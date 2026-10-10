Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1CDCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38DF409A3;
	Sat, 10 Oct 2026 10:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx9yaC6jDKTD; Sat, 10 Oct 2026 10:38:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F204F409A5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791628739;
	b=a9vOtDodJjnTcvzd0udbuh3j4eFGuhiq0CNAvYG3MoSkLjY72zKXZjacBY0OMYen0EZU
	 hPR+2lak8i8Vf4Fe1G7YUbggSmABNnK7egSQ9oHwiQzdElqBGaXn773jKu0JvENa+4a4l
	 LLJmMwHalnpfxb/f4lvFrBDr48EMddLkylz4p3VCOV3UtRRGX2y7kCyzl/wsBngrPYMAx
	 niEZJ1f8PYfC3hnr6dexoNy8j2Ux5BfAcNYCCr3N7g28AW9eA1nXIAf4Y8Zo6HQTloWcB
	 13mQ9vtfdRzdtb0nml+b771cEUAroAvoNq1xyHP9+O1DjTuj/C92DLeO5k8wzrC8G+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791628739;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=p4nd0GuEQIDwE4oS7n4iBJcb/iHlesgswDHuJVWV/t4=;
	b=BZo1bqXidssfSwp7TsYZoWxVhWGvWmOyWjH9/d/SXVs8WGK08Njk7juii7ipxXeG3Zf1
	 RTzL6kFbtwTYt0XQUhlohPUL+yTSbKNhTHjAFdnlQo204joIZw2nl077lQxj9YyIWNyDA
	 t94Kp4V+nnGXBeqvk6DLCowmIRv9/pJwAmXztOZoO9iQjN8rVqOw0s3SfUOpD9/gD9osC
	 ekHYqnDHrUXK+XdPkvaCjJWxTZOVgYMtNtI+UUV1Si2fMgi3ytQYD7U4dkAdPhh05G1aC
	 kHa08GbbM9yeKfwTVNBpV5XY9KgtqDAYyUZhFTZxPGQT5sF2Z9H8rDZbuD8NOYgXw6A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791628739;
	bh=p4nd0GuEQIDwE4oS7n4iBJcb/iHlesgswDHuJVWV/t4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rubkrbCeB6ITgUoXn1d6vtxIPUID6kDyswgdbdy0VjOs++lxzkKNUOdjoX88ty+B/
	 HSxBjL7nZKWaZ6g3+zyen672UaLI+lF+72vvoejh6iuJgE66tmSj1wIuMLDyJWHb2w
	 y6scj5Q9GNm7MNNYM6ATkgzeMUjCpay+Hi5TvYrPsKa3hZDz5jWhacBOnfIUFpXmDs
	 foUGQAsEyuBOT472m2BDZZL5nmzfxZdX8ZprUJry9z6XEu7yYcGa8QjnmbdjKihlYV
	 uUgaKzlgOLyPTbOr/YkmFGuHb2tafBaodtF8BH/epViciWgSGbh9yx8cX5J+dN+r+h
	 gQx4qNo6wXxpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F204F409A5;
	Sat, 10 Oct 2026 10:38:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F5A75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E0B4409A5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAha1WuwNehJ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:38:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 24C45409A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791628736;
 b=HLz+yW3jAmTVzSekq++04u7Qq7BqFjNaqyBVielb0LW11Hi2uYq9CnqVzfKDEUSvmkC1
 HmKzJGL3K5vrtbiF7fNhcHzDZOlbL3CUzhw+gZgqqca95LcpEVqWt8x76ypztKzJid50i
 grMWdIt7d1eZHV9U1t0ukkd1wLHdoMoWc+dLIRWzA2HLpq5Q1iHlpzHYJZSYgwRjXgjGL
 jmixeGhiJ0pRbcNhekYHgdK6TVGpplOUAo+4o6uiHsBBokqcDOIMpTmjKg+DZ5JlPWyhB
 6NS7tPeIOAc0ZJjOx5VFmScrXHqjXubP5+o5Y6jZr7VsidYQ+ApQDt8IcRFQ+TkbSLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791628736;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=jlOrQJj1e2WiwvPd58Yrn273n5ywAWdDfs4USTwQAvo=;
 b=UmN3FoOIsvET14arJrqVv5HswniccG6uDfJthff0nVKjjDmp1dLJ7VbcSzuedaM6sDU7
 6DBKi3hbVZsd/iTVTWuocko3o63KrPq3UaS+iLnrcV/VGIrIHYPUy0dVMCwPP71ddoZRh
 DMwDmKVrV9oo3177T+aMScI7C1AElYYBIz66EeHNaIdsnYsWQFfgaN64qvpbpmGBNH6wu
 BBaXY7vaotJ+PLrRedtzlX+6VaNBfR2AMhZnZcta4fG6NH09tuXNGl2O5ATP7a0o6cswX
 SwTj0Aa2+Pl+rwD4GsYBzAwR4l7ITWVUSuoRoE2cV7IvXLR81kWKs4V91gfl8GQc1rQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=nM90SucW; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24C45409A3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:38:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41B8DB97A0D1; Sat, 10 Oct 2026 12:38:50 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Francesco Mancino <francesco.mancino@tutus.se>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sat, 10 Oct 2026 12:38:43 +0200
Message-ID: <179162800459.66245.12429780108589164897.b4-ty@rnout.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <63ae167d7dd7b0b5ce48234b4d749e9250fb2878.camel@tutus.se>
References: <63ae167d7dd7b0b5ce48234b4d749e9250fb2878.camel@tutus.se>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-headers: avoid sub-make
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On Mon, 07 Oct 2024 10:20:19 +0000, Francesco Mancino via buildroot wrote:
> As a reaction to behaviour changes in Make 4.4.1, linux kernel
> (in commit 5fc10e76fa2a9) will do a sub-make to "reset" no-print-
> directory.
> Command line arguments (including INSTALL_HDR_PATH) will get lost
> because buildroot sets MAKEOVERRIDES to empty.
> Note that "--no-print-directory" might be already set, if buildroot has
> done a sub-make itself to set umask/CURDIR/O.
> 
> Signed-off-by: Francesco Mancino <francesco.mancino@tutus.se>

 Applied to master, thanks!

 It took me a long time to understand what the patch _actually_ did. I changed
the commit message as follows.

    package/linux-headers: pass --no-print-directory

    Since commit 5fc10e76fa2a9 in linux v6.5-rc1, the kernel does a
    recursive make call to add the --no-print-directory flag if it is not
    set.

    Buildroot sets MAKEOVERRIDES empty, which causes none of the
    command-line overrides to be propagated to sub-makes. This only goes one
    level deep, so it is not a problem. However, if the user sets
    MAKEOVERRIDES in their environment, the environment _does_ get
    propagated down to sub-makes. Therefore, the recursive call from within
    the kernel will not get any of the command-line overrides we give it.
    As a result, INSTALL_HDR_PATH will not get passed down to the kernel's
    sub-make, thereby breaking the installation to staging.

    Note that if Buildroot itself does a sub-make call (e.g. because O= is
    set, or umask is different), --no-print-directory is already added so
    the issue doesn't occur.

    Set --no-print-directory explicitly, which avoids the kernel's sub-make
    call, which preserves INSTALL_HDR_PATH. It is only really needed for the
    staging install, since the local install in _CONFIGURE_CMDS just sets it
    to the default value. For consistency though, set it there as well.

    Setting --no-print-directory when it is not needed doesn't hurt.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
