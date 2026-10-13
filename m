Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371F6CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1E3E60760;
	Tue, 13 Oct 2026 08:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhrsQU4ezwLF; Tue, 13 Oct 2026 08:14:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 75F7D6074D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879241;
	b=stTSwq/8ZY60ke1CRDfa69Od3fAsD2szyutqm7SNYWTt3wvtgKJ72d2RqCb/yR8h5Nt8
	 uZ4xhE8B0zekG0JBFL+kllDG8tkizRcqiwI0lYBhvCRKd6ig4494rD8kScL5hmqdPgXAa
	 boiSK1IwbqtpE3FZUt6FOL9pwr7iEa+HWmHJxjDdcumhuLWLBLZNy4CvdGMDRbuaW1W8K
	 h6rPSFSZhyP/1c5pUruQ9q/UHzLh1kCcnw2YK8VGnP5dzrTRZ3U+ZqIpRWKrQbT9mFQVG
	 jb2swp+tm1PGnnJY438knVEDNbMBx00O1Jf1iWhWoYx4Sf8HoSep4RJGBoaWJhfu+JQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vb16IjtH/d2b/38knNcTqXEg5lTzVBkeM+W5xm6H6f0=;
	b=Y+aph4+AZwCZXj1klB+RhLFTs6fuZBU/eLP9OhnCDC/yb6cmAYDl6fP1bn8EqAIBmRMG
	 zdC/qVZxfzXOvnzg4/W8kDmzpYpLATHj5oCryd6FB0f449RyfFRvDglQfBPby1pap4V6B
	 uK7Ljqp67EOG2JkwRhxz4UX8QsglxecWHWunuG3bVWCqZuliGOl10OLPIvFvqnMyQ3utf
	 TzZ3KFc81fnnDEG7x+zRa40npi0+QeKzifoXwC0U1+7HF+UuYlzQ979hnM115lJBesAjN
	 B6y/KxREDKOK4tgB6QkGZVdqrusBMiHx022PqvLo9AFFDfabLxlqKvrSURwuNOPaMqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879241;
	bh=vb16IjtH/d2b/38knNcTqXEg5lTzVBkeM+W5xm6H6f0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k7t7S/It7laScpGAPXxifjNaiTshGOQtSkszOnf9CbClPQrFE2urOGEJbF2XfkdN2
	 lKfxrrzhJBL2TKwL/QtLo0Uz7rehDQqR2v84WSKgyfW1shHv1Da5wkDXuzdwsLd63c
	 hflnUBQF4mz0aIpvOqS1kxkz21VL9n1JynERHlsec+rhdpknvHHwLyTRx6aow4tiMQ
	 cRal23KOU2mPAD1gznYN7LOl6j3rXCI7A3ccTLa51zBOSYup76Jk59uUNoUefGI3xo
	 Oelwm5jnNddAvpVnmgvCEyFDsl39GXvTj7efqjbf95s2evoG4+Se0Dd3qlFPFeTT09
	 xr79aAMYOh97Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F7D6074D;
	Tue, 13 Oct 2026 08:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 830A7105
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 751E440627
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fk7oyDiLJVaY for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:13:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0E65F40613
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879238;
 b=eQtBTeiBjWZYqXvWnJB5cLd1/B8rA/7J2tNe73l7bB5KnOoOokL9KGt4DhqwG8fYqUE6
 MUapgUD29EHd7WuH4x2dI4+o76bPgjbAVydy0WLxH+Omtk4Aay8qsDt94xCtWdO7TyEPt
 mV5QCoDgUyHekuqi8i5J+wxPzE40in5r1KpA57NfL+ZEa/SdKjVHHGjSXgk5rE091iV/s
 PXtUtXcgeTO4JIy5zhPHtLfwxJlQsx0ADwwNOlivItzkN3DVEl0g8Hck/KyJqnImDcyc2
 lCr3S5h4bI8YLRwUfICoh6qBT4GPNzEzHxXO8ZsrWD8FZZHkB8U1obdO5QrbbOqqQBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879238;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=tf16GuSNVioWOS0/9MR01rjWV+nGBAyO/gmiS8M9mNM=;
 b=E2m33ZtLWSv76KDQl2OA5iqLo2ySSzbYu7TsnMw4zTbYiEy8DhvcKD3X4vSJjwyUOIMn
 Sdp8aQmMHw1ZAMzIHI3H7IRW7MT8wA+lAWiSToyy/+9YSUGqCcf2EsaV+DyfXT/foYSoa
 D/RlvqrnOk65bqDW0rNMH5nh0575MslA23MI5xzt72g7r7Qx+GY76uUwHsUnivaUDugmw
 dsZI/0+8bhJsW6ZnqMb42lsqAWALw2OdHVTm6zqgz3VFGE7FgQFfwc2Yq8JOk7qCkze6K
 FGWYBJvvynOlyBL2FC9bikHLcaUovTqB9P7KLWyo91Tski4ClBINWXf+0eIrB666vUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vDu1CnEs; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E65F40613
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:13:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 27E5A4E411D2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:13:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8C7960362;
 Tue, 13 Oct 2026 08:13:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50C9D11D70160; 
 Tue, 13 Oct 2026 10:13:53 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:13:52 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <as3oPchAfpXrbWsA@windsurf>
References: <as2y5-1HltXrXKyP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <as2y5-1HltXrXKyP@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/uclibc: add missing sys/auxv.h for
 static builds
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

On Tue, Oct 13, 2026 at 06:26:15AM +0200, Waldemar Brodkorb wrote:
> getauxval() works fine for static builds. This was already fixed
> a while ago, see the commit message of the patch for more details.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/f03/f03380ef48cea232e4958084eae419d5516f4ef4
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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
