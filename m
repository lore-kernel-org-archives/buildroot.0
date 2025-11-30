Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DBFD111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 10:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A30E1607C9;
	Sun, 30 Nov 2025 10:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVEcEZ700zPN; Sun, 30 Nov 2025 10:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5963A6075B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5963A6075B;
	Sun, 30 Nov 2025 10:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68F7C1A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B178403D8
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epcNiwF9YJX4 for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 10:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC147403CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC147403CE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC147403CE
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:26:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E35715FFAA;
 Sun, 30 Nov 2025 11:26:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 11:26:02 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 11:26:02 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20251121180610.2084189-1-neal.frager@amd.com>
References: <20251121180610.2084189-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fb7f2a14cc163ddb4430d386472fccfb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764498372;
 bh=tKzLo3ezpurb86UI8reOHWqqgR3e82gHBrNnP7ijfXo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sFnm/9pvBEJHcc0JDJk9PjfwrfBavjamIJMCBS+q/y4tiacuQ7mGoZ5aOKATwibkz
 vIvLQhBfWDE+VAtvGLVtpopGWuy8hvvwRzop8MOwqv26ze1XMyBBjzAkWvkPV4ZLVM
 BGNIhiICwEjMiz64jYyKvm78BUQt+IY09+1unQ+JOfUE3larLnPav0rmiFyITlEbV5
 SRrIpyuB0TXjE4aISq9JKEDfUUz+HCpZzLX0m4YsXBLCKVEW8B2QHmH0FkLbpSUGhj
 p6VQiKF9+A8ooL6+hC8ALYXWGfi9s8AazltEnVHttNJpe9DmOsbMS+AFfFstepckTb
 h7gIS8DlqqOQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sFnm/9pv
Subject: Re: [Buildroot] [PATCH v1 1/1] package/xilinx-fpgautil: bump to
 xlnx-rel-v2025.2
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

On 21/11/2025 19:06, Neal Frager via buildroot wrote:
> Bump xilinx-fpgautil to xlnx-rel-v2025.2 version.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
