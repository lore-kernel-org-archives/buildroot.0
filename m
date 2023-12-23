Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F38EC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 13:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EE93400CE;
	Sat, 23 Dec 2023 13:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EE93400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dQmK0dV_zcs; Sat, 23 Dec 2023 13:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4980040399;
	Sat, 23 Dec 2023 13:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4980040399
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 769791BF41A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A45641827
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A45641827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2Em7mJ_ziVT for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 13:40:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96BCD41803
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 13:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96BCD41803
Received: by mail.gandi.net (Postfix) with ESMTPSA id 814F5E0002;
 Sat, 23 Dec 2023 13:40:19 +0000 (UTC)
Date: Sat, 23 Dec 2023 14:40:18 +0100
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20231223144018.5dff2c0c@windsurf>
In-Reply-To: <20231222232251.12786-2-colin.foster@in-advantage.com>
References: <20231222232251.12786-1-colin.foster@in-advantage.com>
 <20231222232251.12786-2-colin.foster@in-advantage.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703338820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8TC6FNosVoEQiNU1bRyJ9vKDuvYCwN08Hw0N4yq9zE=;
 b=Rf5GJ88XvY8ss70lfbrWnjOwtbI95e2qrBUspCtV8tLfUmU3nZeM7kqKvgl61bOD+p1Gsg
 fR4MdlRjrQda2SWt3hvjVfLlk42qwIPfM0xm53sEDJZgQCxaJaWAO7aFo+jMhaoLWWsyKH
 +0eynVhfdEQs/kPbXLwre5sHk9SF8mh/rLFkNlPmkGKPUCCmD4qK1ruUWolYainqMmU3T1
 WOCRBoPvV8VSJJHZHttnQeKL+8KpI2xnRupaTJTR/uYKZjcAsuPoz3NCK8ECg5R0BSd7zD
 ziBafgSjeF66CtpbuMiRnwZ8qHrNgZNtLqe+pXAKDjJsmWa8X1x72OpMIaaACQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rf5GJ88X
Subject: Re: [Buildroot] [RFC v1 1/1] support/testing/run-tests: add ability
 to run tests from external
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Colin,

On Fri, 22 Dec 2023 17:22:51 -0600
Colin Foster <colin.foster@in-advantage.com> wrote:

> +    overlay_path = os.getenv("BR2_EXTERNAL")
> +    if overlay_path:
> +        temp_dir = tempfile.TemporaryDirectory()
> +        shutil.copytree(script_dir, temp_dir.name, dirs_exist_ok=True)
> +        shutil.copytree(overlay_path + "/support/testing",
> +                        temp_dir.name,
> +                        dirs_exist_ok=True)

Is there a better solution than copying all tests into a temporary
directory?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
