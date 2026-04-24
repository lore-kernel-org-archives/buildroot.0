Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A00FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E1CE42991;
	Fri, 24 Apr 2026 16:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5Htex19pxQY; Fri, 24 Apr 2026 16:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5221242987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777049659;
	bh=yRgquXmtAf51qV9FvEN5N5rerOqRuew6fY0mrkvCXtE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KWbGA+K2eL1hvF+HbXdabLzZbZ43fcinoNar3cFSIYz9bPtv6os5c13QmYWjLoymT
	 0Ga/jDrpPENPNQdtmGav8UtoeqR7glXGYfoNC3/hqFYZxaoniI/Z9EHwbkeR8cEMzH
	 0je79cv2fZ5hbEzPRA7FNSCSgW5wcxZFA5hY2jVP/hrLCcHQ3ukR4BXybhivyQgbC2
	 m0qvIIBJRhSmvuxppAsQ/fHwTjxakM4BlbC0yDjqT5WBbE+Tz/ptFVmZDHysWCsdsW
	 ZyPZxG8WHrYPgtyCiBfCEtNcvU1Jcxv8RxL6TjvHFajsJaM5ZW/uMV/sF4gk91v3Pq
	 s7xZ73ZXhvOBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5221242987;
	Fri, 24 Apr 2026 16:54:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2FAA231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D88F461C55
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujHKtqeVL8sN for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCD8661C56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCD8661C56
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCD8661C56
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:54:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 839A1780383;
 Fri, 24 Apr 2026 18:54:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 18:54:13 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 18:54:13 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260421000939.640249-1-daniel.crowe@maxmine.com.au>
References: <20260421000939.640249-1-daniel.crowe@maxmine.com.au>
User-Agent: Webmail Free/1.6.14
Message-ID: <2973e2a2a61a660ad08d4567f3f87bd2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777049655;
 bh=zb9/zJsKVvX1v4KqnOVT+jKhP5qLuj66LsB50OSED1Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k3BnWNrbBNJZu8Dh/s0RdaGhZFQWSJ9fVMJGdN5EymIwK5lRpL9wzDKgReuFJQXn+
 aufWp7azoRwnTx5t6c8mpqayCmCRYyNPvLOrpKVIgl2Gxdm89ETxhDmmk0oTTgK34q
 oB5CwuIITPdSafMI0tvJG8B+FuE1Rp3FRosKencFvTXrwYIIIThf8bl2Qub1xBBQXh
 pEke00o5BALGspwt7AX4Sk6IQ4udmYW4tMH4AR++KI8H35HTDfy5Z2PLBx1+wEFTLS
 528X1SpqCJE4I/bXJNSYIYWhEXXInr2zpWyZEPa4iQn46fQSLyzHg0mRYHhD8wyrxi
 /UBuIkLj7dz0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k3BnWNrb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-caching: bump
 version to 2.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/04/2026 02:09, Daniel Crowe wrote:
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
