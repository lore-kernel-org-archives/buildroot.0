Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA04CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982CB41928;
	Sun, 24 Sep 2023 10:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 982CB41928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nW2L5sSjQpt5; Sun, 24 Sep 2023 10:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E763E41929;
	Sun, 24 Sep 2023 10:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E763E41929
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 163171BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E114F60B98
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E114F60B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-b7D5uaenG0 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:33:56 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16F4E60ED0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F4E60ED0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B47ED780504;
 Sun, 24 Sep 2023 12:33:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:33:49 +0200
Date: Sun, 24 Sep 2023 12:33:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230924103349.GH1469982@scaer>
References: <20230923205437.259708-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923205437.259708-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551632;
 bh=tUtEX3Uq0gVTo1XrkbL12LkSMF1bGiyR2Ff1cf/S/Nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KGu4W+M1PM3xn5EcOKQo2JgJtEDqcxEaCEk5P6zEQXL66dCJvIgk4CtY3JAk/ugcj
 fiRH8z7JrFK15zhB+OWZxlxyHY1gVXNrKDod430CFPa7I2WsyWnNQG8Tukj6hHgPD5
 UJCzmyPP63CM5iD41o8tXKLg5T1yb5Pn+3UpMiFZTuTTfIMLepXvqih/vrHldMrakB
 dTigXTTh4eAaNUU3z+pmD83BfPNagvLVXQdk5DahgzZTBa74vSLaU+hQ5Lpy+ttmIu
 YP8fhr0oMgddV2vUTm0XQPsWumwooxDWiA2nmpWkGOuO+rS0ykmJc53WkL5Pje9BsG
 mDSYr8trWDj4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KGu4W+M1
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: bump to version
 2.1.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-23 22:54 +0200, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - Drop license comment and add REAMDE and libopeniscsiusr/COPYING as
