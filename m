Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68697C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE64E83D0D;
	Fri, 16 May 2025 16:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sfNusGdFh7w; Fri, 16 May 2025 16:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98F9E832D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F9E832D9;
	Fri, 16 May 2025 16:40:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9907F1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F1B16081B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3Wn8JVJfH4h for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A25A960688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A25A960688
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A25A960688
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:40:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E81343A4E;
 Fri, 16 May 2025 16:40:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFy6d-00AfEX-2o;
 Fri, 16 May 2025 18:40:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
References: <20250513191822.2112755-1-james.hilliard1@gmail.com>
Date: Fri, 16 May 2025 18:40:19 +0200
In-Reply-To: <20250513191822.2112755-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 13 May 2025 13:18:22 -0600")
Message-ID: <877c2ga4r0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepteetueejjeefleduieehkeetgefhfeeihefhleeguedvhfduieevleevveehfeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghuihhlughrohhothdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtt
 hhopehfohhnthgrihhnvgdrfhgrsghrihgtvgesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlrgdrughilhhivghtohesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: bump to version 3.6.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Drop BR2_PACKAGE_MBEDTLS_COMPRESSION and all related references
 > as native zlib support has been entirely removed from mbedtls.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed after extending the commit message to make it clear that
2.28.x is EOL / 3.6.x is the new LTS, thanks.

> ---
 >  package/mbedtls/Config.in                | 12 ----------
 >  package/mbedtls/mbedtls.hash             |  4 ++--
 >  package/mbedtls/mbedtls.mk               | 28 +++++++-----------------
 >  package/shairport-sync/shairport-sync.mk |  3 ---
 >  package/uacme/uacme.mk                   |  3 ---
 >  5 files changed, 10 insertions(+), 40 deletions(-)

 > diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
 > index abbe3356d8..21e746d842 100644
 > --- a/package/mbedtls/Config.in
 > +++ b/package/mbedtls/Config.in
 > @@ -17,18 +17,6 @@ config BR2_PACKAGE_MBEDTLS_PROGRAMS
 >  	  This option enables the installation and the build of
 >  	  mbed TLS companion programs.
 
 > -config BR2_PACKAGE_MBEDTLS_COMPRESSION
 > -	bool "enable compression support"
 > -	select BR2_PACKAGE_ZLIB
 > -	help
 > -	  Enable support for compression of the content data before it
 > -	  enters the secure channel as described in RFC 3749.
 > -
 > -	  Warning: TLS compression may make you vulnerable to the
 > -	  CRIME attack. You should not enable it unless you know for
 > -	  sure CRIME and similar attacks are not applicable to your
 > -	  particular situation.
 > -
 >  config BR2_PACKAGE_MBEDTLS_DTLS_SRTP
 >  	bool "enable DTLS-SRTP support"
 >  	help
 > diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
 > index 6fc68ddac6..cc15958e3a 100644
 > --- a/package/mbedtls/mbedtls.hash
 > +++ b/package/mbedtls/mbedtls.hash
 > @@ -1,4 +1,4 @@
 > -# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.10:
 > -sha256  19e5b81fdac0fe22009b9e2bdcd52d7dcafbf62bc67fc59cf0a76b5b5540d149  mbedtls-2.28.10.tar.bz2
 > +# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.3.1:
 > +sha256  243ed496d5f88a5b3791021be2800aac821b9a4cc16e7134aa413c58b4c20e0c  mbedtls-3.6.3.1.tar.bz2
 >  # Locally calculated
 >  sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
 > diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
 > index fd6682fbfd..563683e739 100644
 > --- a/package/mbedtls/mbedtls.mk
 > +++ b/package/mbedtls/mbedtls.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -MBEDTLS_VERSION = 2.28.10
 > -MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 > +MBEDTLS_VERSION = 3.6.3.1
 > +MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
 >  MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 >  MBEDTLS_CONF_OPTS = \
 >  	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
 > @@ -22,9 +22,9 @@ MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 >  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 >  define MBEDTLS_ENABLE_THREADING
 >  	$(SED) "s://#define MBEDTLS_THREADING_C:#define MBEDTLS_THREADING_C:" \
 > -		$(@D)/include/mbedtls/config.h
 > +		$(@D)/include/mbedtls/mbedtls_config.h
 >  	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
 > -		$(@D)/include/mbedtls/config.h
 > +		$(@D)/include/mbedtls/mbedtls_config.h
 >  endef
 >  MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_THREADING
 >  ifeq ($(BR2_STATIC_LIBS),y)
 > @@ -43,25 +43,13 @@ MBEDTLS_CONF_OPTS += \
 >  	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
 >  endif
 
 > -ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
 > -MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=ON
 > -MBEDTLS_DEPENDENCIES += zlib
 > -define MBEDTLS_ENABLE_ZLIB
 > -	$(SED) "s://#define MBEDTLS_ZLIB_SUPPORT:#define MBEDTLS_ZLIB_SUPPORT:" \
 > -		$(@D)/include/mbedtls/config.h
 > -endef
 > -MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_ZLIB
 > -else
 > -MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
 > -endif
 > -
 >  define MBEDTLS_DISABLE_ASM
 >  	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
 > -		$(@D)/include/mbedtls/config.h
 > +		$(@D)/include/mbedtls/mbedtls_config.h
 >  	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
 > -		$(@D)/include/mbedtls/config.h
 > +		$(@D)/include/mbedtls/mbedtls_config.h
 >  	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
 > -		$(@D)/include/mbedtls/config.h
 > +		$(@D)/include/mbedtls/mbedtls_config.h
 >  endef
 
 >  # ARM in thumb mode breaks debugging with asm optimizations
 > @@ -76,7 +64,7 @@ endif
 >  ifeq ($(BR2_PACKAGE_MBEDTLS_DTLS_SRTP),y)
 >  define MBEDTLS_ENABLE_DTLS_SRTP
 >  	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
 > -		$(@D)/include/mbedtls/config.h
 > +		$(@D)/include/mbedtls/mbedtls_config.h
 >  endef
 >  MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
 >  endif
 > diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
 > index 4430014ec9..5d01ab042e 100644
 > --- a/package/shairport-sync/shairport-sync.mk
 > +++ b/package/shairport-sync/shairport-sync.mk
 > @@ -44,9 +44,6 @@ else
 >  SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
 >  SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
 >  SHAIRPORT_SYNC_CONF_LIBS += -lmbedx509 -lmbedcrypto
 > -ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
 > -SHAIRPORT_SYNC_CONF_LIBS += -lz
 > -endif
 >  endif
 
 >  ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION),y)
 > diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
 > index ec538cec12..9a2c972604 100644
 > --- a/package/uacme/uacme.mk
 > +++ b/package/uacme/uacme.mk
 > @@ -22,9 +22,6 @@ ifeq ($(BR2_PACKAGE_GNUTLS),y)
 >  UACME_CONF_OPTS += --with-gnutls
 >  UACME_DEPENDENCIES += gnutls
 >  else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 > -ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
 > -    UACME_LIBS += -lz
 > -endif
 >  UACME_CONF_OPTS += --with-mbedtls
 >  UACME_DEPENDENCIES += mbedtls
 >  else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 > -- 

 > 2.34.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
