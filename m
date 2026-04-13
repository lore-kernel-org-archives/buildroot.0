Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C325BEBFD30
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 10:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE454245A;
	Mon, 13 Apr 2026 10:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugmbAeevWSPk; Mon, 13 Apr 2026 10:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6218041143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776074678;
	bh=sVppY1oIwCZuDx+itJF96J38O5GK35VNArLh03dI/PU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cfbLnwsgxLLE1nSNpp0+40QaKV/4XsIUeWx1C1kteDflJjGAN0uMiTndaKEfjswTx
	 9kcQIv850u2Zsdqst3Y4R+sRinLmPONf0xuU42arLE1nkJl1Rq+ioXjOCvnjNabwhw
	 oBEY0590gFUjX7CwtT+ASCkZQutILDEUCthXgSN4EWD9KEl3wWwXlYbrpmbewhstjm
	 SmqasrPGuocPzD384nBrntsswRmwUG/PyTIrmT9dm2Z3OAQMjWTpxgGQDp4WeDT1r0
	 xAQkSspZY9mgwJFrNc0w6TURtBX3dRnwXYBUkD8od5HYsO9F8nqbd3O4Kkzxu60GXt
	 J4qSpu0H/B7Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6218041143;
	Mon, 13 Apr 2026 10:04:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4D1237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0A941143
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lex3QooIXwri for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 10:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33CFB4108A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33CFB4108A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33CFB4108A
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:04:34 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 413002C80CDB;
 Mon, 13 Apr 2026 12:04:32 +0200 (CEST)
Message-ID: <fa47409e-5229-45a4-bd77-a0ecf345a801@bubu1.eu>
Date: Mon, 13 Apr 2026 12:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
References: <20260413090901.109220-2-buildroot@heine.tech>
Content-Language: en-US
In-Reply-To: <20260413090901.109220-2-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776074672; bh=jwiaAn973if4D1TPSxcx0ahA+2Skytf8NwXXOrellB8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MtGOXn5TlWfzCbn2qlzq7PY//PDwch421nMRM90u7k2s33qTnnUl0D/zupkY7BG3l
 Oq0eNIykOosx1j4pq8IXQQIOwhP+Ybj6FiUi+eR943BR2AjTr3JQb60xMRkc/e7kMf
 Fk7Pf1hXzPVEDP+9Qf9CDxS8zEF4ILDIKXjsp2FstnhjzxDaVaEws/f8HnW3Xb8Wef
 YpBYI2pWCk/vZFkfJOXrCMdFPb35cZ4w/M5ja9wicZVMq88AoKBPeOUZLRyAa8IpOq
 FjvxS9zYEUZ9129FWE5k8ZkktTnII8MydT16Wsz94zxS5ldArT51LRGJAvmM6P2Scr
 de6f2mbR5dbmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=MtGOXn5T
Subject: Re: [Buildroot] [PATCH] package/python-cryptography: security bump
 to version 46.0.7
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On 4/13/26 11:08, Michael Nosthoff via buildroot wrote:
> Changelog:
> https://cryptography.io/en/46.0.7/changelog/
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2026-34073
> https://www.cve.org/CVERecord?id=CVE-2026-39892
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