>   license files due to
>   https://github.com/open-iscsi/open-iscsi/commit/10d50ed4bcf9ef6820f7fe544df0c3605ea4144f
> 
> https://github.com/open-iscsi/open-iscsi/blob/2.1.9/Changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |   1 -
>  ...01-SHA3-is-not-supported-by-libressl.patch | 144 ------------------
>  package/open-iscsi/open-iscsi.hash            |   4 +-
>  package/open-iscsi/open-iscsi.mk              |   8 +-
>  4 files changed, 6 insertions(+), 151 deletions(-)
>  delete mode 100644 package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8acd9558eb..b9f06a7c11 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1025,7 +1025,6 @@ package/olsr/0003-pud-adapt-to-API-changes-in-gpsd-3-20.patch Upstream
>  package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch Upstream
>  package/olsr/S50olsr Indent Shellcheck Variables
>  package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Upstream
> -package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch Upstream
>  package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
>  package/open2300/0001-fix-makefile.patch Upstream
>  package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
> diff --git a/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch b/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch
> deleted file mode 100644
> index 0423179d93..0000000000
> --- a/package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -From 29a4c3a518d13bfc0a07915e7e87fbec2b66597c Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 13 Feb 2023 08:55:11 +0100
> -Subject: [PATCH] SHA3 is not supported by libressl
> -
> -Disable SHA3 with libressl as it is not supported resulting in the
> -following build failure:
> -
> -/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/11.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: iscsid.p/usr_auth.c.o: in function `auth_hash_init':
> -auth.c:(.text+0x7bc): undefined reference to `EVP_sha3_256'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/48a4bddc355956733d712214797350cca8e111d9
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/open-iscsi/open-iscsi/pull/396]
> ----
> - libopeniscsiusr/idbm.h |  2 ++
> - usr/auth.c             | 13 ++++++++++++-
> - usr/auth.h             |  4 ++++
> - usr/idbm.c             |  2 ++
> - 4 files changed, 20 insertions(+), 1 deletion(-)
> -
> -diff --git a/libopeniscsiusr/idbm.h b/libopeniscsiusr/idbm.h
> -index be5986f..1043b27 100644
> ---- a/libopeniscsiusr/idbm.h
> -+++ b/libopeniscsiusr/idbm.h
> -@@ -56,7 +56,9 @@ enum iscsi_chap_algs {
> - 	ISCSI_AUTH_CHAP_ALG_MD5 = 5,
> - 	ISCSI_AUTH_CHAP_ALG_SHA1 = 6,
> - 	ISCSI_AUTH_CHAP_ALG_SHA256 = 7,
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 	ISCSI_AUTH_CHAP_ALG_SHA3_256 = 8,
> -+#endif
> - 	AUTH_CHAP_ALG_MAX_COUNT = 5,
> - };
> - 
> -diff --git a/usr/auth.c b/usr/auth.c
> -index 46c328e..5f50e26 100644
> ---- a/usr/auth.c
> -+++ b/usr/auth.c
> -@@ -181,9 +181,11 @@ static int auth_hash_init(EVP_MD_CTX **context, int chap_alg) {
> - 	case AUTH_CHAP_ALG_SHA256:
> - 		digest = EVP_sha256();
> - 		break;
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 	case AUTH_CHAP_ALG_SHA3_256:
> - 		digest = EVP_sha3_256();
> - 		break;
> -+#endif
> - 	}
> - 
> - 	if (*context == NULL)
> -@@ -298,7 +300,9 @@ static int
> - acl_chk_chap_alg_optn(int chap_algorithm)
> - {
> - 	if (chap_algorithm == AUTH_OPTION_NONE ||
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 	    chap_algorithm == AUTH_CHAP_ALG_SHA3_256 ||
> -+#endif
> - 	    chap_algorithm == AUTH_CHAP_ALG_SHA256 ||
> - 	    chap_algorithm == AUTH_CHAP_ALG_SHA1 ||
> - 	    chap_algorithm == AUTH_CHAP_ALG_MD5)
> -@@ -711,9 +715,11 @@ acl_chk_chap_alg_key(struct iscsi_acl *client)
> - 				case AUTH_CHAP_ALG_SHA256:
> - 					client->chap_challenge_len = AUTH_CHAP_SHA256_RSP_LEN;
> - 					break;
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 				case AUTH_CHAP_ALG_SHA3_256:
> - 					client->chap_challenge_len = AUTH_CHAP_SHA3_256_RSP_LEN;
> - 					break;
> -+#endif
> - 				}
> - 				return;
> - 			}
> -@@ -862,7 +868,10 @@ acl_local_auth(struct iscsi_acl *client)
> - 			client->local_state = AUTH_LOCAL_STATE_ERROR;
> - 			client->dbg_status = AUTH_DBG_STATUS_CHAP_ALG_REJECT;
> - 			break;
> --		} else if ((client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA3_256) &&
> -+		} else if (
> -+#ifndef LIBRESSL_VERSION_NUMBER
> -+			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA3_256) &&
> -+#endif
> - 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA256) &&
> - 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_SHA1) &&
> - 			   (client->negotiated_chap_alg != AUTH_CHAP_ALG_MD5)) {
> -@@ -1824,6 +1833,7 @@ acl_init_chap_digests(int *value_list, unsigned *chap_algs, int conf_count) {
> - 				            "SHA256 due to crypto lib configuration");
> - 			}
> - 			break;
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 		case AUTH_CHAP_ALG_SHA3_256:
> - 			if (EVP_DigestInit_ex(context, EVP_sha3_256(), NULL)) {
> - 				value_list[i++] = AUTH_CHAP_ALG_SHA3_256;
> -@@ -1832,6 +1842,7 @@ acl_init_chap_digests(int *value_list, unsigned *chap_algs, int conf_count) {
> - 				            "SHA3-256 due to crypto lib configuration");
> - 			}
> - 			break;
> -+#endif
> - 		case ~0:
> - 			/* unset value in array, just ignore */
> - 			break;
> -diff --git a/usr/auth.h b/usr/auth.h
> -index 16cdb24..9357772 100644
> ---- a/usr/auth.h
> -+++ b/usr/auth.h
> -@@ -32,7 +32,9 @@ enum {
> - 	AUTH_CHAP_MD5_RSP_LEN = 16,
> - 	AUTH_CHAP_SHA1_RSP_LEN = 20,
> - 	AUTH_CHAP_SHA256_RSP_LEN = 32,
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 	AUTH_CHAP_SHA3_256_RSP_LEN = 32,
> -+#endif
> - 	AUTH_CHAP_RSP_MAX = 32,
> - };
> - 
> -@@ -67,7 +69,9 @@ enum {
> - 	AUTH_CHAP_ALG_MD5 = 5,
> - 	AUTH_CHAP_ALG_SHA1 = 6,
> - 	AUTH_CHAP_ALG_SHA256 = 7,
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 	AUTH_CHAP_ALG_SHA3_256 = 8,
> -+#endif
> - 	AUTH_CHAP_ALG_MAX_COUNT = 5
> - };
> - 
> -diff --git a/usr/idbm.c b/usr/idbm.c
> -index 90bc142..082e1c6 100644
> ---- a/usr/idbm.c
> -+++ b/usr/idbm.c
> -@@ -200,7 +200,9 @@ static struct int_list_tbl {
> - 	{ "MD5", AUTH_CHAP_ALG_MD5 },
> - 	{ "SHA1", AUTH_CHAP_ALG_SHA1 },
> - 	{ "SHA256", AUTH_CHAP_ALG_SHA256 },
> -+#ifndef LIBRESSL_VERSION_NUMBER
> - 	{ "SHA3-256", AUTH_CHAP_ALG_SHA3_256 },
> -+#endif
> - };
> - 
> - static void
> --- 
> -2.39.0
> -
> diff --git a/package/open-iscsi/open-iscsi.hash b/package/open-iscsi/open-iscsi.hash
> index 9fd651cae8..de75cbf1e9 100644
> --- a/package/open-iscsi/open-iscsi.hash
> +++ b/package/open-iscsi/open-iscsi.hash
> @@ -1,3 +1,5 @@
>  # Locally calculated
> -sha256  9565bdf6b68b223e1e0d455d9a04d7536724a3f5b5a254e9398d06b2a0c6b6d2  open-iscsi-2.1.8.tar.gz
> +sha256  60e2a1e3058a8af7f702e86a5a0511b05b8754d29d3d2df4e0e301399b5cf70a  open-iscsi-2.1.9.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  7e6580de9d99b680697d51ec0c5e88acd9ed329139d181472cc5a592d0684fa5  README
> +sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  libopeniscsiusr/COPYING
> diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
> index e5b965b80d..00370a339a 100644
> --- a/package/open-iscsi/open-iscsi.mk
> +++ b/package/open-iscsi/open-iscsi.mk
> @@ -4,12 +4,10 @@
>  #
>  ################################################################################
>  
> -OPEN_ISCSI_VERSION = 2.1.8
> +OPEN_ISCSI_VERSION = 2.1.9
>  OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
> -# The COPYING file says GPL-2.0, but there is some GPL-3.0+ code as
> -# well. See https://github.com/open-iscsi/open-iscsi/issues/379
> -OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+
> -OPEN_ISCSI_LICENSE_FILES = COPYING
> +OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
> +OPEN_ISCSI_LICENSE_FILES = COPYING README libopeniscsiusr/COPYING
>  OPEN_ISCSI_CPE_ID_VENDOR = open-iscsi_project
>  OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
>  
> -- 
> 2.40.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
