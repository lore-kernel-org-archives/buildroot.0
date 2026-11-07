Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF45606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YuwDZtuc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziZIK0T9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 850AD4073B;
	Sat,  7 Nov 2026 16:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKwghYisEgfj; Sat,  7 Nov 2026 16:34:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4DA6B407C5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069274;
	b=Ien/qbuPITGZ+6CaC6MGvdZsjJWabwrGj9fgnSCLfOCjCwGP5wulIYqzf4A64xow9jM4
	 HhNrGtfzSSCRKKoGIo4+nEMUXXeZwGvAP1dq5eoIp6SAWC1eqdbRqUMMvpjNr2MDzvgXH
	 RGZQN6oj2LzJM+yebUWOgeZNqGdrSUEgSEAV4MZ0OquFS1gX0Y4Od0JEAfi+/JlVzsjwA
	 Mq7BAk6F4gWorLY9MLa9WLPFlhBT4S+/J57mNUOhj0lOJrEuk1voVlb6sZcbpyc58TAQi
	 EejcI+ZYIZF9sQwB3cniAohfsEszWcHU2Iv4nfH7DrufW9MQDEKnHm4UO3z8yZYt9NQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069274;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uWsdY2ZaL5TvOhDYqH2uEzAhRWRiqATJ3jutQ+k8A/Y=;
	b=oEFGrh+EI+lWB8sNkrCtt/wqpTOtOZ7FBOG/SLunpbHp5oJvojcbImLR11QFxjW/tD7O
	 pLmD0pT6aOiWUATtLhGUrcRf2bDS/oiRgxLIHvqLsYqBnNIXnFabU8WT6DxTIjKGIkRky
	 dRbacYXq6Q88QeeJvn6bOwOw15z6YyyLDgOnCfoMZfSmffvs4gPJRV+PiHGYO0YHR9rm+
	 IyusjREOE5+aG+fkuAK/izRaW1AZrpSRjnB0zNnT5TYBvnDKirRhjfRNFNrIz56oYiWME
	 CDu5MaK4gVn4B+SWeRBudrG8RO3wrY2S40obvhmqW1urwvn5HGQ4Rna19rJwHSlmc4g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069274;
	bh=uWsdY2ZaL5TvOhDYqH2uEzAhRWRiqATJ3jutQ+k8A/Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YuwDZtuc+lzFnLGJDL7wLiE07h617nTpeTrEQAGNm0gh+HVzf4MAmSdMHvNtzvejH
	 x9o4Ikvbo+I1Eu68nqboSCnyj0KcHG6vaZvfv9vkjG//7v1MHwCEYNwLoBStFBNNg0
	 Ne81O5n+l1Ot8t2f4bfWWAy8dr3mm7qeXWcSubO1qFqIzAVi6oD/h0oBYJloxHKH+I
	 tYILzT5JxsRjyfG3yYHOUHnQ3Zc3yBtg032q9f4HnIXOgFJKjK2xUsjPBrGQAAj+Fk
	 GZoE2lo27/iGgli12HZngpMARUYyi6I3PgkyTafHFN7hunEjzvKw/dEiz1kx4WAqBm
	 6qI/paGpLv4jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA6B407C5;
	Sat,  7 Nov 2026 16:34:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8421317
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A2FA605EA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyKrwDFSDBHr for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3984605E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=ziZIK0T9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3984605E0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:30 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-492f0a1b685so890781f8f.0
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069268; x=1794674068; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UjXUcnNR7sBbHDaizm5EW9It7aWGGDauIcVDrk2fOvQ=;
 b=ziZIK0T9xY34ZBH71ux9xyRz7B8SD0yolMhAOv3xWWseqDcEP7ah7MyN5FoBy+sauS
 qgdT9nln7B0PtOVe0JKgF3Yx/6dO0tKWrvYIVW9GYs7iIJf+/gNU8EzbCFbJ19goaGd2
 4S5dprxrWFJl9EN9vUiv9urW9YgHnmwAVDFs8vq8lsiztTg3b9PiLtuGHNEFBEJ15k3j
 3dJCcYAxuilD7uArDX9HUnZ2PHXdCpMJ5tHR6K5BmY1LVZPSLQEiMcBWHmkhc0pzo/N8
 MrfsmeCs0f8HXB7/zVyBljOGw9h8p/jKein5vEkimrTT/GqouxcDHs2sD0v/bHCfuSDF
 w3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069268; x=1794674068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UjXUcnNR7sBbHDaizm5EW9It7aWGGDauIcVDrk2fOvQ=;
 b=K+vnY76Y0X7JMZb16A++6k4k0hDU+E/hj/ocRFxSGg1iT25BXOFUYAVLssYNYMvTgU
 UX9cFbidIuZnxHehOaBsu38VtnskmnsTPSMl4iswf9b21k6K5NZdfX1+b2gXs6+ciMYM
 t96U/htPOSkYXkm7FYqTCLv8fx1gU/EHeC49T4Q+CrEvVFmGjn8jQ4AdCyqmCk4TnXu2
 HHiR4MqWQQsIXJVI3Vs0UWTPrMKacP6KuGVgyvu8ylx+X2jDz101Yky7QEnX5F/bKgMt
 9U0/BOuN2L4CsZqwABSDMDqxMCiqn1E+ux5OeYV0PPnbGW4MK8XpmErQN9mcSD3t4yJ5
 ID/g==
