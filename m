Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4148ACF258C
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 09:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D224B82AC8;
	Wed, 19 Nov 2025 09:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTG0qH7PiWbs; Wed, 19 Nov 2025 09:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24CBF829FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24CBF829FE;
	Wed, 19 Nov 2025 09:02:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD027160
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 09:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A375140200
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 09:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MvjFadNcb96 for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 09:02:02 +0000 (UTC)
X-Greylist: delayed 549 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Nov 2025 09:02:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B27C40074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B27C40074
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B27C40074
 for <buildroot@uclibc.org>; Wed, 19 Nov 2025 09:02:01 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 677DE44075B;
 Wed, 19 Nov 2025 10:50:57 +0200 (IST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
In-Reply-To: <pan$ad6d3$5135641b$d770d362$88a45f61@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Wed, 19 Nov 2025 08:42:29 +0100")
References: <20251118211149.2013582-1-bernd@kuhls.net>
 <87ikf6wriq.fsf__24259.6589656145$1763528538$gmane$org@tarshish>
 <pan$ad6d3$5135641b$d770d362$88a45f61@ID-313208.user.individual.net>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Wed, 19 Nov 2025 10:52:49 +0200
Message-ID: <87cy5ewgim.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1763542257;
 bh=WVNrqOni57Hi9cMLf1YhPJS0ECcn8eTnAbdwpHxQE8I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QtKcFMhMc65LRIu+Vp9qLqln+miwgENUIXgYPlqqeIsmg+q/6lJFQ9pC0AfnO81he
 5+BG+PJFMQjmG9w6xqKTDdjEOXfSe+um4Uxu1yDNB1LP9bp6OLTOFIEjLe34U4iyvP
 M1L7nPNeqfdDGQuZCEHBdn5tMXYXmaWvGIkYnLQ//3d6Sfw9wdumGVU5+OhEc0M4QI
 vq9k11CRN9VroqZVyGKSEXlM3P3d4P89GOW9sTcWDmYAP7TuiUnwN43JRZmF7JudOi
 m/j+ZxlGpa6b+2Dju0bBN5SuPRpKAzbJ5mwMFIUjJ5BD5RvdYcKAfCvARLcjiX4ELf
 seYCCLuGZIqog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=QtKcFMhM
Subject: Re: [Buildroot] [PATCH 1/1] package/xinetd: bump version to 2.3.15.4
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

Hi Bernd,

On Wed, Nov 19 2025, Bernd Kuhls wrote:
> Am Wed, 19 Nov 2025 06:55:09 +0200 schrieb Baruch Siach via buildroot:
>>> -# 0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch +#
>>> https://github.com/openSUSE/xinetd/commit/
> 91e2401a219121eae15244a6b25d2e79c1af5864
>>>  XINETD_IGNORE_CVES += CVE-2013-4342
>> 
>> If this CVE is fixed in 2.3.15.4, why do we need to keep IGNORE it?
>
> being by no means an expert on NVD entries afaics the CVE record does not 
> contain a version number:
> https://nvd.nist.gov/vuln/detail/CVE-2013-4342
> so we still need to ignore the CVE.

Thanks for the clarification.

I think the comment should mention that NVD data is incomplete to avoid
confusion.

baruch

> OpenEmbedded does something similar:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/
> xinetd/xinetd_2.3.15.4.bb?h=master#n20

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
