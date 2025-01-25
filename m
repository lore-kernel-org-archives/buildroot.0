Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECCC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C52642913;
	Sat, 25 Jan 2025 15:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePgijFcaLcg2; Sat, 25 Jan 2025 15:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D21D942956
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D21D942956;
	Sat, 25 Jan 2025 15:52:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4616194A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 348D582AB9
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROwxGM1Exf_r for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:52:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BAFC82ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BAFC82ACD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BAFC82ACD
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:52:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B5A9219F72F;
 Sat, 25 Jan 2025 16:52:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:52:04 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:52:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124214001.3880942-1-james.hilliard1@gmail.com>
References: <20250124214001.3880942-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <be68c9b7c4c7a0b122024f17569908a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737820325;
 bh=MbOJOTtijy3tOWL9NjT3AoSVTkvyi9YpTXN/lBaKeV0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V1cxyNwzuoo/JMzldyhnURFLTksPh27SDCk2A99e/syNhqKcYaNP52yAUVCyNpQzr
 fSg7Sea8Le8OevgUfH6MeVk64CC2Pl/jYsbZrRdo3vWZfyqrzuaOkDpoguDBq8W1pu
 jGds1FHFAVkLrLplMCkpcOtNK1sWfOdglnMOV3/qLv9ve3NHBw1OKL2g9ymXY+VKJq
 nHeHfTBLOEv5kS9zWJgCGWvUKLIffD4pjAaqbCKkxab6kMfMzTWELjaJU4QTW5vCDU
 ibj7y01TJwaE1tDSFxluHjrhlVNv/FczcvTc9B8nvSD594dNsWq6kZ1gkS5CvqtuwT
 unuchSNsmjmiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V1cxyNwz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to
 version 0.141.0
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

On 24/01/2025 22:40, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
