Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F712C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A34A405D9;
	Mon, 18 Dec 2023 08:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A34A405D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yPtV9awC_pz; Mon, 18 Dec 2023 08:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B224840629;
	Mon, 18 Dec 2023 08:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B224840629
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 657BC1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27B85404E9
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27B85404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z82eh-BdvFLs for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:14:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A73214057B
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73214057B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 155C91C0007;
 Mon, 18 Dec 2023 08:14:51 +0000 (UTC)
Date: Mon, 18 Dec 2023 09:14:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231218091448.640ddad1@windsurf>
In-Reply-To: <20231204211122.12486-1-bernd@kuhls.net>
References: <20231204211122.12486-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702887291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v45rRNwt4+hkwEgTf41Pl4zo4rv3ZfkWd+v+Sx2iiqg=;
 b=XBr1Fxx0T027ZE8DaA7wsf5saLh7xTC7mDqP/+fWDn21a0UrDJI2EOujadVFjwesxD2YxA
 j91iZb5Oxd5ha7FhyKVV8wRe+KqaT5gtt6T8Jv7bU6156g6zZpyvFgpc9rTfN81LQD4nbt
 YZIyox5QnFKgn1a/QA5bMn68lrrg4vDEUECqrUNpEvN0/vb6WRhnR8ofQ+nqHU45Glq8O4
 D63T14m2wTwZgSiEetkMJOi9YX7EFcyxNUsOVlLd4BKYhF98Q2EULPrvDVLb0kWhTXjDao
 M7IAXBzfYJQ0ksXB6ORE3vbvV+b/IMpprqejC0qr7HYJZRD1hifNzhCLO05FJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XBr1Fxx0
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to
 3.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Dec 2023 22:11:22 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://www.openssl.org/blog/blog/2023/11/23/OpenSSL32/
> 
> Removed patch 0001 and added no-docs configure option due to
> https://github.com/openssl/openssl/commit/956b4c75dc3f8710bf7b4e1cf01b4ef6d5ca2b45
> 
> Removed patch 0003 due to
> https://github.com/openssl/openssl/commit/78634e8ac253a8edf338d329965724dfa8e033ab
> 
> Removed patch 0006 which is included in this release
> https://github.com/openssl/openssl/commit/e1b6ecbab41514f45e9c355d01400691f74041c4
> 
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  5 ++-
>  ...building-manpages-if-we-re-not-going.patch | 33 -------------------
>  ...ble-build-do-not-leak-compiler-path.patch} |  0
>  ...v2-ABI-on-some-ppc64-big-endian-sys.patch} |  0
>  ...ENSSL_NO_MADVISE-to-disable-call-to-.patch | 27 ---------------
>  ...ch => 0003-Revert-Fix-static-builds.patch} |  0
>  .../0006-Add-linux-x86-latomic-target.patch   | 30 -----------------
>  package/libopenssl/libopenssl.hash            |  4 +--
>  package/libopenssl/libopenssl.mk              |  4 ++-
>  9 files changed, 7 insertions(+), 96 deletions(-)
>  delete mode 100644 package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>  rename package/libopenssl/{0002-Reproducible-build-do-not-leak-compiler-path.patch => 0001-Reproducible-build-do-not-leak-compiler-path.patch} (100%)
>  rename package/libopenssl/{0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch => 0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch} (100%)
>  delete mode 100644 package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
>  rename package/libopenssl/{0005-Revert-Fix-static-builds.patch => 0003-Revert-Fix-static-builds.patch} (100%)
>  delete mode 100644 package/libopenssl/0006-Add-linux-x86-latomic-target.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
