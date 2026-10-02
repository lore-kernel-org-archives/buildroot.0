Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1F7CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D171581346;
	Fri,  2 Oct 2026 19:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wd7XL9t4TyPo; Fri,  2 Oct 2026 19:34:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0EFF781347
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969681;
	b=pAL7tGZszX19lq+GQ8DMcDnU7L+s715ApIramGndyNLfy+JbJPu7T3xmFtlLxsN5Ut7X
	 6J0h+mfkUGQVO2RLoiXivjOl6HVjsuWbGy7sa+U336ikwUYyo2fGETyabaUs001p8k/GW
	 ARlYGVD7mX9LAdF1GcH+MJGrz5ioxejOLsXJdn+pz1EXfrmMQDExv1CQ6brEXQbpXwjwQ
	 EHuuP63mCZFRCwYDPVE1xxTR0yhrji4pHdoOvU69mtdG5Vm02YhyUGfvAC1e9f61CRXK/
	 XRe1Dt8HZERnG8mnm8g4QeNE4DPnmOpR+NPDDpSOI1kwBfuqOH9blQWhNp9u4I41L8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=50oOv/qf4/3ondkr2EkYHEakkXf8WNnjZgSDLQWqwdQ=;
	b=NHzM5qzRFbbGa4pN1HAEqyaM14IMMsmTCBf9Gr+MY+CBXIyTkeE2GGyEUwklSGjaM8SQ
	 hP+1dh3CmkMPUO6C016CFCJ7dyDXXvzv9XEkQLP6iKMD+FfiXfoBTUlKQaGbxbGdlrTLD
	 ZIhOqfvddhOsZ0r3Tq5qqf2xqehe+qBVMZh+z+CJuRIYOJSaOlEWanJm2OpqWCDbbwpoL
	 CcwM0jEafMaHKi/fJJ+3zGyPg5uzt5l06SYiPl28/6XtsHs73+rxSLPLQtz6tPUBnAwi4
	 +Ts9wbAca28QKug3RilB16niRNhlSlyUybMaoThgid2CP1AvB3pPQD6uKw6/x4YdEgQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969681;
	bh=50oOv/qf4/3ondkr2EkYHEakkXf8WNnjZgSDLQWqwdQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CZeu/xG6VD2j2B5xL1usXrZWcpcPA2nhJUP8lVVKcrrlfNwWur4dMl4Hwc5dJolzA
	 YTYme80AaN+gnvz4ot7spDd0rcmsdF+5Ke5XqIaZt0g82mTmolL9KJDKibdFaG/vgq
	 k9E347szPpxTGMj6Gz9MsHxvaxmqVX15G/oQ4dGVI4+Cj6MG5Lr0Oued8ksyocJQye
	 CyIHHIeYsWryRdMhOxEhRc009I4CPn0SuQw2nvysbisYTBhdgXmU96320YfjJihaqQ
	 OlrhozaZc0sSAZMEF9Lc1VB9ePVTh4FCAHYMFLiu8mXt57QxzEW1poIoFCfheoi9jU
	 UGm9FNyYjfyQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EFF781347;
	Fri,  2 Oct 2026 19:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6F261D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B639400C7
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T96OUof4u9om for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:34:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 25C39400BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969679;
 b=Xgl886jABz5BuTtD2EkQ0NphseohYDLCR0TtDAOfw5SD2yTwzrC1Vd3lHcCyrk/r1vMT
 cjvHUGlq+lWbJhUKoeM98OYLIT0Psy1k6vZnS3phsUO4SNZHrLGVFqjPYomuVQl8C6LyK
 FKYve6i6R4UEKhLiGAXNKOzbVykK1VMmJg44sBCIQHdTMuPfqyhYozb+PQol4VcwFFscj
 EeLCn+Zsk7u9K6f0h+EZ9oSO8QNwxr115qCsQvG/hvGecVvTT6Jo2uy+pE7tSKdl9lio7
 oWSTBLAXsD/qTJq9aKmKSnODJ85cmlupd65iWot8fHYQMsAd4Y+73WvaqWhNMeJMGfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969679;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=USyWkrlt9mtu/ki+oYSdurJ15f60aopgdqa/eTuWLYQ=;
 b=TbXnL/zThP4rABXk1bgKzetN3/WyhYWS+8e6XwUWhvjdOWMTXpUF/qqpyAUHwMiYkqAR
 qcPly7OiyjBqgBCZk9VeM13Yv9HGZucuq+zGGC/XSgnVyy5/xogcDUhATbyldvwqE1d27
 daIgCh6rYl5CfpCXzf9sOunh0R/Pz754/LnJ47KiV2Ue6eqCJWHXfnVn7U/pgnxDNR0X/
 Cy75i0zq0Ef/BlFS7z/AivA05uAyFTk/ZFHRSQHQytv5S40TfLt/vMZMcMYyjAOV1A+Tp
 aY2XawzA9RI2D8r8XrPdxYS6BMNDjsq95OBRu/Dof2lw4qaL0vCt12QNQvZc7sR/8xw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=STzTzmfL; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25C39400BC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:34:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 056544E41113;
 Fri,  2 Oct 2026 19:34:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE288603DC;
 Fri,  2 Oct 2026 19:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 214CA10328273; 
 Fri,  2 Oct 2026 21:34:32 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:34:31 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Message-ID: <asAHQrEVZ_0o2i4H@windsurf>
References: <20261002135956.354969-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002135956.354969-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/gzip: bump version to 1.15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 02, 2026 at 03:59:56PM +0200, Peter Seiderer via buildroot wrote:
> - bump version to 1.15 (for details see [1] and [2])
> 
> [1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/tree/NEWS?id=e6263160768c73f6117f3c1de78291a60f2cb796
> [2] https://lists.gnu.org/r/bug-gzip/2026-09/msg00030.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks!

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
