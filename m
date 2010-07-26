From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jul 2010 00:50:58 +0200
Subject: [Buildroot] [PATCH 3/4] setserial: convert to autotargets and
	fix bug 2269
In-Reply-To: <e6ef954e507703efcbbe4e6a9bff18cb1d8e2cbb.1280069623.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 25 Jul 2010 16:53:51 +0200")
References: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
	<cover.1280069623.git.thomas.petazzoni@free-electrons.com>
	<e6ef954e507703efcbbe4e6a9bff18cb1d8e2cbb.1280069623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrshdfhp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> +Index: setserial-2.17/Makefile.in
 Thomas> +===================================================================
 Thomas> +--- setserial-2.17.orig/Makefile.in
 Thomas> ++++ setserial-2.17/Makefile.in
 Thomas> +@@ -26,9 +26,11 @@
 Thomas> + 	nroff -man setserial.8 > setserial.cat
 Thomas> + 
 Thomas> + install: setserial setserial.8
 Thomas> +-	$(INSTALL_PROGRAM) setserial $(DESTDIR)/bin
 Thomas> ++	mkdir -p $(DESTDIR)/usr/bin
 Thomas> ++	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
 Thomas> + 	$(STRIP) $(DESTDIR)/bin/setserial

That strip should go.

You're also not renaming setserial-tiocghayesesp-build-fix.patch, so
we're back with 5a2844c748.

Other than that it looks good.

-- 
Bye, Peter Korsgaard
