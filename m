Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FB3C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E23804092E;
	Sun, 18 May 2025 13:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbqgWnFs7tow; Sun, 18 May 2025 13:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1494C40576
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1494C40576;
	Sun, 18 May 2025 13:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DB40E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E9B360A93
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4229oOcR12Hr for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DB1A6068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB1A6068B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DB1A6068B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:40:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8A1F4398A;
 Sun, 18 May 2025 13:40:09 +0000 (UTC)
Date: Sun, 18 May 2025 15:40:09 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: aperez@igalia.com, buildroot@buildroot.org
Message-ID: <20250518154009.2795a6e1@windsurf>
In-Reply-To: <20250420073608.668902-1-thomas@devoogdt.com>
References: <20241216181045.757259-1-thomas@devoogdt.com>
 <20250420073608.668902-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudegieekjeejvdfgudetleehueduveelieeiiefggfefteeivdekhfeukedtgeelnecuffhomhgrihhnpeifvggskhhithhgthhkrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshesuggvvhhoohhgughtrdgtohhmpdhrtghpthhtoheprghpvghrvgiisehighgrlhhirgdrtghomhdprhgtphhtt
 hhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747575610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTY4uRXMT/E65zgUsxmqPmGDXNlX3kmRnJRvOiIIsbw=;
 b=BOsL8iYMNgz54hatzm0h5bZfrrS6YnvKsk7A5Tc5JVv/3u7g63zziqnH+b4HTx2GG+J7MA
 87/JsPk3vyrmIx9wloZwZDh93onrVik+kd3EMSubSkyTOuniQ2OEGC1a2gsmK80b20NBZv
 lOnXqDLxGJ/+0xKs/TzKmum3i/rCiG0EupBMVUa25pCJxESX71+QzC5TgtV3p0+ZADLlbq
 rcDU9YJTKFuC09eNRhiYjIwAeOTaDA7ipkIHKjuZoCUb3RHE38DeTjvnoqvXCgOp8xPDEr
 Q+G8BvHnpJoArKbul4WQN+Wmdit0yyjtohFu58sjvlF99Xl0lvYys0EmKZTJsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BOsL8iYM
Subject: Re: [Buildroot] [PATCH v4] package/webkitgtk: add libgtk4 support
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

On Sun, 20 Apr 2025 09:36:08 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> WebKitGTK defaults on GTK4 since version 2.44 [1],
> and the libgtk4 package was added in commit faf2a1d,
> so start using it. Note that webkitgtk-6.0 is the new API
> if compile with GTK4 [2].
> 
> [1] https://webkitgtk.org/2024/03/27/webkigit-2.44.html
> [2] https://webkitgtk.org/reference/webkitgtk/stable/migrating-to-webkitgtk-6.0.html
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2: rebase to add support for the MiniBrowser
> v3: rebase to fix merge conflicts
> v4: rebase to fix merge conflicts (Commit 6a47aa6 "package/webkitgtk: bump to 2.48.1")
> ---
>  package/webkitgtk/Config.in    | 33 +++++++++++++++++++++++++--------
>  package/webkitgtk/webkitgtk.mk | 21 +++++++++++++++++----
>  2 files changed, 42 insertions(+), 12 deletions(-)

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
