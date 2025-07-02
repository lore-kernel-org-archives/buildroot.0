Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5F7C83038
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 19:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1658F60E18;
	Wed,  2 Jul 2025 19:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4p-Rw_OVfqt7; Wed,  2 Jul 2025 19:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B89B612D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B89B612D7;
	Wed,  2 Jul 2025 19:26:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A46F179
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF1981F30
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQrLCoPrvq44 for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 19:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A72F81919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A72F81919
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A72F81919
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:26:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3474519F54D;
 Wed,  2 Jul 2025 21:25:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Jul 2025 21:25:56 +0200
MIME-Version: 1.0
Date: Wed, 02 Jul 2025 21:25:56 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <d2b4cb336fca811329c1042f7b71e8fe9e146415.1751461630.git.yann.morin@orange.com>
References: <cover.1751461630.git.yann.morin@orange.com>
 <d2b4cb336fca811329c1042f7b71e8fe9e146415.1751461630.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e043e13cf3d51710b91ddd039842f429@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751484358;
 bh=9hWv9+6y5lC4nsBz0swR3EXhvBI2vtF9ouydTR7QUSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FPTcpHQqIdg+iGzVh1OxRLM+0LZ+crpmhSm+EBvX8YrcbGv0xi8TkwBy84DD5qeog
 kZacOMaXMeUx5w7qeTp9D+jKTguTsWJbU0Gb9TD0CQ4pvGaI+aTK9scwoR062hS/d7
 o/4Xwcm/BPFOk5S97EN1NRHmFdy7k1LzdhDKLXTUVTfS3sCjgoVGc1rXI+Qexxi6wh
 zVGAFOwJqjA8MvcnbPwhcyHSBggkLuZrdOkG5myaDwYbZV52a9toU0w2KXllB+vx0x
 ECPoeeV3mUtFdF5EHnBCUQ7aa779MRE7SsN9ZjtOBXPRJYysl1B94nchTCXvogpkNy
 Fb06wwNOqvhxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FPTcpHQq
Subject: Re: [Buildroot] [PATCH 1/2] package/cni-plugins: enable sbr
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

On 02/07/2025 15:07, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Christian Stewart <christian@aperture.us>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
