Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA0DC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA0940C93;
	Wed,  5 Feb 2025 10:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FB0CSUSQOVXT; Wed,  5 Feb 2025 10:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB07241674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB07241674;
	Wed,  5 Feb 2025 10:41:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7E1212A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99A840181
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yUgIwvKFfqX for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C39A40245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C39A40245
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C39A40245
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:41:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9393433F8;
 Wed,  5 Feb 2025 10:41:52 +0000 (UTC)
Date: Wed, 5 Feb 2025 11:41:52 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, James Hilliard
 <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20250205114152.30aeadab@windsurf>
In-Reply-To: <20240216131815.318315-2-buildroot@bubu1.eu>
References: <20240216131815.318315-1-buildroot@bubu1.eu>
 <20240216131815.318315-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhgsuhdurdgvuhdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghsrghfkhgrjeesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738752113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aET4ZIhcvqohtWju7mjgPZnkM9VhkFRnjJTijQxfwts=;
 b=iR7KR0G9bv76rS2gBEMEWZlnUqOLAdnFnJee6EM3wz/8ojWh0LntB672XVb/o3JBloEJfg
 aFZCPcsnTW61miLPlqTnHdJ1rB/4KJj1P9zP/JLU4UvhJtcdaz4LGtT1QunJryvkmtb+u7
 8Or2egYrauPT9Z5u/4ihtqMnmOAM0tYR0UMUTL/eByz23a74fDRMrPJUa6EPDrjWKUaZvB
 +vujfA1Cx6IK2HKxrj17bSSfr5k6+cyrC738CkpU7Czp8T32oM2/mIIj/EZb2DENBgwT2U
 /flTo6scH3NNFmEghQ8uu8wc35q6qcp/sgG/F9WqjAFN7UDSwAY7wByEYFAbrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iR7KR0G9
Subject: Re: [Buildroot] [PATCH 2/2] package/python-whitenoise: new package
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

On Fri, 16 Feb 2024 14:18:14 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

>  package/Config.in                             |  1 +
>  package/python-whitenoise/Config.in           |  7 ++++
>  .../python-whitenoise/python-whitenoise.hash  |  5 +++
>  .../python-whitenoise/python-whitenoise.mk    | 14 +++++++
>  .../tests/package/test_python_django.py       |  1 +
>  .../tests/package/test_python_whitenoise.py   | 41 +++++++++++++++++++
>  6 files changed, 69 insertions(+)

Also: entry in the DEVELOPERS file is missing, for the package and the
test. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
