Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6C7E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 19:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB444606F2;
	Tue,  7 Jan 2025 19:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DLN7l5rx21n; Tue,  7 Jan 2025 19:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE74E60724
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE74E60724;
	Tue,  7 Jan 2025 19:33:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4C16DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 19:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A472260724
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 19:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18L40BV9D-6U for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 19:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96054605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96054605B7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96054605B7
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 19:33:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 13B4A2003C3;
 Tue,  7 Jan 2025 20:33:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42926])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 20:33:20 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 20:33:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250107061801.196165-1-nemaakhilesh@gmail.com>
References: <20250107061801.196165-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1316666a4145e39a5ea1f1ebe6a475ce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736278402;
 bh=QZBQbwaKct+Tqq4PceaOt4mpw+5lNUR0R6Gf9NRmvhM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QYgQUboERhXMqF8hDw+fTFqpej9D7BsHVYI9b+1vmlolUqzMnvT+WXAgGU/zqcdKz
 vpd1+yDQ7tHAoazx0IrK8QSBlMRa/rZgXmCTTQ/OdYOJrDRQztIkQFrC/JmCNdyQ2Q
 MuD5R9xzDmczbk4WwIOikQo10A2ZJgKXMR2oUb8GhKVBlZAKpSteMkZKAW/+2Ebw2a
 4PmWmAxxE35bCmr7WwfVFcOQp6v5XsfzeejdiQxOf66Xvhit45SESL8pmlqbLW+EJw
 ewfb01/JIDFRkGRREEzb8v6cFobGZqd4CjSPR65hA0w+xW9CRqKKfHx53e77XPdk5P
 T9Q4Ew02eD+Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QYgQUboE
Subject: Re: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.46
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

On 07/01/2025 07:18, Akhilesh Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-mtools/2024-11/msg00002.html
> 
> Changelog:
> https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.46/NEWS?view=markup
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
