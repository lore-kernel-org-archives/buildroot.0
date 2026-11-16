Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D98606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WRTR3pHk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F274A407E6;
	Mon, 16 Nov 2026 15:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xISVOx0WN3Ow; Mon, 16 Nov 2026 15:39:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 02E504075C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843595;
	b=FhH2bSK5biYfyQF+o/6/XXppt1M9gq1AOWvOvXQRyLCNUaYFm62MpWzGGf+Tnjei2KOA
	 YF78X2wJMt9led0H0YkOBbmo+OlCMrj/cYcdlShQgpL1A7hdp3Y0Izy7FyPEwlaqSEG6b
	 ne6IVFT41kfH1gXsSZJmeiSlAJatLecRC1LRWN38cNIQ3PJ32wdg24Rajkc+FtOIkqQB/
	 +j7Q5TCOXNtTZOPHESucTKJfwhQbmkZ1F8xmzEjNMOScU8RRhPFOF88MlniXyzjQZQhwR
	 3bEmdEO9wN91ZcLCq37Y/hbvKy+7PsHQVBZZNl38gQ834Bhh99US3gLfILzhKcv/yJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843595;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YUORHj/EA5DPEKmrZ+XSTxE/y8OO9Nh5d8BwCQd4iBA=;
	b=U8GsXGzx/dKo1qtd/2TD9RXkDB+k3Fp0D8agYI5yDd7V/LaZogx0aJYy0nDao3xFjmU0
	 RoLvZgiA+Lmm6ehNpHh7Q3y8x2fL28tYsSGmRD0FkoxPSzlJpjQNkyBXGbxDdS3dmgxPu
	 hnMpi6ovCSr1dZfOa3c3O1Xsggq8j5nd3hRFzBO9mt8KPukz3lrsk6BkHZrHWMcE/zg8z
	 RlGJcBaao86QsfqCTEKPA8zjY9COLZkTZ/xvlDOnKcyt3HrpA/M+zFb4tIiCPBsjKrBHd
	 sA3q5cmAfrzQmGuJYzvWcqkBt1ul+nWlX/58yAzs+xBKWSnoc/P0m/Qn27gUo7/Fe3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843595;
	bh=YUORHj/EA5DPEKmrZ+XSTxE/y8OO9Nh5d8BwCQd4iBA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WRTR3pHkXquPieZXsU7X866ZCxeyBd+W5ZpDes8Thdo8JbIJZpjNiIeM3nKOazQNk
	 3QHiRz/MvVb6iiQocXV3a2ZfYe8T9Wh9TAIFKH2S1WEMovMAadutxGGFvdaT7u4CAJ
	 GBEbvyr1eVw4jFyz9E+RCJrvpIiaFl9MnPbGvbQNlnmKXJIc3MKqlSNDuLBWV8JcWU
	 zExy6M8Tk6MRr8IdXe4MDDq4+x46NhlKwQHhrOKaYWTnNnKloha5e7dBISKCPAXGKq
	 SjwK2pm3HG2Syz8R2mqzoqmIqwtp/1/HFDC4DPP95a1ZfP6sk25Zd3Ixt/2saHB1E3
	 PSS1ESHw7CtmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E504075C;
	Mon, 16 Nov 2026 15:39:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4934D109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A32860821
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEeqNEm6kwcr for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6831B60803
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6831B60803
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so29875495e9.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843589; x=1795448389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aEXs85uaiEPn8Gi6EPWCkfmTvANUdJfDgWFl8gF2yrc=;
 b=ewWlZyW66RvYJ7p61crcJzPoZcArCa49Pr/cHIHhZqlf2lFG9XbCKrhRc7NcHcyE3z
 uc8kJQ3kI7tlwoH13v3oYH8v04mNmqv67QFjmDEUe82V1q+FIbi9XKPBtQQifh2EDeU9
 v5OuIJ5Epr92RJS9WpEGfte8Oao9acSGA4rstu9hJXZFLInKwrqg2+j2qv68YfNeI9Ps
 hizMlf/VuT3KUWj2vxP2R/U7/PXUIkhe+a15Tp2b1Fun7HK+VJIE9yCLf5Z28L+jCrL9
 t5klJugJMisCcJ60JRmUy6PVOs6WUI1BYtTS9FfAaJ+GNPefmh5ubv78aoF24T4GcG0n
 XtFg==
X-Gm-Message-State: APuU4Z+PwZdAfbrQM6ieeu3wf02W6eqayXyh5ak2coiCU5AS1rml/CKR
 im+8ejQB5zUA5jtJSxR8xvbyZWMwSd/xovsCMW1q7rQTx0y1nlQybjwGjpytZB7+1PYWFzeo6zz
 SFjxkZAM=
