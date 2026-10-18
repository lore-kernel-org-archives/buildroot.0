Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D324CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4223D6070A;
	Sun, 18 Oct 2026 14:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ITGEVbHmRZX; Sun, 18 Oct 2026 14:30:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8141E60652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333807;
	b=eY/bgX0kfQ0b61PdVjfdZ42ivtjPmJ7a65wFo7qayYocQK9n09OLbuT1OrSj1un9o1jG
	 3Wj+wg49XMHIodLEN+r2ahQlMMbRt5trKx2ltDFFq3BAXQyXu+YLVcvHjWj3FO8vEUOJv
	 qeMmCBxhN1Qctw/yPlkQ+Cd4Xu1T+L4Od8+EMSt+wLlpDT4Nf3Ud4Pm8XGaBg3d054QFn
	 LhFX0nxMufoAwZKexxiPp2MaovdHyl0M7SP3WYbJJgNtOKsKU1q8PrAh5VVx5KnUix03f
	 X13MmEm3EkK0iEapP+R7NDf7C9tl0VK8S3IVWQGZJku4arOZuis2Aw3sjTa7RvBUc2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333807;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=DP9YEVY/ZxSSAwanWqBlRa57KjKAfI0ti+ZrQqrGgjK572a98jKya8e0JhAyuZwdNRty
	 EiMzfH3tM/ffHwXTahMONSvI7Ir9qK7woxwmnqJ19GfsumKLVqjKGGUnmUlccv12LcO7J
	 NX+2R1APiJnLRHkxbKC5Mu/dezD+a/l4eHaHnEV43hupI5529c4ovAEqB9Zt6BNhy7GcC
	 FrMNX4aAhmHwdQY1oYIUsvVrk7rVZBm/x1CP7sYL5MWy2wnhIgPAgmJc+42mB8ElguGrH
	 DPNlPQ3JMeUkkVvhjZULA9PCjF2E/GG+ZiX0aWhMZae1U5CUswPu5i+lUknrqpWnogA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333807;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=egALl8F43ENCzVwLRdEFr3rN3uNZiOtVqMjiDa3MGkjUC+yCpIfJ8yTL9gl4OHvyK
	 aTHLzehikmhHtmFSIVsYcqDRCBmqICtWjVl4fkB07xYGNiVJL3o1UOGdVXkixFUnyF
	 DloN0bz94aVnD8FbBsIR7OD32qoL1bDtNqdjDDFxyZmzHHYX1byKyBdvFoUoi8ijKo
	 VEDf+obJyF2++G8syrY3VzeajWN34aI7p6kxFrBom0TWRDlDicvc0QNo5D1VKO1JTd
	 ws1YAkLao4bfwXjd3foq9397wIUXTDxw6auZ2kxQ3WoMVpUfZDeu+byXcUnwzdClzo
	 XwhIXmQPjYenQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8141E60652;
	Sun, 18 Oct 2026 14:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 035732A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C6F80E1D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivCl_BXqS-nt for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:30:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2740C80CB0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333805;
 b=Bh0d/tTam8bULpSZjFcN5uCVYsKEKu6oUzJ/osS6itwkZTnWB1EX2HRgbJSYIVd0oW75
 YFq3+UCpnhlyStNwbtphcoSBtyz8cEvV+oA5JDHdrVPaXBLnr6eH/dohjzATQVRPVFp0N
 IWNLE5O4ls34ttpv3xH/DzjBvpNtUG+2Ly5UGpkuvRQAomHjCGj0+NSF6hJsxbJxRzYfr
 FuMaqKQn3KtAQClVzZ1zAaABZWiDmY1Ni1pu9zTvilEXF4+zrObUH1KlYtSmhuk21MN7I
 90YOaoSrmNtaF+HZ2r1LMhA338Hdym+CHUApBXWPdyhlyD0FvuMcmmSJebuv/aDY2Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333805;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=izKeSq4CwOBC7DHieLo3rXwjaVxxKqryZo8Eh/E8AQYN6CQFFW9wB6GbnfsAA0XM1pBb
 m4lS4Zs2odDsxXLq57SB/jWWoHWbFIqqAvejCnuhDfibd4QUW753l+nlk+ZlmsipiHKgA
 +4VD7g8ygXl5jsJOHyw6qxxK3qFqfx89rEeSboIUObwgU4zRcITSfAVd7b43OsfxFA99M
 YXbpsU/qptiApy8wc4+GPdogK+OL1ay/wON/Lqk2E02BGHy45yXLJ2Et9o09+dDUfTICZ
 c4PpnVTqrezd7SRVovQxO1SKrxjBWtMsKJY7VPwJJJzhqerO/cuai//soL6yNmJfAQQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CXL9JUBp; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2740C80CB0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E303519F59C;
 Sun, 18 Oct 2026 16:29:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:29:58 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:29:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-14-james.hilliard1@gmail.com>
References: <20261015215210.3426895-14-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3576bee1f0620d1bad77764d9b1d17da@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-tortoise-orm: bump to
 version 1.1.9
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
