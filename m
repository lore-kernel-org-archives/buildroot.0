Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB8606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q4X1ZmR4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A46405B7;
	Sun,  1 Nov 2026 17:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HiPdUcq5tQe; Sun,  1 Nov 2026 17:13:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2133C405CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553230;
	b=cxpblgQF+ittw/WUDHsfDDP4OGDyWfUtsng2scAIupreBj5vzchtxfBuPEYDZNtqC7HV
	 Y3F8CrSb+d1OGbBCZpmmqDPL0o9jm305jWPAWW+Ke5TEyBO/MxzTIeIS+YZdy5bxyVIbu
	 0vh9ltotFbIuKmITo1Lbg3/JAmaT4WWI2QMb1lil+cRBqdZoJOZZ82olzWG1NTSFbTlvG
	 MRHuvvjoeTOoKNn4O0pC9pdpj57P64JVTfdi1dCrPGJGmsmCRbzLkvOdkn920E9nIzAxL
	 xlUAsejkZD369iz7+5fjUcSTLG3itfgcZi6kDkhxhpXedHDwMs0BohUvJXw64E0S/rA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=idQ012FsLXQGWTZstZCgp9CXQGE753bERCmxor4c281nu4ssYxy1N5fzWeL4oxWGBCsl
	 iuIpaBjJ+WWYXUSLruaiK395fSqMKc2bjZPK1q1iiKPXbGMkSNIgfi12ll/Iudk07DZ90
	 YJJ4zbWbO+YLA8jN+0y9ef7Ersp9VC6Frz/E1SMNDE7UkyF4+JlOxYFXblUhv/7UyjTRE
	 XC/6wPNi7jqlhVtwV5nJRAGdzKRSNrUDvUvq/8/M/XFWyWlfoSxdSXwwTLZl1JgC7jK0W
	 N8aKu26id2vrSfxu26KcT7NSQ/q/2jX4+QJQZdOkzpwU51/9EOsv8Pq9qSQ4paeBAEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553230;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q4X1ZmR4Ci0y/NgL9FWr/KGGLvhKj2bDcyPNF1yGznKJM0j0PM96EFSWprCVWTKVi
	 ZNx20lfTnu75pT0RWUFHp3DTAPgVUTjvOVjo0dzcqZjE94ObeKLJTl0OB92mwduPDy
	 GWt7p/vBFCCgBTFkm4u41o1DFiOBjoCIX7Jl6bqbo9mM0d7JZTWI/jB+yFHA4g37MX
	 bWgiAJEAgqWhXADHhplmHxOEzmq21hJBTGpTKXXY1YmC3t7KHxbTs6zyxj9LN2aEJt
	 cVGKAY3C5HRK0TcBYqPtgOG+qKfFltolLCgL8bFchFMtXwALPEmkIfz2gPmHbwK2ua
	 kUlMjYmpUytUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2133C405CF;
	Sun,  1 Nov 2026 17:13:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98CB1EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AB9E40076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tHs9RVKX_Sl for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:13:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E37DE4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553228;
 b=i6Lp8R6WIj15IrIk2ILzbdJD4ZycQCKNQyZnwSDN/40aB6/Y+P5kHXc9yqwx9EKm46Sg
 7YwFXHt6gEAHo32l9DweiQdL7bQNblqfJ12nTN84mqEmBV9O5kWjzPHaHEpaezBW5y1GI
 DA58CYJbofdYVxmRYCQ8zmLTGvZ23iLO6IRp9SLwa7EYXN1Uc+iLkg94VKrglA9kEG8ZW
 Xfh90wF3ode2pNKYApKK/6fNJskzsyfQQiC4MSv2QGU8zSHrYseHRDbBVL4269NdFiwPZ
 0HSSSvAVy1Jk5IibwOmk4C0ILumcDmCAqV3p9HUc/kT7/OJBL37nmZiXLYeP1HP7mew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553228;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=X4tXA0INaaItLUoHfRfVZmb44YiJudwdY425sIgOzK4+AMvZ8mawSbKc7xwVfUV4mD3I
 P3gygZsihGwNIskuDza8F0Nt/w0MCLNar0HmVMPY4/lT0b/K256MSlR9058bcunWip5Ja
 5kyPEm1Q8cMH04ADonOgLtoUrOrYFML3K7lSelyiusc/nXoNFtJBuzIwxM09Y/+8keHsz
 piBH3lt1w3sIyAAs62begz23NTC7KqF1lzFOwjdbNdf/v29KEJeY0Y+LSl8FKQiNTTNbU
 dx0ypWAymJBq/Bom6Qb1ZXK51sZiKP/stUeIiSzRGzH59UIAwo8xjMzniHcbqzPNJcg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=d4YKKZc1; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E37DE4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:13:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ECB4E2003EF;
 Sun,  1 Nov 2026 18:13:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:13:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:13:44 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-23-james.hilliard1@gmail.com>
References: <20261031172019.2683287-23-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <edb162601d43cb55f26bd199df8ee988@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-types-python-dateutil: bump
 to version 2.9.0.20261029
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
