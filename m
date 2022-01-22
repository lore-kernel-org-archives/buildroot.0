Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9330C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 15:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F0AF60ABB;
	Sat, 22 Jan 2022 15:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S44HDLYpoaYY; Sat, 22 Jan 2022 15:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E1560A8B;
	Sat, 22 Jan 2022 15:31:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0970B1BF391
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 15:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8EF34040B
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 15:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfiinyfE4mrd for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 15:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F8E240882
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 15:31:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id br17so40177510lfb.6
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 07:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q9wradGYGMbKYd+SR3cj4kjOxbv27gr0Zx9uI01QbTk=;
 b=hQT7kGh4BMxysSWYqAZLXbuZGezNuz+tYVJZVtZF07QoQaT5p056POoU1GOP+CwN83
 AtQmn2xhhOtiBqsbidOwjNiwhuy6la585NFTkwPlyxzjfN2H7bjqwMEIq0UBpq+2cvbt
 36QR7FYfewxHCk7oaXuC+Q0Kcw+tkxY+2NTXOr6z1p3S5eU2KC5IGjy8GXJYLA3775N9
 qPO8IlXdS/lbC7oJfLiQb0l4bc92+9ZD+U3edFnw/8Hta38D8hXeRGX1dkXGS1GVjgF3
 m8J2jH8vBg+Xjcc7/jXc6dB0fxaMS5OhtRpnnSAV9j533eG/XyqncgPjdPm+L/sjBcqQ
 5Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q9wradGYGMbKYd+SR3cj4kjOxbv27gr0Zx9uI01QbTk=;
 b=j1IKP1Ci6PIyc2V9O0Rc62ocOYcAApUTFl1ioqBN92DQ3teaY8QIfPTsNivnFdNdy7
 0oGo6+N5wGSPGJy8+4UHULgl8hJbfzuv9KZWWV6EHEjYTaAINQ54Wkh1iomO1WPmjbjC
 yFAiqEfLKw8gYln8r8mzMRRQpe4PGnVyVcUl9xlGW6oxu9SFo3q0B/ad7v4tKMtP92B/
 yLlCgFj6W/zl6HjE3McCoaXfhaaTQB5DhV7L6YnSMs7ZItzFXHln90Pq1EvpD2iMbecS
 bhBzxul1jeVtvMRjXVX1uawCtBnFgqkE8HMfqwNE4cmyDWxOcm4/jb0v1WK7S5CgwLUm
 0AZw==
X-Gm-Message-State: AOAM530jMbHLMJy3lMiBtGZ/gigb7Iaas+/Mdc0HO8Q79xwV22cBFXkv
 YOFa4diUO40RwmnuETBmTzYhG0ywJThfGEG9ofs=
X-Google-Smtp-Source: ABdhPJwN+k5JsprnLNVNgQrXy/nsDVy1fBBvRQDYL5CiE1FHvSjYk8f/ArHVGbf8SSt3Y38H7Jw13SjtPIMcfMEGaOE=
X-Received: by 2002:a19:f00f:: with SMTP id p15mr6951829lfc.196.1642865510479; 
 Sat, 22 Jan 2022 07:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120135251.4225-1-heiko.thiery@gmail.com>
 <20220122131500.10cafe0a@windsurf>
In-Reply-To: <20220122131500.10cafe0a@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 22 Jan 2022 16:31:38 +0100
Message-ID: <CAEyMn7aR8e0cfKbxv=QQcnmLz8R8=s8c1iUAfGBypotRxCE4fw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig:
 remove BR2_ARM_FPU_VFPV3
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Sa., 22. Jan. 2022 um 13:15 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Thu, 20 Jan 2022 14:52:52 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > The FP setting is not used for aarch64 in buildroot. The FPU options are
> > set implicit.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  configs/kontron_pitx_imx8m_defconfig | 1 -
> >  1 file changed, 1 deletion(-)
>
> Applied to master, thanks. That being said the FPU handling on AArch64
> is not very clear to me. I'm not sure we're handling it correctly in
> Buildroot today.

I must admit that I have not fully understood the topic FPU either.
What I am sure of is that the kconfig selection of the "Floating point
stategy" option for aarch64 has no effect, since this setting is made
implicitly depending on the target architecture used.


Therefore, a patch could look something like this to fix this:

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4c0910e4f8..05acaa9157 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -618,6 +618,7 @@ endchoice

 choice
        prompt "Floating point strategy"
+      depends on BR2_arm || BR2_armeb
        default BR2_ARM_FPU_FP_ARMV8 if BR2_ARM_CPU_HAS_FP_ARMV8
        default BR2_ARM_FPU_FPV5D16 if BR2_ARM_CPU_HAS_FPV5
        default BR2_ARM_FPU_FPV4D16 if BR2_ARM_CPU_HAS_FPV4


-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
