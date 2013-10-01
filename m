From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 23:27:10 +0200
Subject: [Buildroot] [PATCH 1/2] freescale-imx: separate variable
 assignment from Makefile
In-Reply-To: <524B3C4D.20906@boundarydevices.com>
References: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
 <1380650790-18097-2-git-send-email-eric.nelson@boundarydevices.com>
 <20131001214420.34d3ef48@skate>
 <524B3C4D.20906@boundarydevices.com>
Message-ID: <20131001232710.2e3aaae5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Tue, 01 Oct 2013 14:19:09 -0700, Eric Nelson wrote:

> I can do that if I move packages/gstreamer/gst-fsl-plugins/ under
> packages/freescale-imx, but not otherwise.

Are you sure?

See:

$ cat foo.mk 
YOURPACKAGE_VERSION = $(FREESCALE_IMX_VERSION)

FREESCALE_IMX_VERSION = 42

all:
	@echo $(YOURPACKAGE_VERSION)

$ make -f foo.mk
42
$

This shows that the value of FREESCALE_IMX_VERSION can be given *after*
it is used.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
