Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13FB606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oncZi6rv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F3D8122A;
	Fri, 23 Oct 2026 10:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLHB8k2VFXAq; Fri, 23 Oct 2026 10:52:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B7CDE811E5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792752731;
	b=r+i4yyTU5GniWE7l2XTOvzdYPAbLbwumEyGtFKW75qI2zh43LIbk6JYg4TiKK2gsA7Nc
	 9oTP2DB5IhZH3urPWQX27tYBeL67F/4+aa7I6VImCIw8IOzZrY6MyxbgQZv1pzwusEzE6
	 K7yGh2TuEzXVE87YmqTQRtOUyigUH1TaqITw1bPgMI0Q+M41YtO0GjO8rxt5jOo79UZX/
	 /AfCr8Da2V3enAbk9jbr/R9sh8m0dOPKvfAKZgWRKeUjd0yg80ZG4mCeuCsCcQ0O+IndZ
	 7tq7x63LvONsjaB/SyXXkA7rt1XOZ9CqUPWP6UeVYliLSiLgqTHU1l1ORhygWWrEeNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792752731;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=iiKLl6x2CSapCdZJC2KvyDDgWmOh8KIqh9lOG6qv10Q=;
	b=IfyBykPEKLtKSAUwLAu6xQtewEdqbVMoq4NKU6AssPGrGFI+3uxs4lLGi+c/45lQ2fWb
	 pUvxsW7+ajCjUYKn6vQ71/wz4DYhGcF6NIBgpWCzVxEW84zhrtTFt6f+GeNffgBvRBK0S
	 UEt9nfK8WJDDzosle96xP1yLL6uNCouf9RHzIxqYUFQFomhLsA9QmFIVfNfdtJFM6Ykyc
	 brLltBx9QLNNVGlBXs4bmKQUsJHmov/Ul5z09CUgoYXdgRNzOnvZBJX2/XzcN6M7/gqD4
	 rVsejND2c71/5dX55uQhybZ7XMqYCfqyR73SPQGn+CW2l6qqkEL3zcF9kYMuucql56g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792752731;
	bh=iiKLl6x2CSapCdZJC2KvyDDgWmOh8KIqh9lOG6qv10Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oncZi6rvw942LTEhkWVA3ZYM+8jlgu3/Hsl5595iggTWhBwH5IWzqEd47KStTbbGb
	 aP2ZViTwzAkVPLTPUXrUMc3+NcDMBt7gBuwC6p0w7iNp4VRyewE3gewGlHoO6dABjz
	 KL2phpnr6XoY1Be/XPGnSHrkGAY0wtraK21qMFoIgwWl1yKxhxTbd3OC7t9hppQUy6
	 RbWHNhE0EHDErX7Bqva0IcKi1vwSbHsVhfCxhYM1IpHmI12KlOo7fzguE2PipvJr/s
	 b+SoM7BDOrd6defYHBLioW2/5zUnto2ndOTFRCxfgvVWkbVMCX5C0c3c6p79OQGS52
	 7+f2wyRYMmLXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CDE811E5;
	Fri, 23 Oct 2026 10:52:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 498F049D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B35B811C0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlX7l7A20UdU for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C88C811E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792752729;
 b=lTsxMQWH4oT0SiDtL/BM9QNE3saKPtgQH+5oSudtKRmFFkVID+odAS6ofiGxQ7U56lUq
 a90Cnb2XDs9WIbrxnS2mlYvxpM7zFYGhjWdD5CV9LJuj5tfjn2e7rDhPHu7AOKGR9t9ey
 SXxvpgwvhNFipYvksTig+ZIgFItnQgQRkg7IemlWhrMstGne0iL5deZFuRgC2+mv0P00i
 SKr69iPxUBO5gWb6O+hgL4aPPtAJJ1pZ+kE/wuoOCM+Wxx3rhTGV//tR4aDqYMuiFQfSk
 n5PShx0Ueg6hzdxBJzFFU1ni3VClIYeExrZVguW+TtSxZ0X6m4Q1xsASSDXEU6taEHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792752729;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=suL9cT3J+GXl9aWdX2kkC2THc7Nxukhdbuz+9wZLWAg=;
 b=YB4MlZt6XFtUkdPT6NKekfT/lmGxAD/IlA7vHMDb/9UlZCoUiBYRUd7OV1OXzCuDj+ax
 tezcdvGIlt2ENMNSIzw6CxgVe/ap+oZ3eNtHw1f72VCTEOYZDsj9vu3z3sZnePL9SOMS5
 7AQ0Z+OgZy847DuZapDf224UVxW3UEhD8maR0T7ksU2+hFeiVO42lNudQEiFpWeXZrwle
 r/d0HnASTcuTYJ6m/xWhMVRe2dSKwlpGhfBaVRo3kg+aBvuhchjw28wxru5esh6+bGODq
 NHfk/gEDHHZSm6P/8oDb4OISaqV75p+W8HkvKQsK63uPDVuAnZ8NhapYwv6kvWZFPaA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sUNvjRwN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C88C811E5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:52:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6033D780505;
 Fri, 23 Oct 2026 12:52:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 12:52:05 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 12:52:05 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023085925.1104974-1-yegorslists@googlemail.com>
References: <20261023085925.1104974-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <e633cc4125a99b6028b333ff8b427445@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/parted: security bump to version 3.8
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

On 23/10/2026 10:59, Yegor Yefremov via buildroot wrote:
> Fixes the following security issues:
> 
> - CVE-2026-89085
> - CVE-2026-89088
> 
> Other changes in 3.7 and 3.8 include ExFAT detection support, several
> libparted fixes for corrupted/unhandled disklabels and a gcc 15 build
> fix. See the NEWS file for details:
> https://cgit.git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.8
> 
> Drop 0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch,
> which is included in this release.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
