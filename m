Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB19E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC981606F4;
	Sat, 11 Jan 2025 16:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVT7k-2IfwKo; Sat, 11 Jan 2025 16:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2960606CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2960606CE;
	Sat, 11 Jan 2025 16:46:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7F4942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B87260AAA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaZ8x2GoHxEa for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:46:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D096606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D096606F4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D096606F4
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:46:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A8C5319F72F;
 Sat, 11 Jan 2025 17:46:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43616])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:46:19 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:46:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250109212235.2403294-1-james.hilliard1@gmail.com>
References: <20250109212235.2403294-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a920e7abe0437ad6099e73f43145bb4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736613981;
 bh=ixEmkUj0kLyPlKwezywQt0SJVHKNZafYzjB6ueCQGUI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SHh/hBoJX/CVgXN2z9J9tETyDviTotUpV0rZzr6LgJfossHFAc96o7+YS4V6zHfPv
 XnOpYWFCRu/36If0YKLxvRUhDS9dzEL5c1asJ8N0s/5zgBVX1jPesUqODXKTC6veH8
 S/JTMq0ArupltyEMj4xnw0/dezq1OUKANxYme3mCJH9Mse1YfSMACyZcl/qUNLMU9V
 jTt35ciEIN3PN46r1jQ5PWdV6Tu9LCXHGsmjswQwIjmORCJmGPbrfluFjaNTIVnx5M
 xjRgQOg5Jv5I2aVfWH05mTqKhihdomO75swTu/VvJknyU3FZAuWNXCp2om5FfAtaNG
 CCjyN45ak3rvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SHh/hBoJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-immutabledict: bump to
 version 4.2.1
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

On 09/01/2025 22:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
