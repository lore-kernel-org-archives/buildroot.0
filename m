Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B01E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 21:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFFB460B55;
	Tue,  7 Jan 2025 21:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQ-hEiWY3pKQ; Tue,  7 Jan 2025 21:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28EB60B9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C28EB60B9B;
	Tue,  7 Jan 2025 21:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C8E1EB8
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A7C60B9B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FI_ogdsT6tW for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 21:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17DDC60B55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DDC60B55
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17DDC60B55
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 21:06:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BC0E95FFB7;
 Tue,  7 Jan 2025 22:06:35 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55738])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 22:06:35 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 22:06:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250106170715.176041-1-nemaakhilesh@gmail.com>
References: <20250106170715.176041-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <075b6a69f01be7591b611c2c32662702@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736283996;
 bh=/sjXICCXMqxyDjlZGSjB+PnHqsnsumB9I0wAnyzNKiw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GjHdL6gMeNDyM+RbAnD1R8gvnqU7E9nLTPlh2U29od6Eivf40mFfBmBotPL1CAMK7
 hODa9rf0DA7E/p7ET+6gR7dGmwRhXY10U2LBxYaHTSZijWaBU5PvC7i3E72QBUjY6v
 FQJsFPzWYPWNbKuR5GKOyMhBpmBAW13Oa6DdeLftrYYN9WTor6aAuCBcY8r8eBymfH
 RCOroXn/LZoe1aQvkvHL8j481GLxcCC/t0pt7CYZAOIPgM39FlvnhGwiEKv/D75pkX
 j4I+VZmKOq7DUxh0bvFLUsU7H5abrF6pG9IDdfwDpiQQcjThAMNLepg1F8fpDl9cvV
 GUqwpa8lJprcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GjHdL6gM
Subject: Re: [Buildroot] [PATCH 1/1] package/iptables: bump version to 1.8.11
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

On 06/01/2025 18:07, Akhilesh Nema wrote:
> Changelog - 
> https://www.netfilter.org/projects/iptables/files/changes-iptables-1.8.11.txt
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
