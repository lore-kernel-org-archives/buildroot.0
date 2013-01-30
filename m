From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 30 Jan 2013 08:50:59 +0100 (CET)
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <510807F9.3040905@mind.be>
Message-ID: <ce1e1f6b-7d56-461e-87a7-d18a64240c35@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >
> >   make foo_defconfig
> >   Do all kinds of weird stuff that completely messes things up
> >   make clean
> >   make
> >
> > and to be back in the same state as 'make foo_defconfig; make'.
> >
> >
> >   Bottom line: I tend to say no to this patch.
> 
> 
>   After the feedback from Real Users (Stephan, Jeremy, Shawn), it
>   looks
> like I have to revise my opinion...
> 
>   Or are there any other voices against?
> 
>   If this does go through, I would  like to have some way to throw
>   away
> the customized config and revert to the configured config.  Perhaps a
> 'realclean' target?
> 
> 

I am not sure what you mean by "the configured" vs "the customized"

I guess that the customized is the one from make linux-menuconfig and the configured is the one from make foo_defconfig

hmm, I see your use case.... I would tend to argue that the kernel is no exception to the way buildroot works

* make clean removes all build-generated but doesn't touch user-defined configurations (BR configuration, kernel configuration)
* to revert to BR's suggested configuration, use make xxx_defconfig, and that would override both the kernel and BR's configuration.

I don't really see a use-case for "revert my changes to the kernel, but not the rest of buildroot" though providing targets like make linux-xxx_defconfig for all kernel defined defconfig
and/or a make linux-buildrootconfig to revert to the buildroot-suggested config might make sense...


Best
J?r?my
