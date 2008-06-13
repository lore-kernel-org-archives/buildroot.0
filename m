From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 13 Jun 2008 20:02:49 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
In-Reply-To: <20080613084536.0BA573C804@busybox.net>
References: <20080613084536.0BA573C804@busybox.net>
Message-ID: <20080613100249.GA31396@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2008 at 01:45:35AM -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-06-13 01:45:35 -0700 (Fri, 13 Jun 2008)
> New Revision: 22312
> 
> Log:
> libusb: depend on actual host-libtool binary
> 
> We need to depend on the actual host-libtool binary instead of the phony
> host-libtool as libusb otherwise will get recompiled every time.
> 
> 
> Modified:
>    trunk/buildroot/package/libusb/libusb.mk

Thanks, I fixed this already in my local copy but hadn't checked it in
yet.

>  libusb-unpacked: $(LIBUSB_DIR)/.unpacked
> -$(LIBUSB_DIR)/.unpacked: $(AUTOCONF) $(AUTOMAKE) host-libtool $(DL_DIR)/$(LIBUSB_SOURCE)
> +$(LIBUSB_DIR)/.unpacked: $(AUTOCONF) $(AUTOMAKE) $(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY) $(DL_DIR)/$(LIBUSB_SOURCE)

I added a $(LIBTOOL) in libtool/libtool.mk similar to $(AUTOMAKE) and
used that instead, so that we can hide details of the libtool package.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
