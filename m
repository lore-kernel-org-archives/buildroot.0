Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F12C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 01:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2242A4046D;
	Wed, 18 May 2022 01:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tzoCIpFMI56; Wed, 18 May 2022 01:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C06840436;
	Wed, 18 May 2022 01:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54E201BF20B
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AEA783F01
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sL8zMmVaZwdG for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 01:59:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CDB583EFF
 for <buildroot@buildroot.org>; Wed, 18 May 2022 01:59:15 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so916659fac.9
 for <buildroot@buildroot.org>; Tue, 17 May 2022 18:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DqR+1isq8IQnA4Dmu22fuzlCSgNU2zSFI/y/FIBC7Eg=;
 b=ByL+UW0fyojjS65rV3Wy2r3jxp1uKYOwd/+OtrgQIPkxvZsWbeX0rCWNCpS76YV130
 ea6LdQG6VUOtDKcrNsEcgJLywQy7nip0nz2vCWGlNCX1gqngjjft3G0dJFu/ZGDxOOPN
 EUK9cBmY4n9mfozaJGChEj+JABQO1XJRYXo88EgNMvUHEGwyNVaNbtxu5DDyMqiZZ3p+
 OKGiFbp2s8jkAXktetOtTHTve4YmdiyF6trrrk76QMakF0Q8Sfqr1hp3t0d6ZsVijb56
 aGZuayExHO9AzZBqP8c8ZbYAdH3DoR8L7fMJ55hp0MjGjoZkgwynjolyzV6CMyozLm67
 oB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DqR+1isq8IQnA4Dmu22fuzlCSgNU2zSFI/y/FIBC7Eg=;
 b=TbP/Ov82Wr4+iWU8lyfJ6R59kCGhW5Mrbzds7Sw4CPYn5D6B5C30sdJpFmlRZHJKUl
 70fdBGcrwSwM1KzeNKbEieHSUjErxZyuam+9j4qY15a9Wy9X8j/Jwy6gmHszpkhSvM9j
 UgtxfGvTqIpmwx8RD0sWMc+sK8VXfIsujL9lD9/hdPjdLO9i+zBuyRP+mJu6baXR/48i
 bNp82AoEpVRIUV9I4OQxlesap7cEqdksTQQg4QtxuUYrELXCCw6MlkNn+D12eyQ6ECGw
 SBpUBob5uguUm+ePqTK8cakXM+wLzP8X2vWbopeDi3K5ocZteVec2kOa5s1DaOOqz9KD
 JVAQ==
X-Gm-Message-State: AOAM532zJq+kE5RF5949i52GZvkEQLwiIxJ99RLc16uIOSQsy6DQvOwi
 GBRBwTTOHUpfz6SAC0YJKX8S4eEir8g=
X-Google-Smtp-Source: ABdhPJwMXN6VYCUneblmf4dzva2gHPUhNKccMvk+Ndlk0+wLbMhDpFSUJ7H4SaYahahjQXoRWUkSSQ==
X-Received: by 2002:a05:6870:b693:b0:de:7356:a3a3 with SMTP id
 cy19-20020a056870b69300b000de7356a3a3mr13856763oab.24.1652839154858; 
 Tue, 17 May 2022 18:59:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 x24-20020a056870a79800b000edae17a8cesm537316oao.3.2022.05.17.18.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 18:59:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 19:59:12 -0600
Message-Id: <20220518015912.2564978-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.51
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 6f65a6b143..db618ea9c5 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  68592ab5852c46ee3d743f429f9d6b6c82171fa37b4b3854eb0da62b08b49d14  pipewire-0.3.50.tar.bz2
+sha256  1820bfd524805ef3e4e4dcb368f26efa5f43ca90f8c3c67731e502268c34245e  pipewire-0.3.51.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 64f7d054c1..5495c2749a 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.50
+PIPEWIRE_VERSION = 0.3.51
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
