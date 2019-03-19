From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 21:59:17 +0100
Subject: [Buildroot] [PATCH 2/3] package/uftp: fix openssl static linking
In-Reply-To: <20190319204642.28920-2-fontaine.fabrice@gmail.com>
References: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
 <20190319204642.28920-2-fontaine.fabrice@gmail.com>
Message-ID: <20190319215917.3b01a8e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Mar 2019 21:46:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +UFTP_MAKE_OPTS += CRYPT_LIB='-lssl -lcrypto -lz'

What about using pkg-config here ?

CRYPT_LIB=$(shell pkg-config --libs ssl)

this avoids hardcoding a bunch of assumptions about what OpenSSL
depends on, and you can also drop the BR2_STATIC_LIBS condition.

What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
