Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F41C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 09:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD2A60639;
	Sun, 16 Aug 2026 09:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNtDJLLnreLV; Sun, 16 Aug 2026 09:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 692AC6063E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786872245;
	bh=523Fa/SxjmWnS5U4g6QexP5cqrHTXuPoSCPCTFM/XF0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gAFqxT1EQEb+TJrtx7Dg9SVP0Iz1Eyaal6aP26qfk40CS/zaSzjdOOVTdMBJYaXOh
	 t/F+pXlnyrQeBixNbPeankdAPaVGyA7rPoM9PCkTFcynazwi6HOQ69OEz37jz6Dtqy
	 jGf9qtMRd1GCO4n6miiPlZ/664q3qG3ft4P3lQGizN7O5GS7ZkA6BOdyUKVWTL4GKp
	 GxWiTikNHQqpONSNbwRCIIs2nNoT8wPZnbleK0VkG0HNk518DgV24/G41Jyrc06+CO
	 5c4lqVVNs02RsESR6wldkfRBiL+XykmaMV4Vg01L8VYgwQsunmO6nwvrxRpAVem1qr
	 D6axcPVR63S9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 692AC6063E;
	Sun, 16 Aug 2026 09:24:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62BB5334
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 489904073D
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnN-ses0CCdN for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 09:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32136406F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32136406F7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32136406F7
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:24:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C67CD19F5B2;
 Sun, 16 Aug 2026 11:23:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 11:23:58 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 11:23:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260816080802.2794593-1-bernd@kuhls.net>
References: <20260816080802.2794593-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <314190d8987705ef942b0edfb0592a6f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libffi: bump version to 3.8.0
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

On 16/08/2026 10:08, Bernd Kuhls wrote:
> https://github.com/libffi/libffi/releases/tag/v3.8.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
