Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE55C3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 15:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A83580061;
	Thu,  8 Dec 2022 15:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A83580061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4p64Yivp_eK; Thu,  8 Dec 2022 15:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54570820CD;
	Thu,  8 Dec 2022 15:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54570820CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 518091BF576
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 15:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CA974194E
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 15:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA974194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTIEo4GspY8E for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 15:49:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C5BD4194D
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C5BD4194D
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 15:49:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0042E320092B
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:49:05 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute6.internal (MEProxy); Thu, 08 Dec 2022 10:49:06 -0500
X-ME-Sender: <xms:cQeSY1q2lvss02N5HqQs5uESETZmy-VIV03ror-qNUL6Dh9yrstoNA>
 <xme:cQeSY3qc7vXrkMsg-zdwEHtCmMj_PZBP_iQr0YusvJW7N5BUbZo_xyazxdFC2sfXz
 M_1q4CWds7Enpqm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdffrghnihhlohcuuegrrhhgvghnfdcuoehmrghilhesuggs
 rhhgnhdrtghhqeenucggtffrrghtthgvrhhnpeeutdejkeefteevjedutdejfeefveehie
 elhedttdelieejuddttdekgfetkeektdenucffohhmrghinhepghhithhhuhgsrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrih
 hlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:cQeSYyOUBhukUznvUyhotvPrj-2avlSlWqSRessu-YVej12v1rzbEA>
 <xmx:cQeSYw7xC5oTbmSMAyX5oi5eb0b-I5elAxioU-j-2nmnxGMwUAAZtQ>
 <xmx:cQeSY0770-pIoMtybOmzaSlASo1x6kPBv1uGchGInpMCf_Ac0B60Mg>
 <xmx:cQeSY7Le06RzX1Cpx4HDQ6J6jDsLp06XOk8Fu6WfMZTk2ZQTI_0zpg>
Feedback-ID: i1d444086:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0F69131A0063; Thu,  8 Dec 2022 10:49:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <b8157c6b-cf89-4d3d-bafc-fba182f8cf5a@app.fastmail.com>
In-Reply-To: <20221208141647.0ca26b3c@windsurf>
References: <20221208110247.7002c3ca@c3po> <20221208141647.0ca26b3c@windsurf>
Date: Thu, 08 Dec 2022 16:48:41 +0100
From: "Danilo Bargen" <mail@dbrgn.ch>
To: Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1670514545; x=1670600945; bh=mDQRgm0Y35
 Tn2Z2tujdOo6py9lwjU6deQCd2EDrniZw=; b=BVaGwtSdBp0iGC5Gi22kgu6b+D
 bKMmwlJW4jGvu64rPfF/zkTQNCJp5Fu9S2MSSQfiOuF9neUXiHYX1cIqWOL9Reiv
 QrZOjpjq2aK07qyBJvrIbqVSqMEeAm0LIZxKEHdmtobJ1EDCgW0IGgl8l4Rn1jHh
 croZT6GirXpEGTv2+3gy+0dzkYrkLJ517zsq3YRsZv7sZSQyqfWLmMKgeOnMLfe7
 G3Hi7JwNR5P/oSb0dcmBlJ9ba7ST8MsFQLBCtztuhPwflrHBoewsaYXJEhrJ7lJu
 kgQWTU8nnancFIjXWHBMho40I1HjLVBqVFie04gXXAKKaRsE9wYnhXDkCGYw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670514545; x=1670600945; bh=mDQRgm0Y35Tn2Z2tujdOo6py9lwj
 U6deQCd2EDrniZw=; b=M4sWENALbaWFFGTndQjO/HV+bbFDwouSjZkMWF+7iYwZ
 7UGz+MMvh431qLdLoF7KCRiiEqd2uNeP3GXAec/ANQ0W52YEwjMP3ByHYbu27p5J
 HI7F4a7+GnM269VVzAYkDAoXNDwlZJ/qDSh1DCN6lzgZ0CSOjK23eU5XhXO4zPDG
 h2r7aAHsHJIGMAiOxk0lEv6MeyzBiyX4K1dNlTDjmgAPoODZwSeMVhX/Jpl8HhZ4
 xQiFUMV2L+SDDZdIFLSgM6xuRCqWldIzDCc6cuJW0EUFBraNHqhynI1jFuptwPT2
 3DeBAxHJtk8PKsZyQyLN9ISvwmH1gJ7A+ttB1o+jaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm3 header.b=BVaGwtSd; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=M4sWENAL
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: exclude unsupported
 targets
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hello Thomas

> Thanks for working on this. Your patch is badly line-wrapped by your
> e-mail client. You can disable wrapping in Claws Mail, or better you
> can use "git send-email". See below for another comment.

Oops, I do use Claws Mail, and used "Edit with external editor" for pasting the patch. I didn't notice that this doesn't disable auto-wrapping.

> Side note: overall, if you take a step back, it is absolutely
> mind-blowing that a simple application showing tldr pages has a
> dependency on architecture-specific things. There is really no sane
> reason to have such dependencies, but apparently the Rust ecosystem is
> not completely sane... :-/

The reason is that Tealdeer uses https://github.com/rustls/rustls for TLS, which depends on the "ring" library https://github.com/briansmith/ring/. To quote from its README:

> ring is focused on the implementation, testing, and optimization of a core set of cryptographic operations exposed via an easy-to-use (and hard-to-misuse) API. ring exposes a Rust API and is written in a hybrid of Rust, C, and assembly language.
> ...
> Most of the C and assembly language code in ring comes from BoringSSL, and BoringSSL is derived from OpenSSL. ring merges changes from BoringSSL regularly. Also, several changes that were developed for ring have been contributed to and integrated into BoringSSL.

Due to the reliance on BoringSSL and assembly code for some parts of the project, it is not as portable as pure-Rust code. Support for MIPS, PowerPC and other architectures is in the works, but not yet finished.

Previously tealdeer used OpenSSL, but quite a few of the users had trouble with broken OpenSSL installations. Plus, it made cross-compilation and static builds much harder. Using rustls makes this much easier on the common platforms, but of course, this has certain limitations with regards to more obscure target architectures.

If you would rather remove tealdeer from Buildroot (because the config is getting too complex), that would be OK for me. Otherwise, I'd update my patch based on your suggestions.

Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
