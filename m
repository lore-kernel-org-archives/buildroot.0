Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63829C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA2F3408D5;
	Mon, 27 Dec 2021 10:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Myyt8v1vm-Qk; Mon, 27 Dec 2021 10:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0114D4055D;
	Mon, 27 Dec 2021 10:45:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 507D21BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ACBB4055D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68hVVK_9JbEc for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:45:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D6C04040B
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:45:03 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id q4so13453978qvh.9
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 02:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:references:subject:mime-version
 :content-transfer-encoding;
 bh=QCRaXOVyJwWD5XgZF+CCvn4JAQNLxUrbgdlarkT8G/Q=;
 b=di/2BvQFrofK0XdXGBl5g/cWoHBiBHeffjjc1xJHAhqc0aL4pRzbdPOQRJz7u/a88p
 T1kaedQJDIooCVjqHhQOx/TE/qasB7L09Xzvx+qQ13mafD+ryXWM3ryNDq19ErtUUPfu
 sW7HPbyrO0Ugy5ym7eeRfvHlJM/qWr0saqhdFucNAa3QLUyl0NFrffG223tZ9cyU5iFk
 UDOrfrxvmmFDeOEgQ+mdB68pdZgZt54IcoTuDNvgFaS3Lfl6nRK8C39KxMMQfH3+Osyu
 OPsuUr68HTG5neavdrLpSY/JSRLFiDk46bcotJTNW7EXmN46CvAMFxQfVLcG2gBE7HQG
 Be6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:references:subject
 :mime-version:content-transfer-encoding;
 bh=QCRaXOVyJwWD5XgZF+CCvn4JAQNLxUrbgdlarkT8G/Q=;
 b=LZ7xHQLnKB1/OT38PwcCis1CXa1hlVYpPHAh/opS8Dt/8dCio0Ca9okDdHLjM+AbhN
 zJZbhv/hxGFrFLuB7GqU6wBR1w98RTYs9tpyyx0LbOHIkDY+2NzrtzUWFKAztJUMxYfn
 MVrtqw91EW0t9E3OuJLIM1PykTlL6uM4ZV0gsdYww4u8tN05jsAEYqmC4aLx8wICpBVs
 wjIpS935q3XZ468MFImVMJNcmyn9B3cH0cA0c83QdkXhaVnbRXqPqPZCfaatJ+LiQMTp
 xuU8MR73yr9oCrvHMjl4PEsmBPUsVLkkHWv4aL4c1AlqpDobLZINshcXhf3EEgk3mWaJ
 nnug==
X-Gm-Message-State: AOAM533fu6yadVbrtav7eAnLb7BPM/ZE3NtwuplG2R1OTxmSF7rm7OVz
 s4vG+8Gq8d+ENgrY7n1Df2T2UHJLV0U=
X-Google-Smtp-Source: ABdhPJz43dyR3g0D/kOWc3DM2K+5gVUMumd/0vg00Q6LgVjx6D5c/c9nH8fZ490zMFgAruP1V2DhHQ==
X-Received: by 2002:a05:6214:2388:: with SMTP id
 fw8mr14589839qvb.122.1640601901947; 
 Mon, 27 Dec 2021 02:45:01 -0800 (PST)
Received: from gmail.com ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id bq43sm12801069qkb.32.2021.12.27.02.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 02:45:01 -0800 (PST)
Date: Mon, 27 Dec 2021 07:45:00 -0300
From: ricardo.martincoski@gmail.com
To: thomas.petazzoni@bootlin.com
Message-ID: <61c9992c2d979_7a709ec608a0@xultri.mail>
References: <20211226233920.53e17619@windsurf>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_61c9992571aec_7a709ec607a9";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Buildroot] [PATCH] utils/checkpackagelib/lib_mk.py: fix check
 for overridden variable
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
Cc: titouan.christophe@railnova.eu, fontaine.fabrice@gmail.com,
 buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_61c9992571aec_7a709ec607a9
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Thomas,

On Sun, Dec 26, 2021 at 07:39 PM, Thomas Petazzoni wrote:

> On Mon, 15 Nov 2021 20:53:36 -0300
> Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> 
>> Currently this .mk snippet results in unexpected behavior from
>> check-package:
>> |VAR_1 = VALUE1
>> |ifeq (condition)
>> |VAR_1 := $(VAR_1), VALUE2
>> |endif
> 
> There is apparently still a problem with this check. Indeed, I just
> committed 1118f2c51c357d968e2d08e31ad3c741f5fa7df8 which adds an
> unconditional:
> 
> +# https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html
> +LTTNG_LIBUST_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DUATOMIC_NO_LINK_ERROR"
> 
> but even though it is outside of any condition, check-package complains:
> 
> package/lttng-libust/lttng-libust.mk:30: conditional override of variable LTTNG_LIBUST_CONF_ENV

20 |# https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html
21 |LTTNG_LIBUST_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DUATOMIC_NO_LINK_ERROR"
22 |
23 |ifeq ($(BR2_PACKAGE_PYTHON),y)
24 |LTTNG_LIBUST_DEPENDENCIES += python
25 |LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
26 |else ifeq ($(BR2_PACKAGE_PYTHON3),y)
27 |LTTNG_LIBUST_DEPENDENCIES += python3
28 |LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
29 |else
30 |LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
31 |LTTNG_LIBUST_CONF_OPTS += --disable-python-agent
32 |endif

Well, it seems that line 30 is indeed overriding line 21 when python is not
enabled.

As check-package is today, except for _DEPENDENCIES, all other variables can
have either:

|ifeq (condition)
|VAR_1 = value
|endif

or:

|ifeq (condition)
|VAR_1 += value
|endif

check-package will only complain when there is an actual override:

|VAR_1 = value
|ifeq (condition)
|VAR_1 = value
|endif

We could, for instance, change it to always expect:

|ifeq (condition)
|VAR_1 += value
|endif

... catching potential overrides.

Regards,
Ricardo
----==_mimepart_61c9992571aec_7a709ec607a9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_61c9992571aec_7a709ec607a9--
