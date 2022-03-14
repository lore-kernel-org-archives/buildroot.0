Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7AAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 20:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D553A60F05;
	Mon, 14 Mar 2022 20:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVcYoqtnVbrF; Mon, 14 Mar 2022 20:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF49660EEA;
	Mon, 14 Mar 2022 20:28:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF5121BF30F
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE78080B6B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9RpgwFgrlBk for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 20:28:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55F34813DC
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647289706;
 bh=soc4KRpDWswrIhHHNYJkIQ5sx0fxgohgWXnkng3j2J0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ERxcccnqbcphSM+v7C74IcfBzntt9eQfjv4TBOtgMTPxNF21im6VAZA4O6t7r8ZNO
 Qlz9KeJkEmswnzHv0E052zJLpbWsGY9PxWxFF3qVK45JbnNRMKtPWrr9sQBRdK9TIM
 aICV6WCvYOq3fJ4d11F/zGOKICLWm88dTQVNVDEw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.196]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mq2j2-1nxxFr3t7y-00nBW8; Mon, 14
 Mar 2022 21:28:26 +0100
Date: Mon, 14 Mar 2022 21:28:25 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220314212825.72645f04@gmx.net>
In-Reply-To: <20220314184353.2639955-1-bernd.kuhls@t-online.de>
References: <20220314184353.2639955-1-bernd.kuhls@t-online.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ct4QWxAcYhzvctfX0ZZl9MjBOBBr5A+XQKOA5ANIIskIWuScpUV
 rKW7HkvVbOW9okYjzXSInxNfh6OHEWsVqsYHzCTLRj0cTM5tIRsR+uGHD6jw0CknL76fd0D
 YH/+cJ1zi3T3XESnSY9cShcRacs3E8UOYWrAen2dh4NJyonntPmH5yueuywYrR+zbnI//1g
 P8G2Vk3VNKJgTSRhxusGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0sBAUz94fms=:kRSDwE0lomTco24wly/yuy
 4EjH2yY9pAvE5DO8rphviaCNSDDori6cIy5JjHWylZrLg52wjYF1zfqj78G+zhg87VUbfbJAM
 DqK5DjhIy+5DndJhNn5x71JbpvvkpPgVrL24CGlYeteZFu3JNMpqGt99mVVDOWMR8Xk43DUbR
 yzf9CfM5LSG8ZcxkfajDNX4G7brRUmdVsPmRF4MC5xtjIeqTl0D/+yU/s6fFO2CCG2otErDwJ
 qrKWfIv2obCZtO2AMNYzZI/qKNYSs/e9zKKv+CZhp+M9Epn9cc0C5mDvAFMt57uGWl6NCnJxy
 Lt9Iyo6nBgZkV5wRIRaR2wgbccWUF3678labrRkstlN8POjZ8WHhHs9RW0eUkFpHVCZD4/uoV
 8k36ptSiOUiQli1Rnc26G9IeekXJVdQNU89ZBDPo962P0R1xYq0smhZsuSRdIG2PBlgJyLQ74
 qyyHjs414AYa5cvVfzRTBclPKSZhLQyQ76r1Av+P/cXn8v8mXSqWEYZJ8k2Ew9KUsdBiN5G9i
 dxy+9NzBpUA5mJfO2FFC4eHelX+vdOAGzPQu2lwEMQwno0G/dlK3MfFhbIyV7q+z9k6EFZCWi
 f3hDAzG+Z9tDwziJT2qNFGMe+c+TVzzsVTsfsv1gscHEl+n89T/JZEBNwMzXBDXkhS5bKvHXl
 yGvUXtWL4CTSKs9VS++xP9wvCl2gaoq5yN2/JNsQ5oIBw8PMT7cO5Wyx+QF/iA+RJy2uhilb/
 B4Q2wXv6wduUH/JaID5+jLEjOQqTWbx/MD60ylz7pIwL7zISCrypBNPLWB5Uc1NciABztIDWN
 44A58s9UIlqgwkmqbIJJkEOhEztuBQJ6UehYnwXEF/0Aq4l+q9nRlLvUVH+YSyc/wcS2UWI8L
 I/JiDNMoTXVeC8yo8x1BN7QKAYIyJK6YFFZFnviI3qhYdkJqI5nTvDxLgURm2vvjghroaqY3i
 /kSuYN0ljnllYyi3wHheaPzpxj0jbR2APEp1B9ItrQyf1F2Ce+5WfCKVR/SufGa673rzOn11S
 FOPn01iEdQFzKB4WkDLJ6xW/xLx775EYiJMq/JzFWafXPkQxcGDeebU2e+zvf6QtMe832fAU1
 +F//PmyV+rUvrk=
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.53
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Mon, 14 Mar 2022 19:43:53 +0100, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.53
> 
> Fixes CVE-2022-22719, CVE-2022-22720, CVE-2022-22721 & CVE-2022-23943.

From the Changelog:

  *) Support pcre2 (10.x) library in place of the now end-of-life pcre (8.x)
     for regular expression evaluation. This depends on locating pcre2-config.
     [William Rowe, Petr Pisar <ppisar redhat.com>, Rainer Jung]

Time to switch from pcre dependency to pcre2?

Regards,
Peter


> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index 014d920772..11dcdefe46 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.apache.org/httpd/httpd-2.4.52.tar.bz2.{sha256,sha512}
> -sha256  0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9  httpd-2.4.52.tar.bz2
> -sha512  97c021c576022a9d32f4a390f62e07b5f550973aef2f299fd52defce1a9fa5d27bd4a676e7bf214373ba46063d34aecce42de62fdd93678a4e925cfcbb2afdf6  httpd-2.4.52.tar.bz2
> +# From https://downloads.apache.org/httpd/httpd-2.4.53.tar.bz2.{sha256,sha512}
> +sha256  d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63  httpd-2.4.53.tar.bz2
> +sha512  07ef59594251a30a864cc9cc9a58ab788c2d006cef85b728f29533243927c63cb063e0867f2a306f37324c3adb9cf7dcb2402f3516b05c2c6f32469d475dd756  httpd-2.4.53.tar.bz2
>  # Locally computed
>  sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index b280d4dc3a..d3857d00ad 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -APACHE_VERSION = 2.4.52
> +APACHE_VERSION = 2.4.53
>  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>  APACHE_SITE = https://downloads.apache.org/httpd
>  APACHE_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
