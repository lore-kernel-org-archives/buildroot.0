From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 28 Sep 2011 17:02:21 +0200
Subject: [Buildroot] [PATCH] add libfcgi to buildroot it will have
	compiling errors as long as -lm isnt added to the buildsystem
	of libfcgi
In-Reply-To: <20110928163020.6350cc9b@skate>
References: <add fcgi-2.4.0 package to buildroot>
 <1317219200-4655-1-git-send-email-bachmann@tofwerk.com>
 <20110928163020.6350cc9b@skate>
Message-ID: <000001cc7def$9ff6a920$dfe3fb60$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Urspr?ngliche Nachricht-----
> Von: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] Im Auftrag von Thomas Petazzoni
> Gesendet: Mittwoch, 28. September 2011 16:30
> An: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH] add libfcgi to buildroot it will have
> compiling errors as long as -lm isnt added to the buildsystem of
> libfcgi
> 
> Hello,
> 
> Good for the usage of git send-email!
> 
> The patch title is too long. There should be one first line of < 80
> characters, and then if you need to put some other details: one blank
> line, and then some other paragraphs.

that wasn't planed ^^ i didn't know that all my comments get i to the subject.
next time i will use the blank line. Did i have to commit the patch a second time, because of the long subject?

> 
> And the -lm problem should be fixed rather than explained in the commit
> log :-)
> 

i have 2 patches that fix that problem, but i don't know how to add patches to buildroot for files that are created in the build/fcgi-2.4.0/ when fcgi-2.4.0.tar.gz is unpacked

http://lists.busybox.net/pipermail/buildroot/2011-September/046084.html

in this link you can see the patches for 2 makefiles (they're attached to the mail). It is the solution to the -lm problem, but i don't know how to add that to buildroot.

> Le Wed, 28 Sep 2011 16:13:20 +0200,
> Rico Bachmann <bachmann@tofwerk.com> a ?crit :
> 
> >
> +######################################################################
> ########
> > +#
> > +# libfcgi
> > +#
> >
> +######################################################################
> ########
> > +LIBFCGI_VERSION = 2.4.0
> > +LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
> > +LIBFCGI_SITE = http://www.fastcgi.com/dist
> > +LIBFCGI_INSTALL_STAGING = YES
> > +LIBFCGI_INSTALL_TARGET = YES
> 
> Line not needed, this is the default.
> 
> > +LIBFCGI_CONF_OPT = --enable-shared
> 
> Line not needed, this is already part of the default configuration
> options.
> 
> Regards,
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
