Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA51C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 08:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB643404F4;
	Mon, 13 Mar 2023 08:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB643404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piKyymrkr0UO; Mon, 13 Mar 2023 08:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D8D94018B;
	Mon, 13 Mar 2023 08:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D8D94018B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA04C1BF3E0
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 731DC81263
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 731DC81263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ub2C-eXLu31t for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 08:21:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF38980E5E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF38980E5E
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 08:21:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4FAF9240007;
 Mon, 13 Mar 2023 08:21:32 +0000 (UTC)
Date: Mon, 13 Mar 2023 09:21:31 +0100
To: Michael Walle <michael@walle.cc>
Message-ID: <20230313092131.04406301@windsurf>
In-Reply-To: <20230313081549.493823-2-michael@walle.cc>
References: <20230313081549.493823-1-michael@walle.cc>
 <20230313081549.493823-2-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678695693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XCj7j6L+UAN27Sqs1fqi13CN3HkvVrBKHeA8nHFP2s=;
 b=R7mLxNJvBPJfhBFw6y0GN6pgvAV7SdAiZp8sJE2ElPn0THBQ+IMZ4CatuN8yaLirKjVzkf
 q28ysMIBz0ZkX7JNlibfAVmeiAnQjW/vs0Ln5Xmj53GpqwljceTYhy2kJR6muK8kFru+m5
 S/MaF2G80lAdYNgTojn9RalO8pM07+jXrWt4DDr0JZK2Jp8D9XGd3eoJhlM0c+fiUqPJCe
 4r9vnpCm1I+9V1eZEI2hMRPpieN7BeUaVQOfPavVLllFsh0WV+nVRqVNdnOS/3jvCDOKAy
 q7C5DPQcdSuGgMd1VXlJDoJKJAk0sfYgWx+332hiMQMG3KvDQaZ/36bI92fCCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R7mLxNJv
Subject: Re: [Buildroot] [PATCH RESEND 1/2] package/urandom-scripts: move to
 new package busybox-initscripts
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Mar 2023 09:15:48 +0100
Michael Walle <michael@walle.cc> wrote:

> +config BR2_PACKAGE_URANDOM_SCRIPTS
> +	bool "urandom-initscripts package was renamed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_BUILDROOT_INITSCRIPTS
> +	select BR2_PACKAGE_BUILDROOT_INITSCRIPTS_URANDOM

This is basically causing to cause the legacy warning to trigger for
virtually all configurations, as this package is enabled in basically
all non-systemd configurations.

It's a bit annoying :-/

One option would be to not have the "select BR2_LEGACY", which would
work OK because of the 2 selects that enable the new package. But
it would also mean that people will keep BR2_PACKAGE_URANDOM_SCRIPTS=y
in their .config forever.

I don't really have a good solution/idea here, just pointing out this
inconvenience.

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
