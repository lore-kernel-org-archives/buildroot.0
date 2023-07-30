Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B82C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C57C61041;
	Sun, 30 Jul 2023 21:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C57C61041
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMjIdrmSAiRL; Sun, 30 Jul 2023 21:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8D261028;
	Sun, 30 Jul 2023 21:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA8D261028
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3921BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1715040B12
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1715040B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9zC-SMDTkq2 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:38:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D55C404B0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D55C404B0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37AD540002;
 Sun, 30 Jul 2023 21:38:32 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:38:31 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230730233831.1a55da75@windsurf>
In-Reply-To: <20230604172845.2291865-2-bernd.kuhls@t-online.de>
References: <20230604172845.2291865-1-bernd.kuhls@t-online.de>
 <20230604172845.2291865-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690753112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuHfgD4EHMkoJXSKZAGjTf71IO+w+VxdmhxLVfc4DQI=;
 b=UulcbYd6U/CwXupSc/3Y/MhX7sPnt4oIFR94HgTtrb1H0vt9LWr9sr67iRrFJYg9HMECn7
 kG+R+7wUpr4D1YzIcspo+YOfbwbsiVRFPKNmh40/PBX63K/1aMTZ6Uo1Op/B5g/cYUN8EY
 hrz1HUI7f+B4mckwPD5rY9ySyyN0e6UqBrHfukZY3bj8qGRlm5whCyFGJadrdWCYdgUKCP
 FAwDG8Xtbm2wRtORAsAebX6ahTYpILDdAyk4mDPcAg114Ouw3YVVR0UCY9mZpxkUULmO0x
 u4AANZx4J3lhIri4RaIHOWKb1Zpl87ZOlQxf8ZWb7wWP/12SaKawII2d8UjrJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UulcbYd6
Subject: Re: [Buildroot] [PATCH/next 2/2] package/intel-mediasdk: bump
 version to 23.2.2
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Jun 2023 19:28:45 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-mediasdk/intel-mediasdk.hash | 2 +-
>  package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
