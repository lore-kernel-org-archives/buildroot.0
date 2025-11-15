Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A4CEB2E4
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 17:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53CA40FB3;
	Sat, 15 Nov 2025 17:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlKgNYLUa8TP; Sat, 15 Nov 2025 17:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C9740E6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C9740E6E;
	Sat, 15 Nov 2025 17:57:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C94D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72BAA40E59
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gC7i8X_VhiA for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 17:57:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 260D340869
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 260D340869
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 260D340869
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:57:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.24.181]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42nS-1vKKWb4848-00C5Zo; Sat, 15
 Nov 2025 18:57:26 +0100
Message-ID: <7204645c-ee5c-486c-8179-9967ab4bb9f0@gmx.de>
Date: Sat, 15 Nov 2025 18:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>
References: <20251111212632.51340-1-thomas.perale@mind.be>
 <20251113211248.6645-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251113211248.6645-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:pUal7tvrbrf3jErBkFKJmuAWlkMaomHPHSuENT1707nAdGPVFLv
 v6vCV4X3gHIMZ+c0BU1Hq7drOCfI6a3IZtJppEowNJDfvuJGhxrS9DmH2icZhTo7xHHY051
 9dRG8lz/pW9oN3oYzjShDMgec9t4FiiQUXJlVKytEUJ7DD7Q4SgipjDfjgyaWHoJ51CXWSw
 fhiqEXm5gOCD6EpMY7jNA==
UI-OutboundReport: notjunk:1;M01:P0:lTmeiH+zplY=;kLLaxM5VwYuzOtq/aivDui8mmBN
 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
 F/UlsONoLYArJC0Q8bD5S4bWrSzwQ1d/1LpuMU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1763229446; x=1763834246; i=fiona.klute@gmx.de;
 bh=91UHfP9tPWcAokFAJPpzCcLk1b3XwujLzMQAEFLMwh8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uIhxfwxxcWmqaw1X3Td7mzJxAtuMqs6sueKWNtOl9NrxoCg+tapMaskmm0jcwyxK
 DOI5ybuK/qYjofu9A9Yg+rKqF4Capcmqe802pnoADSL8PgjjTThf1hIvmHz48bnRK
 xe4egCGOKnjZ3Z0RQEkRnrhtwoAgl183xLA4D+XoJIbWUccq1Y4+vTN5yeXu/DsL8
 Vs9rkzdNcU+loZ+7qDntfsF7/2/wlC/zD8TvA1BFq/mhz0br3I2Lp5TQr+IOQCmFy
 WWLiSVgsY5kE1g0zJHSwg3JZexCHAgNWRSk9xRUn/Jo9tOhky2lEevL9n6QYfRpPz
 trji/yY87tEC4XSjpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uIhxfwxx
Subject: Re: [Buildroot] [PATCH v4 0/2] Add external tree information to
 CycloneDX SBOM
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.11.25 um 22:12 schrieb Thomas Perale:
> Hi,
> 
> I created this ticket https://github.com/CycloneDX/specification/discussions/720
> 
> Let me know if I should add anything.
Thank you! I've added a comment to emphasize that packages from external 
trees aren't necessarily packages developed by whoever supplies the 
external tree. Let's see what they think. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
