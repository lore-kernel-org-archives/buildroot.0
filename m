From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 06 Dec 2012 14:22:50 +0100 (CET)
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <50BF84E0.9090502@mind.be>
Message-ID: <3e51b13a-6944-4355-935f-76b551203888@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > unless you want me to make it relative again... I believe absolute
> > (whith the possibility to use env vars to find the buildroot
> > location) makes most sense but that might be worth discussing
> 
>   Like most other paths in buildroot, it's relative to $(TOP_DIR)
> (i.e. the buildroot directory).
> 

my bad, you're right about that, i'll correct that

> 
> >>> +endef
> >>> +
> >>> +define ROOTFS_LIVE_INIT
> >>> +  if [ -z $(shell which sudo) ] ; then echo "sudo seems to not
> >>> be
> >>> installed on the host system" ; false ; fi ; \
> >>
> >>    This really should be checked in
> >>    support/dependencies/dependencies.sh.
> >>
> >
> > I didn't know about that file, but it seems to be more about
> > dependencies for buildroot core than dependencies for a particular
> > config option...
> 
>   I forgot to add: similar to the java dependencies for classpath.
> 
> 

I didn't find anything like that in buildroot... there are some config-dependant checks in dependencies.sh (checking is locale is installed) but nothing class path related

am I missing something or should I do it in a way similar to locale ?

Regards

J?r?my Rosen
