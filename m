Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C871CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E5C88102A;
	Sat, 10 Oct 2026 17:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQV7u18G88Km; Sat, 10 Oct 2026 17:36:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 748AC8102D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653760;
	b=h1I1zC4YK3qEzFdcsb9+P/WgNtCbBM+rBIYSLPS0R7XDXvlcfOzPvSVlgdFnz2leT6me
	 s2qpFD+5Q0qa/JiDFtbf0pbK+Z+NcmS1MI1sYbmJn+dr0q+yzI9/AWtkqdf3ZEm5geDsZ
	 xMgDecw9e96KVzZFBOHySc/jaM0yGWF0LH1U0NCsk3jpdGthJF6aRdXVZft+3JgbdO2SR
	 /C8M2GeuVXFeqKGh4Hyhtn1SY/itsbqhShScwA3jKUP6s9ZeCOwuJnXgRoRbiSyfywzSC
	 1NlfmZqILWqneLuwsJU915G/435tAsoy4VQCkfuGu7qluMCox3M+kgmVZ6XzryBMsuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LIQUK8FHP2+ubde9sQ6s3MEqGrNvTBAAr0B04eN0OXA=;
	b=E8jJFhRLzzfgZczvyn1/oF4GuVW9PiQpa1ZEyzIvIgAOo5kc6+9pWpcp5Bfe2JMQ0a1x
	 Bdhd5jtpV518afVZ8k264ghS1xYLl6YWZJSH8Zuf7+u3ORQJcGX3truAKCfEZuJL2J/IX
	 IGPcAGegL7XkQglTpEaxpAEtnOc4g6QSPfwnmotz0siOp9ChCpVucKz9A5VLcmglsFZQn
	 Rhw9ki9C0Zc6obS83hvElUdCgoPUjYGZMlo6/PaAVafdceZSb3K6pyzELQNKer3fEHh+u
	 Tk/M2rUyoy7a02+AtNMWzRsjBucXauZZRVQH2U5JwoXLcB/5asrY5bc6XF4nLBIZQUw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653760;
	bh=LIQUK8FHP2+ubde9sQ6s3MEqGrNvTBAAr0B04eN0OXA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=blnGS2BBKRGKxu0u/rAr7zEZfn7YMXOPhKv3nr/aEiB+//EFoEZVhDMnjZ6lKb50V
	 mMAemamNKtCmfxwv8HPMWKD9uuMAKGkBjbr0SqlzG0i6VLA0+EEVW1rAjNCVRIlomN
	 5E1VJ1QK4LsFvzZXcVOZvWV9NpnguYSzqXgwalkSyt+yF9vPq/YBhGhYepPJk3AfoV
	 Z/Y5V0knr9RVogFu0qm1vVsie8VBsuwqMwUQZJCXXlMuEikbxUKhyhEQjGenRbV2Oz
	 xMboWJOblX8pwurEKpJyrkZktRjpaVEMWczxMdmF0NTpHOOSgTw2WytuAfiW2VlfnT
	 KWa6xqb3qcrFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748AC8102D;
	Sat, 10 Oct 2026 17:36:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1851105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96C1D408C7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mv11ZioEDpkD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:35:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B8EA0408AF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653757;
 b=dIMc6tVD9hm5Sy/cDpjQDJXqm3CkJGdXey469nqctj74wAm0w5xIDpI4yVR8elsaDLoB
 6hspKC24rN7vojSLt5kOgBOnPohojK1vgni21ggCNK5Di2cBum0p46Q8/t8pGLG/sApHm
 F0J8VCEAVV4qxcebKUgc+UrJHRtoSGwhAIIxXwxB+AAaFYkgz5ltJgVvSKLwLfy2x7GD0
 hPiYCt3VeIUiAuWnBe03JWbWxFQSm7yX9ztIQprreAOlo3yp/7UKeUYLOOtTEobNBnDK3
 OBkpkCuZdF0drUL/fNj/g0nHGh8KJ0gwm7HFN+w2Qju6bJ8bVMZ7p/sv8+bxrtg49IA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653757;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=p9gfshg/vvFMBFE5SUFcXJbkddowlRtrTlE9QYRXsLI=;
 b=tM3CuaSaZcsosAXwvvYadElAcrosFqpYq8FGlg0UxmzGEyMlt6RgDileBESaZxduSstM
 h8GRNq8IeAEaQyy1rBx041pIg8ejIXKwBDQ/+UxbPjMP2JC6n4fj+kPTzduSewXsN9Q9g
 sNPTxPoTBlVD89pkFXCUxfOCNEBecSEgFaLQEhlaPIu3+yjT/96hjd68pF4HrOy7P1cBG
 BBXW6mVG74Ukf0WtRv/kxBkeuQhO8FphL+fLsijiGUueDHB7Z3A8Th/P0+kx7ZdNGxwpA
 g5uiH28vRhIiA2Wztt97EJXSHjYnsa0VNNuN/z+kI51bMX/X9z/JKq0f7CFc0CmB28w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b="m+k/kSsG"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=m+k/kSsG
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8EA0408AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:35:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=m+k/kSsGZnVDTTBbqKisEdPg1ATrt9LKcjIo7psLljFJOsIaU0/5iQnFCS+i8L4EJD7vqtSAY0FNngJ3kIeMWrXNKyLrZ9thsm4XIqBu2zftm/vvPJ75gpZf5E7gQb+upA4Hi0I9PDLB8JSca2pl44ydFVrzUizEvGNod02xsCOe5cusexqumTz9EmyVRYmOABc6eSjy/m3VyBr+p9i2O0S5o+7UVaJAxyRlGssVP4L8/gtNq9DDQWkVZzihf3RMQML/ViXulsQZCfyMA+bKWchqsxPWH5OIe8a4pxU4u6CoYJcqtKkHnTLiX0QsBcGntLXDyzhR/K/y5Kno9jjaAA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=oLq8yUGNyghYH/f1IJudmEQhE6XA8eaZ8sWF2IzqMx8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1577911768; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 17:35:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFaz6-00000003552-3okL;
 Sat, 10 Oct 2026 19:35:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <b0c47736-e84d-424d-aa1d-0164454693ce@rnout.be> (Arnout
 Vandecappelle's message of "Sat, 10 Oct 2026 19:17:06 +0200")
References: <20261010124237.92754-1-arnout@rnout.be>
 <87fqydtxjk.fsf@dell.be.48ers.dk>
 <b0c47736-e84d-424d-aa1d-0164454693ce@rnout.be>
Date: Sat, 10 Oct 2026 19:35:48 +0200
Message-ID: <87jynpcvbf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] .b4-config: add patchwork configuration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@rnout.be> writes:

 > On 10/10/2026 16:55, Peter Korsgaard wrote:
 >>>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:
 >> > This allows maintainers to use b4 to update patchwork.
 >> > - Use git config --global b4.pw-key <key> to set the patchwork token.
 >> NIT: Why globally?

 >  No good reason.

 >>> - Use git config b4.thanks-am-template <filename> to point to a template
 >> >   for thank-you mails.
 >> > - Use b4 shazam -s -k <patchwork URL> to apply a patch and set it to
 >> >   "Under Review".
 >> > - Use b4 ty -a to prepare (and optionally send with -S) the thank-you
 >> >   mail, and update patchwork to "Accepted".
 >> It would maybe have been worth mentioning that this is a new feature
 >> in
 >> b4 0.15 and ignored by earlier versions.
 >  It works with my 0.14.3 in Fedora...

I'll give it another try, possibly I did something wrong. It is listed
in the 0.15 changelog though.


 >  BTW a few additional things I discovered:

 > - it doesn't do the From: rewriting like patchwork does. I do an
 >   additional sed to handle that;

 > - for the same reason, you have to add -S to correctly handle
 >   Reviewed-by etc. tags, otherwise it gives an error when the tag
 >  doesn't match the From;

 > - if the patch is part of a series, shazam downloads the entire series
 >   unless you give --single-message;

 > - b4 ty gives only a single reply to a series. It does mark everything
 >   as accepted in patchwork.

That part is probably OK, as long as the reply makes it clear that the
entire series is applied.


 >  So a bit of a mixed bag :-(. Time to patch b4?

Indeed. Maybe not a bad idea? It naturally does not fix it for the
distro packages for now though.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
