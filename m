Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D19C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 15:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC7C160D57;
	Sun, 15 Jun 2025 15:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geAAwC2Ky_0e; Sun, 15 Jun 2025 15:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F029460833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F029460833;
	Sun, 15 Jun 2025 15:36:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1154151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 15:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1D5360D57
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 15:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edQurNu6I7fo for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 15:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9FA4607D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9FA4607D3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9FA4607D3
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 15:36:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4631F13F8A7;
 Sun, 15 Jun 2025 17:36:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 17:36:39 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 17:36:39 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, Oli
 Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250610144753.92545-1-buildroot@bubu1.eu>
References: <20250610144753.92545-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <d2e142ed280907fe3dd257e327e4579b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750001803;
 bh=FcK7QykyDRin7VIPl7iQCwDw4mMHEbG4PPco486AWrw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EN+3PGKq5Odk7yQN2A017tpuzXIylSWq/N398BEQY6GJKv35nezncVOhp33AanaZy
 SX5DS7rgoJ7y+X80pgDfIMkgAwDyDklkr/wjPLLlgtU7X5jOkmQ7ViGtWmt+2NxrfO
 PF2+1Wff9Xv5kl6NWf3Sp3v9Qlo35HwatbKBZ0lO6yKpK+I3dbYnHyCm0nlch7SkhF
 KSW6V1uqJuOkZ1/ZenbImyk6MV+LJGAVDTEzogryvwHd1wYuM5VW/QECLu/eVG7EKZ
 MANA1OMDeSUb51S9mjkeA0FU801RC9jUP/U2jmYFDA/yyzjoxfAYGjfuGpIGXhiFd2
 89wZ5982MdRVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EN+3PGKq
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.2.3
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

On 10/06/2025 16:47, Marcus Hoffmann via buildroot wrote:
> Followup release to 5.2.2 that completes the mitigations for
> CVE-2025-48432[1].
> 
> Full changelog: https://docs.djangoproject.com/en/5.2/releases/5.2.3/
> 
> [1] https://www.djangoproject.com/weblog/2025/jun/10/bugfix-releases/
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
