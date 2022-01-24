Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CB8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B7B740576;
	Mon, 24 Jan 2022 10:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCKTVuUuSXcc; Mon, 24 Jan 2022 10:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E68740475;
	Mon, 24 Jan 2022 10:23:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1855D1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04EA240475
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ML_VxqeyYGDm for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AA9E401FE
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:23:43 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 9so3211981iou.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48/WY0MOqJPJSA0hYcvwIVeCXxaLbk/I3rohFJy1UVs=;
 b=AA2uTppASG09WywB54ws68Q+Q3P1I3cyL9pKNQRB/EZzoO+JlpHJFtIk+EkyXcO5iN
 KZEDvSffxF7fc8ONBpWnpSXosJk9zn9mon+gJL4XDm3NxvfH+pFIZEsd0nEwuxCWf4g7
 U9b7jG+TJNu4u48nqcWfqshZgUzwHX/Dw3vM4HyjE4QwHJq2OH8B5kR18Muu5nhk1KpF
 oP0zFZ+DOd+oU7+OI19oHehclUK3DlJzd68Pz2noCHULvAYKW2ELSGLz0AOOtzHybmrI
 W2B7+Blh0/+5A5eHO7BNK3fXdjtBcR2Z5sBs6xrZEFvhAIvEiIWNy2CSsYGqDDaLVMo4
 prhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48/WY0MOqJPJSA0hYcvwIVeCXxaLbk/I3rohFJy1UVs=;
 b=l4XRzIssvUpVy0lMTpnX7Qn9DYwA9HigTYE9kSqw0zRV3cCfHu3wVoKCMPyYsSKNUH
 uPhuYH8cJPW1DyJqFOAmsSLokMZmBxtTechpRGpLUcEkfFEd7boRSn/uhr1tm6Bt3uti
 5H0cHCp59nsuY+CrF/pmJJbXP+944x7zbYIZxnEjtG78qUad3QqOpmDG8Y1iYfrLmcjh
 RBvXRVlO3D0zZNwM116N7THOzz3S7sEmObn+THKCMnER6CSn5iW2JK4wYc5nb6B2u5e6
 VKjEJu3d0+e6fYm7LW86gLvvGHqMWSm9uzEu4r5kTqsuTCSa+HJZ9BlL3mSoe8rRLtId
 as4A==
X-Gm-Message-State: AOAM530oQg6RzQUHnhUlEYalx8yNmf3iDUWbt2ovjY0kmmQ2trkp5qed
 3ZJAuxRgAtavelnagaOsFkDxCYcp6hc=
X-Google-Smtp-Source: ABdhPJwZZmOcWKcMadsEmV78T936OV4997TFUli+S8dZvWPxTMxRpsHGDeIQr6AjLoG8KzZGqr7y0Q==
X-Received: by 2002:a02:838c:: with SMTP id z12mr6003883jag.312.1643019822892; 
 Mon, 24 Jan 2022 02:23:42 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id g5sm7709006ila.59.2022.01.24.02.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:23:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:23:41 -0700
Message-Id: <20220124102341.469972-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.0.3
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 8e192e3717..382bada4a7 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  68d5804254642905ba87ede509e68970  msgpack-1.0.2.tar.gz
-sha256  fae04496f5bc150eefad4e9571d1a76c55d021325dcd484ce45065ebbdd00984  msgpack-1.0.2.tar.gz
+md5  2dcb4fa618d7890e5a79de6fe44cbb59  msgpack-1.0.3.tar.gz
+sha256  51fdc7fb93615286428ee7758cecc2f374d5ff363bdd884c7ea622a7a327a81e  msgpack-1.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index dcb525ed1f..c50b7157a0 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.0.2
+PYTHON_MSGPACK_VERSION = 1.0.3
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/59/04/87fc6708659c2ed3b0b6d4954f270b6e931def707b227c4554f99bd5401e
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/61/3c/2206f39880d38ca7ad8ac1b28d2d5ca81632d163b2d68ef90e46409ca057
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
