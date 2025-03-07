Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE5BC28B27
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5AC4154B;
	Fri,  7 Mar 2025 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bE7O_S1NCFbW; Fri,  7 Mar 2025 20:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64CBB4156D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CBB4156D;
	Fri,  7 Mar 2025 20:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 875381C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7711760BC1
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 20:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9ZmyYML5ECS for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 20:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 553A060B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553A060B5A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 553A060B5A
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 20:57:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D0CCBB00565;
 Fri,  7 Mar 2025 21:57:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Mar 2025 21:57:30 +0100
MIME-Version: 1.0
Date: Fri, 07 Mar 2025 21:57:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
In-Reply-To: <20250307140407.4091221-1-buildroot@bubu1.eu>
References: <20250307140407.4091221-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <9d45738738592229d4409ed9200977f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741381052;
 bh=aH0Qf7txL5p2FeDBcOWYFTRyb0xKFpkTUr2IeEWAd/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cDbzvjltBNiXJEBF7Pn5FNVk4RRp5b40lnDNbgq9ITa0cB+G/kMi4fsDFv9d9bMQj
 LcMLvLa7lKGXmiJp8+qySQlD7EE26lVXInOjPkvRGWDrgmBXoys7gAeMy9K8Jp+pgP
 1JveqsC09WZ4oDHM63qYwiUXvqbORYA+od7/pPuCzP+z6y5pNk7+xMBeqRlvtSopiJ
 DAQRxWsUzERBC+xHm4j0E/jzZ0tfTJbwab6zy7PXB8xalqZxWJm31MxJzixBDQWgBt
 uhZVuBLA2rNGwRjlcsWsOcihwMtVtYf2lIDb+Vb43+TNTkkzJg7gvZBIDX40TKnm6t
 UqGAtfe1deUJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cDbzvjlt
Subject: Re: [Buildroot] [PATCH] package/can-utils: bump to v2025.01
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

Hi Marcus,

On 07/03/2025 15:04, Marcus Hoffmann via buildroot wrote:
> Patches are now included in upstream release.
> Package switched from autotools to cmake based build.
> 
> Release Notes: 
> https://github.com/linux-can/can-utils/releases/tag/v2025.01
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Testing this patch on the next branch with "test-pkg -a" generates
few build failures:
https://gitlab.com/jolivain/buildroot/-/pipelines/1705548790

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
