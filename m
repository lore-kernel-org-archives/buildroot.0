Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95911E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8CE80B8B;
	Sat, 11 Jan 2025 18:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWXvLXYgPzFM; Sat, 11 Jan 2025 18:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151348127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 151348127F;
	Sat, 11 Jan 2025 18:36:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D862A940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5804607D6
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6cLlXrXlaxg for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FB706079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB706079A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FB706079A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:36:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 62DB119F54D;
 Sat, 11 Jan 2025 19:36:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50694])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 19:36:12 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 19:36:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, "Wojciech M . Zabolotny" <wzab01@gmail.com>
In-Reply-To: <20250111162913.2883216-1-james.hilliard1@gmail.com>
References: <20250111162913.2883216-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b940caa17f7483efc7a46b42d1d13918@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736620574;
 bh=GIkh7NusPNJXA6uWwO5EXwA23QMWKuWiSqzteJNpWuU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qc3topHD8bALj7Su0mAyrL+J85teww5pt/Mjgy4m1sLF71vcjPr0ryOM7AGf7ALTW
 o1sAqLSfa1i29TdLgeHTf7G/KyT5bA1F7RufX/zknDIAvTmryU7scK9c0REagWXNoe
 Bf5t1rb+2YDVQnoPmvkHESESwDgwhmf9LGDjJpGc2L8Afeh47FgLScEzlFYsy9t9R4
 UcSjIyKP2vxdhw0ZgrMgVq99k/NO/yiN9JWIdAhFcKpDrqCzWKjeaqYe8AYaUkwy99
 O7sJZUEmmJlMpe7HsRug7gp/SZLF1Yak3tkrrB+CA/scNuqsGtGG/895ElOOVYSdca
 +/hCZ0sUCjVtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qc3topHD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyusb: bump to version
 1.3.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 17:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
