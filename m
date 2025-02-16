Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ECEC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DEED81D11;
	Sun, 16 Feb 2025 12:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYY2AuhVV-pF; Sun, 16 Feb 2025 12:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45EF281E21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45EF281E21;
	Sun, 16 Feb 2025 12:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 241F5DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC5E81D11
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ti9xRWn1Vieg for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7520481E21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7520481E21
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7520481E21
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:02:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 26C1313F8A9;
 Sun, 16 Feb 2025 13:02:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 13:02:41 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 13:02:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>
In-Reply-To: <20250214174357.2080209-1-vfazio@xes-inc.com>
References: <20250214174357.2080209-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <107afdf3ecb3e4ad6a8e35175a09e987@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739707364;
 bh=rwA86PWFfc4LQjyZBLvg1qc/iZS7LyIGFLBWsKg01oI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QXzssQTlN7aD9ln+1+lh17EO7eYnp56732PRbF2mwKrXFinaTl5lta4VmicrHQ6Y7
 GgDu6FA1ivAXOLHH7b9d4gDlTM1XCFd07UNBWahUVi5idWFX0BOGOfLI+GGepLw3/x
 HiHI2tChhOGUIl0tFPcK7s96bM9X1yxe46uPNK66MQxry5N8MDGP1r86LhIuDUOC+d
 YgrmXKKll0uMHDA7PBTLnqqEuGoqPt+8G/eb6EfgKSOCS/1bpMxtaeAqgIXoGVzi/d
 jPPCzZXvgFoNZ9ZJjj8LOi3pjKv1btpEqm2Bqf/8fC9iSXUmYO/OSzaiNTGfGgSCq7
 oTJbAfGyw1l8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QXzssQTl
Subject: Re: [Buildroot] [PATCH] package/python-evdev: bump to version 1.9.0
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

On 14/02/2025 18:43, Vincent Fazio wrote:
> Upstream 3ff9816e08be95b331ea9dadc18fc17f1e04e272 fixes issues when
> building wheels.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
I added extra info in the commit log.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
