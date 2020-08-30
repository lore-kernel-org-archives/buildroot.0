From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Aug 2020 22:02:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtty: fix build with mbedtls
 but without zlib
In-Reply-To: <20200830192029.1009973-1-fontaine.fabrice@gmail.com>
References: <20200830192029.1009973-1-fontaine.fabrice@gmail.com>
Message-ID: <20200830220205.777024e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 Aug 2020 21:20:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +-        set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
> ++        if(ZLIB_FOUND)
> ++            set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})

Is there a reason why zlib is necessary for mbedtls support ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
