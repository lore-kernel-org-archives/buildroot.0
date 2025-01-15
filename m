Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9061C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 08:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935E6607E3;
	Wed, 15 Jan 2025 08:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4j2I2H_eIZHM; Wed, 15 Jan 2025 08:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97F76114D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97F76114D;
	Wed, 15 Jan 2025 08:21:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5CB94B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB8980CD9
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1pFwq1w41WL for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 08:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B91480C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B91480C9B
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B91480C9B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:21:47 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id BC948440FA6;
 Wed, 15 Jan 2025 10:16:56 +0200 (IST)
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org,  Alexander Egorenkov <egorenar-dev@posteo.net>
In-Reply-To: <20250115080052.794978-1-nemaakhilesh@gmail.com> (Akhilesh Nema's
 message of "Wed, 15 Jan 2025 00:00:52 -0800")
References: <20250115080052.794978-1-nemaakhilesh@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 15 Jan 2025 10:21:43 +0200
Message-ID: <87o708lc6g.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1736929016;
 bh=eC42df0tR7xm0TN4ZFZcOwV5as+2f/W+Lj/fs/dv/Mg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Zsk1yF/TbFxUiNMOnFTyqmXhXm7QKQTsMUdNa01ZuEN9s7oIDDzoWI8Xsfs3iyJmg
 XLXU53R1a/E2D6pAndEmxtLG9ZirOS96KFCce2dbcYYkbXWppbmEflcyGMGcxcOcfO
 MO8epOABjl5jwpq6M1oOLpF8/tUJVFrTrOygogN131rtg/LIm+IVO8iRnbIvc4pDAi
 KJCejeEIi8FXXTmVY6cougftZRI2jRyxINWGxcSiurRXeCOc9U17VkU7d7J2N1yvXw
 9dkefZRbCA5gAmWWcHjmRnslc86n1gZp7W8BXuzW7fMzRUBUDjYrIBGQBlHN1lGA07
 unx7nLJ3dFrXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=Zsk1yF/T
Subject: Re: [Buildroot] [PATCH 1/1] package/makedumpfile: bump version to
 1.7.6
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Akhilesh,

On Wed, Jan 15 2025, Akhilesh Nema wrote:
> - Rebase 0002-Handle-__mips64.patch
> - Fix a check-package warning related to Upstream tag.
>
> Release notes: https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.6
>
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/makedumpfile/0002-Handle-__mips64.patch | 8 ++++----
>  package/makedumpfile/makedumpfile.hash          | 2 +-
>  package/makedumpfile/makedumpfile.mk            | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/makedumpfile/0002-Handle-__mips64.patch b/package/makedumpfile/0002-Handle-__mips64.patch
> index fd3fdbbb39..b3fc6fba05 100644
> --- a/package/makedumpfile/0002-Handle-__mips64.patch
> +++ b/package/makedumpfile/0002-Handle-__mips64.patch
> @@ -14,7 +14,7 @@ Fixes:
>   - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638
>  
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/makedumpfile/makedumpfile/pull/11]
> +Upstream: https://github.com/makedumpfile/makedumpfile/pull/11

With this change you can remove the patch from .checkpackageignore listing.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
