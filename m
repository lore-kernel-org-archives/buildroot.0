From: Roeland Van Praet <roelvp@mind.be>
Date: Thu, 06 Oct 2011 18:55:41 +0200
Subject: [Buildroot] Add 'pv' (Pipe-Viewer) to BuildRoot
In-Reply-To: <20111006183012.24ff3f7d@skate>
References: <1317913244.21369.15.camel@roelpc.telenet.be>
 <20111006183012.24ff3f7d@skate>
Message-ID: <1317920141.3905.1.camel@roelpc.telenet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-10-06 at 18:30 +0200, Thomas Petazzoni wrote:
> Le Thu, 06 Oct 2011 17:00:44 +0200,
> Roeland Van Praet <roelvp@mind.be> a ?crit :
> 
> > diff -ruN a/package/Config.in b/package/Config.in
> > --- a/package/Config.in	2011-10-06 16:47:32.000000000 +0200
> > +++ b/package/Config.in	2011-10-06 16:47:47.000000000 +0200
> > @@ -31,6 +31,7 @@
> >  source "package/strace/Config.in"
> >  source "package/whetstone/Config.in"
> >  source "package/valgrind/Config.in"
> > +source "package/pv/Config.in"
> >  endmenu
> >  
> >  menu "Development tools"
> > diff -ruN a/package/pv/Config.in b/package/pv/Config.in
> > --- a/package/pv/Config.in	1970-01-01 01:00:00.000000000 +0100
> > +++ b/package/pv/Config.in	2011-10-06 15:50:50.000000000 +0200
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_PV
> > +	bool "pv"
> > +	help
> > +	  Pipe Viewer - is a terminal-based tool for
> > +          monitoring the progress of data through a
> > +          pipeline.
> 
> Incorrect indentation for the help text. It should be one tab + two
> spaces for each line.
> 
> > --- a/package/pv/pv-1.2.0-fixld.patch	1970-01-01 01:00:00.000000000
> > +0100
> > +++ b/package/pv/pv-1.2.0-fixld.patch	2011-10-06 16:36:28.000000000
> > +0200
> 
> Each patch must contain a description + Signed-off-by line.
> 
> > --- a/package/pv/pv.mk	1970-01-01 01:00:00.000000000 +0100
> > +++ b/package/pv/pv.mk	2011-10-06 15:50:50.000000000 +0200
> > @@ -0,0 +1,13 @@
> > +#######################
> > +#
> > +# pv - Pipe Viewer
> > +#
> > +#######################
> > +
> > +PV_VERSION = 1.2.0
> > +PV_SOURCE = pv-$(PV_VERSION).tar.bz2
> > +PV_SITE = http://pipeviewer.googlecode.com/files
> > +
> > +PV_INSTALL_TARGET = YES
> 
> Line not needed, this is the default.
> 
> > +$(eval $(call AUTOTARGETS,package,pv))
> 
> This should now be:
> 
> $(eval $(call AUTOTARGETS))
> 
> This is a very recent change in Buildroot Git, and the doc has not been
> updated yet.
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Ok, I'll submit a new patch tomorrow.

Roeland
