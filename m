Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F07C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC8AB60EA0;
	Sat, 23 Dec 2023 14:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC8AB60EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBWp6_Bs9urM; Sat, 23 Dec 2023 14:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C15360E7C;
	Sat, 23 Dec 2023 14:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C15360E7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9CD71BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F1FE40524
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F1FE40524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEfw2H2AJoCl for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:13:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA7D740399
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA7D740399
Received: by mail.gandi.net (Postfix) with ESMTPSA id B731840004;
 Sat, 23 Dec 2023 14:13:08 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:13:08 +0100
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20231223151308.4e28ec13@windsurf>
In-Reply-To: <20231221190800.2669237-1-colin.foster@in-advantage.com>
References: <20231221190800.2669237-1-colin.foster@in-advantage.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703340789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ct/w1UW6Z+pRLkzcaa7dGfiiZZxIfK1Hr0cbwSXhG3M=;
 b=CWgyMRVEPDxvgAoFy2KEi/aCoxjbB9hjtLMoNuMW1MMvoqIypbelOsRqaxOd+voH9XGyJY
 l1FRIeIjxjVG/qtCrSycUeYEvUOwNuwLSEVYO9K7e1io3M6653bibkTiE5Hwh6A5t+vMlP
 uHhhMSpKb1t0kBfBw73/2XqbzQ29z8ggv6kAjvViv6POFEkqNzFXkE6hLM+srgl8hfcMa7
 r34vfLQezIDDFjWyhu8VrXdxx6UwNMSfFV+T4JHFCkBsqYe/VWCo0v7sHek6P4zy7d/+3V
 FAv1QDqNSjY09+GnNmuhnYbIa3PRb7ZfXo1o4o33IYkjzMshBpptxPry/8coBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CWgyMRVE
Subject: Re: [Buildroot] [PATCH] support/testing: add python-tftpy runtime
 test
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

On Thu, 21 Dec 2023 13:08:00 -0600
Colin Foster <colin.foster@in-advantage.com> wrote:

> This runtime test verifies the existence of the tftpy module when
> selected.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  support/testing/tests/package/sample_python_tftpy.py |  1 +
>  support/testing/tests/package/test_python_tftpy.py   | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_tftpy.py
>  create mode 100644 support/testing/tests/package/test_python_tftpy.py

Applied to master after adding the appropriate entries in the
DEVELOPERS file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
