Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D6606A31D
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j4NbSLhq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C709B60760;
	Sun, 15 Nov 2026 15:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Se7QNirqda5; Sun, 15 Nov 2026 15:26:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 567BC6061B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794756376;
	b=jpldo5oduU4bUNdjJ6sfGZSblHaYws5Nfwk8rkPgaeEUDIWUEct+8w7g6yeNc8P5tx1F
	 bGsF/QIF/SalIYiRElkrBGfx7JjfCfdoTlFO2wLzQmDtRBxoFoHwgIRAsMqAldElt0z7U
	 7s5v72vwtXdq69jy6j2WTRaRHK/IESQdU2RE3fjTYW9fejBkranLqcIH2oZZWJk6gNIr6
	 U420hJFRG+R0YHgPsJ10fl4RKyEZl1ZufeqbbXsCHHRGJFuc84FBL0j6ruxYS6Z4HaYYe
	 7w+kBOcwPnWstTouOo7x8LI01v7Tufux5JiNH6RRYVELNhmJiRqxYQ1RdC6qn9T2qKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794756376;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=za/K6ODObt6uZ5sJviIiaOFeoGakadwdy1HHvZmzxr8=;
	b=hdzNVcUExJ4jCR6DIMbH6wBq3BQRl3C7ZVYxCUurR4e7sTlIyL3LoEvJS8uLAod0FKxV
	 oMbwLtBczLHeSS8jnEE3M341a7VGG+9UKQCeuyNBxd05xGEQVltm6m0uUyGRNr+AtvBdS
	 ZxZ7ZjraZ78RXLLTKeP/IPuMzJsJ3+ZWDUpxUnTZ1ha3OirrggNipwRSQl2sEj3lWjv5C
	 5r8ZJ6CEjIsVG4iyjCkrIxF9kYsnSxU75L5Dzmq29BW8fFc7NDroS6IB/P9qLnUTqvxEb
	 sCH5J/D3vX7a+kRwI0ZnzgBoJOVmIXAqpHtHcD4kqnhP+mnKHq4TLTOZeDnxSJsMTog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794756376;
	bh=za/K6ODObt6uZ5sJviIiaOFeoGakadwdy1HHvZmzxr8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j4NbSLhqVDDFrVX5n1DcnEl4bzx8tUCBy9TpCKaqz1SxvAUXctN1kL60Qljr8l3oo
	 AIeOAKUTXwIfmZopEqlseUM+bD4GZX+liVzC3/bPcEuUje0Ry8L9PsYDw5oR9hAJJH
	 YC88oFJoxCNVLmQco7v/9UjOvqS/8nZWuCH93XQcwkDUDnNIy/DGAGou0RegBh5S/P
	 rqXVmUCdAvFnMRIjqx7hUEnS+5JA+RcI4MTajiadIY224T5Pp8lpyqYAywv2QEEzEO
	 9Hpw0E1yiXxXUUFy0T1Pscy1afcfJWOmFadhtDSVHjm6tRWBB0cAx5ebimVU83Bq1t
	 IE/pXxbz/jcyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567BC6061B;
	Sun, 15 Nov 2026 15:26:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7EBD109
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 15:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E6706061B
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 15:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8HmFnA-8vBD for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 15:26:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F53C6061A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F53C6061A
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 15:26:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8EE52780316;
 Sun, 15 Nov 2026 16:26:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 16:26:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 16:26:09 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <au9A7BZP4DK9CM3t@waldemar-brodkorb.de>
References: <au9A7BZP4DK9CM3t@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.21
Message-ID: <3dfc75383d0a0b58e97c60e950f59bac@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2] package/uclibc: bump to 1.0.60
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07/11/2026 16:17, Waldemar Brodkorb wrote:
> All patches are applied upstream.
> See here for changes in this release:
> https://github.com/wbx-github/uclibc-ng/commits/v1.0.60/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
