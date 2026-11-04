Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B6606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kwAxCOad
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9B2404C9;
	Wed,  4 Nov 2026 17:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omxzEbqoW1hb; Wed,  4 Nov 2026 17:20:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 23D3E40497
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812812;
	b=rnynJDFAwePEJSsaNWWBxB27E7sYDzZRylPMHz0QJCfuF948BPEqahVdNbSR98+eZYRB
	 y/5jBTb9vWchqOpHxWOdAt6k0057yX89yu4hi1pYmF9IHO/HeMQYQfNj9bwKavWnQZW6d
	 5UNh9j4Ye1MI/WeKbscmsk7p8T/4D4U+moZ3YBhiGcgN+HClIi3P/07bwnWtrhV5ZRL/e
	 7PIU/5YfTMzFb5yOQ6xTQ1ZcrfVzW6V8Wl0GNNjqfQ8N+TTQIGq15me292MVD7uGDcBE9
	 DiC/bdWiDWb+Rt7/zCaiROBqSm3LHcCBxr20bTu1HRPU/3V6HBFs9pIMNGduSSPK/8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fCRkvl9B06jCfjX2utjBBCj33w5pLlF77IEjbUp31+c=;
	b=ApEdKmZVVAxcWF+4YkgIDNHzzg5Yzu6YBWtvRQChE9xMRgkC2D69M8wpRGPYEzjjaSOn
	 TFd6eY51Alu0ugt5jBTNwAOip74gBrbbnlXn2s+nMsXmGkfqmQk53O+drmxsFfEP8GVqb
	 eIscQGq5E/jfBO4cMITY80bjwyCecXMq+CjveVKg6JbOkwxs8TwO+hhJKFiYCGWZcmKj3
	 bACkpVD+TpADJpBEqv1ZZnx4j9I20fiFry9I/qCv422bUFUnOhqr+5oWg2NVmZYjplT6J
	 6gX5oAceyBAMNmc/fd8PjjQCm6HqJsaVcNgqF9fs/cKLEDxCOq1sd21xoN3PqRhZ02Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812812;
	bh=fCRkvl9B06jCfjX2utjBBCj33w5pLlF77IEjbUp31+c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kwAxCOadbNWbpx4DR1IZmzGITM1fDCKa0URH9zet4foHo7ZHynr/LFHa/CzfFmdd8
	 NalITLJMLNqmvtKmGBnzcb7dNGlTEWkhXvwYz0u2pFWvZuKcSV2hu+k8JgH54p+pKc
	 Fg9Uh0rNsgBrwHSZxj4Nq75WPm3PGP2UIuLawRTvoXjzLZtguU8PdeglenkAADpOHI
	 knLyby/OPa+eRVDQhF4z6QtFMJls3TIJYWQilHU9aNbUHS+GmO8NrgRDcTgsNEcaGm
	 mCylAKO8T+60FJ3Kt7eRPAiJC0OPIdjgEEN4SDyiuhZIIm7faGUGUB81ObpNRJfhaU
	 6X06AF59FRxzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D3E40497;
	Wed,  4 Nov 2026 17:20:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E41CA411
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E193C80BC4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aesqD-hHkV-x for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:20:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EB28D80AE8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB28D80AE8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:20:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AD17F6012F;
 Wed,  4 Nov 2026 18:20:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:20:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:20:06 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261102181345.3238554-5-james.hilliard1@gmail.com>
References: <20261102181345.3238554-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <dc0354b29e005f23e4bab6d525bbe979@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-sqlparse: security bump to
 version 0.6.1
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 19:13, James Hilliard wrote:
> Fix CVE-2026-112307: unescaped dollar signs in generated PHP snippets
> allow code injection through interpolation:
> https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-xmww-55xg-h3vc
> 
> Also fix quadratic CPU consumption when formatting statements with
> unterminated quotes:
> https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-3r5h-5jcg-gmgg
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
