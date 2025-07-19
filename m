Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D653EC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99CCB61441;
	Sat, 19 Jul 2025 10:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3laTAB0z6jz; Sat, 19 Jul 2025 10:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E2061445
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E2061445;
	Sat, 19 Jul 2025 10:50:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1909DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE423403F8
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hwaqxl0nDHZk for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:50:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38F5840267
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F5840267
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38F5840267
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:50:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AFA2D19F748;
 Sat, 19 Jul 2025 12:50:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 12:50:33 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 12:50:33 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Michael Walle
 <michael@walle.cc>, Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250715081938.108853-2-heiko.thiery@gmail.com>
References: <20250715081938.108853-1-heiko.thiery@gmail.com>
 <20250715081938.108853-2-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <24a7a8c7189b6f9d47915d0ccf500b3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752922238;
 bh=BEs9cQ5rLIYSPB0LjQau58IwNzOHlEBzcqcajntnlpY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZV8Q3F/Q5LlkSPkPoSUqawX1IdDw+nxMIFuouoapv/drd4JEnCe4L3KtHt0RSm+NX
 R8og1u+sPdj+q/hiLDrZX6jmV/e2CdnLE4RrjRXCQVwM3gKk7b1k3z91vv5CBypsC+
 xLSblr3LuW/pbVLhIUBfKFLvjKN0TzGjZ3TJ7O/rbNi0/bGUZ830mcEgmka1GTlKjr
 kXZxHvhPca7VMZgwB+a7PWFOkli+lVpWjrptJBJKHN4uAXnOOJbaTErAzqBOXUw+RT
 gaI4BvVbqAa25N1PkVdAZgsrJYDvXEzhqegIRUL3VnVbWW+1ZLfXvmixfkFJufuG/L
 +rnRJKljU3yxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZV8Q3F/Q
Subject: Re: [Buildroot] [PATCH v2] package/linux-firmware: add support for
 PowerVR rogue
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

On 15/07/2025 10:19, Heiko Thiery wrote:
> This "powervr" directory has been present in linux-firmware since
> version 20231211.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
