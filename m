Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0400DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 20:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FFA881364;
	Mon, 14 Mar 2022 20:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLgZLdmFIYc7; Mon, 14 Mar 2022 20:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE799812FE;
	Mon, 14 Mar 2022 20:23:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA1F1BF30F
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B052812FB
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8Y_62bfslVF for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 20:23:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4C41812C9
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 20:23:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0E00560002;
 Mon, 14 Mar 2022 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647289423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ly/x4GNOlYKMgkZFzeMosM3W/xZwMx4m7kZb/PYZ20=;
 b=YXf1+WrNWfB6ymstov2W94KKngl0zcnPCQUFi2WBKMMcF3Q65+2ufqonNfT9MECKg6TDbh
 wHp+XEPpKJ9Z5FSTiIYP/d8/ftLawcFu3r8Sp6RpXNsIxdIPIMUhAf4egENTSivarvJjff
 2uTLFlvezcjRchWeQwEMVw7F2puqBG/Pwi5zFv0t0aEcm9znxvImYZkARLkZvuDhPYY25Y
 ffHIxJEtiqoX8GbOxaHgpztCZFwl9t1TCqOUXHcFRu2iZcNnBbEYqBilsllb2BojaBS8TA
 2UEM8fxK6EFgJFCMuLXy3rCRfAnbOMlnb1kcA8P4hte6Ccfrhnal4L0UYwIWpQ==
Date: Mon, 14 Mar 2022 21:23:39 +0100
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20220314212339.45d1da77@windsurf>
In-Reply-To: <CAN5uoS9XLeiApqZUzs_UxPqg5UOKU5oDp-2H03+bq9miYM0iew@mail.gmail.com>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-4-clement.leger@bootlin.com>
 <CAN5uoS9XLeiApqZUzs_UxPqg5UOKU5oDp-2H03+bq9miYM0iew@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 3/8] boot/optee-os: add support to build
 with python-cryptography
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
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Etienne,

On Mon, 14 Mar 2022 18:20:47 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Once bumped to 3.16.0, optee-os won't revert to pycryptodomex.
> Why not using a single change to upgrade optee_os to 3.16.0 and update
> dependencies?
> This would get rid of BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY.

OP-TEE is one of those Buildroot packages for which we offer a version
selection (because it is heavily tied to the hardware, like a
bootloader or the Linux kernel). So you can't assume that everybody
will be building 3.16.x or newer. Some people will probably still be
using older versions for quite some time, which we still have to
support.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
