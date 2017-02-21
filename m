From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 21 Feb 2017 22:16:27 +0100
Subject: [Buildroot] [PATCH v1] bctoolbox: remove redundant mbedtls
	dependency
In-Reply-To: <20170221210436.11040-1-ps.report@gmx.net>
References: <20170221210436.11040-1-ps.report@gmx.net>
Message-ID: <1487711787.23591.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, 2017-02-21 at 22:04 +0100, Peter Seiderer wrote:
> Fixes:
> 
> ? Makefile:532: *** mbedtls is in the dependency chain of bctoolbox
> that
> ? has added it to its _DEPENDENCIES variable without selecting it or
> ? depending on it from Config.in.??Stop.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> ?package/bctoolbox/bctoolbox.mk | 1 -
> ?1 file changed, 1 deletion(-)
> 
> diff --git a/package/bctoolbox/bctoolbox.mk
> b/package/bctoolbox/bctoolbox.mk
> index 76737aa3c..78269751e 100644
> --- a/package/bctoolbox/bctoolbox.mk
> +++ b/package/bctoolbox/bctoolbox.mk
> @@ -8,7 +8,6 @@ BCTOOLBOX_VERSION = 0.4.0
> ?BCTOOLBOX_SITE = $(call
> github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
> ?BCTOOLBOX_LICENSE = GPLv2+
> ?BCTOOLBOX_LICENSE_FILES = COPYING
> -BCTOOLBOX_DEPENDENCIES = mbedtls
> ?BCTOOLBOX_INSTALL_STAGING = YES
> ?
> ?# Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to

I somehow missed to remove this in [1]. Thanks for fixing!

Note, that this should be committed to the master branch.

Acked-by: J?rg Krause <joerg.krause@embedded.rocks>

[1] https://git.buildroot.net/buildroot/commit/package/bctoolbox/bctool
box.mk?id=2c3be02dfb16a39f9cd494f8215a4b1c4d4d8a70
