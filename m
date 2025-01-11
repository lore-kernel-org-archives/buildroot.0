Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5116FE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6716075D;
	Sat, 11 Jan 2025 15:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ep1VbUpl1hFQ; Sat, 11 Jan 2025 15:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 075A860701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 075A860701;
	Sat, 11 Jan 2025 15:34:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6013E940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB40410B4
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Li4uSYv8wo88 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EC7340E5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC7340E5E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EC7340E5E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:34:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6213E13F8B8;
 Sat, 11 Jan 2025 16:34:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45564])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 16:34:11 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 16:34:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250109205901.2396719-1-james.hilliard1@gmail.com>
References: <20250109205901.2396719-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <178861c31cdf8d23b4d78484ef50ad15@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736609653;
 bh=e9WrlN/enojSs6HWQBhBNok+fvcoF0a+DHgjqaCv4UA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ab1P3EnGmp5nFJvxji1q90sJn1KXPHogiDqS2iUmQpNnMRMaBRevIfMXbbEWtoAy3
 nHFubiIBB6mrAhs1ZMuz+AwJ8TlCTwYqeEN3tXl7f8LV5Qql1Qa5QqQd99EVJwZZXz
 vM04v8UlVs2nq3P/2lhwiE39rKeXs0x5YR2Zu0JopR9W3ev3Bi2vZC7Bw5Y9Prg6Po
 F4YqxfV7Lv8OCbge6yWkxa4hnV1IFV10S8P0wwxg2M5tKJssot+dz3GTRWxx6HQdPs
 xB1dHHNp1pPS6cm8UWBXwP9U6khn/+8a0HmK8nRovfbL5ZMuTLP4otWQSsD6Ona+Hl
 gB0qh5gRTtPlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ab1P3EnG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-git: bump to version
 3.1.44
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

On 09/01/2025 21:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
