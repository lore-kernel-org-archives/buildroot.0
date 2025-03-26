Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BE4C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 09:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0CD141A58;
	Wed, 26 Mar 2025 09:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6V5RTnolZRF; Wed, 26 Mar 2025 09:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6EE341E53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6EE341E53;
	Wed, 26 Mar 2025 09:06:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48B9FE4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 09:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F2B660880
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 09:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln1RDwXBketn for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 09:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B79660B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B79660B49
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B79660B49
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 09:06:05 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id C03A94409AF;
 Wed, 26 Mar 2025 11:05:39 +0200 (IST)
To: David Picard <david.picard@clermont.in2p3.fr>
Cc: ML_Buildroot <buildroot@buildroot.org>
In-Reply-To: <2834e139-69b2-44e3-aceb-b8b6f44cde22@clermont.in2p3.fr> (David
 Picard's message of "Wed, 26 Mar 2025 09:37:35 +0100")
References: <2834e139-69b2-44e3-aceb-b8b6f44cde22@clermont.in2p3.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 26 Mar 2025 11:06:00 +0200
Message-ID: <87cye4ma9z.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1742979939;
 bh=YfZCOcSQ/QXKyBlDwxicQvfzlqfxQTh4nxwh1Nv5U1I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pO3UQkXvPsO+lWtYioxj92ftLEdQ4XfJXQQlLi7qYZNyJ+U+pXzpUzAGvdpj77pfQ
 4vQdYeJzZC01n08CC/XEVmU6w2BNQ4K5rhfauXo3TuZOkDOeWIXx3gEy/Ylm3YKmag
 UYv5M3YioZHzAWQVWtsaitvTRSp3LryEL+JSeXjmNTEP2x4+Gb6/seFUySj8APaxyA
 WGj78v+zPXmGfKPbkFtvz35DAwdpsAdpRjRgQSQvimGKUEbL9BZgMosmVm9sxxRtsn
 qilSjAkqrSHte9H7o3sIJZgsMkyGBo8HkQt6mV5iaLmMyn/5SVY+RfANjjdxRp6VT1
 jAP8RyhZoWJuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=pO3UQkXv
Subject: Re: [Buildroot] how to force-check hash for extra file?
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

Hi David,

On Wed, Mar 26 2025, David Picard wrote:
> In a home-made package, in addition to a Git repo, I need to download a binary
> file. I do it with curl in a pre or post download hook.
>
> I provided a .hash file for the package. Buildroot actually checks the Git
> tarball hash, but not the other file's. How can I force it ?

Try using PKG_EXTRA_DOWNLOADS. Buildroot should both download the files,
and check their hash. See package/asterisk/ for example.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
