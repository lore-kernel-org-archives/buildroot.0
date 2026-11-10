Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CAE606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jVIBWBfi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA5D2408D2;
	Tue, 10 Nov 2026 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jirmJLkXAq1u; Tue, 10 Nov 2026 19:29:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CD4B0408BC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794338994;
	b=f4KdK/XjhdBgbDpkYg0/KsGvKVICy0gWX+lNsrHujmqelc6aBxxGLhnMd10AHoc49Etv
	 CvIELQDFZgZd6c7lZmhcgAapYOEcUh+Nuq5UH4UvnwFw/fuoiMp6g4KSPxadznM7LCoks
	 QTrcoNuoZzLV86XN6GM/MDsWVm4D2Ue1aRqep9UxYnMN8uf4mKK0p/2ELe1v18YK8ydot
	 Tn4JzMsnI0+ClFP9doVYLD6DGrsfpKX8TILqj54hGD55fSW1pxwRdhmaxYGrK3KwhlwkN
	 u454YN6DS2KkrNzIOXNTaCf9bY1huiWqecdrFhEs9JH2jXl8wG8TrNFiuyIQKxW4ksw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794338994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=rOw8EzfKVBHo1pVX7n0RM2GydvHbq0aMXR334tyoqBs=;
	b=T8l+B4RKyuGM4o0mFbPspZ0F6ArmBfoGMXxrp6h493Mrwr6PnN7S6jsMsdA2Is0eRUKT
	 6u1TN9FToKLFYhTsjv0GFJskfvAKYs3GhiiWBsuVhUd9RNZU9sa5gmc3/ZOU0fJSXoh24
	 xSUclofeyV7jMyj7bj43nS+QGxMS1bRLdYDksWdFa8+Jjlk5ajEA0bYuBnrz7oBMzyjgz
	 NoQC/SP3NpYv7w2jHeEz2CCGxm68AtEg4TW6pS3s4q5BEhJUSsOVG6Ng7JVayH3+ynb5O
	 4oIq9J/MrMOh8pIGMjljp0UKuoy4jYwml+EwJuUTzQsBWJwwHhWb66R4kjtHSu67j4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794338994;
	bh=rOw8EzfKVBHo1pVX7n0RM2GydvHbq0aMXR334tyoqBs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jVIBWBfinD0fVGtX5GsHEhAo1AdSIhJ4YgRiJs6I2IjTpMfl689aB+G1+ESnv/Th6
	 9/FSlNxnTN1yVTVKYtZhO0o/DwCGMOs94wghgM7CyxiIHLyVU9PP+G4YqZh28Gz6DY
	 D8fZzERvRUKn/iHw4X4tVHE9hir26+ol5tAuHNskHFgPYZZC1W4kNd4WqUsryPEpeo
	 y/0yC0mJLo8ozSQOC/BhgDDeGLd5MJwzddAe8QBx/01TLp8Se5pkvbkTPeJ2UR8ID8
	 pMSO0p+McnPEZ5yeVxM82bfm9uL9szxFGws4vQU88NRNxjA8QQ8ykGlFqDo7GikcQR
	 H+/GKyo9ztxsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD4B0408BC;
	Tue, 10 Nov 2026 19:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2036C28C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 19:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 111A1812AA
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxteo_ieuaPF for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 19:29:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9513281298
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9513281298
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 19:29:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BC66F780383;
 Tue, 10 Nov 2026 20:29:46 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 10 Nov 2026 20:29:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 20:29:46 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, "Claude
 Opus 5.5" <noreply@anthropic.com>
In-Reply-To: <20261110171404.869236-1-giulio.benetti@benettiengineering.com>
References: <20261110171404.869236-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <c0f1c1a66abe009139c3fb408226079e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.133
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

On 10/11/2026 18:14, Giulio Benetti wrote:
> Release notes:
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_133_RTM/doc/src/releases/nss_3_133.md
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
