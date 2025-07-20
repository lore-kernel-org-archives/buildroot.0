Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA7C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12C383C00;
	Sun, 20 Jul 2025 21:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wztO5081Bie4; Sun, 20 Jul 2025 21:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0552B83BBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0552B83BBE;
	Sun, 20 Jul 2025 21:36:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BA787AB
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F15888380E
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKX8PjZ475s4 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:36:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E97183BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E97183BB4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E97183BB4
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:36:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5C47413F88F;
 Sun, 20 Jul 2025 23:35:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Jul 2025 23:35:59 +0200
MIME-Version: 1.0
Date: Sun, 20 Jul 2025 23:35:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250720193626.3220686-1-james.hilliard1@gmail.com>
References: <20250720193626.3220686-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8b59f3ddbe01f5fba5936e6b064d866a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753047360;
 bh=WmeLbYj5dt5oM7WuI1mIsH2CP9zCvKEV9bD/T8TODrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ljvoixiGfGGZeVZwF1tFmo3TnOBrwnVPJz8xXDDL/8lRUP5dK3Bjf5YeMszxsq6WB
 +Ed33WTQECpyygEXFxepZMXVx+nxoM3xLWvl8lmWnbiNNwN4hKeJXceR4nzhblDAUs
 XZmFGcPjYsOsRs/quAe6+vjiSisJaT8pJEt2z5sUkR3yAU0HdFOvI+Khq5v846xWJ/
 JJJrFo+5EWrphuVK8DDYiggQAR/hWviLFFzLycEjh0KwfKBcQDhYKW/20HHcwyDOo5
 aS10oX9YUy5iwwsBIsT94y3rgPvTZo6AvF2eeVUr1rC8FRCIKqjC0A5HgIQJbLiLAs
 5oD/ApR4xOaDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ljvoixiG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.16.4
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

On 20/07/2025 21:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
