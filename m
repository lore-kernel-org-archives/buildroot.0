Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB17C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 20:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE4DF608B0;
	Wed,  2 Apr 2025 20:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfmwjhjm2eHc; Wed,  2 Apr 2025 20:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3727F608C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3727F608C0;
	Wed,  2 Apr 2025 20:23:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26C6A117
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18C3583716
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4P9nxBLj98z for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 20:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CCE283689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CCE283689
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CCE283689
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 20:23:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8A08D2003AE;
 Wed,  2 Apr 2025 22:23:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Apr 2025 22:23:43 +0200
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 22:23:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: gilles.bardoux@sagemcom.com
Cc: buildroot@buildroot.org
In-Reply-To: <a7492951-7d08-4509-8243-c2b9e9b1dfef@sagemcom.com>
References: <a7492951-7d08-4509-8243-c2b9e9b1dfef@sagemcom.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7a08f4358d7689c631912453a12e7f67@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743625424;
 bh=1YaPmFbRr3qlUDDBcoUkmRtG7uU13YnJkaeuEcSDdYY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VPH3WBZRcivM+9pgpxv8Z5/RT4ANyOxxvM36JmrO5Swrc5AoYjVApczTwDKRbrB8Z
 QBrNwTOy2Rq23ReRazCtTkF126EJ2odSwnnAlZ1ONG7Q98iMPbRL4HA9wsng5nshTa
 LXCOs7tHxB2BgwYZvAi2G1j9dQFYbkbtx2FEyMG06+EBs7wiJL5VZW0cLSOC5UG6Vf
 C6QWy33B6Sfz1ZmmVB1vgEHEdiDRnbfD8kOWDXPmT3Xs4xII1slWb7TkunmKyRFpcu
 hIvqwWp2GlWL1G/Z/cs7o4mbGbtuYklgiaZNX780fmp2YnUYn1OlqeyD5f+01hFU/d
 uxqsguC6t3Bpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VPH3WBZR
Subject: Re: [Buildroot] [PATCH] package/python-twisted: fix cpe id vendor
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

On 24/03/2025 17:26, Gilles Bardoux via buildroot wrote:
> package/python-twisted: fix cpe id vendor
> 
> twistedmatrix is deprecated, twisted is the current cpe id vendor for 
> python-twisted
> 
> Signed-off-by: Gilles Bardoux <gilles.bardoux@sagemcom.com>

Applied to master (after reformatting the patch), thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
