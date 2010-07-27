From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 10:35:06 +0200
Subject: [Buildroot] [PATCH 3/4] setserial: convert to autotargets and
 fix bug 2269
In-Reply-To: <87wrshdfhp.fsf@macbook.be.48ers.dk>
References: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
	<cover.1280069623.git.thomas.petazzoni@free-electrons.com>
	<e6ef954e507703efcbbe4e6a9bff18cb1d8e2cbb.1280069623.git.thomas.petazzoni@free-electrons.com>
	<87wrshdfhp.fsf@macbook.be.48ers.dk>
Message-ID: <20100727103506.629d9469@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Jul 2010 00:50:58 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Thomas" == Thomas Petazzoni
> >>>>> <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> +Index: setserial-2.17/Makefile.in
>  Thomas> +===================================================================
>  Thomas> +--- setserial-2.17.orig/Makefile.in
>  Thomas> ++++ setserial-2.17/Makefile.in
>  Thomas> +@@ -26,9 +26,11 @@
>  Thomas> + 	nroff -man setserial.8 > setserial.cat
>  Thomas> + 
>  Thomas> + install: setserial setserial.8
>  Thomas> +-	$(INSTALL_PROGRAM) setserial $(DESTDIR)/bin
>  Thomas> ++	mkdir -p $(DESTDIR)/usr/bin
>  Thomas> ++	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
>  Thomas> + 	$(STRIP) $(DESTDIR)/bin/setserial
> 
> That strip should go.

Well, it was here in the setserial Makefile. While I agree that we
shouldn't explicitly add strip commands in Buildroot .mk files, I don't
think it's worth the effort removing those strip commands from within
the package.

> You're also not renaming setserial-tiocghayesesp-build-fix.patch, so
> we're back with 5a2844c748.

Right, sorry.

Thanks for having fixed those issues.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
