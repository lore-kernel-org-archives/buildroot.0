Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F05DC36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 20:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19563406D8;
	Fri, 21 Mar 2025 20:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80hEqNoatCP5; Fri, 21 Mar 2025 20:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5386B41398
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5386B41398;
	Fri, 21 Mar 2025 20:13:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DFAD1A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D85360087
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOk8tCXV26Ho for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 20:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 913DD617A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 913DD617A2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 913DD617A2
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:13:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CB41E19F740;
 Fri, 21 Mar 2025 21:13:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Mar 2025 21:13:26 +0100
MIME-Version: 1.0
Date: Fri, 21 Mar 2025 21:13:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org
In-Reply-To: <20250321162034.1851757-1-flavio.tapajos@newtesc.com.br>
References: <20250321162034.1851757-1-flavio.tapajos@newtesc.com.br>
User-Agent: Webmail Free/1.6.10
Message-ID: <7102faddda664c6cc4ba128a0e4e16b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742588007;
 bh=ExH6QNiXJ1UG+FGz+vikJyf6dQPwSCdPA/fWDCGJFW4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uCYUepHrYMqq2uUQQkWZ1IcGgT9BaNzTJ4TbT6zl9S1qWW9mclK/z1fKeK2dC5mKH
 +TGMRCxUOI5wcsRDAqjeQgr4TOiLIlAfBTIoc3t7ja8wIF6HJ0v8jAA0HyPdp3G6JG
 gThkydivQDA5R88jgxyNxWTG4oioJwW9sd+nTr3feDmnh2LfBgfF48mis0dd8TG5oa
 8Fsxkq2s92Csud2gmMKokGfpc2ZQkg537yk3HQb27kQqXU7FUvWv5Je8ATpxNqOou7
 7qQfrILOBV62SBi8zYBjco0hhgXNspgK6MBzx3lnH3S9CKShOMqO/xpgUtkWEE5xHS
 trrG9mNR2OL2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uCYUepHr
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to
 8.2502.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjEvMDMvMjAyNSAxNzoyMCwgRmzDoXZpbyBUYXBhasOzcyB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
