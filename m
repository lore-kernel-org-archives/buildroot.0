Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619D2E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A2260BB7;
	Tue, 14 Jan 2025 20:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLrhvqumJLhE; Tue, 14 Jan 2025 20:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B8B60FAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B8B60FAD;
	Tue, 14 Jan 2025 20:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0329294B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E51C740C2F
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8g6smoF6FjH for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CDD840BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CDD840BEC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CDD840BEC
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:55:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 22EB0601B1;
 Tue, 14 Jan 2025 21:55:16 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51996])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:55:16 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:55:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>
In-Reply-To: <20250113184146.3015828-1-james.hilliard1@gmail.com>
References: <20250113184146.3015828-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a5e3873bdae4113367adaaf17c59bb62@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888118;
 bh=05ySfhiim/jtTmQ1o28ESfE0HNKdqnpTZMxTRi3SeLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AwjxAjRAK7GmAaL7FUeuF0WSUcQ3AUkoCUcsAVRN+LTkZCg2UoMdG+PpGX0V+gYqk
 6pYgJvc+pJEG1jVS6pFC9+HGrWov+oMEr08ZIo4NFmBqrrAIfOg4dkzG4NR1XnS/3O
 +4PncM26O6yC53xNL4BcCGOjNxKx87UArpaSH/zumeU5THUaPzoX/PcJ3CcNStOEOk
 RinQmnD1bx1iiHzsEIIs6y+ON0iXT8IvXGvBvGEJfQVbXGyLYb5+bQeJMQuB5/SCu6
 bB9JrWs8Hgd+ORlIqK617AN3q8HkROaHUiIgIcuY0hBhPAYAuEtVfCRmrJdKAYGIZ8
 6QOAhtcXCuWCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AwjxAjRA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy:
 bump to version 1.3.0
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

On 13/01/2025 19:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
