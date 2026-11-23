Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ACE606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fp8xMwAd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPG00xXf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9540A40728;
	Mon, 23 Nov 2026 20:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lauEyPYtRRiW; Mon, 23 Nov 2026 20:58:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DB7EC40729
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467518;
	b=Cfr0oPNwJPTrWsFSDWMoKcFy2sfvL+jhGCsDXz3OA3wAK6Wc7zFli5rpfRXIBWhQkN29
	 xwr+rt7w1ymaWo9f8e7FjcqUognOwaTqnTEx/gPr9CZH1p+MvRg3Jfwc85B2b2Slu4dsv
	 Yf6YX9ghrHQ0/MjHb7iv6+zehSYkn+fM8Q9uC1D53d8ZWcIszfXSUSPtsFGo9NRDlG2tL
	 mtYCHINm1GXa3ACu0NpYuR5HLlv9N2sR0E+7NhH3MW5ZwaIvu933d02sDv/VpJ0mp/LBt
	 xQcTscnFBGoPsjm3IHVQ5ECA/XgrniG5yMOJ3JoOvu6WuCiGh6cN19ifZNmENc6OQiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467518;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KcKcbngFq14KVCtQRqOYKVmi3tUS7wXRb/Cea3uaU8I=;
	b=VitBN1RibminzvH8L4Gh83MplhJTpQ09ghXu052RoZQfSEy4ZROUJ/kjswI1CcOa6fb/
	 kE94GVRF8jSXjxwgiGz5VBEJUnYhVQDxkpsOwo1I/EfA4htstBV7COIabUxekxebhgfex
	 1HaW56O90YxA2VD9mnK5XEhu6fwSjT381yngl5OQ10UFqoTyk+KaUvwo6dhzhbAN0sQRV
	 NGvUWUX35wezfbp/Dt1NdRFWl2WMWuwgEaEq6TokN4cL0z+MEybkKwUvlITInj8lSiVr2
	 wqD7w6ur/lIbL3V2s8YoYUJPa/CVeMs6LPIjlmokUY//6lP+Y6oTrcC1L768N6uWUoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467517;
	bh=KcKcbngFq14KVCtQRqOYKVmi3tUS7wXRb/Cea3uaU8I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fp8xMwAdky48j4pmH1NAGQH1578c9plBNKv1AFrSmMaQmdcPjO9UWd64+bptBYJFT
	 UMqxrGVEgu6SlhxcoKboHDmLNdQATFtIS7F3P0vADQ1GajX6Mtve+eA5tenNpj49lw
	 l9wrAFYxrkfnL/wF/OC2Rn1/JsgIrtgaVfuG+LkKlFg98bxQVzuO7af7upqbsS3HoV
	 hfy/OUBBSgFh4ziJ+vTjmJyyqZ4x0EEPiD8bAHbCgmUBr+lsOgj6F2iy8BCJNdJWhm
	 LEdbMQ7I98ZQVR46cYP2pq0OA6gmJgnnof/GP7ZDYIm4+pbeKxUAs+t1tM9xaI6b4n
	 goA6LjWzYagag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB7EC40729;
	Mon, 23 Nov 2026 20:58:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA9D22B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52C316067E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTuRu9PDFysW for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:58:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 56707605F7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=OPG00xXf
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56707605F7
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:58:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so40073425e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795467513; x=1796072313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I4TVtQqCRrd+ig8WKPWlVdDLY4++Isvbp0X7x6pc7Og=;
 b=OPG00xXf9emPc+tLxMlJgB61R3C4taljLwlbgwoZidv8yRQhgTWihZVOTjkPg6c5vC
 hQaL7WdAnU9fbmrEBk7jZiWPaw6PGvWzHYY1YRCSwIzv/mlZMYEAyZL6x1wxRyey+aO6
 Gpbb9Z/J2A9BW9Ed+hFfpI9UwYZnh8SYVU71yx1aNat353rErGHxPtuifYLoJoq0j7al
 gjG6eTTIJXmpt7AiRREEfviQJ5PhSOiT2Cqm/AzPncrwPlA9x4fX/IUvdf2VMewgqp7v
 IQmbAbo/bz+FdOht6xBjkCuDSr1lDc7Ooo2rEEk2vbOezVgLstParTquuWnDOJXp2e0G
 ApVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795467513; x=1796072313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=I4TVtQqCRrd+ig8WKPWlVdDLY4++Isvbp0X7x6pc7Og=;
 b=mRDPvXK42whUf8TpULZd/JX3vUjfj3W4V53gSj2fkcMBHqcVSgoDsd1/oF3jCB1xEp
 l3JMRzhTdyIViCO/kxaJ7W/bSYvKvE/hjyrRZABNn2dGmn0Imyi8Jcz3cTThtYZT+2RN
 iJY2gyyqpOJdFUCvtsuoiKbZBZRZFnGRsGArme17pF9e0hETXgnTw7u4IdeRl2D7P2S/
 elktnCpg6YlqMfu/lSWA5MriKM6OI2MNQupC/EoPoq2pEF75N9b4gNIsvN7uEJ2bjiKq
 7PHlIkwSAs6I8oEVFXG49LfXKE+gVN1iE2g9HJDi0wlS431Es4+Qlq48rO5GFWKX6nxI
 80vg==
