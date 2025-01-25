Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FC9C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B4180AC2;
	Sat, 25 Jan 2025 15:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nQaULNwE55t; Sat, 25 Jan 2025 15:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B133580BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B133580BC1;
	Sat, 25 Jan 2025 15:14:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5471DA8
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E362640347
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6g3jRUEODFW for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:14:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05995404B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05995404B5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05995404B5
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:14:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 345D613F8AE;
 Sat, 25 Jan 2025 16:14:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:14:03 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:14:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20250124202558.3852689-1-james.hilliard1@gmail.com>
References: <20250124202558.3852689-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <96e5e91c4b8390a60a5c068bc608761d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737818045;
 bh=EbjJasmEM8G8d1BZFR8h+GS3LypOTj4j16mb6CV0AKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pe8JWH/JYNSlAn00y+GHLAMbQa4WB0TxA1DDEtz5Z+FJrdZ5wtOto3tvD+JLcRgoE
 T8agRXx0wlJQvAmPDCaGq0V4AbAfx8NdusLuaohJXThsMNs/OoQgk719CDIo9bO7ax
 B5erL+fcnfJlogB8vmWpZ1Ke/UX3jqAx67HvKTFFYXahAFb0I9ORjRR6TQ7AH0lkM1
 GFtEChkzY3LjRg17OZ6kMmHkoRE+C4jXlDZkqLRyp5sF4o5FuB0ySGve2uRcK8Qsmh
 9JeWWkwIzDhh+0O53k1cCn+nnYHS/ia2EtIKtLP6afvGjDFDqnPawa2mRGQ+YJYxuR
 aWA/42CO+I2QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pe8JWH/J
Subject: Re: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to
 version 0.11.2
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

On 24/01/2025 21:25, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
