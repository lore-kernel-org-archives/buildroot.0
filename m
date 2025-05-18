Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCD5C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA06440791;
	Sun, 18 May 2025 13:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnzKrA003nwe; Sun, 18 May 2025 13:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 030CF407A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 030CF407A6;
	Sun, 18 May 2025 13:04:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F217DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 500D76087F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGIbkiJNomG6 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51D7960608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D7960608
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51D7960608
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:04:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 809B141B5F;
 Sun, 18 May 2025 13:04:37 +0000 (UTC)
Date: Sun, 18 May 2025 15:04:36 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>, Thomas
 Devoogdt <thomas.devoogdt@barco.com>
Message-ID: <20250518150436.3ab52127@windsurf>
In-Reply-To: <20250420070934.185346-1-thomas@devoogdt.com>
References: <20250420070934.185346-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudevfeegieehveelffdugeelveejteegjeetheefgefhfefgudfghfeggfeifffgnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsseguvghvohhoghguthdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsu
 hhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhuughgvgdrphgrtghkhhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdruggvvhhoohhgughtsegsrghrtghordgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747573477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/MNQ8CSdkJDXgOpSBw4oSGMdXyHGVGylRW5tnDOuPY=;
 b=kqwRidcdL2ugoN3Iu6G+LsKe7fT/7CSVft1Txu1BEHKLP0lWY7anwrYntkoxtNVnw0Op8a
 0KtZ/+fJ/BDc6L4/QCu/MBwzQlWgdMfmrnA6IJBJjKzNeaPnTMyavLLPzVXOGWBveEMbB6
 +5yZo1HiCBf7/aBy70+yiYwu26H6TVCMGnLqT7T1XDEKVZxZYuW7HJbbBykLEhgL7wSg6k
 d6U89pVHR2mKntAVHgjdSC7Jc0GIqnZYSdXIq0bggb5+Oe/6wYgSBkGucoqwwchaCqt0mZ
 V4itVrYZsf6cw9t5pjfu41cImLaHfBuAPPxMOT0XeUzdmuPsza9VcD9s1HY16A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kqwRidcd
Subject: Re: [Buildroot] [PATCH v1] package/syslog-ng: disable cloud auth if
 libressl is used
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

Hello Thomas,

On Sun, 20 Apr 2025 09:09:34 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> ./modules/cloud-auth/jwt-cpp/include/jwt-cpp/jwt.h:1158:33: error: invalid use of incomplete type 'struct ECDSA_SIG_st'
>      auto rr = helper::bn2raw(sig->r);
> 
> ./modules/cloud-auth/jwt-cpp/include/jwt-cpp/jwt.h:1159:33: error: invalid use of incomplete type 'struct ECDSA_SIG_st'
>      auto rs = helper::bn2raw(sig->s);
> 
> ./modules/cloud-auth/jwt-cpp/include/jwt-cpp/jwt.h:1181:15: error: aggregate 'ECDSA_SIG sig' has incomplete type and cannot be defined
>      ECDSA_SIG sig;
> 
> Fixes:
> - https://autobuild.buildroot.org/results/d76/d76883e0870b4c788058fee1ac2c1c47a17f6bf2/build-end.log
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Thanks for the patch. However instead of this, can we fix the issue?
Looking at upstream jwt-cpp (which is bundled in syslog-ng cloud-auth
module), this snippet fixes it:

  https://github.com/Thalhammer/jwt-cpp/commit/c9a511f436eaa13857336ebeb44dbc5b7860fe01#diff-be2369ece29c0945fc04ffe13a39767b7841fc2fabd3df209a26b3bb381a2fb2

So could you make a syslog-ng patch that adjusts this, and report to
upstream syslog-ng the issue so that they update to a newer jwt-cpp
version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
