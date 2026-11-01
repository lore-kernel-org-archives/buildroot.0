Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42704606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=byxVdy+j
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19990605F1;
	Sun,  1 Nov 2026 17:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uI10YUABp-v; Sun,  1 Nov 2026 17:11:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 494806061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553116;
	b=L3mT6Ap2PhH5Anqk2JySqgJtoGJizz6pIaaxV0h/DA7BFUxjCjpDGt6IMDLynOQ125u6
	 K7CIs0iuT8XzxUC+BFiHIh9WUD87ZKFdTlG1bbW/Nl6Kj+13urI9Y0Jra93ENpz2EXN84
	 sKg/vLG/luHSZzIoJ7reazezWELwmyXaH+SyhrWOnfhFu5kEUgX2M17x6G/87oYMISYT7
	 NM46C2EreYc4vJyPMk08FdnCGDLwkI91ZFWWrnabivhdJWN4w0cbVJLovq4+TJqq9f5yw
	 0g3bgiLM4JI4MgUsyoyr+UgoGZfgQtlOyGhnHTcwIWN97v71UXN5lPoUcTKhsPaMBrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=mREap6zvWtq4F3fsj7FRODy2evsBWHL2FTKqTwBA8fILvfJL1q227zMT2AwDhBNOPfqi
	 X1qXyue+Z0C3HYt2vD9V05jok9KPvV74P47F+iHkyzCdFFTJb53K3uUdz7rQyKFbir3/l
	 DY2mLSP7ZpNqsfI6hRA0tk9HKo6qGMpnUP6k5ScfkZUXL4IKTtgz8ec3s0D782wMfGG/o
	 s4rcxvoJnP7ddhk2o55vZG7qTAeZoDpmWyWR91qWWE2e2AUzLGdD4Pa7MI+upfYf2Vx88
	 2v1S4rNnx7PTfZreQMI9TwbyuFTVZGi6JOR8nvS3pzegb6wUKmeuAPRs6Hoa5x1RDfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553116;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=byxVdy+jNoBkVH92HRFjy7+cFkw5HU2mjaJTVT1xW5mzpV4dR1lVsDu87VJvbSolk
	 2pg6EqlPs9OsBB2oCWWWlSaDrcy37uquuh2uE+aw0HQ3mXwDA/0phhF7yIN/0s8r90
	 3yhmii0OAa6v/PPsDCoG6KwmUF3spFWEsGpgcxIsFvLiHwGOcdYVYPCGB2ioDW92xo
	 kQ/tGxBZnLbG58ld976KMf6W0VKfQoMVL/Y1WhasuhleZ/rpfdonzGF6noHe6RWsEV
	 I7F9mKGcYF9HX+5fkDkfXWW9GW9KGujEyOem/VVo7jUEFMaaQ912eCF7aKlufVsN9l
	 cFTaVthoQxnxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 494806061B;
	Sun,  1 Nov 2026 17:11:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE61E2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0FE44004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtCgYpnfW4jU for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:11:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 347B440076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553114;
 b=ACqUPJdyqRPGVx+E/57+mUH9NSVh44iBbXrjyHdo7FL2covBmGeIgHfp4zP7Fgetp4Ke
 aY5J/InuAKwcBLbqdCHhnv5eDymRA2Tw8CXn/AWos0qIsJS1pCmrPmUk+me4z9WulfM9g
 JZtPHs7fmeklvQ+U2cUl4peUD73TGktF3ThxisbWQxXit12Tpi0axmiL8ZA5OSpcro673
 X4fg3O7OIRPpuCJBCyT91E6R3jJeKbO+vea4MFoZac8fyrk4u25f/Hj7gnQ35iGtYhBdw
 RZ9U2EYmSYFUifdXWTxmyv4IGFp4vfnWK2tfZI+cZScwW608DvH8ZCKGjPpS1GxzCYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553114;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=nyi70Z/IXtcRVgIOzSxuA7NF4ogBC2Q7dwyPEYHGNAuwGcSJ3anoeIeFQmiEn8yiI40l
 UPgxBcbc9WGc5vp9crZH9XxkXqwNnu+5A1RCyHOt0TC4/ijbt9Jbcc5U5P70os3T4QpDv
 AT86zp3teSXWYI3x1GUQoiI10JWPbFE8gLQV1VJ53aqKZy0J+XsJJRc+GqVYQUw769r73
 mjS1VcRA8WrBQyvypUoDJ3UmUu2MciUlkdqXd678TzB8q7+CTvBx9dX9P39rv3NDMheTy
 mkhKdwrBUdzVpRMBppNLbZls3OMa7Uz+ZK6zZO156+nwOnzJJ1Zwqkq/Nd+LkKMQrIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XWvdGFgy; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 347B440076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:11:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C25E67803A2;
 Sun,  1 Nov 2026 18:11:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:11:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:11:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20261031172019.2683287-16-james.hilliard1@gmail.com>
References: <20261031172019.2683287-16-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <b2f5eafc9168505dd292f47d106f2e0a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pydantic-settings: bump to
 version 2.16.2
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
