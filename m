Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043C3CD5BA3
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B380B60F28;
	Thu, 13 Nov 2025 09:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLlBf4BFNMZn; Thu, 13 Nov 2025 09:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3BE46064A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3BE46064A;
	Thu, 13 Nov 2025 09:21:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D70230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C1098116F
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMYczWKBBfa2 for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C4E28114A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4E28114A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C4E28114A
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:20:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1599594782; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:20:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJTVb-0029He-2A;
 Thu, 13 Nov 2025 10:20:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-3-bernd@kuhls.net>
Date: Thu, 13 Nov 2025 10:20:51 +0100
In-Reply-To: <20251106204522.3273683-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 6 Nov 2025 21:45:09 +0100")
Message-ID: <875xbeqoek.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=skiDu3wZDkbWIkJvGYmDSwAADGmJsDYI7IbSow7vtJPyA+N29DKgIryb5GT5gw5+8vTTUl1z+DvJQ6AjHHSkRivCbofoM7uZoO/eZDdQR6wwivIcYon1l2kuiFPqcSasqEH3ZtPOHapBQEx/XEE3Pin7IYjYtS4+ig2h95zLs9KIeoKJvshYbgvldRJgU6KjpQi8EvPbxV/y4SNl0FuzfhSMNCGk/D7cS5tZFP9CyLCu0skojBgwWYk12bRKIzuC/MtYHpArRm9S86sDU1uCXI974aaSt3G1F/nMYmdZ6azVujE9FFm5my2NTrAxOyLtQw/eEpSl102svg7i8wAdEA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=TikN9b5t7gAW/2I3kiSgaKNYyWNfoGHrGzQL0AQtZRc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=skiDu3wZ
Subject: Re: [Buildroot] [PATCH v3 02/14] package/libjwt: remove package
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Carsten Schoenert <c.schoenert@gmail.com>, Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > In commit 770f9154978c40ce5b7718174108b37c5310869d, libjwt was bumped
 > from 1.17.2 to 3.2.0, which is a big bump. And the libjwt website
 > states "Version 3 of LibJWT is a complete overhaul of the code. Please
 > see documentation for usage."

 > And indeed, this version bump breaks the build of Asterisk. Therefore
 > asterisk uses its bundled version of libjwt now and this package can be
 > removed as no other package depends on it.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Adding Waldemar, who is listed in DEVELOPERS for this package. Waldemar,
what do you say? Is there any sense in keeping the libjwt package around
if not used by asterisk?


 > ---
 >  Config.in.legacy           |  8 ++++++++
 >  DEVELOPERS                 |  1 -
 >  package/Config.in          |  1 -
 >  package/libjwt/Config.in   | 10 ----------
 >  package/libjwt/libjwt.hash |  3 ---
 >  package/libjwt/libjwt.mk   | 19 -------------------
 >  6 files changed, 8 insertions(+), 34 deletions(-)
 >  delete mode 100644 package/libjwt/Config.in
 >  delete mode 100644 package/libjwt/libjwt.hash
 >  delete mode 100644 package/libjwt/libjwt.mk

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 26391bec23..5aa271183e 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -146,6 +146,14 @@ endif
 
 >  comment "Legacy options removed in 2025.11"
 
 > +config BR2_PACKAGE_LIBJWT
 > +	bool "libjwt has been removed"
 > +	select BR2_LEGACY
 > +	help
 > +	  The only dependee of libjwt, asterisk, is incompatible with
 > +	  version 3 so the version bundled with asterisk is used and
 > +	  this package can be removed.
 > +
 >  config BR2_PACKAGE_RAMSPEED
 >  	bool "ramspeed has been removed"
 >  	select BR2_LEGACY
 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index b14c6e3875..f9cf31f7e2 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -3420,7 +3420,6 @@ F:	configs/stm32f746_disco_sd_defconfig
 >  F:	package/asterisk/
 >  F:	package/evilwm/
 >  F:	package/fbv/
 > -F:	package/libjwt/
 >  F:	package/libpam-pkcs11/
 >  F:	package/mksh/
 >  F:	package/ruby/
 > diff --git a/package/Config.in b/package/Config.in
 > index 930f368058..07244a86e2 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1927,7 +1927,6 @@ menu "JSON/XML"
 >  	source "package/jsoncpp/Config.in"
 >  	source "package/libfastjson/Config.in"
 >  	source "package/libjson/Config.in"
 > -	source "package/libjwt/Config.in"
 >  	source "package/libroxml/Config.in"
 >  	source "package/libucl/Config.in"
 >  	source "package/libxml2/Config.in"
 > diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
 > deleted file mode 100644
 > index 47eb0882a3..0000000000
 > --- a/package/libjwt/Config.in
 > +++ /dev/null
 > @@ -1,10 +0,0 @@
 > -config BR2_PACKAGE_LIBJWT
 > -	bool "libjwt"
 > -	select BR2_PACKAGE_OPENSSL
 > -	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 > -	select BR2_PACKAGE_JANSSON
 > -	help
 > -	  JSON Web Tokens are an open, industry standard RFC 7519
 > -	  method for representing claims securely between two parties.
 > -
 > -	  https://github.com/benmcollins/libjwt
 > diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
 > deleted file mode 100644
 > index 8e59d2284b..0000000000
 > --- a/package/libjwt/libjwt.hash
 > +++ /dev/null
 > @@ -1,3 +0,0 @@
 > -# Locally computed
 > -sha256  17ee4e25adfbb91003946af967ff04068a5c93d6b51ad7ad892f1441736b71b9  libjwt-3.2.0.tar.xz
 > -sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
 > diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
 > deleted file mode 100644
 > index d20067de24..0000000000
 > --- a/package/libjwt/libjwt.mk
 > +++ /dev/null
 > @@ -1,19 +0,0 @@
 > -################################################################################
 > -#
 > -# libjwt
 > -#
 > -################################################################################
 > -
 > -LIBJWT_VERSION = 3.2.0
 > -LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
 > -LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.xz
 > -LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
 > -LIBJWT_INSTALL_STAGING = YES
 > -LIBJWT_LICENSE = MPL-2.0
 > -LIBJWT_LICENSE_FILES = LICENSE
 > -LIBJWT_CPE_ID_VENDOR = bencollins
 > -LIBJWT_CPE_ID_PRODUCT = jwt_c_library
 > -
 > -LIBJWT_CONF_OPTS += -DWITH_TESTS=OFF -DWITH_GNUTLS=OFF
 > -
 > -$(eval $(cmake-package))
 > -- 

 > 2.47.3

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