X-Gm-Message-State: APuU4Z/z+XRncDy6oBXVKi8ANHwCbRG0ibhfSgTi68usQXLfh9utVyYR
 ct9FLkfldDDE/9f7sulD6YAUnQDRESAjDV9o3EXoqod4uQna0qU3B15Dav6Y7mZs
X-Gm-Gg: AYBFou3D+xo52XVc6sGHjhqU4KYhkB8bVWmxGDAdTwzPBGoBpQmutx/K/gloJ+ht86F
 GexDc9Lp3w3fW5qpWkxafVu1CLj9DzuZxYQWJUY0rLddeovZo7I6nwLoWSovfcxq0nN6Xi8t8vM
 tA030+DPjND+8gJA7an4ixVvppX66fHWyFskMP8/eQRh8DmXYuRxl/plouHqUcE/KXVoNUSO46V
 WbkKuLpgxiBdm2jyXsUEPQyCDLhtBRQm3uJyuUTfIVd0pvKsG25RXZ4PsoXYSLplABZulCHhR37
 7NOTvcQyBe/YDb2qEksnNiovFPyJonJuO5mTOQfj39SR9AxWSLrJr//kVh7DhrQ6CYTSMOywryZ
 zlVdGRNAhoIubgGgNQahqKF6xrYqdOgwP7isbEB73NRQNiADEE6yqc16cO7+fM/rSG4oUZuTOs6
 PQ4rCqgy+rOJl79894rGxqwypxtha5hRHTArqupgGT+l9Gp9vrUXuAgLAmWexpjz9II6DW7Rxfp
 lrHWWHf4vPLGzLmP9JAcm98pfwYlLAA3BHAl7/DWSC15ztZTBNfrsh3McLlevt66WrHp4s3fQ6G
 y6fG1KsMAFW64q/czxFr2jyazpwlkaoVHCMQ8cOw7+KTMQE7Jp4A
X-Received: by 2002:a05:600c:4e90:b0:4a1:f7f4:7ced with SMTP id
 5b1f17b1804b1-4b6df21362dmr104687425e9.17.1794069268323; 
 Sat, 07 Nov 2026 08:34:28 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:27 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:04 +0100
Message-ID: <20261107163414.560896-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 05/15] package/fbv: drop the unused configure
 options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the move to the autotools-based fork in c7109e265c ("package/fbv:
change upstream, update version"), FBV_CONFIGURE_OPTS is not used: it
was only passed to ./configure by the custom FBV_CONFIGURE_CMDS removed
by that commit, and the autotools infra uses FBV_CONF_OPTS.

The new configure.ac has none of these options anyway: it looks for
libpng and libjpeg with AC_SEARCH_LIBS and enables the formats it
finds. Drop the dead options and keep only the dependencies.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/fbv/fbv.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index f7a061dfd7..45320a6bcb 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -10,24 +10,13 @@ FBV_LICENSE = GPL-2.0
 FBV_LICENSE_FILES = COPYING
 FBV_AUTORECONF = YES
 
-### image format dependencies and configure options
+### image format dependencies
 FBV_DEPENDENCIES = # empty
-FBV_CONFIGURE_OPTS = # empty
 ifeq ($(BR2_PACKAGE_FBV_PNG),y)
 FBV_DEPENDENCIES += libpng
-
-# libpng in turn depends on other libraries
-ifeq ($(BR2_STATIC_LIBS),y)
-FBV_CONFIGURE_OPTS += "--libs=`$(PKG_CONFIG_HOST_BINARY) --libs libpng`"
-endif
-
-else
-FBV_CONFIGURE_OPTS += --without-libpng
 endif
 ifeq ($(BR2_PACKAGE_FBV_JPEG),y)
 FBV_DEPENDENCIES += jpeg
-else
-FBV_CONFIGURE_OPTS += --without-libjpeg
 endif
 
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
