Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4257606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Aeb6bBO0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67FCC8135D;
	Wed, 11 Nov 2026 00:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKKDZBEni03l; Wed, 11 Nov 2026 00:38:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BBD6D812AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794357527;
	b=QXTB7YSFBejTvORQNKmQDgzwsN1vTbhuA506o0FgeTto+AqamZ25CcLYVEP+GUBzHpJu
	 3waWXhVzO5ePTDYhI+XCd+Z/TnfhG4pR/xMFS3wfQ2xg+OL+PNuo+4plGYnNQ5FkCo+HY
	 2RW52Enckyw5G2sQc16/2E8jYJaLupXx8hprPS6n+fyGvFXTcJof6DG91rBvKzICxgwDs
	 m0TUk1diDdaJnXVYltViltdbxXRPOiapbXzefcROuP/xIkZrpEkC2BXWfMEEIiXqUIyux
	 VM6Q3Y/H7KUMCM9L2nmnXCm6x7WPpmZPDArUw4gMBbndor+FfCyQ/7Sp3lMhihNEl6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794357527;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=32wNs4DphhE4Fv4ZJMx37XrX6zsLwOKJ2VPpInxGXL4=;
	b=aHUKYQK9cLFm6i3RpNNqITUFvF60isCffqgbvqyPYm0YGFkXcaQH4qVhapPETYSfYktZ
	 QFPZCOJBqyOxXJtwiUZP0lCkKI1TR5siGF6sbQAdDWEQqx6lc+HShTP03Ym17Q+H88fkb
	 CqClC76GyOZHk6PUtEVN+xKeS1PpItmPrCd9NwCgDPtGXMSTDiJsahUAeGo95/pXTItIh
	 NyJOCm3ibCk3b3ingk3sneBQ/zhLJXMkpfTtkKf78gh2qDESZSdxOE34X+ahNimKCkeYd
	 WdRynPfj1N49ptxxnHAPUNwWJsPZ67zedTVuESm07VKs+V1ga1yie/oq68J4kzlv1iA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794357527;
	bh=32wNs4DphhE4Fv4ZJMx37XrX6zsLwOKJ2VPpInxGXL4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Aeb6bBO0cw4vDFZiG+h3ra2VqwCVykRJnYLwEYn7BJfp/ZRofUBZwCEUCWf647H5m
	 c7B5ON7iMzf6JT3BUtqje01cmq0IKeWwpwuvyFgmhXPvuVOcBMSF69odo3b0WCFfMz
	 mt3qXwrILOog4VCrcjtU96TR5DXtLm35IRn2gW5HNcHaj//vKAVn2exehrV11Zqhbj
	 9sVnyteeAPK44aAiluWArlRQLDz+CRCUJdiDG8cx9xMaNb1lWUp1TOI3YGAQfnlV7a
	 eUeMW4Z0LtTLDDOG2ek66tb4RaRskKtCRZ8c1ojXf7Z34U75CEYcpMuJROfD9DvSFt
	 A7/KrkkBKXgqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD6D812AA;
	Wed, 11 Nov 2026 00:38:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0BCD9D1
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 00:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA653812AA
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 00:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZN4YVBP-d5dm for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 00:38:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30E9D812A0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30E9D812A0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 00:38:42 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794357520; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:BSNBo4boORGeLRP3gILvE7O5qwfX
 TDkdWFaoVf7rB2b4s0TiyO0DhmZbyJjt43jJfjNuEcJDqJorLfanjzZ+dAI90cCv7Jocl3DW8WF
 Of4K3iolTZXONr0Mli0D4gJVgXWDjF1kArfCCby3nw82Q2WtoDsKZoj0fvwsrvRGg7FJhJcZXci
 GwbT+4Dlhu5NpSgTDYYmHCTwPnb6JdlC7ZSUptHEWmXDK6Mnx1Nbl93G4ws2w62wMI4CMfMDpu1
 9u3l1iyuV/bIpIbtdbqVCcLo45dxUnDT8pp0vBPfO5+37buTFe4egtaUaNnrJ+QMKzmHiHoFkM/
 JAQgtc4+jWSqYw==;
