Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEFFE732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBCEE4154D;
	Sat, 30 Sep 2023 18:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBCEE4154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id booEs3ZTuT6K; Sat, 30 Sep 2023 18:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE7B04168D;
	Sat, 30 Sep 2023 18:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE7B04168D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38FB81BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DC7141955
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DC7141955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoZRYh1baCeR for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 18:55:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9CE041936
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 18:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9CE041936
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A60B240003;
 Sat, 30 Sep 2023 18:55:23 +0000 (UTC)
Date: Sat, 30 Sep 2023 20:55:23 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230930205523.116e0f69@windsurf>
In-Reply-To: <20230609174955.409551-4-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
 <20230609174955.409551-4-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696100124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uJpnD6UnmcN2KK4HrGP0XSWtPgqcgIS6v3t3oLXcNU=;
 b=OSvmP+LDWbnBLziScQ4Jd48kjxhHQORoqn1JjUvq+O3deVhULZs2WtIS00FMM/f7XkYRBu
 cVOLWrJdX7+YTKWnDiyg2PiEYMf5Bed2NiM8oBrwCz8Zkt1F/v3ml4OpSlGr8fnnBRYlZS
 sIqMk4VWG+NGPD00NJA4DIrkXJyMyO5J9JwjxgTi9hwimtO3osjH8tv3BnTFiF0Jv6qjyJ
 aD6GtvXpqNDuPOHLuHPiJAVKhst/tBralNHrpUvCGyRxGp9B4XJsJqVUeujjKwE9daZOVP
 qcE7V5yPCXQ5TjVHd9OaRt9omnr3nrmETL3w9EnT/kfVmuzvwlmwS844DbypZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OSvmP+LD
Subject: Re: [Buildroot] [PATCH 4/4] support/testing: TestPythonPy3MakoExt:
 add a test for mako external plugin (pygmentsplugin, babel)
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Jun 2023 19:49:55 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Mako provide some external plugins that requires additionnal and
> optionnal runtime dependencies.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../testing/tests/package/sample_python_mako_ext.py  |  3 +++
>  support/testing/tests/package/test_python_mako.py    | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_mako_ext.py

Applied to master after adding entries in the DEVELOPERS file, and
fixing flake8 warnings. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
