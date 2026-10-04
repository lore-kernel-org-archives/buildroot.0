Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A24DCA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 21:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F71605F0;
	Sun,  4 Oct 2026 21:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVf7hfJ4j-pt; Sun,  4 Oct 2026 21:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B2A7660607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791148852;
	b=kcK+1acMYoch2f4beUrMbC3wWXSWZS6KDXnhbk7bEHGRIYDHScxW+GpeWH2C/9x3uptc
	 a446h6VDI8n13WVkamqLAj1M3QDsvtx1zdkA4XqFJrPpPDaGHKWvxzFxitP8Oi63lc+mW
	 lYp13tK3FsbuNVt86Q8HD/EIk5gGCsizSnCTmTLU7jpQDTVvtXbcGIfcoGJoi7vHWz5ba
	 dlhvDDvjVZH4KkAo52iqAu4t0OJ7W3YXoFHm1lsk7f8MAVtJHEXasoVOg7aCd0WZWHB3N
	 c5mGdW1enM18Nls8UUA+6GZNZf/rqadpQxtwXcaQd6zFU4zuUyaF5L/LqWm8dikeVAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791148852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t57ytHWwUDZNIIL1vSELdFPZ9gusez+go4Y5AwEiNjw=;
	b=pd4cvsI0gvVUIbFolx+TF9Pf6vcsHl9FO/bTk1hN5PM7fw/P+CVtra3YYyYcaobA91EG
	 9/oo+UXfxYTQinfzr0bJl9CUDSzeka47iyIoOvEwbfOm2Wc/NWjWMQc4rOLWSXKtmvKH5
	 X+BrWk9BfYqyi75OpD+anEaN4Yrnh8JJyAal8Z+CvnLXQyfoRkivAmg9IcbG5DP5i6Vzy
	 Atg2oAQrzMp5X8eQiYmamx8Ty/7N7R00nENGPBzgpQzI9yjxgxUN1ecthiq4joRHL9GYO
	 Xfr9RUbC2eLEHxU61OvjroS2yIvxmVx1cBdFqloRAoSToxtrLHqcC4cvc/55/0KHWfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791148852;
	bh=t57ytHWwUDZNIIL1vSELdFPZ9gusez+go4Y5AwEiNjw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hGcCWXqAyV97Q5mWu7mGCxdo5jUl0yTamtZwORDR+X7oiAs9PsbhRPbc0QR5HWY7U
	 kPFk3w3v06l8x+/lBzyOrsel+OTBY/goVIhV/BGoRgPrldDy36mAchI9WiZs6xXTQe
	 wzvUIL/5ibOvF232P80OcFvxMMtx5IC0v5q+HYD//uUQCKLQ4GK4KWZh7VGYg9DWDc
	 C3wZpnOB41HbbIJ06PkDGF07Gw3RfnDKe+YIyPzTgTtSb9+ChzqYTGWR16e2/1LDU4
	 iCYBg2CqKo1uHUpvduDXnj75TRpadk0e27mtw/SjrYgLSMHHr4yatxM9J4icuin6g3
	 0SUwXwgD7F9Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A7660607;
	Sun,  4 Oct 2026 21:20:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C406732F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9B7740687
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXGWG7N9RPUA for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 21:20:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BF98940684
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791148851;
 b=R8zRAzy9EJMC9iV8C4Grk4yIKelEieW1ucV+vglYd7uFWsm1KKll5f9L2Oqzmx42eEAG
 zlQ1NNmSg8vfS12gjLAgKoDByeRKx3jfBh7bP272VOjYBaQCQBGdvZoj4MYVfNouUR2nl
 SEnruAnw7RvEGhNF65WFEp1tckbNrRnO7xuJmE235LLYxGWTpBgOLLeZmazHnRNd7CNzR
 RQ1whEapK54aTficrqlO90YnJesg7tkGdeI3p0euZLw2sWNV2nbsUvvxVBrHdmDzrXPA8
 SHSYqw8DVc3umF+PTOjRIdKooHT777YPavv7qF8gd/tWM4wAWlu3HMPEXObQgc8IgBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791148851;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=c3Vol/1MXCbVqweavIOkWDeLVLcuSzG6L2jcnkv+vqY=;
 b=kiacVWvjbBoGmeKqcsonEKlDPX2VEVenSX4UQhMx4P78AsbEzU+TLXSi2j9/yGQIxZZZ
 ytyHnY5lkRK+b6Uz59U9MvznTuI+0CN+mdhcFaKvXLlYRgy1rq/zuhdg0meqr1WP1B/ft
 ZVtZqbTET8axVlNJvefTO7HkMerHusd2/gl7d/zIzk51OIlQq+rw3J1SuU0Pu/KYu/fJm
 Y55yGRkyBtNkP/MkR9cTKT3ygGc2tbViHy7OH8Z2cvz6pVwFJhi54v49PJAIpqC7JMM3R
 +YuvtOuN325L/HkWzlzLLxTmzZp84YOkP5NLfYPIHmidVeo6/K5x4c4SqUxepDt6t3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RA8FsbcP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RA8FsbcP
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF98940684
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:50 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-81ae6aefdceso1322516a34.0
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 14:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791148849; x=1791753649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=c3Vol/1MXCbVqweavIOkWDeLVLcuSzG6L2jcnkv+vqY=;
 b=RA8FsbcP/HWtqbQcoqR9DHcrf1zxRNAhqfxt2b5G8I6YnidZSfxAek2+ozRxD7EBkj
 fYUKVa1BzbZ/ahLFsFglJr+2YtBqx1/9irBlyAA4ffvxOLm0uNXUZhxuAn6avAEE1Ylk
 Uubma61oZ6zLeffi7aB+kfovLZDlMypJywg4pn8ff9IsUD013zHxnDEd/L3shP4AYL7B
 MOmx+cmZlRVyb/a4oCV5ajvkL7cuN29hg5NQbqwXQSv+cU6Gqo2mutjQkOiTDVkxWMiY
 +rEk8kni+PJHPbEUMPizwkeHTWAAAd/H9/OOGUY+aDrm9m4PG3BDXduKEGHBqLxOeXzj
 ij1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791148849; x=1791753649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c3Vol/1MXCbVqweavIOkWDeLVLcuSzG6L2jcnkv+vqY=;
 b=oYImb19WMAWharZY9ZsgwwNIW+7OyHgKMvxJ7VOIDxP1z1o49eK9Qo16iPNk9pSSoQ
 mZuuf7YWGYf778llkWBOUvXr7MVvzTrKFudVOEax+8xVfL2VAkAGjBPWSGyMrARzp3iN
 NKQphAfDB+2eYBeAwu51kRc7sDtS/uyrjtH60ohV/j+epF2qR1j+oDdJDy6OwChPbusA
 zl7AG+neDRWh0OJcth9RCXFcnhlTxjywUtHEVvA5+Z8ZaGf3UNIp+xzBMeYtwvcmmOpe
 YGarA28txmV5S0p2e+pbWv3DgLsL8nSjxzuxge7wmvHtEfq6kPs11aElkO3mkaW4D9I8
 Gfyw==
