From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:36:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/sispmctl: fix static linking
In-Reply-To: <1409008353-20940-1-git-send-email-romain.naour@openwide.fr>
References: <1409008353-20940-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141005233651.6320c514@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 26 Aug 2014 01:12:33 +0200, Romain Naour wrote:
> The static linking doesn't works with libusb-compat when using libusb-config.
> Also the CFLAGS initialization with libusb-config --cflags is comented out.
> 
> Based on libftdi's patch, add the support for pkg-config to link sispmctl
> correctly.
> 
> This allow to add correct include directory to CFLAGS
> (Add -I$(STAGING_DIR)/usr/include and -I$(STAGING_DIR)/usr/include/libusb-1.0)
> Also add needed libraries during static linking (-lusb -lusb-1.0 and -pthread)
> 
> Since configure.ac is modified, the configure script needs to be regenerated
> with autoreconf.
> 
> Fixes:
> http://autobuild.buildroot.net/results/647/6473088e751d3ab3a5227e9d7876966934e66378/build-end.log
> 
> Cc: Phil Eichinger <phil.eichinger@gmail.com>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Thanks, applied. Please submit the patch upstream so that one day we
can remove it from Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
