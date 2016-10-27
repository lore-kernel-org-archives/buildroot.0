From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 10:41:26 +0200
Subject: [Buildroot] [PATCH 2/2] ts4600-tshwctl: add ts4600-tshwctl
 package
In-Reply-To: <20161027000807.20206-3-sebastien.bourdelin@savoirfairelinux.com>
References: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
 <20161027000807.20206-3-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20161027104126.6928af6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 20:08:07 -0400, Sebastien Bourdelin wrote:
> This package is required to access the FPGA registers and configure some
> controllers of the TS-4600 board.
> 
> It comes with two init script to properly configure the watchdog and the
> ethernet PHY at boot time.
> 
> This tool has no repository for this board and the sources are taken
> from the Technologic System ftp in the TS-7600 subdirectory which are
> compatible with the TS-4600:
> ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7600-linux/sources/

Sorry, but we clearly don't want to have 7000 lines of source code in
Buildroot, for a tool specific to just one board.

Please make the package download the source code from
ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7600-linux/sources/. Of course,
the fact that they only provide individual files and not a tarball
makes the exercise a bit annoying, but it's doable using _SOURCE
pointing to tshwctl, and _EXTRA_DOWNLOADS for the other .c and .h files.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
