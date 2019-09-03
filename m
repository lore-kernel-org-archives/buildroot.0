From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 3 Sep 2019 22:58:43 +0200
Subject: [Buildroot] clang tool-chain support?
In-Reply-To: <87d78eb1-45aa-6200-03fe-20998152fd1a@yandex.ru>
References: <87d78eb1-45aa-6200-03fe-20998152fd1a@yandex.ru>
Message-ID: <f9265f6b-b188-ec04-5fc7-fd5dbb8c932b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stas,

Le 03/09/2019 ? 12:00, Stas Sergeev a ?crit?:
> Hello.
> 
> Just a few toolchain-related questions from
> novice buildroot user.
> 
> - Currently it seems buildroot does not support
> the clang toolchain natively, so is there any way
> (preferably a documented one) to use the host's
> clang tool-chain? (I've only found the way to build
> clang as a target package, which is not what I need)

Indded, Buildroot doesn't support yet clang as cross-toolchain.
Last year Valentin worked on llvm/clang integration into Buildroot to provide
llvm/clang libraries for the target. For example, this allow to enable opencl
support (Clover) in mesa3d stack.

I recently tested clang to build a kernel for aarch64 and x86_64, but we needs
some work to build userspace application.

Also, there are some questions about clang toolchain:

"The long-term goal is to have a complete clang-based toolchain. The usefulness
of this is questionable however." [1]

If clang can be used as a toolchain, it would be great to add it as part of an
Buildroot's internal toolchain. Also, the toolchain external infra should be
able to import clang and it's libraries if present in a pre-built toolchain.
To do so, we have to make sure that clang binaries are relocatable.

[1] https://elinux.org/Buildroot:DeveloperDaysFOSDEM2018#LLVM.2FClang

> 
> - I know that currently there are not too many
> clang-only projects, but I just want to build a few
> of them. As their amount may only increase
> in the future, are there any plans to get the
> native clang support in buildroot?
> (not found in buildroot's TODO list)

Can you share the list of clang only projects you are interested in?

> 
> - buildroot seems to provide yasm instead of nasm.
> While I was able to work around yasm bugs and
> build the project with it, I wonder why such a choice?
> Unless I am mistaken, nasm is active and yasm is
> pretty much dead - I've got that impression from
> reporting bugs to both projects and getting replies
> (and instant fixes) only from nasm.
> So any plans to switch to nasm?

There is a nasm package in Buildroot for the host and the target.
Yasm is also available but less used by other packages.
What is you Buildroot version ?

Best regards,
Romain

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