X-Gm-Message-State: AFuF++kUrHaEzMl0OFlwUrS3tg56sM2NHclfXiZXbqDlDri+Vlj/neSl
 6mhTpO3jYz+msZ6Dgs3KrM40JQELJY6H4s+SipRSq1LCHih1KHT2Kp5WIUaS3Q==
X-Gm-Gg: AYBFou3ZyF1oq7eS70DlkuwxQJGQGNbTa7Qy5hNqnSWDvgLAuCx6lThvy/gyejpGWa1
 EXqO6N5fsLlp72h2J5wgSrun/KI3zw0X17GN2Mas5aqEEzp863on4wHcoYvuhX0mb18R9SQtS5Z
 JL4+C9GFl+u08++nFHP2M2qkrtB7pxg4qFNW/7u/cXhwPlTSsb7eIhw1EU6vz8JyEXGJgJQbCVJ
 kuI9RrTondiDraMom7BElCV/NhYoM8NVGx8pjLyHQJU7A8qe59hZDWa52zE29NdQRkiOkGKONpJ
 uDagVIUMUOX2uEAqj+3stAHUYclk/2NZmLeQxSBrMmNvTU5p9wJ6gYJNt6DyKDd7Olp7OkZIJc5
 ToIWA9SQzVXkFJm738fYSfx5kluXCFJuu1m/sHRLg3Ldeuv0RAsLEpvoLQYNi2NThYJRIQbmEkR
 kkekMIAs8eEjlVfy5pt9zfjpGuG5BQDIYj4MLD3voP6T5Lg5keBWGQ9VGMg8V4OWS+YBhu0xPYa
 /5fPQKmzdx5hd7TEgLxvgo86EEjN7Qza9OeqmQ3O49dT9JIEmwINc/aO2sZqn5038yWhunGq9A+
 S9KZQS+ewB2jDmMDRrS9n4K82RqayDuELYdhMD5Qn1NkH8iow7YrE9LPYL2Yq0c+j+0GDtbsD8E
 7TJC6r50t4ztU/q2N/YqQROARSXNqU4LdwBv6YH5yA+A=
X-Received: by 2002:a05:6830:82cb:b0:822:ce5a:4ab with SMTP id
 46e09a7af769-823fd8f8f6fmr5725864a34.26.1791148849269; 
 Sun, 04 Oct 2026 14:20:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227aa72075sm10602691a34.27.2026.10.04.14.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 14:20:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 15:20:44 -0600
Message-ID: <20261004212047.1047271-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-uv-build: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uv-build/python-uv-build.hash |  5 +++++
 package/python-uv-build/python-uv-build.mk   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/python-uv-build/python-uv-build.hash
 create mode 100644 package/python-uv-build/python-uv-build.mk

diff --git a/package/python-uv-build/python-uv-build.hash b/package/python-uv-build/python-uv-build.hash
new file mode 100644
index 0000000000..bd0644a72e
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  6b2b5c814e6ecf61a0f3743362d3399fd7578324a1b59b12e242cb6051881dc0  python-uv-build-0.12.23-cargo6.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c  LICENSE-MIT
diff --git a/package/python-uv-build/python-uv-build.mk b/package/python-uv-build/python-uv-build.mk
new file mode 100644
index 0000000000..1a4cf5a4c5
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-uv-build
+#
+################################################################################
+
+PYTHON_UV_BUILD_VERSION = 0.12.23
+PYTHON_UV_BUILD_SOURCE_PYPI = uv_build-$(PYTHON_UV_BUILD_VERSION).tar.gz
+PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/b4/65/672d5c1e7fff2a602b51758cd96c379ea80c0c20d9d10aae5139bfde9877
+PYTHON_UV_BUILD_SITE = $(PYTHON_UV_BUILD_SITE_PYPI)/$(PYTHON_UV_BUILD_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_UV_BUILD_SETUP_TYPE = maturin
+PYTHON_UV_BUILD_LICENSE = MIT or Apache-2.0
+PYTHON_UV_BUILD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+PYTHON_UV_BUILD_CARGO_MANIFEST_PATH = crates/uv-build/Cargo.toml
+
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