Message-Instance: m=1; h=sha256: H7zK2AOAQoh5fJAWwJX9SRRNUsJ5BR9EWci063eeDus=:
 AJJq0uPLRAOstytq38k+BlKwkPJW3eYa2RDaPkLOqRs=, sha512:
 v4hiBZ9q3DGUXqy+S3LkDXzGwwF027TDFgV8lLP+qj/ua4abrwpF+t76CF/P1kqJkc43WHSxmho3FW9Me8iVRA==:
 uWu5QZKUkXr0uZIX/od/ilpggNWMapgIbrZsLoOsN2Agv2a+3+suUxgOKdkIpUFRRJyHK2UA4Lx2PW3UhSphjA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2aN-1wj3Ie3Bln-00gaXr; Wed, 11
 Nov 2026 01:38:39 +0100
Message-ID: <e5bcfc97-dbc4-4cca-bddd-9533e0027f4f@gmx.de>
Date: Wed, 11 Nov 2026 01:38:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20261107121327.1314641-1-thomas@devoogdt.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261107121327.1314641-1-thomas@devoogdt.com>
X-Provags-ID: V03:K1:cA0ZaNsmQtdWJ060KxybIXqpzSNfwguXuIqfshssr95Fk3Anx7r
 jwva6MMqfiLNC00uZvyjAZqG8sXQI5Eau47U2CsAHthCTztTCdPOoEWlbFU1B+KcymLv8d6
 covNlOWgchNFYYjuWtzMohJyDAQDoKbv3e+eOEVTDs0DOOlvp4lGOwlGqvEZ/25qPgltLGR
 ie4fqgLYXy5rL7QaM3TOw==
UI-OutboundReport: notjunk:1;M01:P0:JORgA9PjJxA=;qJOHn4Zyj+nt29KnyZelUxHTVRf
 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
 kKcBb
