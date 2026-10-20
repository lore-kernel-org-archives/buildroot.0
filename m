Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B366606A32D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C8mlpT81;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=ijRZOIYF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49366405F6;
	Tue, 20 Oct 2026 16:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkXBUeMS34aW; Tue, 20 Oct 2026 16:38:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D45440537
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514330;
	b=bd2etDNtOQZRfQC1cme6ERS1ae6zKz6RO/eDp8cyVxNr+Hjym7RMmmdmfqj+eThbY1tK
	 WvzeZPOPvGs3k+l2ZfvFpq3dPwa/JZ061/3OQtxUBdoOX88NG/eFOlqkjgZCWsfy+DDJa
	 istqn3fwK6SnknxiN2OJXGh1ZRCIsYmnax2alUnvRP792tX4X78+SqsO4Jn/So+64LDvn
	 cDBAnu8QVNdYzr5l4q/kpOOtqI1dEtT9Kyw6tEIWMNtX2Jr2P+uu9Q7I3rf+D+QIwPRxy
	 zHPQpK1YcWppnBhKimg++yCnUP5vT1cIPQuz+0A1xk4uvZVnyda8bhQPS98+feK9WGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514330;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lgIbX65v2jEDhTZVDx477RuOKVwQ0uykEXxdvxMn+Qs=;
	b=loMnXkPsC7fybvRVhz84ZXe/rgwOYery6Ha1v6HLPsHlTiFhxZqPSjl4Kd1mq/ISH4jc
	 U2VLH13k/B4XOyuEGagZvJ6DnBOltcwIdHBHx0K+YsWhEvoH2l/TI7M5U2Kz6Gf3kJpEL
	 Qcs/w2YtD4QTNh6p8i3qpqlh6KzCxoe1hL1TEKw8eqCFI6/WlNYDV0cneu2JYcEJc8EoV
	 kttPq/Q0bEP8N5i3F+f91uZmVnx1Gyf6P2Z0xulwFBanePEhP2QdE9gYYN62No+xiWC97
	 MjXnAHtazL7miiuLbym5nxEqfSwihcGdn9aYzI+fSVqdnHhPZO9Az11sW6yhOlUoFYA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514330;
	bh=lgIbX65v2jEDhTZVDx477RuOKVwQ0uykEXxdvxMn+Qs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C8mlpT81CHMkBcRP+4XIetRqKB82Zd8BRGHzNZewJutCNyREkn5//PBI50jdTq21E
	 UFu5Cgo3WdtLQimt7ybyX6yRyqgprBXM+zjF2X5FiBrYqDwGyA0nLUVkvh6iTqnUQo
	 raDb2bm6XVBDFX9MB2srKR9fV8wTToWu0han5RwOgVyohas60iy2KraZCsUP3WjRLq
	 jRQaGQXhyM7mqJogBsddojHCMsw9Aojfq5b9vlqKXUMGPEzCAv5+nS/wIib4K7kdbl
	 7a/Y5qWjjBIsqaxrqY6gp9K08T/Ir3dw94gYLqLttDe+xNfZnMhNbYXgkj/PeK4g59
	 w1Qztcqsy83/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D45440537;
	Tue, 20 Oct 2026 16:38:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1597930
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 934FA60773
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQuPSPQdSCrX for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:38:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 59F5B606B6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514327;
 b=aw5tZJQePhlLhr/SrDMt/DLpU5QmNcZhwmnHt9xYuRH1G3+YCTbC93cLM70YfbBzeDqn
 tid9IRQ4chzeu/+MvkP1h5rTAJBGwz6dS3ZnoVO/icwz+agtLCNDu6PVATVQX9dMorbES
 SyHAIxo/J+gLdm1w7lF91Q1qpEz3csxpLyLT3NvS6WCdWaUkgoJmPpe4ln9VMdmw7a18D
 VJ7Epd8vXTOa62MNpWC2ikmdQNlaoSbnWCpTtQfahd2AQAdVssn5gBrEtbNrFUxVSrvms
 NX6JIp3cJb+3MrU7mthq7Ohkx76aIzVXK6g4JmD5NE2nepMAJud+WyZNtb4cvDJJhzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514327;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=letm4WyjR0HOLqD8nc25AovGkicDz/62eHdzXEABOvI=;
 b=Y38Bds58RwIrtNRVSGrNJaa10txI1LNTyLhkPj8D/g2HX2VGo3UzjxhfzMePrI1tHAs1
 gKgWQ24GAlpsc0jWSesfCPSoXS6/kIZhpdeyOw1+mmR+wdzEjT+7H6wVSq/6DG2VVfKNt
 83Hau265EuMSIlBfNtJN+64PFSdcrtQWJkL8WahKJF3XyCqkoyxTJETznu+FnQNvHcjQz
 mBH7HI6/vmXvjyKr8kh6C/td6t5Ed8kWt/az8kQtN72DgIZ/0ENOJJzd8KJm+kEVPn5gX
 +hWwKp9eDbNSafH185BpEbzj6xUqQ6b5YHvabAYLuhTrrZOn2cR9CpzdIWBEnGU2y7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=ijRZOIYF; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ijRZOIYF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59F5B606B6
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:38:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ijRZOIYFj9mVGN5hYAoyDp0MK4T0KX1ER9b1Umec4ZLUHvDifSnOT++By7285qksavV9gUSx3WsSnkm3Nvqatmk4TMxFUKs6bfOGqO2FlnbS5U1qVL5GqX9mqF1Brbu64cOlE3AMovM+ao6KObPrLhIZJUBuNSWmpYMpRuexKHzSPmGmAngolceNEluewFjdgmVtljPUxeLM6wSpPCdx1pgykDNK8PUEMHS9LTNn9HhD8UPhDUCHxVXlQlNKoRAvqqKZe9FExTqVdMOimjh88lzAspVjd/gQ+0CMv2PGi6bToHwuCtlKNioB2jNNsy6cGKpPNRe/8RNgxT2ZN6A9eQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=e9VQCE7z3psUSXgx0o9GLpJ/kggivOF/rKDQk+LzRRc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -202550179; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 16:38:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJCrH-00000008Bxb-14Z7;
 Tue, 20 Oct 2026 18:38:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261020135455.1595899-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 20 Oct 2026 15:54:54
 +0200")
References: <20261020135455.1595899-1-thomas.petazzoni@bootlin.com>
 <20261020135455.1595899-2-thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 18:38:39 +0200
Message-ID: <8733u09vjk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/network-manager: rework jansson
 handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > jansson is needed for BR2_PACKAGE_NETWORK_MANAGER_OVS (which selects
 > BR2_PACKAGE_JANSSON), but practicaly speaking, network-manager's
 > meson.build detects jansson regardless of ovs=true. So we make this
 > jansson optional dependency explicit.

 > This commit doesn't fix anything, it only makes the dependency more
 > explicit.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
