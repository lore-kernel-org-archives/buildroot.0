Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096E1C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89FA140AAA;
	Mon, 15 Aug 2022 09:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89FA140AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQmQp2oubSuZ; Mon, 15 Aug 2022 09:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0708408D0;
	Mon, 15 Aug 2022 09:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0708408D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C841A1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0E9B60AF7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E9B60AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ92woL0CaQU for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:50:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B43946068D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B43946068D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:50:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED3A9240003;
 Mon, 15 Aug 2022 09:50:39 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:50:38 +0200
To: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Message-ID: <20220815115038.30dbcfa2@windsurf>
In-Reply-To: <OnXRv428u0aogON15S-eaYq1e-8O0pEK8Ul7AshrDFTo6BbyTTGBdXgiYGzOMtmsIf0eluZocPSIya_d2i2LimqdcrK5eEGaQ5SdOwIppSg=@protonmail.com>
References: <OnXRv428u0aogON15S-eaYq1e-8O0pEK8Ul7AshrDFTo6BbyTTGBdXgiYGzOMtmsIf0eluZocPSIya_d2i2LimqdcrK5eEGaQ5SdOwIppSg=@protonmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660557040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IBgYvyROsTxeuhpRN118VXeMC26IdlRERGr8UVXaYc=;
 b=A1tLeeU6uE097VMnnlEgVOjr3+xwMqd126XGjTg1DwP8tCszwqFTs/vzsyF+sSt8mfOPWF
 sOPOvhE7ZWlzWwlTwzJ/Fv3aQYH98K1tKfq3ZdzM6RVBfnhxml9eTo7vA25UUVjR6Cqzm8
 3Q46UT7YANt8pWcn4xkPmApPsUtpO67pueAY/wIifE1tW2iR0r3v7/GDdeONhbTCabRz3F
 SeEjsxh3CF0FURivDNqDcvgMHq92mMSC4xfhSrvrmfHXdLlPnmKHkQPKxiVsCmWNj1vApW
 Xd5Qs5K66MQCZ/7r+BuODkalSwPJXlUESefaWxuZ5bNYSXvRb3Cbw7WLEJvFHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A1tLeeU6
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: bump version to 3.2.5
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Aug 2022 04:06:02 +0000
Yair Ben-Avraham via buildroot <buildroot@buildroot.org> wrote:

> Fix https://nvd.nist.gov/vuln/detail/CVE-2022-29154
> 
> Remove 0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch, applied to master:
> https://github.com/WayneD/rsync/commit/c3f7414c450faaf6a8281cc4a4403529aeb7d859
> 
> remove 0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch, applied to naster:
> https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  ...n-the-certificate-when-using-openssl.patch | 29 -------------------
>  ...g-with-a-zlib-with-external-read_buf.patch | 27 -----------------
>  package/rsync/rsync.hash                      |  6 ++--
>  package/rsync/rsync.mk                        |  2 +-
>  4 files changed, 4 insertions(+), 60 deletions(-)
>  delete mode 100644 package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
>  delete mode 100644 package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