X-Gm-Gg: AYBFou2USoYWi7jWSoaU3SrvdFPr2424pv+n7TtYl4LfHt7G86w+V6e2K7CwvKKMaCZ
 LMIhiJ5wkVR+lM3OJBopUCA0OO+Zs6+r8HC7ZskTX5uSUHrlYfToWIBMwzG1SR0JOz+ocbTNhyr
 qY0PxBY4aHb9SVtZ4F7FIRlQusXnyzm+tpQkezAldbUTI4TISdJ6N/l37eauk8eYIFjtkVpOJHW
 NHYweMtA0WzuHac05gTx4xtHltJvlo72D5oAt134Qwewpg7YWLaqgdGKssQiGq83R9LcVuAK4HL
 NsgOLFYSI5aPbwK06OuwVzuJFVPDuz2WKA1qWkW8Fb7PVipO4/fXQhs388g6ZEk+TYoe0Cb98xW
 158nrTv5HgASwY5l9/YBl+uW4lYqS7SFqDzXVPNikDoWdJMxXC9/yOh1oa3cgqeWbvo4fq6CXUN
 ln3DQo5e0+XbL3vGsaPJbBLRJtMN6DN4VM0LyZn4kkgfbaV5TjoHBMUMH112jyO28K5pdK9B6dn
 xblSTD00ZZ35O73xRK9LyGEv2CD8z4APV698EvSSU2d6azKxD/8XA4E8k//aaJyW5xJ4SjPSXpK
 tpA/csPtaAd7vsg7Q+MkHRxIDfXz4w6H971TM4O/Poj3z5fepSxc
X-Received: by 2002:a05:600c:3113:b0:4a1:d537:1c8d with SMTP id
 5b1f17b1804b1-4bb55aabda0mr234006295e9.19.1794843589367; 
 Mon, 16 Nov 2026 07:39:49 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e28d0b2sm319703845e9.7.2026.11.16.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:49 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:46 +0100
Message-ID: <20261116153948.725599-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102205914.70727-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sofia-sip: security bump
 version to 1.13.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://github.com/freeswitch/sofia-sip/compare/v1.13.18...v1.13.19
> 
> Fixes CVE-2026-110658: https://github.com/freeswitch/sofia-sip/pull/347
> 
> Updated Upstream: tag in patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed including a build of freeswitch:
> https://gitlab.com/bkuhls/buildroot/-/commits/73abebfd5d4b5816876dae85c5e17ed479781056
> 
> with the exception of bootlin-aarch64-glibc-old:
> https://gitlab.com/bkuhls/buildroot/-/jobs/17677872559
> 
>   ./.libs/libfreeswitch.so: undefined reference to `getentropy'
> 
> Freeswitch added the usage of getentropy in version 1.11.0:
> https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b
> 
> getentropy was added in glibc 2.25
> https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116
> 
> causing a build error with bootlin-aarch64-glibc-old which is based on
> glibc 2.24. I found no way to disable freeswitch for this toolchain.
> 
>  package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch | 2 +-
>  package/sofia-sip/sofia-sip.hash                              | 2 +-
>  package/sofia-sip/sofia-sip.mk                                | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
> index 4e1b2ad87d..cc1d11f7f6 100644
> --- a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
> +++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
> @@ -3,7 +3,7 @@ From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
>  Date: Fri, 17 Jul 2026 16:41:11 +0200
>  Subject: [PATCH] Fix build error with OpenSSL 4.0
>  
> -Upstream: https://github.com/freeswitch/sofia-sip/pull/337
> +Upstream: https://github.com/freeswitch/sofia-sip/commit/3cc785eeb186d6103ea628d15ec4915f1a59be1b
>  
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
> diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
> index 623b010190..e852c92000 100644
> --- a/package/sofia-sip/sofia-sip.hash
> +++ b/package/sofia-sip/sofia-sip.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  d2ad4e64753a7c9843b766b8de8081d9c1d7acfaeb53c12b3aed7fdb9235766c  sofia-sip-1.13.18.tar.gz
> +sha256  99389b574dfcff5775b260dd9ef1bdd2bcb5a42e655bd229d477e488e658064f  sofia-sip-1.13.19.tar.gz
>  sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
>  sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
> diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
> index b8679f6961..c0d15878fc 100644
> --- a/package/sofia-sip/sofia-sip.mk
> +++ b/package/sofia-sip/sofia-sip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SOFIA_SIP_VERSION = 1.13.18
> +SOFIA_SIP_VERSION = 1.13.19
>  SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
>  SOFIA_SIP_INSTALL_STAGING = YES
>  # Fetched from github, no pre-generated configure script provided
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
