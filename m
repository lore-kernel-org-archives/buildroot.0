Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE128606A902
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MlIwmeYs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E4A4606A5;
	Thu, 22 Oct 2026 18:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Q5fVTWsbjUi; Thu, 22 Oct 2026 18:32:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C131A606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792693964;
	b=VVe4+H77EhDpQeSalmVZ1Ike3z5qVlKdZ+QgvSa+JKSjdo1g178dyrINmUAsTysGfQWW
	 gbnCzRYE9YB9vCSzSBREyhN690vmuqdsYsXT9QMLQmo1oFYdDnNL1N+cvaVTOkKgL+GDV
	 T46sm6dyQGWULYI5mjCx2rTjmhxbvqj9pamvgH8WZtMF10jpWxhCbB2L2bL89sKmetgXO
	 watcA6kQMSPTDzLgc6q0woFHhBt14rb+v74gWqGwI/K3im2DcNNE96QZAzBOSlBCA7ZN/
	 UYAqaKff7jIag30MnQZ8MeVfuRPq5YTdg3vTStyX58WNx+RnPbH2nHsooe3OlM83UKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792693964;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yb8cWCy9mh81P6tgojANawHLA6Isfk0Qf26KiX6J/TA=;
	b=JyGo/bjR/Wn543HYiFTew2ekmA9D9O8bafNe0q5etfJcV6hjtsjSMlWTRfi5ntfGRIFl
	 i0CNP8viJezlX0MhPNxj1BS9e0febjIHXqjmpi+1QmMxWqcahYlqn3YOuAorheKC/xIUR
	 wklzXUW5ppPVtyAtbS7f8vznubuTjAW5/xDv7/93nV4aJlv/mH6d9lthFCpiQ8iNSmzrW
	 O9ecDRLQ/6ByhgWqDpa1dLM9ogctQfNs6R0r9fUr+lbqQApzxjYNxYpXCWMneyTQicp/T
	 y+YTDTCeVEa+inA5JSSlbcZKJVq8DSfSpAKNUeH72H1H8igt86AdQbe2QFs0ENNmokg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792693964;
	bh=yb8cWCy9mh81P6tgojANawHLA6Isfk0Qf26KiX6J/TA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MlIwmeYsQslQWrJpHDTHZ5S5VS0uk9GyU580IwK5nvmetC4H3rM6qQlYQvsd75ZOl
	 +OZbkxq5C6y4uJ8jymyJLKV+mBPaASV1JgFBEmKkxadbFvF6YW64oOnZGscBhlCUJ6
	 4SOLC6QB0qXs+bE8Kb/paxANadkASQ1A+d8wn+l9V8SXts+URwJnoSr/PmRnMEHIoZ
	 rEdDZmXv7jdoUfbTuaeFr16oYVhcg9QaRD9Hg/w6wL8h9rjj072xD0O76KE6zNQrxB
	 4TyKm4Lf5rJA0refDZD8/3XeB+Q1l1O3pjWKz+NDBsj0T9QAhGLLE7M/lGtsHyjGr9
	 DzZmOwooh8OuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C131A606C4;
	Thu, 22 Oct 2026 18:32:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68BC64BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F3B240176
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tgc8VvwIVSkI for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CBFA3400B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792693962;
 b=dtZL3qY9faFK+tsgsGJGztBN0G6vz337uyU2HrV9QPUxYQkZAQUF5+MLEA0OcJHmMPMc
 hm5GIcmryc+jL/vn42no/FbdadshpMY1IKfSoEDjdQt9drckWPBp3U1yXIVeoIxafLxeb
 0dEH3bZjeS6jnk8NrjVTsF4FSSS9M5jzMz+B3K3iBba4MmIsT+8fwG+6A2Z4uphMOTaUN
 JO5j58mYK0qcfQn9oGDc/FjUO+BbZ9N4oTFnSgQQFD4Ed7bWWlrMVVT1Su/nfNQXP5phW
 cLQN4Uy0uekXpthyFEkS7VBXGFJ+JgT1gqn2+HpBkxx6hCZpIRoEfPG6Jio+R5X5o1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792693962;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Pm/bT109uwIrffT0t4vuACpmTvB/PStel6XMFqYvSEQ=;
 b=rS/jQvf+BgEq95kjikFnaodKa0ibm9vvbLDH8Rek8BM5ESnElxx3XImCQ44moOuLiziL
 ct7NYknkoXmttNmRozTRi2rP/7d9VOh++mK+FI6Jxvu1CbxsqiN9BIM7BrJgJ27WSnz4H
 S6KLnlR6dLUte1ZsuaOuKJF+5PR5H6aXlGCdQ4ha68iuQOtfvEOWyZ+Imz4gwF6nL6Lkc
 FcRNOLhr6UzCrnxKltFXJDxbqGTAhPnAbxmm/hZd5bw51btoXC7dlOMzlqbB/Kr5jnQI3
 yP1m2fjnQ/7GEulTqvbc4w8MwIs3JITq/Cnsi6TX0VGBzzyEz316QBzSBoB7QZDAdPQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Va15hstR; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBFA3400B1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:32:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D6B6BC5847E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:33:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5763D60763;
 Thu, 22 Oct 2026 18:32:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E98410328F2E; 
 Thu, 22 Oct 2026 20:32:34 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:32:33 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Message-ID: <atpWg5UkR_bg_Qo9@windsurf>
References: <atnvkhUXOH2UxGmj@windsurf>
 <20261022181954.267177-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022181954.267177-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: add uuid as
 serialNumber
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

On Thu, Oct 22, 2026 at 08:19:54PM +0200, Thomas Perale wrote:

> It's optional in the CycloneDX spec but it _might_ be required by some
> regulations to have an unique identifier.

Ah. Then maybe we should leave it out, and ask Heiko to post-process
the CycloneDX SBOM produced by Buildroot to meet his cybersecurity
folks requirements. And we can revisit that later if other people show
up and ask for the same uuid field.

> It's OK for me to include this change but I would still like to offer
> in the future a solution that can fit both uses cases: reproducibility and
> output customization with product owner informations/requirements.

Like "generate-cyclonedx --reproducible" ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
