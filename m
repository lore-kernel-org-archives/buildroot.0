Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A50CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF7140BE4;
	Thu,  1 Oct 2026 16:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUEbBReyiIfY; Thu,  1 Oct 2026 16:49:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7B88240B84
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873341;
	b=exgWjy0HZuKmjtBQAo9brWaargWYjD014p+4o/JSIwT3RgXKnDWOzdqR4HXjaKGDO0zr
	 LrPfvFvr5HRqVps3XiXQNiB44/NP8g5nWZSXXGGWzv5TSAR3yn+MEefgfJ91GLhKu3va0
	 beZgxJJHJcNA28rfoVu+rAjZjPYNTVQ4NrmzVzL686YrGwPWANpm+uZ2kA7khXEX2D3vS
	 2TlUraBZSP8EBypjwgHgMftx+/qKSyt5I0wmWJLjq2p5wGiLuC+8yeB2JnQni5FDzcfOV
	 ktwG+FUp68o4PjMIJrkpfcxdHmMHYORqaz7J79vbb0cbZdny5favwVTpgKd4B3KWqfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873341;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=D1yOYgbu/gFLzFR45G7OGthe40c33s7hUs2E20SaLJE=;
	b=FjZBUqpirGpXliXtp7a3oFeWPThz0v0YMjgxmWfmEVnk/LQqhe2FPZkj9pRRPspDjHBZ
	 skQP0Mtv8LZ0+5PCJh1IfW0qVsusqWZstvXUy21y4JjlOsAMHUSsHTy5ZHahuplrz/+aL
	 l8NsoNjRaXOOx2UUiQrMEkmUK1nARLhKU8Uqr2i2FG7KAh/ECesmT0PibOpKaX1Fubpyx
	 0YY4TqhrBg5c0terRq59cALJXdrIIgKc2wTfwEvndUmULJRzEfnTKkS6fqlnHbuOqmAzM
	 HVKsRkzluSr7s45qhjmXXNawq81fs9biO1VULAWVJDikbQMReNUnsQZYOEnQht0Dy8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873341;
	bh=D1yOYgbu/gFLzFR45G7OGthe40c33s7hUs2E20SaLJE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S3pMeTQMwvjGpCGyiIJyIURfKgyiVcOiHbSFLb29JMG42NLVOsxWaAJXIneiwLadJ
	 o4PYheGHe4HcVePcBijUc0IHzIbQDerpwZ1I98M3Uc1RpcKz/EVKZAAKOCP7AgAlE2
	 IOockJJaaVOGVOxmlfRFL8YH9kkqETLmVjgVGWK8YXt8ygUZb4A04My+uN6qGorX1Z
	 8SIWc/w1Vzh6OW78jzWdiTWtFh81p7or8ThMs3RMOOINrOGKZGgezod14DrYfEAq5z
	 6orx05o+LDLbf92IggzKUSEKil11nXUzsnLgoLf/bibOmkW9ihmAbixsg5gwUzcMbi
	 D265r+hptAe+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B88240B84;
	Thu,  1 Oct 2026 16:49:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 698B932A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EF9B4052A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTmS9rbBlDaF for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:48:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0243340098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873339;
 b=oq4OQKBzBFAKsimCEmVNkzOoBkDccpboV2DgiVsQY9BdExn1iUAd1B41FUUvr+PTeIhP
 qKWwhpk+SdRUmFSmOGRJQ5glJ1RvLsO5/Use0JQXe8vnzJM7dT2YLbFUk6u1xjh1tpu1O
 nh8iIu4mxzqY3kgIWJ5kQzxNKCJ682+PzEj1XRfAfn5yFF6wCpJSRZE3xJIdGtaLUz0TC
 jD3zspky0Ea8NlEF8ufhg9DmEu2gpa9UAqoV9qMTTBbqRS6lGF59EsYOmOwfKIWk2TuzC
 Ia3XwiVmmsLHAbZ3bRyPdtiCYfAzq4odjeJhiP7mWexSQ281fsfHr/esHgDIm8hiIFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873339;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=aOHdCBy1taHjhIKVeDYVC+wceYtrHZaGHg+7+AH6hxo=;
 b=QNuI0lwbbTd2BMHWbJfnNg6ecAct74Vayl3vOLX25JlOqk9eIg/r1LZR4tEGmk8el9x3
 s4j87FeZVGGZKLUhR1CmTc4/cqOcumL8Q2TBKvdJUfIBsLnMG+dJVgkMAKdhd3oORu2iZ
 ncuw12BRcSB4TFhTzVFOz74KyZHNi2I0ek2nLn1UGH/9oS65FwxgjeaXbSMvwDXDRiuiE
 rKgpghG2yIZaZZVNzrpS6Dgs50qK8/MDTz1f+Y3Sp2jnQdeTuMfPMgWjSDU7t6vTkWGIn
 UoVyzezoYCwmbm8nDuF/qLiVbbXakJHS2/1q1OTGb/hGxPCa34UymeTNhJqfkeW7TGA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=G91D5f9M; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0243340098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:48:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BD6DB19F593;
 Thu,  1 Oct 2026 18:48:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Oct 2026 18:48:52 +0200
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 18:48:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261001070846.1275054-1-bernd@kuhls.net>
References: <20261001070846.1275054-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <8608d682adea1b1dbc6efc658fb5e657@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/10/2026 09:08, Bernd Kuhls wrote:
> https://www.python.org/downloads/release/python-3148/
> https://docs.python.org/release/3.14.8/whatsnew/changelog.html
> 
> Security content in this releases
> 
> CVE-2026-19445 gh-156293
> Use-after-free of a server-side SSLContext when sni_callback switches
> contexts
> 
> CVE-2026-19553 gh-156793
> SSLContext.wrap_bio() missing validation of server_hostname parameter
> 
> CVE-2026-82049 gh-157190
> tarfile extraction filters allow file modification and content
> disclosure via hard link to symlink
> 
> CVE-2026-15310 gh-156002
> Memory exhaustion in zipfile in bzip2/LZMA/Zstandard decompression
> 
> CVE-2026-19672 gh-155999
> tarfile extraction filter bypass allows creation of directories outside
> the destination
> 
> CVE-2026-15806 gh-155694
> urllib.request.HTTPPasswordMgr credentials for one URL scheme sent over
> another scheme
> 
> CVE-2026-17084 gh-155292
> StringPrep algorithm considered Unicode codepoint attributes outside
> Unicode 3.2.0
> 
> gh-158446
> Reject float format precision near INT_MAX
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
