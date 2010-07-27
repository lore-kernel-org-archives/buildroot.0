From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jul 2010 10:53:09 +0200
Subject: [Buildroot] [PATCH 3/4] setserial: convert to autotargets and
	fix bug 2269
In-Reply-To: <20100727103506.629d9469@surf> (Thomas Petazzoni's message of
	"Tue, 27 Jul 2010 10:35:06 +0200")
References: <cover.1280069623.git.thomas.petazzoni@free-electrons.com>
	<cover.1280069623.git.thomas.petazzoni@free-electrons.com>
	<e6ef954e507703efcbbe4e6a9bff18cb1d8e2cbb.1280069623.git.thomas.petazzoni@free-electrons.com>
	<87wrshdfhp.fsf@macbook.be.48ers.dk> <20100727103506.629d9469@surf>
Message-ID: <87k4ohcnm2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> + install: setserial setserial.8
 Thomas> +-	$(INSTALL_PROGRAM) setserial $(DESTDIR)/bin
 Thomas> ++	mkdir -p $(DESTDIR)/usr/bin
 Thomas> ++	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
 Thomas> + 	$(STRIP) $(DESTDIR)/bin/setserial
 >> 
 >> That strip should go.

 Thomas> Well, it was here in the setserial Makefile. While I agree that we
 Thomas> shouldn't explicitly add strip commands in Buildroot .mk files, I don't
 Thomas> think it's worth the effort removing those strip commands from within
 Thomas> the package.

No, but it was stripping bin/setserial, not usr/bin/setserial.


-- 
Bye, Peter Korsgaard
