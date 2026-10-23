Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B315606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IHpJlZZZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF5DA80DE3;
	Fri, 23 Oct 2026 07:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIjEFwSomErY; Fri, 23 Oct 2026 07:31:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F15DB80F47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740708;
	b=ADA02tCBr/OFl0n4tQ/F/rLP4huV4clwqqpwx1xLInKGyTTSApZXd4JqVn8yHl3AW2uo
	 YZnMn6J+X5JnCVTyf54DHW7AFcH3oBrCCHfROunQaNc4S5piggQc16zVJF/aqbgdcqUZZ
	 1IftBnuIbnx07qmajOkVJApDMISxLXDvRe1nuqgX3Pmzs/eLxzj6Ev2a0lPEIzxF7vntx
	 TKESOAwC7gbWphRlL5eQb/ND21c3I9yno+fjVARfQJin48RJP64TE8GDtepp1QJP0uFmm
	 R5cYef8Pg/EpOZMCzxxJDZv6IOvZPenUbjxoBjyv4K96Xz69OzAslU+Op/kHnSnCOnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zc/vqdD0CkJk3VMmsLTZHrbxfEudxToaPyWmjVzMJEs=;
	b=LEhb9VUfDVmsWbiahy5k/Ru2HBy/4lX+Hr8Ytzlgpuy8ZL/CP552D46rbKLbvF84V8/b
	 Z9Ah7Ya6K2Z5OeI3gqCRv7BvWPvAysxX8ewSUe6Vo4voA5SRO2KunU3kkrrHbXwSR0OMb
	 oY0lKgSfpjbZa/QBB5sF9KjEagBeDZi969DVC5dDTyuv+BJU6zLtVkoO319gTQM7C3Us1
	 oInZsb9WYECMDTkBe8/07mhwAtnHJ2khQlh2MsNqZdxdLk1fHlHQAT871HP/W1eHmNGbe
	 hU2mMhprJr2/TVjwRYDPsuWfHauh5Pq2VAI1zmezbyAwlWTpocTuYe8jinCuS2/WjbA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740708;
	bh=zc/vqdD0CkJk3VMmsLTZHrbxfEudxToaPyWmjVzMJEs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IHpJlZZZMF5kRTrUyv+9z0hSYTWqzZI3R5m2E6tE7wRqrJWLfloOtVZsZ5rIYR4HT
	 MaOZ1pDa8takhfa8g/b/adpdoq/9v1mcPw/nbSBFJwqvv93tYmhaG9hJB/ryPuXUPy
	 njrKt4HtY7usCIoC9Z30UL+/yDZCJT+ARrO3UuOtcHUSsMpAmAUFm9x9vLaOmt4yei
	 6xahN3LFvC4UB9klQMvYm7+CEs/yCU2tQoHQmmbh7zQciw7IxI7AMGo+9IMo6WcEyU
	 +Ssry3K4+uIB49CJ0SkrevzaLKYlu6AN/PdpG82mAUqgyQtRfpIy+gFi3gJdMVrKnP
	 7ctdJTx/m5kKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F15DB80F47;
	Fri, 23 Oct 2026 07:31:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD233C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F7B580DE3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iijQt1tJ4h4v for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:31:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7810580CEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740705;
 b=GfDVXJPoQnm5c5BsayhxP3Os47ksKGihxtGTvB/sXkPki8iy47yvqZ35bSK5WbKp90BP
 s3qX+SKn3irxkCSdc0rRGBDPMoKXcMVa6qwjbGSGZP95CJHtsyEatlHk7MtLTERKHLmOK
 sbd1r/cpqEDBbeKiTLArjMMttIZmtc6Antf92ZlQj7sp05XsG5CBzmDQpWsDh5b9ZvTf1
 oMhojV+NsiiMVmyAeRF1eGxHY65qZchApQSwPn6wENJBz2oFEoYyStHCBwyZKghOdAMuw
 Xb0+ei/rwOZJ9X0IgsPgd94lQ0zE2+y2RnwXhLGZGQK1IpeUAb9dPTkeNNvZYcFVldA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740705;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qJ3Zw0vE/NgOyhLboCYtSL8/rTBVYhBkQBjDccSSUyk=;
 b=NqNqDClrzU365Wk5i7Auu9G5iaD3yOXL2AGmAeCNVRggHuGMRSLFawt+cvgAUjXxdT0u
 R3CReoxdl9Ou8Pu6c38Wb6LabDSiu56SMMwDtR6qTW2WQpsU33HoT3aI0Gkq8Eby2HfFn
 4n6ttwM2PnPFAs9fNfBw7uASroIc+fb8c/OSBce3TblFI9Atm2hjl0e/Slwm3D1zv37L/
 RoR/5LRoivuBp3H2scBWAwIjo8RnM5+kuqimSbpyMDjLmVhRz/UOLc5Qk4czcQyYG5NIS
 bnxNl5MmFQdzZ9YZNBy3u57YhFOZVN/xuWzW/mhkub98EvPVSsKrZTn+7Lv/q1ZCgtw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SfKdOHdl; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7810580CEC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:31:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 09ABB1A12EC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:31:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBC6560398;
 Fri, 23 Oct 2026 07:31:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C69F610328EBA; 
 Fri, 23 Oct 2026 09:31:41 +0200 (CEST)
Date: Fri, 23 Oct 2026 09:31:41 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
Message-ID: <atsNNhuRk7k0lFDr@windsurf>
References: <20261022222752.3530250-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022222752.3530250-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/iozone: fix parallel build of
 the linux-noaio target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 12:27:51AM +0200, Yegor Yefremov wrote:
> With uClibc, iozone is built with the linux-noaio target, which lists
> libbif.o as a prerequisite although libbif.o is built by the
> iozone_linux-noaio.o rule. With a parallel build, make also builds
> libbif.o with its built-in rule, without -DHAVE_ANSIC_C, so the K&R
> code path is used, which fails with GCC >= 15 (C23):
> 
>   libbif.c:191:1: error: number of arguments doesn't match prototype
>   libbif.c:170:1: error: prototype declaration
>   libbif.c:193:9: error: too many arguments to function 'do_eof'; expected 0, have 1
> 
> Commit d7233ae04854 ("package/iozone: Fix parallel build problem")
> fixed the same issue for the linux targets only. Add a patch doing the
> same for the linux-noaio and linux-noth targets, which were added by
> 0001-Add-new-targets-for-iozone.patch.
> 
> This issue has been present since commit 75891397abe6 ("package/gcc:
> add support for GCC 15.x"); before GCC 15, libbif.c built with the
> wrong flags but didn't fail. It therefore affects 2025.08 and later,
> i.e. 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used.
> 
> Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I initially had a hard time to understand how a parallel build issue
could be related to a GCC version, but your commit log explained it
very well, thanks for that.

Both patches applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
