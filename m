From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 23:42:35 +0200
Subject: [Buildroot] [WIP PATCH 0/5] Static linking fixes
In-Reply-To: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140730234235.10bb0b47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 25 May 2014 19:12:55 -0300, Gustavo Zacarias wrote:
> As discussed on the mailing list here is my current patchset to get
> static linking fixed.
> This is a WIP (Work In Progress) patchset, that being said i consider
> patches 1 and 3 pretty safe and ready for the tree.
> Patch 2 and 4 are medium confidence level, how things should be IMHO.
> Patch 5 is also how things should be however it's not extensively tested.
> 
> Gustavo Zacarias (5):
>   uclibc: don't install tools to staging when static

This one was already applied.

>   gcc-final: disable shared build for static
>   libiconv: disable preloadable for static builds
>   package infra: revert 0a4bd19f
>   package infra: add -static to C/CXXFLAGS

I've applied those four patches. On the gcc-final patch, I did a small
change to factorize the static library installation logic in one place.
On the libiconv patch, I did a little bit more changes: completely
disable the build of the preloadable library, since we were anyway
removing it from staging and target. It allowed to simplify the patch a
bit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
