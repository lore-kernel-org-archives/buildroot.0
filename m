Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B6606E822
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A6wkTfBn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA37D60815;
	Wed,  4 Nov 2026 21:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xm3L5VRXy0Cv; Wed,  4 Nov 2026 21:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 16918607BE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826437;
	b=SKbKKUbpjvdViE46C5o4aAbD7I8hTwDB174A2JcHwXdWOuJ5MCnK5roB+So4WtxomqSv
	 S/Jtk0gxZ8H2l6vmmSp1bKQmpUex3+Z65amq2qLy0Y1Rr1oKkwlYrj2ldLaB5ElcMl+K3
	 KoPkw15m+zymmz81viVjli7ZsJIi8BBA4UqV+bTXBgQkipI+juOQnZmzJ4dLbA1T6MsoC
	 woY7Yuay4ADK9xc6vIdTZs1tne69tSmP9cGB3HU7jzuWpmBPQ3yh1tusMYsTtKN25kk9I
	 jfD3Q0NYoUtJl19cSbsV822lYioeXdUFXlnnhcShBKaSqR99EfHS6XSJVJSiUosR2gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=o1imHwXxB07+1wH7r400Qdby+6MlHD+XkC3CBkhfU5s=;
	b=Dtv6aGgkIvL+2dErIjkaUrDbGHNtQyhiSxTVGjqlfi419+rLciyW0QaadjN4MfhtgFek
	 UuTZY5NGuCWjw6gZH8pryDLeM8E4eL/6I1qxsVm5KZhD8O0Gfkbd7VEkulJa1mhdFEqlt
	 R2jap01sP/9zsjbUx06fFpcVgSLWmZh9mpsSo1guSsUUpQSNNMl0PHUejNz4LPBpKs19a
	 NAnjFvf/vHrY0WZvfmsESmHhMJkTIK1p3nCrjGraGEl+WOXsY87vcytRFBJ78Iohu9rgT
	 1FvebZWlAONOJopvbdS9IJ/P4zZGYYmBXPs0m+XtRB5Q1OzB/MnikN0klEttmIYHqcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826437;
	bh=o1imHwXxB07+1wH7r400Qdby+6MlHD+XkC3CBkhfU5s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A6wkTfBnztJH4ih1KzrvMCyD7i8Z+F4+yz5dV35COZjY8ocEGf0nPrnJFTHrT8sun
	 +ZVgAqzgl/x5CWwsnZShzhv/MhPXi0yxzJjCS36xAKFH2sANSX65OGPAaivaiVAgtW
	 AYIqqBEjMaEryQ9m840ouNMkT1SzAbx3DvsitwN1U2v5R4GgZIBGMzI+pIsTH1JdxA
	 dtA/FyozU78+axpH4LA6bTJAelZUaYF6dYUy2jWGdwRdBsIcOvun20zbnA4MFtFo/M
	 hEMx3J5yB5+DoOCozxw3i8+tyGSogbaHbbG6bppmyiqWPEYVVHPvNFe540uEbXxxg/
	 SRkg0upUno7Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16918607BE;
	Wed,  4 Nov 2026 21:07:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6133AB00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4706B607BE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cFuGDnJUUvq for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:07:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 05C496078E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05C496078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:07:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 17A364E403AA
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:07:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8F1545FD64;
 Wed,  4 Nov 2026 21:07:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B4BC10329245; Wed,  4 Nov 2026 22:06:53 +0100 (CET)
Date: Wed, 4 Nov 2026 22:06:52 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <auueXvvSH_AyctA4@windsurf>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 0/8] website: follow-up fixes
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:00:11PM +0100, Angelo Compagnucci wrote:

> Angelo Compagnucci (8):
>   website/download: make the table responsive
>   website: rework the navigation bar
>   website/index: align the hero on the grid
>   website: version the CSS and JS URLs
>   website/download: fix the git clone box on phones
>   website/news: fix an unbalanced paragraph
>   website: escape the bare ampersands
>   DEVELOPERS: add Angelo Compagnucci for the website

Thanks a lot, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