Subject: Re: [Buildroot] [PATCH] package/util-linux: update license info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 07.11.26 um 13:13 schrieb Thomas Devoogdt:
> Audit all source files and README.licensing in util-linux 2.41.5 and
> align UTIL_LINUX_LICENSE, UTIL_LINUX_LIBS_LICENSE, and their
> corresponding *_LICENSE_FILES:
> 
> - Add GPL-2.0 (sys-utils/lscpu-dmi.c, sys-utils/nsenter.c); drop the
>    outdated comment claiming no files are GPL-2.0-only.
> - Add GPL-1.0+ (disk-utils/fdisk.c).
> - Use BSD-4-Clause-UC to match README.licensing and
>    COPYING.BSD-4-Clause-UC.
> - Add libsmartcols to LGPL-2.1+ in both util-linux and util-linux-libs.
> - Add lastlog2, liblastlog2, and pam_lastlog2 to BSD-2-Clause, and
>    include BSD-2-Clause (xxhash) in util-linux-libs.
> - Add EUPL-1.2 (schedutils/coresched.c).
> - Add crc64 (lib/crc64.c) to MIT, and include MIT (crc64) in
>    util-linux-libs.
> - Add Public Domain (lib/*, mcookie, setpgid, setsid, line).
> - Drop Documentation/licenses/COPYING.GPL-3.0-or-later since GPL-3.0+
>    is only used in tests, build scripts, and the disabled hwclock GPLv3
>    date parser.

I disagree with omitting these, all licenses for (parts of) the source 
package should be mentioned. GPL-3.0-or-later should be in _LICENSES 
instead, ideally with a note to help people who are checking for license 
compliance.

Best regards,
Fiona

> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>   .../util-linux-libs/util-linux-libs.mk         | 14 +++++++++-----
>   package/util-linux/util-linux.hash             |  1 -
>   package/util-linux/util-linux.mk               | 18 ++++++++++--------
>   3 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index d434a8f461c..53b9fb05ffb 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -13,13 +13,17 @@ UTIL_LINUX_LIBS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
>   UTIL_LINUX_LIBS_CPE_ID_VENDOR = $(UTIL_LINUX_CPE_ID_VENDOR)
>   UTIL_LINUX_LIBS_CPE_ID_PRODUCT = $(UTIL_LINUX_CPE_ID_PRODUCT)
>   
> -# README.licensing claims that some files are GPL-2.0 only, but this is not
> -# true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
> -# (but we disable that option). rfkill uses an ISC-style license.
> -UTIL_LINUX_LIBS_LICENSE = LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
> +UTIL_LINUX_LIBS_LICENSE = \
> +	LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), \
> +	BSD-3-Clause (libuuid), \
> +	BSD-2-Clause (xxhash), \
> +	MIT (crc64), \
> +	Public Domain
>   UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
> +	Documentation/licenses/COPYING.BSD-2-Clause \
>   	Documentation/licenses/COPYING.BSD-3-Clause \
> -	Documentation/licenses/COPYING.LGPL-2.1-or-later
> +	Documentation/licenses/COPYING.LGPL-2.1-or-later \
> +	Documentation/licenses/COPYING.MIT
>   
>   # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
>   UTIL_LINUX_LIBS_AUTORECONF = YES
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index b6393d6ec01..4f1378fdbd6 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -8,7 +8,6 @@ sha256  ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Docume
>   sha256  6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665  Documentation/licenses/COPYING.EUPL-1.2
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-only
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
> -sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  Documentation/licenses/COPYING.GPL-3.0-or-later
>   sha256  e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
>   sha256  8555341619542abb48c102afd954e42d4478e5be16ad3d5af7b0ff71009e7348  Documentation/licenses/COPYING.MIT
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 9ddf48a343b..d973b33d401 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -12,17 +12,20 @@ UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).5
>   UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>   UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>   
> -# README.licensing claims that some files are GPL-2.0 only, but this is not
> -# true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
> -# (but we disable that option). rfkill uses an ISC-style license.
> +# Some files are GPL-3.0+ or LGPL-3.0+ but only in tests, python bindings,
> +# and optionally in hwclock (but we disable those options).
>   UTIL_LINUX_LICENSE = \
>   	GPL-2.0+, \
> -	BSD-4-Clause, \
> -	LGPL-2.1+ (libblkid, libfdisk, libmount), \
> +	GPL-2.0 (lscpu-dmi, nsenter), \
> +	GPL-1.0+ (fdisk), \
> +	BSD-4-Clause-UC, \
> +	LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), \
>   	BSD-3-Clause (libuuid), \
> -	BSD-2-Clause (xxhash), \
> +	BSD-2-Clause (lastlog2, liblastlog2, pam_lastlog2, xxhash), \
> +	EUPL-1.2 (coresched), \
>   	ISC (rfkill), \
> -	MIT (hardlink, flock)
> +	MIT (crc64, flock, hardlink), \
> +	Public Domain
>   UTIL_LINUX_LICENSE_FILES = README.licensing \
>   	Documentation/licenses/COPYING.BSD-2-Clause \
>   	Documentation/licenses/COPYING.BSD-3-Clause \
> @@ -30,7 +33,6 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
>   	Documentation/licenses/COPYING.EUPL-1.2 \
>   	Documentation/licenses/COPYING.GPL-2.0-only \
>   	Documentation/licenses/COPYING.GPL-2.0-or-later \
> -	Documentation/licenses/COPYING.GPL-3.0-or-later \
>   	Documentation/licenses/COPYING.ISC \
>   	Documentation/licenses/COPYING.LGPL-2.1-or-later \
>   	Documentation/licenses/COPYING.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
