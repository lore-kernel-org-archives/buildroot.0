From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 07:21:33 +0200
Subject: [Buildroot] [PATCH 1/3] mdadm: convert to generic-package
In-Reply-To: <20181014200056.20220-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 14 Oct 2018 22:00:54 +0200")
References: <20181014200056.20220-1-thomas.petazzoni@bootlin.com>
Message-ID: <87va63okde.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > There is absolutely no reason for mdadm.mk to use autotools-package:
 > this package does not have any configure script at all, and its
 > Makefile is not generated using automake.

 > Therefore, convert it to use the generic-package
 > infrastructure. Compared to the previous code, we are now using
 > $(TARGET_CONFIGURE_OPTS), which passes our CPPFLAGS. This overrides
 > the CPPFLAGS from mdadm's Makefile, so we repeat the only CPPFLAGS
 > flag passed in the Makefile, -DBINDIR.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
