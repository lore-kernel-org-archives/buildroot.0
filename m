Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2549606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mmJbdSgU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8068D40541;
	Mon, 19 Oct 2026 19:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 091vSgBD4lYr; Mon, 19 Oct 2026 19:32:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A734140577
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438369;
	b=Y1ysUPvEEvdOw8jBTP4x0kZan/JBD0crYQHGSx5CE7Rzvxhwrz/gdUpDEk34w26K7kJw
	 4hoDtlUVBEprkCsq+0D0F63ikClw7GLk8ZmxQYmVnkb1LlQaaqlLGVa4iFX7TdNjNykQa
	 k/Al6As32AaSuP1hLS8oN21PHLQVOmtHsHeVtuBT+/K4ciGXGkhJDUi8K+9CowgbpyvaS
	 HhikUCEK94GVf6BaFoTFIJE41nV/giDWW9lMcqbjtwM74DAFdQ2CvBg5hccgnHvlGbeF8
	 x+Jvfa0zT8KjweWx9r1zN6DJC6lAf5LZd1u7+bLmAZiZ8CpqxaotVUpwuvrB2LEZhaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=W2Z4wXBBEE1quQEH2IdoG885j4bdpi+e5fTISESApxo=;
	b=dJFBAgNfBEg5qlyYnSNQG1N2KXG2uH3q6cd4aHWhTVTmmdtAcXVG8pz6uRJVGcvMO0qG
	 XPquU9uQ7Z4TbT51+r6aohyflhV2UzvdOHFn4GoA5+BwZ90/ZehSGJcjV9r3qWDpXZl3v
	 BfuzHt9d5HzFh0xSY+c/8wWx0sv0ylL9gO/BrwM40K2ilPHbp08UglmctbPQDJAm7hW2n
	 6wH4I8/pGnNhnWLUcDfS/N7+3ZeaZImgXNqzlN8KP4hMxIVcSfeWZP2KK3BZlG+nQE0dY
	 ZX7W5eO3k8vn+YvIJX6w7Br8oogpQ2hV7cx5RT/WV+DJRMGciDhchcVFo3fCWgx5olg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438369;
	bh=W2Z4wXBBEE1quQEH2IdoG885j4bdpi+e5fTISESApxo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mmJbdSgU99rikfazI1yWPQQcGoHYwpDkFAoC6yFJ06hDX4S1BJilLkA2R2USSmToT
	 NCLEaMjLbZr2IPDyaRBz+x/8fE9zbBDgNuFf0xmshrY0S/0q7vdzWW/AQjb8MC1eX4
	 YukeOhF2QLEhgXphCKlvnx0s8ZKPYg+7tWtpV1uAWFzvoAScuAeJSaLlMbam/59L0H
	 T9uORYVUkggblVwjIJY6IUWZE0q3X2l8zDymNH0Ey97budEv0NL5cyN/5UNDchzFgd
	 7x3rx0ti8zEVUYCUXl9OSQD/kKqOWbTaUItlyG7RMI2od9IMnFQxGbl9Xk0gXdjF6Y
	 7f6pIiynO+bfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A734140577;
	Mon, 19 Oct 2026 19:32:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C45B11DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA2E1606DB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nz0xkDTUJOHK for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:32:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7ED78606A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438366;
 b=MRsrqCFOILpamS63INLF2MAy/h3mAJWWk++N0X+i5ck7NfzdO+/LD41YLUBvfyXj1CW/
 jh/G91lOkMGv/kqHpmc2hKrzHSFtphIZfS15zqreV575DXG5uPAHzWzAK9gEbkjcqCAe4
 cidva27XmeYlungsrAMWxOLFfkboi4UXd/pW49JV8G3Cne+ZeDjd/CF4LxBbMKqeGPsPo
 6mWptR/UZRq2OXr5FEDsN03MyIRjWw+f8QoQMGtk5psbnAa5EjG6gsHzvS4UqZLiFtOAq
 J/q5TSzY0g19MljJLSwhkS7O8rcaN0mka6nz30q78EATfxdz631KkFkmF7g3++5SWiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438366;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/DsuODmAii+mV5AI+ZNrijnCeEAroH19aDFgV+zVVCc=;
 b=jdOG6JQgynX7nhDC7JXsdBLBXf3ukJcrvXfGuqvKWSOdc92yhADxwZYIKgJRB+oHQkP1
 aLaQBgH2DYj8lni1mvikYzZ0XmUnSnL3aP8A4Mnx0oJyXYUwjUTO1suhFkGSw7F4dMN72
 jYf2V+GD+9wExLQE0QzqKAhqfjgax2bvNmPpnlh58qPACRvSMDx5DopUDpRqG72W+KEev
 H/YN/Q0LHT7cCN5kZYwDMADlhpzTSjTI/xuUdAVIqS35zOVrh/Rtp+0tZnt4jKVc99JKQ
 kP120PuEDsRzIKRP+XbIwtwLpmmYMj7uz+iiMQ3FBF4ourof2EmBqHJwzI6FuGTmKag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y0m0be7w; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ED78606A0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:32:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CB7B519F574;
 Mon, 19 Oct 2026 21:32:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 19 Oct 2026 21:32:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 21:32:41 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
In-Reply-To: <20261014214158.535942-1-thomas.petazzoni@bootlin.com>
References: <20261014214158.535942-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <8051f71801c6c1a76aff81c77f5233cf@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/podman: propagate missing
 dependency inherited from runc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14/10/2026 23:41, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_PODMAN has:
> 
> 	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN
> 
> but forgot to propagate the
> BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS dependency from
> BR2_PACKAGE_RUNC.
> 
> Propagating this dependency requires a bit more care than usual, due
> to the ability to use crun as an alternative to runc.
> 
> We also propagate it to the only reverse dependency of podman, which
> is mender-update-modules.
> 
> Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new 
> package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
