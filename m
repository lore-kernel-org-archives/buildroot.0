Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD03CDB474
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 07:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8003D80C34;
	Sat, 14 Oct 2023 07:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8003D80C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_1IipxTNd8Q; Sat, 14 Oct 2023 07:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F5E80C44;
	Sat, 14 Oct 2023 07:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F5E80C44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7D231BF2F4
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 07:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F9F80BF2
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 07:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F9F80BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7f0vVqQ5a25 for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 07:39:45 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4EA68084B
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 07:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4EA68084B
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-503397ee920so3379272e87.1
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 00:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697269182; x=1697873982;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a/XmV7wVkCKBm7/NjcZprua6eWC68A651N6ZyCTUOVI=;
 b=nhaxXQIBmXUacFINsB+Zw1JU6KVtp3G3eZJalw2V36+VZgHeeSaN5D54imAdrBPs1+
 XgcA32m9ia02riNFtadj/f2mc2tuzf+QfeXKJRv5FAacpn9DW7ifE4+vXBiaoaBcU0u9
 it9OX1e+L0pAnXS3IZCMb3gtSzNEKP81ViCwhKl2vfg78GpvRRo/NadAIP49GuCZK8JT
 GMvqmdKMfa0AXRr19/CSVbswjclcOf2iscArWHMG3hMCduf8WYVB01oUmpfqT7Pa5uz/
 7eYw+vNCWpmjYf0aUqprRYbOFqC2520D8MWsY5iGA+p1HNQv+LY6A9IVYkcAuhx1UTip
 uOCg==
X-Gm-Message-State: AOJu0YwTP7R2Jms707rvsus8xWQXGuicNNeirrUPeaqhlGm1NMaSNOMt
 ES4r7n6TY2+LN4hwmFZaOZzORxJa2kTwra2gvTCQhwKnFi0=
X-Google-Smtp-Source: AGHT+IGKD3ikRckfRrYBHvrO5VK+Ti2fHed/S2trPVAT8nU1gVeG2S1+hzF4dSMcHmbwJUkYyyZwLV9xSI5m0twi/LE=
X-Received: by 2002:a05:6512:202f:b0:503:1746:6882 with SMTP id
 s15-20020a056512202f00b0050317466882mr18900995lfs.37.1697269182288; Sat, 14
 Oct 2023 00:39:42 -0700 (PDT)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Sat, 14 Oct 2023 10:39:31 +0300
Message-ID: <CABRndgwVqN5LH+j0EHVn9Quy4aHxXBhiYhVMh3Fgiz5etaPbsA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697269182; x=1697873982; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=a/XmV7wVkCKBm7/NjcZprua6eWC68A651N6ZyCTUOVI=;
 b=jc0MbWQyxXLF4FM77JqGH0A8liDatpnrp/RFiGCdz9FHECPcGU29BgJ6h+4+UuS3kx
 BBRKXebdsV3Y5HkLP8pzzraGbVkmjATtzey4TNoylqTi7v0dwVaaX1B0WUIqC1CsNoh4
 ST0/2euJ/8FM+41+8t2hSupHQbdlqGiiBpLddTJi9/DmmVs6m2yeowxdG8x3u3j0TdOm
 Gnq0pBjqCi5hMmrWv1K+K2xQJAr9AI1rAw+SsosbnuOGgUd57PHFn3oJ6fivsbljDjNe
 8TWXij50XIvM5t0WCkCESKoZbA06EbqI6186p9WLBl71WRNBWAnZm8j0EdpkJBqU9txd
 NHFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jc0MbWQy
Subject: [Buildroot] buildroot 2021.0.1: couldn't find RGB GLX visual or
 fbconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

In my .config I enabled few MESA3D components in order to use OpenGL
Upon running glxinfo I got:
couldn't find RGB GLX visual or fbconfig

In my .config file I found the following section:

#
# linux-fusion needs a Linux kernel to be built
#
BR2_PACKAGE_MESA3D=y
# BR2_PACKAGE_MESA3D_LLVM is not set
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
BR2_PACKAGE_MESA3D_DRI_DRIVER=y
BR2_PACKAGE_MESA3D_DRIVER=y
BR2_PACKAGE_MESA3D_NEEDS_X11=y

Does it mean that I have to modify my kernel configuration for "linux-fusion" ?
Kernel version: vanilla 4.19.135 (x64)

Thank you,
Zvika
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
