Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB95C88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C6680E2A;
	Wed, 16 Sep 2026 12:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nl-LjpUD-6NX; Wed, 16 Sep 2026 12:53:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AA9B807F9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789563189;
	b=B9WeeF0IncetCau1i26JF6lqznu8opp+BNogyIjM9CD9jwJEn7HjJPspsPkJei22Qy9v
	 f0ACnZvlNJBXjARosH0OeYnNEI9hzkdskFNs0pSqgulUSDQ9JqepbD/k4rrjN5z5t0bWl
	 GuXTZnDooGwtbrsU6Gi25t4fVFwMQPvDelozRlXALU4SO3fUSTuEvq7wWawXqzQJ1kRU+
	 Kz6hwglA0H7LUULXXqFe9ODQ/9zJViTnHo8MwCd9GHPGgh66g8V8Y52NZo+1cHX0ujn07
	 pFp2eoxi7fkSLYwqPHWtm/DiXJc5kwKwdnFinADYJ0hyP6XjgGZW0f+XWj2KNinFtTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789563189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=npssVwth/ApQMxYIlDcj4i+rtsUgZvw/V0w8v9nhgoM=;
	b=c36DnkxkW2ejyvieyMZX3UJbXB3x3LFXRNvIDu/pm/tBZ3OcqWDkdpNgKx6asVDsHYtT
	 GvUKtkSLv/jLlNS7kIwAykrcd7NV92XLLU1KeowDJMqFA02cLXWGN844Tiy/pcNdSk8wB
	 BEWuvheSawed4bOlshTNbaIr9C0Qi9fiYV/zYYqNjJH0JHhWrbkHsNeWJbEQMqVnHHcvQ
	 8Jj50FXtuIudbyful4QwaYnbeA/aoIkAHpSv74DXVxKxqZOowZdYfVy0EbHyyWxiEWBfk
	 dkFz2ZNPzb5RA7MGRoiXtuE9M6lELKEHQQkndlNPeo4VlUxe2zrEimbh9aoYmdIeOaQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789563189;
	bh=npssVwth/ApQMxYIlDcj4i+rtsUgZvw/V0w8v9nhgoM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=eBgRfAdDgKNLaJ98WmGbUZ7yzfTzpzJ6zGrWY2iLq+H+v1vZ5/3KGSRDEW7sMxMds
	 vMVIZjcbRl44Aty+oCQoNbg8jyyYEWpGnSiFRDF75wjzXDdkI5MdEnhv3U7s6A6wzi
	 qGjMXJ2LjV9urUnZwWt6imoOi+G774Yz4Hbw047HInFs0pPEe+tp4NuoGpyW0o86A3
	 QYiSzH/UiRX9fvccxO+T0L7tKPTf3Oz8Su5UsumhUWFzqrVg18JWulFTlYsyAaw/pB
	 0A3lSo/Hi2ZnhlavvXIT6xdi/k9uv+FXxnS+rTD9C1G7hRpkX+tEIY+atM38aIlJZ2
	 E+FNdThqXLX+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AA9B807F9;
	Wed, 16 Sep 2026 12:53:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D813824D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA2B0402DF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ynnxBNeFg43 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:53:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ADACC40093
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789563186;
 b=MPtonJBPsy4mAvsqo2aMl9niYzI88tUVnlVAOy6kFO7HIanflTJzwU1HZIEU+8T4NtvU
 /rFs+qaWSkuq6KVahkFvXb5bAZyFSi3Gwap3VoOI9DIY4pkv+U/+hev1CHSfRUqNItYct
 isNYw72R7OGihflP+LwXK7p/Wuw1qmQs9gKjT1zTBzZgORCIgG/OYEwRop4sV3KEnIbZw
 h2l055nhD9OaoXi8LHLuBly/Wb8xTJ367eZzOHVx8QE/PW41t4nqjE1TxWndZ5JvawILK
 VRr/OJ7fl8ydQ3z5+n/7xy+HNTivkBqIezzl3E0HA7O85FIS68ESbJg0YWn2NWBlOHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789563186;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=pXfm65N1sSXsTLg4F4+FseW0GKhrLSLXDRNMZ7QZsyM=;
 b=VeKjO2RlDZdTuib2QThUkF5pEuxkY/T3nZXG1QclVCpmbTEfu/lJTbaMt5MIU6wxqWRt
 hOplpfy8aOpPl0dW0vg/VQOeB9CUhCEFXFIMr7CI9VP/crDPRC+KwN/mbzI964otiurqE
 kvUWSMGk2VT3f2XMrIXalBABgiVrgv5CevH6J+JrKbJawGi1fxAagJmBXA5hUaJW9uodK
 pKwOOvZnXTPAwt9KK/2Ca7XgsQv5/RCSpTiThlbI+kNab0yIPslVXZMZ112Fi39gOgNSz
 JSa+B9p9cdoO35hPVaMZ/uIQGBCztAPEjZ2jugkk3jW7/qXYC2NcSOLIusg4K01D/0A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pUd4ERCg; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADACC40093
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXyJ-1xIkRK1LDD-00QbxJ; Wed, 16
 Sep 2026 14:52:57 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 14:52:36 +0200
Message-ID: <20260916125236.2759304-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125236.2759304-1-fiona.klute@gmx.de>
References: <20260916125236.2759304-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:B6Y/+6G0vA4Bfr7UzoJ4C1/FDRKyH/UJffaN8vcUXj5xdCY/HUG
 mksVVn6f0adn9JjlWxWKtLrkoxei3X6cc60B6FGADILgGtUZflKACJVp6wtJnoNZMpyo+T4
 yZD7meKz6QWr1cd2nh4otjF5/UidM3391s2Hcel/yAoELU84aelP8WYYLL6wctjmlvTUl3T
 RSCiJqgzoJ5eVGe6dpeAg==
UI-OutboundReport: notjunk:1;M01:P0:84tCqAjCKUI=;MGREamp+rppQj7CfOp+XDGAm/Jr
 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
 6H0V0O3vuf/1iedF92+uau7bNyJ8JSl+w6w==
Subject: [Buildroot] [PATCH 5/5] package/xfsprogs: select
 BR2_PACKAGE_HOST_UTIL_LINUX for host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

HOST_XFSPROGS_DEPENDENCIES already contains host-util-linux, select
its config option to avoid confusion.

Fixes: 45a74068df22bd88db10bf2296cca9e995c4d097

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/xfsprogs/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xfsprogs/Config.in.host b/package/xfsprogs/Config.in.host
index f200b766fe..94ba4fd6de 100644
--- a/package/xfsprogs/Config.in.host
+++ b/package/xfsprogs/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_XFSPROGS
 	bool "host xfsprogs"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  The XFS file system utilities and libraries
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
