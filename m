Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14551CCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B02BC61066;
	Tue, 30 Sep 2025 19:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nv-PO5pG9WSe; Tue, 30 Sep 2025 19:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D06D861062
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D06D861062;
	Tue, 30 Sep 2025 19:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49EDC111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39F478243B
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dInQCGgEw1Nl for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6531B82438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6531B82438
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6531B82438
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:57:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 274C019F73B;
 Tue, 30 Sep 2025 21:57:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Sep 2025 21:57:20 +0200
MIME-Version: 1.0
Date: Tue, 30 Sep 2025 21:57:20 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250930171549.3035274-1-james.hilliard1@gmail.com>
References: <20250930171549.3035274-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e13d5f3c2f8b340e9293de198e55df17@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759262241;
 bh=S2wf/iq/5bVg8GfQ14CLnDj1XJTVA+/+A54TqgfK0MY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fjllJcvavc1m9kpNrk+v7lTd5z9Rhdw7q/yVdTpm3Tw8DvjglwRWswvBsjpTaPX3s
 z+JBPBuC8t3ViYyi5CQOaida9qRpY3Z4dFW92W0EBhNSotrsdyr9Vk9/x2a7GY/G+Q
 Fk7H7KqSAws6ATw/NquMfZLXIMQ7CyJzXmxwzgtqemgriJmjFJOILKhdWO83TKihYN
 KHpPZgOWfMB2tzFbI+A1EttRnw/PIpsaKUookxanWWIO+Z538pjqibMDAAvq/cajgl
 0ZpBHCJg7n0cj+h+O79hqeebJW9cONwrhEaJT6+lOEjLK/gP1zwWpob2JKLWVRCFgP
 FJhZdowv+6D2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fjllJcva
Subject: Re: [Buildroot] [PATCH 1/1] package/uefisettings: bump to version
 149bc92970949d44be641ae1e3e942220d7390e7
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

On 30/09/2025 19:15, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
