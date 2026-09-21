Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1271C982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 17:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8F060778;
	Mon, 21 Sep 2026 17:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez2-1HZMuPBo; Mon, 21 Sep 2026 17:30:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A37986075E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790011805;
	b=Ek7M7ttnVxKrUqHUYy/Osf8Lu+AWP0J+kJOLn3DTlDNx4cPAsXqaJIfTM3nKP28zgzOA
	 Q6Pl98HuzguQaihwi4few8QQE5BVW9zvwLzti1QixvfcGLrta6EmwtKEypiDrZbsvbxCm
	 D5WOLMkhjDCwlE3VXml9qXdFQVE0ijf8sDGpDl4YIP7ZrmFQhS5DMjbGleBo+s9OlcEB+
	 w2Uphy/Cn8cqMq8wtwJwlSMikADZBPR920epuwTCULv8H4qeAZEwTmDTG6R/P0CRsFRCM
	 byq67qyN5UDae1z2eKkKc3yXmcaih5ROQjtfL8krTjmZpH6Tis++9JbV8yziPQIiq+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790011805;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/3WiC5IE8RMngKRiyHj9x2DJSUVHNF3+bQmX+LZEZYo=;
	b=k7MWubLkkROqJDuAaDsf/F16BMOjXYNW+PMmiQSH053Vkm1fuRJP1c0gwGsvSAm7get6
	 y7L69UhY/8ouUJgHOLKXWypoe+7XjJDXSIG92SmW+uwgUdVQ0zpakT2wUNChqHy48qV7m
	 v1OoVvPqM/FLHVIhfj5JZoJ57o7un9dIPlwDz8JXyU/v29quniBhG1/hmjRhSSoDHNMFV
	 4kbvYfTAi7+PFaVSgPztYEkNJgOte9suN14HGhz0FEkg6qkSmWbEHRWHelo7ib4go9d0b
	 8Iu038zD625UzSEqzg69BLwP9wdZyv1omcyxhrAOYhuV3vyaMgk9CzQDRoBklKFOpsQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790011805;
	bh=/3WiC5IE8RMngKRiyHj9x2DJSUVHNF3+bQmX+LZEZYo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ID5+ZuRCfIQ28/lz3NX7qUqtPvJVLlzf4jro5RyMS074/t2AHknrjGzuqMpCktHdX
	 DSogwxwPhfibY2JTrJxujqcrxhiBKplTtnfonXwSPOsSHYPZEMKIGDHnnclXxNciOk
	 Ph8Rrrt0EMfWbAqAub4Zwq7NsI91cR6Zp5wA1ERvlibBBHtUhaN9DyClAsR0fqz5i2
	 FKSk+6LmYDINBgF7enwvMGWsvKxOMlvuAXmCruZdRMslffG+zhBlh4UgKPrqLF+Mr4
	 VxYokuYaMXyAet8vGZdEDCFGc8Ow4M1VxpXqOXs5ZprkPlN3Dv9g4jolCVtx0CVf0a
	 1ncCy+JWmrsYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A37986075E;
	Mon, 21 Sep 2026 17:30:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E161824D
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7341401DF
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S98T7Hie1cO for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 17:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D8B794005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790011803;
 b=iBKaT5LUVNGy79RfqY0+kJkYWopdqdl08/EknzheULDqdNSN5hKJ0alV1eAEYtKekQHR
 nqM0h8BCv/Av2e0pawXcGk/XAGK2xe3bEx1/w0FHlgdWh+8x0hKmxWDgC2q25RDYbMOCM
 G5iqKXtLVsOaXnHK5eA5U0a8kOLYmyzsfAjPapNJ8yTsmre+HlcMKr3XxIQtsfpWZXbkg
 japRIGsPYlYPDPlEYn7ZWpnuJUgeQuvbRYVAoRQszIQIsgH4DahPAsChU/pj/DBZedIc7
 E6Tl01ZRIjDK2QDDzatMutuMUI/j/Itlu6re4eHss9KWU/5jtIpo69ctXGxS28kNa8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790011803;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4gMg3wD/H+fnA5JPI8ycYHb13pX8Y3XQ4tB0gihRkHU=;
 b=QY94tYJKRc0uyZI4GABndpnUYq57iWSa/fecF5Wm6CJN8UPUnnjM4Qu9vNM83T1PvDW6
 /rI5J2860Jff2IGzty3gl7vq+Sev4YViWUhH+8AYeh/6lQr0MDqyn5e3AdBFGcOOGkNx+
 iKphCWisBag+3UQfRgFaEhzbqeK1serI/asWAVviHnFJb1N9L52HnJ6s3Lx002fQN6yev
 /Yi4Ctf0gRiXf9oj4bOpnvbb+67bCEjd11Y0AbWUV6ZZLD5giEH29zH+fkKRG7gtiDyHa
 ObbGEEB4PVsN+3E7oBE/FJxgrLxdRmdOTHEfAnYBlnL4s/qyT8BrjRhH9obZMzMu16w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cy54CkYf; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8B794005C
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:30:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4B029B0053E;
 Mon, 21 Sep 2026 19:29:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Sep 2026 19:29:59 +0200
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 19:29:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260921060603.10831-1-bernd@kuhls.net>
References: <20260921060603.10831-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <26c1d0e20852661cffa4b8165734f9e0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260916
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

On 21/09/2026 08:06, Bernd Kuhls wrote:
> Updated the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
