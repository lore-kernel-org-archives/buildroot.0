Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C62CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12AEF60606;
	Mon, 19 Oct 2026 07:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYYrV838fDAH; Mon, 19 Oct 2026 07:47:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 138B960612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792396078;
	b=IwFyimRH6hJVQrVZTLuz4TUg+bf8UaaXJhr3AmUX2rBNHLrs1Zzz8iZbR2oZSBWJDAID
	 GgNDSLGFbUd4yK3J4JVLRmsPox1czQOAWU1egK84IXtvknGmbG9BUbRWQ03flx/abMM/E
	 BT2wnhcAEZ33zWEuYyfaAybDFkUgO6QBqclwqSaOhfYhPLqwSMra5OzeQAzYR3ExTqi4C
	 K86a4ZsfdEQTHNdq4rwAdMOfiop9NPkAlNXOCyCU/q4+oQRCFbo+q2z5j32M5714rc3BC
	 RX8S4//f+xKtYunp+lx2WlWhee+ylW+DqR9tFRgblH9Ubf0O6OzJiPgtLyfHw89WBUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792396078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=f+sRwMbsADKy9XbxyfPq8BPdyrwkb3iGBOmD5GQtE3w=;
	b=OHVPekFZB09be3ujYlLUfX/3YLK0T13Z86IjulQH8LfdqQ+6SU4fXsh9knRnVkw+DnhE
	 mZQs7LOxuj85gLzZR1HGUc0A6D9VYWn9gbWFiFMuF6NaVr6yrrF7LRj06//eav68S5okm
	 spkELm0YhilnHFIdCDcBBWSLzOWINEZaO3T360awbXyQu5ngoBxjshyX0oigqdTNkosaX
	 lWKEWNn3OPpmBh9hiOdGw1N4nE6cMobtS15y9hnPlRVk5g/XR/0y2/KahuMtw9vwv6A0i
	 zmHZxsGqIIopiUT+hgE84c4rBn6ZNn9/xk8kq2dn/y/FM0mk7bpMPRXLQlKWRPF5AYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792396078;
	bh=f+sRwMbsADKy9XbxyfPq8BPdyrwkb3iGBOmD5GQtE3w=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ljZA3RxLlcIK4++JLAIuThYuNTBr+df0glb9shCIxEJC45bRwqNQEehBW1IwnB/O7
	 A0kcbmCNGXKSP23ZpCFhKkjWUM6Cg1rV5i1IE1JPddTqeiRkxCJrBZa/2oRzHSzv72
	 S6qnDqMHpKb1578YxhvIFV1iiURl6Wyms7l97KOB4+DJjH6sxMumTjhz4bYa+rmCRT
	 fAXBf2OcyvVLQqP/sxQ1IYODJwudamr8zn6MBGBcFN1xiG1n2AD4DocglCi4hY5/vl
	 k1o3FOqaCJiPVLWQUV6vZKMiTv5++o7ajNPOPg8kVxWXIN5T+XxHsWjKyGQpWpC3RT
	 piGadpIdca+jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 138B960612;
	Mon, 19 Oct 2026 07:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 988772A8
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A29F406BF
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jnObX9762cS for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:47:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 492D5406B0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792396075;
 b=EM4YEZ8YA0GMEhju2ViwPvPf1Ts39gFflgtNJwLsZD94tEBmKKe7uknvYup20DVr5L65
 ISFx+P+avDshQ9GJ3BEjn9ado7jZvDDRC+caZOzxfmG/4IL9xyAF/fr4h384YICqikFCG
 CuvbjEqnIMfaxazKRAqfc8o3nPdTcwkvMftkAiUc1ZGMPx3/W4wUghokFN+3WUZITPo1M
 oTq0sOxcSA1PjXta9T7W2B0RLNQ/pQ2fhEcTmcXIGddy+03BZZVwW2vN9Ld46tqFVGP+r
 ENeIUscdnf3fOivZFDhZ2Mhz/n4vpzjQhq/3rFtkV2w4ebMwyKrhLMPOxY6BwjGO9AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792396075;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding;
 bh=7cxd5a2tNBy7dVf0VMTwx03dAWZkcuiH4RHjhh91188=;
 b=PH3EVBxZPGtQzWafS30DGY1j98+sUw2HjynGcocShd3wVNkYVCCf53bUgrmYWE2TeQT6
 x52WL8oLJ98PPZOgCS/MzGBlNUVPmAlxJRUMZGph8KFNRbANC4vNy0l5ueeCV7zzzybNA
 Ae0W8ZJGHOHmqPkdj/k+eO9U3JgdOq2KsitIVzK6CFbT++m7PMz11O35rzI8U89CTlm/K
 d/F2dmx4PQOz9rBP5Su/414XCdkp38sIebQNPWnBVwn++lsitP66uEYpzHfIVMVsrhXrV
 0ot0zHZpU0L+VOOv+tskqjesWzAPkarNkdr6dmQGoAHtrAMOP28EnMM+reww8il8w7w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GvSGxSKY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GvSGxSKY
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 492D5406B0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:47:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso15365955e9.3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792396072; x=1793000872; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7cxd5a2tNBy7dVf0VMTwx03dAWZkcuiH4RHjhh91188=;
 b=GvSGxSKY02+UD3GciRPG5lKR/kDsKgvbfQI2e+F0um0XxYYEiSlwURmAUUSqJvgpLj
 e9CFqoDvsQR5/T83lxKLwAINz0Us2o3zm/4dfzfsZ2yVFeMdt85fpOFO7o4gLhZOK4ti
 KwbpkL6LN14PTxswmgkLZLpq3eXkqwSM/z7XJUq1/xHHpo9H6Z12WZB59egM9QCvLS/r
 waCeRy5XhmAPs5293kPpuBoqp3/063EyY+DiquhIRkdM6BTCRL4LuYeBLp3rhAEblfx/
 dJQezn1gQDk5mFYaivJ8rtctMcQUip5sGblUwj2Yp7ibezGkDtX6i4L3jCDgUZ8qN0vo
 GiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792396072; x=1793000872;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7cxd5a2tNBy7dVf0VMTwx03dAWZkcuiH4RHjhh91188=;
 b=GPfZusmZA7WNY1aK9+YHzT6BLmjC6ugfL8UtUg0u89uCIlsXGnwuMrm2VBPryee3LT
 lWxq7Mu3jZ+ALpz1AFNgU1WcS5MELZj7byf/NBS21B7tElBK0M/WbzITN3sD44Timu0t
 IZHF4jhz6i0iZtGlC8aU6zeEhLl9V8eL9gklp7kD68CgWJkwdRIQymLl9eLUEr56tska
 fsYmc4SjChgrRvUPa8I14HJpZSXkZdYtCbNNqM8andigyF8yixVYlkf+dBRnRujWTSRC
 j5h6OD5NRUAHqRMBRv5n37bsLfQq8iE3X3Uk06a27Tyme7inSTr/KLHwRxjJfZmE1uSh
 0K5g==
