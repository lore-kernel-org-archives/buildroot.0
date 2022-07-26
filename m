Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C581BC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CA614119D;
	Tue, 26 Jul 2022 16:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CA614119D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XsRgA6KiiBxz; Tue, 26 Jul 2022 16:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C7DC40612;
	Tue, 26 Jul 2022 16:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C7DC40612
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EEF21BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61EF610C4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61EF610C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTr4-qUV6O1v for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B20160EB4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B20160EB4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:43:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00A7220005;
 Tue, 26 Jul 2022 16:43:12 +0000 (UTC)
Date: Tue, 26 Jul 2022 18:43:10 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726184310.20b2d25f@windsurf>
In-Reply-To: <20220725145836.11664-1-fontaine.fabrice@gmail.com>
References: <20220725145836.11664-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEtocNbRjPKSO67BDHmljE3BYzKZkjRG39eZ22ofikA=;
 b=KmWy+yF2XTjVn5LUi87IX/zpP+St+9ey9F+kT8e9PInHDTqFFSHDSVHtBjf0tbDjO1wEXv
 uwiP5+iDOrGGlpzik9A+4yvcjUfGHlcpa/s+UWLkmpjbj66LIqOHoHZ0Gz29v+rDPRYOsk
 MqE2emwX4S0gFVJQQswsHZgMVG9jL21mJj8PPuZu+v6ZaT8dtw6xvJbUf5dK73Kpoo6dKQ
 0EAZiQJJIacozeEo89P6stgKVrMMEtfC7iowV2K/7hhUFH62OxdEQCfZtjmgSSv9PcfHmY
 Z+8vMHx9Ymok5EAFp6abT3jtgHRTBzatG481GeBjBPeqNGbP6geKNL05gp8YSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KmWy+yF2
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: fix build with libressl
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

On Mon, 25 Jul 2022 16:58:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with libressl:
> 
> eap-tls.c: In function 'ssl_msg_callback':
> eap-tls.c:1284:10: error: 'SSL3_RT_HEADER' undeclared (first use in this function); did you mean 'SSL3_RT_ALERT'?
>  1284 |     case SSL3_RT_HEADER:
>       |          ^~~~~~~~~~~~~~
>       |          SSL3_RT_ALERT
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7d721833bddf73531fa03b0a626511af6826d0df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pd-eap-tls.c-fix-build-with-libressl.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch

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
