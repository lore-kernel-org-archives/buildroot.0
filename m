Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24FC606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LjWjsOhQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F5A96061B;
	Sun,  1 Nov 2026 17:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aap1Q1zzuIyL; Sun,  1 Nov 2026 17:14:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF7086065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553284;
	b=TCH67REpYJhAO+Qv33/fDav5jyDSfVcYks7EUliTvGGk1z44oARjC8IP26taifDjoIJ8
	 nZqZfqJxcxQfmXUGMldyr8MLGDUEJxXkyHZJOwRcYZWeCSmDPlxszHyBBCCtuz6FsmigJ
	 KNCJrzs8D03Xgd2hNo4Vlhbg1qp1r1XcPixg6N1MDmGaZSnk6beBxL132PNx66/7FEqB6
	 A55KFLKL1VodY9VAyqWaYJx0eMnccmbPF0xuFwhQ2t50ab/yvY0LwSslDVg/PTHN1GnzX
	 hbfhoA7FOpJItFOh9+j1iJlqgl5CmF9uyrPd2XI69x6YRDAubqvhA5qeHY6kp57h3lg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5RtR/ClctDvP4H/YkXJqgA4oJ9+8/Zz6aNcFmnIIltw=;
	b=mMK9B3MQrUm+OaaIZV5SQD1bbK0UjyQ7D5z7VVhq0OoVOgKUMXdbUnKqYZWWGqYvLcK5
	 54B9SG6c8sjE7MYLo5WrjDLEy20+z5kOXcqZB75vWlRqg4D/MG8cWfty8FknQRb2sbGeZ
	 ChnTE/d45wjj6QCopNeMf8030cSeW09hOL+v9jD7Th9qtkxnqYAUyV0AA5b/4+q9XsyIU
	 W9SMWuajQhsVBZZDCZm4TDU/ZBMl2rvcIs3lmctChC6thR/pirT9NyM31ja0fFIZCHZUJ
	 p9PYtE2zg9LqZEN4sYRrvL5tno3HA/J7Tmxr5NuYozCfjrgmSUNAc4xGeEcJEO6mClg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553283;
	bh=5RtR/ClctDvP4H/YkXJqgA4oJ9+8/Zz6aNcFmnIIltw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LjWjsOhQFDnaFkiHHgVRDMck03ABeaVAjcKZPo3Z3npF1hfmQtZNTpjsBxgSbFFy+
	 QAPQUeXzJYX/hlM5yIGuPUHSqbGWy2G7gvHesUn2BJLP6KZN/s48WVMFKc9NtRf5kE
	 Z0F5Yhce3HY7LQwLZ5b6ybYQVdK/hSfdN5i7gOG8xAMHakrUs3fAWlJ6HBrWYxudL2
	 xbvug3z9AjKbp/4bxD8jgPkKNH9/HTbo09BniHYeibah7qEuDlV4bLy97M9mqweGJR
	 N2rSJxcGswAJ2++w0nzdFhzX+p5fvAPo7GQ+JmYiB9mKnELX7OFI0ndnl0MvHN4niB
	 MrrqoGmGJ6n7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7086065A;
	Sun,  1 Nov 2026 17:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF6683A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 957A3405B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1puh0wmmtA9I for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:14:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE016405CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553282;
 b=QtQnGYILNQGG8elDx6t/GYgS/9uYfXCi3dfzRRClx1rISVwqgti0ehe/IqgDIPWTQqNU
 HzjIkEUm3wWq4WwxvJaBXHYOBH7XmQ4tO6QTXbPgQ3Oftz9rtslT5aZ9rMRf1nff6DQld
 J4X1q1Kl5+mf+JognlB/1jvSxsyKLIogEWLqzvKerlkIpdtVxFN5WoH1DbiLE6gS0r0HY
 cn8zfyPYsbhkQiu9fdfYhhgrek7e4w4DFfR8RMyFZJ/RilkUjAuvjZxM6pFMOTNaUvxEx
 ww9vHJIZWlrBmWV7hnXCPiXyHhgRO+3pyPKLbwsxsluBv1bpVLDz9pQCyWi477FCPcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553282;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4x+hf3i/rxYHnwFN7gyGUO3y1+bnHhnRBH4hr4nHdKw=;
 b=spP/i7OIaGCdMx2qXg2a3aQXTAIpxOhirxGcQOdnwlbt97cb31DcF1aQrwthFXgAfibk
 CnP4HEQ9nWbm0pc2QsHyEPuJgyH26RRT/ao+3hlgwFqXVMfPZVuwBRaxqNrqhaM+67xsI
 uTm7Cap2FMSy+ZW037ky5uAgwM043rlfGgiUt/wUrQS5wDpBvH64zcyQ53/A5sJU4bo72
 C/hgNrToTYgOZN8iDvFAs1ilS7IIDKFlaY/BlzmVcdWS6uswno3hz9RdjZqVpzRr5i0i3
 oicjnkm7MEdQsOPiXhCtqW6b3hMUvSfZJskHrPMjNAycIsCdVZ54DW7da2QPaWj+e1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TBnJM5KV; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE016405CB
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:14:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 299B213F899;
 Sun,  1 Nov 2026 18:14:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:14:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:14:38 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031174249.2698980-1-james.hilliard1@gmail.com>
References: <20261031174249.2698980-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <ae1ce3821535533c32f734f64866d188@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-multipart: bump to version
 0.0.33
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

On 31/10/2026 18:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
