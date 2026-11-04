Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E87B606A329
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BBbRzN4T
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491BC8127B;
	Wed,  4 Nov 2026 22:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHrDRMDaeHUp; Wed,  4 Nov 2026 22:44:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77F7F81257
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793832273;
	b=Ea1b47i1iQI0/4nZBKMWS573SSES3Ovrjvg14cgCl9RiDbVT/LEolcMOdl3X/UbRfGyr
	 EImTKrah7ZVhMwLCSu84imlS0DyCwDuMcpg4MDAXPlU/2IEk3Q8HTL4QsnZMDzgFMCTx4
	 7ooFIOz5AUowUo/JqiV/WuPrIJSn62fgzKy601dpbLo+3bB9PjV8nQOW3BtRvB4jWpEvh
	 SutcL3KRc4NSObTDhaEiiN9PSaNzKV1nsdkGimcoW5gmZBkxxoxeZtkV/vGUNBoDr8aeB
	 eVijczfNt8nfKK0HhplUCRT+Fi5fG40d3L06KPBQ4yNp/njrCMHmWNm/2FsAdTwEpag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793832273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5bIdBbXjD5tUPzBym69je49inkMDqqRzOPmEM844wfI=;
	b=n99AjicO4O2AOM6zfjBadXgLdUvxbWpLFXKF71nAKxMvElvBdkB5hQuSh4sxJceVSqD7
	 DzcLnb5Hs6OeBJ/e+JZ+hcyEzZqdfxQ+r+vckMnhSMLV3AnSYZxiLpmdZxMIkOoofHXIe
	 E0jIy5AFxfdfW5319xePU9BKN4ZTT7FhYD7mJqVwgBjyOdgoxwFJ25ZmUpSXX/Ix4u7Sf
	 dKl4F2STM6r0+Mvj0DwI6ldqzZrVj8qJX9AioCoTreSG61MIN4+lyIbn7rPUyzVFy78Ne
	 zMcye5pjO3DY/EmVsXqkBa6+Ne19QaP18pLnLgnad/MQb9cQ/p3hb6JbBnTwEsEAZaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793832273;
	bh=5bIdBbXjD5tUPzBym69je49inkMDqqRzOPmEM844wfI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BBbRzN4TetF+NjjZbhAiV3lTgeDtqvMs41R9stSqz7f6EBWRs/qVnLQ+ezrMUYtg5
	 UzMkhDlnhD217QIxRq00J7ZrPL0YyhBQRYQSDufr+gytPGckNJURJT5osHoPdDZmaL
	 49dKO9Zp/gKZGlHT7NNd3+ArsdPK0fpZg7IePla53I8LySvuRv4MImTA90vZ0Gekgf
	 oUAXWthq/xJS2adGqqOY8q1clIbQVtaDA9mzOtMJARUKHT0707HwRIV8nbpeT87hen
	 x7b0pygDUJHR/TEUBm2BOUiHlPkK3emY6woNBmv4g3DZuww5gaD5dYH3XSNxBRI9us
	 g566mTAjiVgPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F7F81257;
	Wed,  4 Nov 2026 22:44:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1422362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA54607F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsaInNOKIFwg for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:44:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0DABD607D5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DABD607D5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:44:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AAEEA4E404ED
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:44:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7AFA55FD65;
 Wed,  4 Nov 2026 22:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C5411032926F; Wed,  4 Nov 2026 23:44:23 +0100 (CET)
Date: Wed, 4 Nov 2026 23:44:22 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <auu1HsM7xp331Hbk@windsurf>
References: <20261103064034.3913314-1-yegorslists@googlemail.com>
 <auuiaUH0JJ20VZWV@windsurf>
 <CAGm1_kt3BhEuM3H2rRUQYiFmU2+HrsCQdajzCe6whEXwrBkmAw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kt3BhEuM3H2rRUQYiFmU2+HrsCQdajzCe6whEXwrBkmAw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/file: bump to version 5.48
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 11:19:49PM +0100, Yegor Yefremov wrote:

> > I continue to be amazed that key open-software like file has a website
> > like this: https://astron.com/, no Git repository, no mailing list, no
> > nothing...
> 
> You're right. That's very odd. They seem to use CVS:
> https://github.com/file/file

CVS, interesting :-)

Note that https://github.com/file/file says "NOTE: do not make pull
requests here, nor comment any commits, submit them usual way to bug
tracker or to the mailing list.". So is there a mailing list
somewhere?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
