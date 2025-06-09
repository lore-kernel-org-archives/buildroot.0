Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD957C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9307361298;
	Mon,  9 Jun 2025 14:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrm9RlWrC3bF; Mon,  9 Jun 2025 14:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53C1610B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B53C1610B7;
	Mon,  9 Jun 2025 14:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C1B41F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3244F610B7
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQbhLC_cV6ws for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:09:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5142860B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5142860B16
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5142860B16
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:09:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1320958283; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Jun 2025 14:09:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uOdC5-00EFuR-2r;
 Mon, 09 Jun 2025 16:09:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>,  buildroot@buildroot.org
References: <20250608110626.17746-1-ju.o@free.fr> <aEXH2DWromIdh5wW@landeda>
Date: Mon, 09 Jun 2025 16:09:45 +0200
In-Reply-To: <aEXH2DWromIdh5wW@landeda> (Yann E. MORIN's message of "Sun, 8
 Jun 2025 19:26:48 +0200")
Message-ID: <87ikl59fbq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=E3k6qziEQdmhEcW5M5EkYzMZLDIbsT1sD6Jhv9uEOx+I2QkaGWK9hq2vj7XUSl7IZVblMhCs/XVK6wlMMfxYOen0cx7CAUl0gnaYB1fyciV8iJhFu6aIaT5kpB/+JBjuy0gUQ0KofZQAO/IElIRUo6l/COT5bg4irrppVe2Y6Q/sOigFqL7m99imr5/2/+dLW6IawTBeZLrH2KSZtTO3nl1X8CnfJwMH3rdHS0DLdIZMUatjvTfUk1vVlsRgOMCjYD9ykGJqfEA9bz7nSfWxMOloFNLFfipIJbqHmBmXCzzsc7EcTcui3LTUwI81lU/VuJ8FHJWcZBnKlo6QIUIkFA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=26T7FrDtArl9d5i23P514QNpfvbQZglvuyBVOma05U8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=E3k6qziE
Subject: Re: [Buildroot] [PATCH 1/1] package/podman: raise kernel header
 requirement to v4.14
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Julien, All,
 > On 2025-06-08 13:06 +0200, Julien Olivain spake thusly:
 >> Since its introduction in commit [1], the podman package has a
 >> dependency on a toolchain with headers >= 3.17, which was propagated
 >> from libseccomp and slirp4netns. The podman package also selects
 >> BR2_PACKAGE_SHADOW which has a requirement on toolchain with
 >> headers >= 4.14. See [2]. This requirement should have been
 >> propagated.
 >> 
 >> This commit fixes this issue.
 >> 
 >> Fixes:
 >> 
 >> WARNING: unmet direct dependencies detected for BR2_PACKAGE_SHADOW
 >> Depends on [n]: !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 [=n]
 >> Selected by [y]:
 >> - BR2_PACKAGE_PODMAN [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]
 >> 
 >> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/ebbaac08e3f462bf023c12077f739ed1c0543eb2
 >> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/f78c5cb5cae93a9e63dad4361d78e1787759382f
 >> 
 >> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Signed-off-by: Julien Olivain <ju.o@free.fr>
 >> ---
 >> package/podman/Config.in | 6 +++---
 >> 1 file changed, 3 insertions(+), 3 deletions(-)
 >> 
 >> diff --git a/package/podman/Config.in b/package/podman/Config.in
 >> index 4378d9918d..2bcb8e71d2 100644
 >> --- a/package/podman/Config.in
 >> +++ b/package/podman/Config.in
 >> @@ -5,7 +5,7 @@ config BR2_PACKAGE_PODMAN
 >> depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 >> depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 >> depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
 >> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp
 >> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow

 > I always wondered how we should express this situation: should we keep
 > both dependencies? For example, if shadow dropes the dependency on 4.14,
 > then we'd drop it from podman too; but then we'd be missing the one on
 > 3.17 as inherited from libsecomp...

We could, but I think it is quite unlikely for a package bump to add
compatibility with older kernels.

 > But anyway, there's no good soltion...

 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > Thanks for fixing my mess! ;-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
