From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Aug 2020 22:55:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtty: fix build with mbedtls
 but without zlib
In-Reply-To: <CAPi7W80P=KyKJm0REocozCv8mgDrEsrED0OtwqPdrOc_FEqygg@mail.gmail.com>
References: <20200830192029.1009973-1-fontaine.fabrice@gmail.com>
 <20200830220205.777024e2@windsurf.home>
 <CAPi7W836LNsN20-Zu=WW_Z9Zp_p2DFx41TnH6cUxDrVqjmaJ3g@mail.gmail.com>
 <20200830223154.3bb3ed2f@windsurf.home>
 <CAPi7W80P=KyKJm0REocozCv8mgDrEsrED0OtwqPdrOc_FEqygg@mail.gmail.com>
Message-ID: <20200830225556.12a131e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 Aug 2020 22:39:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> The suggested patch is only fixing a build failure when zlib is not found.
> We're already linking needlessly with zlib since the bump to version
> 7.1.4 with commit 0c80245ddbe78c8e443f98b9bbccac56331cdb26.
> So would you advise that I revert
> https://github.com/zhaojh329/rtty/commit/7b8efe11dbafce97971dc130bf6cc1756f34ce07
> and manually link with -lz in rtty.mk if
> BR2_PACKAGE_MBEDTLS_COMPRESSION is set?

The only sane way to fix this is to use pkg-config, but as you said
mbedtls apparently doesn't provide any .pc file.

So I'd say, leave it as it is, but it's better to have the full
explanation on the benefits/drawbacks in the commit log rather than
having to second guess it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
