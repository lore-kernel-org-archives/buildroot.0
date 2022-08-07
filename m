Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AEAC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6031560B3B;
	Sun,  7 Aug 2022 17:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6031560B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jGSj_QXNcTZ; Sun,  7 Aug 2022 17:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 758AC60B2B;
	Sun,  7 Aug 2022 17:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 758AC60B2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB851BF3D6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12D654055D
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12D654055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SN8_WgmZ_wsw for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:22:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C977640377
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C977640377
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:22:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BAEBB240006;
 Sun,  7 Aug 2022 17:22:30 +0000 (UTC)
Date: Sun, 7 Aug 2022 19:22:29 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220807192229.0d697a6c@windsurf>
In-Reply-To: <20220807165538.850640-1-ju.o@free.fr>
References: <20220807165538.850640-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659892951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pvf6xhVpT/6xW0uuAx/8F+I+twpClqgq3H2eTTPySjw=;
 b=c8F1l+hlVrYlBbroHw88DbFjZDeZd4zyJXPNJacIZKhkIK8vYykezh19RXzdcdMHLrwQiC
 KvWhjqztjBmoEFAM6hgNL5TtQosVUGyIfVzCVuEDrwPT0ANhaOxdKC6yxTkChDa7TMDalp
 qnTTOdRJqKH+GrDw6iTacCzNYEX7ibp3mYDgOFxBZkz0jiwcDKuRK6g5DT2iMfShOdvtYY
 DoQTdHcV0pzgZnFoLHzj31JEd23DNsKx+nsQC/cpPdcU6UTahUOATdd+RtZj3vs9HrllQF
 SgewAWRgp8jcMGc6RXmSASBoA3HLKANXy/Nl7eZe855e9N5aT3DpiFxl8TK1QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c8F1l+hl
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: octave: increase test
 timeout
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

Hello Julien,

On Sun,  7 Aug 2022 18:55:37 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Octave package test can occasionally fail due to timeout.
> This commit slightly increase timeout values to reduce those failures.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/package/test_octave.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
> index 82a70e09c2..2d808e0cca 100644
> --- a/support/testing/tests/package/test_octave.py
> +++ b/support/testing/tests/package/test_octave.py
> @@ -34,6 +34,7 @@ class TestOctave(infra.basetest.BRTest):
>                             kernel=kern,
>                             kernel_cmdline=["console=ttyAMA0"],
>                             options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
> +        self.emulator.timeout_multiplier *= 2

Thanks for the patch.

I know a few other tests are tweaking timeout_multiplier, but I think
it's wrong. The idea of timeout_multiplier is that it's defined on the
command line, when running the tests, to indicate that you're running
on a "slow" machine that requires a timeout factor.

Tests should only tweak the timeout value, and the timeout_multiplier
will be applied to these timeouts.

So I think we should remove these tweaks on timeout_multiplier in test
cases, rather than add more.

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
