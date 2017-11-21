From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Nov 2017 23:52:56 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-19
In-Reply-To: <acc6eff1-ae4c-4f49-74fa-bc30df9af86a@gmail.com>
References: <20171120070004.B482020743@mail.free-electrons.com>
 <20171120233253.541c48ad@windsurf.lan>
 <acc6eff1-ae4c-4f49-74fa-bc30df9af86a@gmail.com>
Message-ID: <20171121235256.75c6e007@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Nov 2017 23:24:13 +0100, Romain Naour wrote:

> > On Mon, 20 Nov 2017 08:00:04 +0100 (CET), Thomas Petazzoni wrote:
> >        
> >>          sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7d2cd95bc75250b47f5c9947cd996852925f6e0b | ORPH  
> > 
> > /tmp/ccFVFYgX.s: Assembler messages:
> > /tmp/ccFVFYgX.s:34102: Error: pcrel too far
> > 
> > Toolchain issue that nobody is ever going to fix I guess.
> > 
> > This issue was reported a long time ago on binutils (for SuperH), and
> > was apparently fixed. But now it appears again.
> > 
> > What should we do?  
> 
> I don't really know about sh4 issue but a new cppcms 1.1.x version will be
> available in near future [1].
> 
> The 1.0.x version is getting old.
> 
> [1] https://sourceforge.net/projects/cppcms/files/cppcms

We should also try with the latest binutils and gcc, and see if the
problem still exists. If it does, we should report it upstream.

> > This is a build issue caused by glibc 2.26. Pascal, since you added
> > google-breakpad, could you have a look? Perhaps Romain Naour can help
> > as well, since he bumped glibc to 2.26.  
> 
> As for gcc, we need to replace struct ucontext with ucontext_t.
> I'll try to backport this patch [2]
> 
> [2]
> https://github.com/google/breakpad/commit/bddcc58860f522a0d4cbaa7e9d04058caee0db9d

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
