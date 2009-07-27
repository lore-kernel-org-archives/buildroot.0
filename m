From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 27 Jul 2009 13:58:38 +0200
Subject: [Buildroot] [PATCH] Add support for custom post-build script
In-Reply-To: <87vdlgsbvy.fsf@macbook.be.48ers.dk>
References: <1247086018-18816-1-git-send-email-daniel@caiaq.de>
	<87vdlgsbvy.fsf@macbook.be.48ers.dk>
Message-ID: <20090727115838.GS13236@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 25, 2009 at 11:14:57PM +0200, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:
> 
>  Daniel> The config help text says it all: Specify a script to be run
>  Daniel> after the build has finished and before the BR2 starts
>  Daniel> packing the files into selected packages.
> 
>  Daniel> This gives users the oportunity to do board-specific
>  Daniel> cleanups, add-ons and the like, so the generated files can be
>  Daniel> used directly without further processing.
> 
>  Daniel> The script is called with the target directory name as first
>  Daniel> and only argument. Make sure the exit code of that script is
>  Daniel> 0, otherwise make will stop after calling it.
> 
> I have normally done this by simply running make twice - E.G. build
> the rootfs, fixup anything you need under project_build_*/*/root and
> run make again to regenerate the rootfs.
> 
> But ok, I can see the desire for such a script. I'll apply it now,
> thanks.
> 
> It would be good to have a note about it in the documentation - Could
> I get you to add a short note about it in docs/buildroot.html?

Sure, see below.

Thanks!

Daniel