X-Gm-Message-State: AFq9FYKDRWDa75BvzPsIgvkTkvu+iTn5KwzWgegAH08IU1Evq2OpIQ8O
 71FisvygbzvJ3ojG1W2TWXQzsYCxxuwQy8tXvh2BHvhIyO5ZrTP+HSaXMChiZutY
X-Gm-Gg: AYBFou0Rqz6WjC4kt+stDEvU5J9Eh9Ht/CO4tOhikwB6xk2TjWLejrp8C7l+z6hpqGf
 JOUOPOiFuTbOq0q3jNIuOmo+9pDxYDd+2srBZtBD6ntdlo9c4dJKGVpIkCVV8GF0FKZm3jfRciu
 lDrczodXDRunrfDgR0BO0Ex3Vo+ekKD+KS+zKtqs1OkAGowOGDAW5frFU7ihMgPj2O3ODOREErr
 M4pBVwksaT5khDwY5xJp7zJx/G+4ihLTCjvZZlQCJRBeCcgikXC3NO3MnFaKzjxz6IKLbtv4nmP
 NZirWUTths2r7wi7/ewnL1uWt64JYIHQbQXU92yloqTL/5y+FrokwAwf/fstZUbqDEU1vjqQ9sj
 X7seQ9/uvigbtArfTaPiP3i+XLVM+c7Lg+orLDHh4RLYL9HCj3K7djRWiTY5T4CZYnKvwkCnRkv
 zBr2CMruNtqk+qn2JRrubdlgwsxM8aCufvcNE/LHQe3WBhrPfVjEmy8b+RNN0/ymTIWe9TnNX9l
 tQ+TQz80Qno/+CbhDgi4G+yUFDpm6kHKBjGrkV3/B/TsOiXWIx4Psf32Ou/O7KL4HeuyJwPg/TG
 4jMRhJ9iMDCJ
X-Received: by 2002:a05:600c:a085:b0:49f:c1a1:5222 with SMTP id
 5b1f17b1804b1-4a1d762ba65mr136220735e9.33.1792396071694; 
 Mon, 19 Oct 2026 00:47:51 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1dda881f0sm149699915e9.15.2026.10.19.00.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 00:47:51 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:47:50 +0200
From: =?iso-8859-1?B?TOlv?= Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vladimir Oltean <olteanv@gmail.com>,
 Vincent Jardin <vjardin@free.fr>
Message-ID: <cover.1792395346.git.ldenieul@iliad-free.fr>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v7 0/3] board/lx2160ardb: new platform
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series adds support for the NXP LX2160A-RDB board. It is a
repost of Maxime Leroy's v5 [1].

Changes v6 -> v7:
  - resend with correct authorship (v6 was sent with wrong sender
    addresses). No code change.

Changes v5 -> v6:
  - patches 1/3 and 2/3: unchanged
  - patch 3/3: increase BR2_TARGET_ROOTFS_EXT2_SIZE from 130M to
    256M, the rootfs no longer fits in 130M on current master (it
    needs about 148M: Linux ~100M, eudev/hwdb ~25M)

[1] https://patchwork.buildroot.org/project/buildroot/list/?series=3D366

Best regards,
L=E9o

Maxime Leroy (2):
  package/qoriq-restool: add runtime dependencies
  package/qoriq-restool: bump to lf-6.12.34-2.1.0

Vladimir Oltean (1):
  board/lx2160ardb: new platform

 board/freescale/common/env-dpaa2.txt          |   7 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 +++++++++
 board/freescale/lx2160ardb/readme.txt         | 129 ++++++++++++++++++
 board/freescale/lx2160ardb/uboot-env.txt      |  11 ++
 board/freescale/lx2160ardb/uboot.config       |   2 +
 configs/lx2160ardb_defconfig                  |  59 ++++++++
 package/qoriq-restool/Config.in               |   9 ++
 package/qoriq-restool/qoriq-restool.hash      |   2 +-
 package/qoriq-restool/qoriq-restool.mk        |   2 +-
 17 files changed, 384 insertions(+), 2 deletions(-)
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/=
74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware=
/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-=
headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.=
rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 board/freescale/lx2160ardb/uboot.config
 create mode 100644 configs/lx2160ardb_defconfig

-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
