Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC7BC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC1E282087;
	Tue, 22 Apr 2025 19:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQNcLVe8iZst; Tue, 22 Apr 2025 19:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1EC80F31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1EC80F31;
	Tue, 22 Apr 2025 19:33:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF90C1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B603660708
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkaxgZvguVR4 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:33:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DABD16079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DABD16079D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DABD16079D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:33:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8B7D713F8C2;
 Tue, 22 Apr 2025 21:33:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Apr 2025 21:33:29 +0200
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 21:33:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Akhilesh Nema <nemaakhilesh@gmail.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250421203110.896967-1-petr.vorel@gmail.com>
References: <20250421203110.896967-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <cffcff6d919d5c30e49e4642a6574340@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745350412;
 bh=Oy7fk7e51GJ3FZ6ZOygQHmpGMoezCIPDRw3x5KxaPL4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=saaqywESz7EyinSFFmhjfw4ivBQFuBf4Li/BlLfCf0q2aF9ajgfoudGpK8xdmzk3w
 Xepf4UQwbWc4kohKlJi0p1RmeTujKIi+OHZg5+RmTnrVZWzonUono3A+WOIQXt7fvo
 UChI3sMbAodIBBCEIVofsWsIMzBpfY0zf6V/DQNMV4Q44k17RoaZUxDnZSeDN6Twrr
 dzU/zyYgRmZ4gFi0FWjmm8/vJ5a8abBW6WogcqxaBoszPI0D6UWidw0IOhpM/Zsjct
 czKEPcY5hHRu1Lat4yTFCv1FnwTKGZ7WgpPGrHslZ7wsuk4IgRbKJfbOCHUkq7Bcz9
 1nnynReddLG6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=saaqywES
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/iproute2: bump to version 6.14.0
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

On 21/04/2025 22:31, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Series applied to master, thanks.

For info, I fixed a check-package error in the patch 2/2. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6bcefa73b1aeefcca81fd4ca2e33f5bf1d3ce9e3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
