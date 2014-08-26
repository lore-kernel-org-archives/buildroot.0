From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue, 26 Aug 2014 08:47:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/sispmctl: fix static linking
In-Reply-To: <1409008353-20940-1-git-send-email-romain.naour@openwide.fr>
References: <1409008353-20940-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAPiYbRKyWdOrOge52eSiJTa0DSD3BwcBwyc3yrxryTY073P+Ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 August 2014 01:12, Romain Naour <romain.naour@openwide.fr> wrote:

> The static linking doesn't works with libusb-compat when using
> libusb-config.
> Also the CFLAGS initialization with libusb-config --cflags is comented out.
>
> Based on libftdi's patch, add the support for pkg-config to link sispmctl
> correctly.
>
> This allow to add correct include directory to CFLAGS
> (Add -I$(STAGING_DIR)/usr/include and
> -I$(STAGING_DIR)/usr/include/libusb-1.0)
> Also add needed libraries during static linking (-lusb -lusb-1.0 and
> -pthread)
>
> Since configure.ac is modified, the configure script needs to be
> regenerated
> with autoreconf.
>
> Fixes:
>
> http://autobuild.buildroot.net/results/647/6473088e751d3ab3a5227e9d7876966934e66378/build-end.log
>
> Cc: Phil Eichinger <phil.eichinger@gmail.com>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>

Thank you!

Cheers, Phil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140826/c046e63b/attachment.html>
