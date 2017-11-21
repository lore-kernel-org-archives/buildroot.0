From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Nov 2017 23:24:13 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-19
In-Reply-To: <20171120233253.541c48ad@windsurf.lan>
References: <20171120070004.B482020743@mail.free-electrons.com>
 <20171120233253.541c48ad@windsurf.lan>
Message-ID: <acc6eff1-ae4c-4f49-74fa-bc30df9af86a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 20/11/2017 ? 23:32, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Let's look at the results for the master branch. If you're in To:,
> there are some questions/topics for you below! :-)
> 
> On Mon, 20 Nov 2017 08:00:04 +0100 (CET), Thomas Petazzoni wrote:
>      
>>          sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7d2cd95bc75250b47f5c9947cd996852925f6e0b | ORPH
> 
> /tmp/ccFVFYgX.s: Assembler messages:
> /tmp/ccFVFYgX.s:34102: Error: pcrel too far
> 
> Toolchain issue that nobody is ever going to fix I guess.
> 
> This issue was reported a long time ago on binutils (for SuperH), and
> was apparently fixed. But now it appears again.
> 
> What should we do?

I don't really know about sh4 issue but a new cppcms 1.1.x version will be
available in near future [1].

The 1.0.x version is getting old.

[1] https://sourceforge.net/projects/cppcms/files/cppcms

> 
>>          arm | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/6380341dbb6c114e4452c5cda37da6b44b80d178 |     
>>      aarch64 | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/4ecf770df7c984a62082d59f8fab632d3efbe06b |     
>>       mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e1473a12cf38ccf4dd3ed0f26a8ff9e6b57f0810 |     
> 
> This is a build issue caused by glibc 2.26. Pascal, since you added
> google-breakpad, could you have a look? Perhaps Romain Naour can help
> as well, since he bumped glibc to 2.26.

As for gcc, we need to replace struct ucontext with ucontext_t.
I'll try to backport this patch [2]

[2]
https://github.com/google/breakpad/commit/bddcc58860f522a0d4cbaa7e9d04058caee0db9d

Best regards,
Romain

> 
> Thomas
> 