X-Gm-Message-State: APuU4Z8Fn7dkmQ6Jo6+L7FOfeIcHN6j/4PWkLNHCw2ZwTTRgtrrDnfw5
 /dzJ8pl1tVte4aJEmUmPhmb5d8+QOY2D2MabGmUIw5Kl149TSlVkazgwcjBfEkrx
X-Gm-Gg: AZFdTZeBAwb+9i49r+9/s3Xx7FDHpn5nhn+BtR84+hKHOGO7giGyt4LfltnpHZ0+2bS
 oA4/m9nIC2iQSTWFNTcw1B0aUafD5s80HYMp2XWaTITNlrbv4jAgm1FFMsmq7bVf/gs5T71sAR6
 Op5XrIi3ga7gc5MsZ1HJOdj4J9eoVtt+h8NzgGRcrvQrDqsz7CEiTqV+M1wcoOYwPaygQibC4QA
 scxopFnU87gTD9cqajF2/Z5JQ+2lyJEXj2EbEsq5tsNdbYojWASkExdgOsgBCGITQFe2682xzaU
 g9i+mrn8N0ezFSjUwv2QjMBS466exnZQoXbo8mzlEleuVM+duHM8lJgC732jNqQYip2a9KaH8Dw
 crU9yhb8t2v2Xq/iHF2iK6YqI9jn+yZgr/ZgPTMDNP8YbFECiPLHlokPPRz/CiS5BTFdaRnBphv
 o4xvnUIDzFYGr8RyzCn1EO7o7ytoADyJN99u+u5Atdx3XO1tHdc0lzeUBFxKCz8HfRif8TbVyXN
 5YXrQ4kd3+mHfZTzAQJqr38JjGWycw0qgXsAOc8Kdmy9jK4g83lztnSvWPD2lFveCjQZTqCIpn1
 kq0IFSvRYwpthDhrO4aH4m7+coFVF5odirVAr0L7Hw0oxjhzBl+701CA6UG4cG5jbbabDAQU
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id
 5b1f17b1804b1-4bb888236a3mr265051315e9.24.1795467513173; 
 Mon, 23 Nov 2026 12:58:33 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm329540305e9.1.2026.11.23.12.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 12:58:32 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
 Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>
Date: Mon, 23 Nov 2026 21:58:31 +0100
Message-ID: <20261123205831.3708410-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240722133804.2794134-1-p-bhagat@ti.com>
References: <20240722133804.2794134-1-p-bhagat@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5] boot/ti-k3-boot-firmware: Add config
 option to specify version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paresh,

On 22/07/24 15:38, Paresh Bhagat wrote:
> Introduce a new config option
> BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version
> for ti-k3-boot-firmware using menuconfig.

I think this patch can be dropped:

1. As Bryan wrote, the package is kept current with version bumps:
   11.00.10, 11.00.11 and 11.01.12 since this patch, in b401a61f35
   ("boot/ti-k3-boot-firmware: bump to 11.01.12").
2. The package moved to the GitHub mirror in ebf0131e3e
   ("boot/ti-k3-boot-firmware: switch to github mirror"), so the patch
   no longer applies.
3. With the hash check kept, a custom version fails to download with
   "No hash found": the hash file only lists the default version.
4. As Romain wrote, OVERRIDE_SRCDIR covers the other versions.

Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20240722133804.2794134-1-p-bhagat@ti.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
