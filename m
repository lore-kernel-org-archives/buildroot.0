Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE1BC369A6
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 13:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBF3608A7;
	Thu, 10 Apr 2025 13:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTO7CWZz66iS; Thu, 10 Apr 2025 13:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F3560ABA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7F3560ABA;
	Thu, 10 Apr 2025 13:49:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3475B108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1996A80C67
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cfpi-kr59D65 for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 13:49:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB90F802EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB90F802EB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB90F802EB
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1tGep739e3-00eTFo; Thu, 10
 Apr 2025 15:49:34 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 15:49:11 +0200
Message-ID: <20250410134914.916804-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:FaGG7mwdkqlghkPumeA4ZTX84UzbS35vuviBk/pPLEoE63kN6Tf
 lzxBoenKW8Dll2MRJ1EY019pFbSg38LwHeH04B3hc5dRDxLhJBno15yA0mNSxznRpvFawZM
 23f+pDfVOb4dhQIdxtNKc8xmaNUH7jXIcIEMwLE9NuHQ/VdqXJLZIiDmCtARgCzWuuomyGP
 NNbS1Qb/ZziD04r43bz4Q==
UI-OutboundReport: notjunk:1;M01:P0:w3gYLMQe0Lc=;Vk2uCibwdV3E1+XIR2uEVOPu4zG
 0pLQk+YiXczedrKGY8S6IaJMKpnI/YjqUMYU2HA5L10ujAw1flgg2HQSz889bKbe3EpKIurPf
 vgDPmIjgRmiY9iLMWeO49kSZSBcFpr662iPlPu+vLOj1FM3cDt4ulwOw3pzu2Xi/EAo3hk/hx
 HnxdNXWN4u280U4RG454alLFq5EuFbk7bn7QbxvvTX+tWe5RVZhnemLP9IXKCpU4l9nF5c9H1
 VOB6HDRObpZzan3SrK7ZjfgGUW94XIdqSkjehyi7UqSOUQo5Wz4NQTicvj0nUJwlNnD4GFWyr
 0IDHRDYd3/J/jbDEtEqaGjEk2pmm293tbpWEHN8O7CVoQpPWsv2Izx04nsEKhHjzZhUEGTOQf
 x4XoMPiAfmgfCsO+o8c0+tAdt7yH3oCY318bjg+2e+uN3urE4RcXEBFJQibS6TKZ74ATfN0Q6
 IVWfXVDnyYN9DROHsmHDeFRel1F3aLN8es1lZa//OLMIoxpi1OBeHDo/+V7cnmYUXN0oWlw8H
 oVkLu7WhV2N3uZWM1oMeK+azfiy26RgtSJsNez3Wo4Twhkb4ZwvvApwZgaxSjI7PWbcT6CRnz
 lYlTF8kLK5hFsx96faVaZznmXwuLVJZ3ArZ2ZGqyOqt86lXoxgsotUp7Q/ffLhktrGEFPnJh1
 YuZxjTDZ8uz+WYIIC4UxbnF/maXFn+f2jQA/q6z1cdCS6Pd2NqgLId0nLTR3HmEggf9vxHD/L
 vhutcRA8EqiPQSBhyoMj2fHj09JsKOoiYK80cu8PMCRsbqcoqHVtNkMcUylZ0Um8Ca+385VkW
 Kxc4GXnjJyP8TU3T9+4Ydrzkj9+BBCorlhdialMcs0SnJr/OY43Sgq+yVZXuYD5nt4UKlGxhz
 Y9cQeDM78tyF/tRMkqtuT+1649ig3Rov8ANHB9j+VdME5kVytOlv904ZQNAcooFOaMvymhM+u
 1Ox1VZg8US6qu2FsLFPtQL6e4yaBlU6xlR+t8iMSU29QS9hsJNCGm+E6MZkS/nQqmfQhlMLEm
 vDsfxS0mJM1gPUf9GbYDJjJqIodEM7vvRsyQH27C+LeEtwmeRAsiOTB6VRHV+k9zo3pxZApnN
 weA+iVgIh/VVttglT3Ve18I31XDB1HvhiLE1whpzQPusN/zszi5XkMfsWk0W9QN0LeygRN5uP
 EP3WrLGRC4GSqIYbjl3wZIjJjtnK3xYXE+uBJItfyauWhjaoJdATqSCxhC3z8C9T+MQUozD8n
 T2dqIcsqdfcwyA371Xxg3fKjyjmgNrPy8rZ01bbCLeD0/tBd1oyRmi1niwGt7usXuXnOUa6jV
 8QkLiMECMxOKbn3mKLBokhQlv8hEsgOzlWte1fjXOZulWNVNJWYLR+FbX1MQ8ygaxN2W7KOGR
 OvS5QANwFKNYCMRh1T3aVmBqvBbSFWvuTkxQy+/FtAvazgWywlBkOdWQJsjYo5Qb/0BxLS1sQ
 /pVe10NMetDRkqpC8rGjaESjUFH4WlFDnQwRQ5+yyaUFeOswwPi42CTZPD7e59IQITinM51UO
 KkxB1iyBSiBN++ykYmi0vv1xdS5BeOduJpzwY56+pfMkJ07qBQoVwfziVT2CY6ucnsh9tMGHG
 JtIuUWBNlWiVkjVSUsUPSEFwWsYoWeVwVk+Ssgu4/0QwAFBtyY5Gdt+I1Zwm9OIZZKWcYLNUJ
 GDdQqtOuJdA9od6zs8NwsHHbPpgJp6oHp/YjHUNdc6tF29AXQrMsrHJ2UgQEM/UjriiIJjYnw
 F/Ej+Cg4euwWWteK4kozBONfUZYEnkdxrfciCUeZ2NcMuan826/yj9r7fJD8JUn+P2EJLdxBD
 UYTQL1iHWH74TfyA9BKo3HHejxaZQRGpoB4Teth1/ssx8RbsfXbugXlB5U1vcCaOFHmZ257UJ
 DJ8LzfDHy5XkiKNQ3y0Q5lMTHWoAvhSNqwVEESZuljDh6pJnySrtm/zBg/ZoAvw40B3XIlo4L
 R5QdltBGNeGcxz9FQMAYO8vNAVvzBRHtgNJR48kf6+ebzVIcKxzJhicNXcHSKs/rkKzCWm8qV
 0Wkh7o5EYjC3ijzqDj7vD2hhKB8h+Fyl/INrTIr66o1wEYCfpL0btjk1N1qcvNURZOp9DuQGI
 6JoXpLSEY4BLm0UkVVy/0fjTGEh79nQYvnUldrA4qQRxAWvfJnlYx5x6Gl1xwo5ZvPXL7ifVF
 fgWDAZ7TPSqyiImNhfhRXrI2DkMZccOg0UIw/Yf71kLbGjrvBD0W+2zB/uvxiK6K+B4xpqRl5
 xTladKCyKaSZ6UnfE4YfQ05z1nqpzr9GcakQXH7iYoCdwTvGjCZXnlwBeJTYjMyNAOg7vtTnJ
 1KIBt2klPCZx20T05CAu1BKssbQ25SmmqfmNUMGqLx2mw2J7eGPZI9ID6p3xg3wl6w4OgD+32
 5xbXGgMrj4z8+AhDvn75nGtNBZhH0TaCERrNWh6cT+vEepuOt6Aw88QDCg7ZgP//N5LLJbuBp
 fvr0Sj6seJIAY9kM/cj0O2iCz1PS8LOBzpApoSNy/Ix574Sj6rzczaQztVdjPTJqX6kOnIlrJ
 gVCILPO3mEFu6c2a+miH2wprb3h8V4u02ZKOGSWBSwk2bdxrBPBxT9aIuQNjiHKw4twZr0d4h
 qlWr6YEgGu0HtOVlRoRHkujF7ECe/37SkLZ30AIg0rTrzLYjjDy1H6ETLWVxHAAkR+KSCVTqu
 t+vcsdgTdQObxa+4dFHE6ZHG4YfYvCnJWHKJcwBOwAfjdTTAGsjjW6b/BznbpUomMQgw2WqXL
 mw3msBttijmgxragklSc+mjnKnKgHElTnZmkkeA4le8JcITKbwn25IM46hp+At2kWSrHQJSfG
 DzcnivzhdD+V/B4y3SQXWtZPhpx7YgQ7fsRHx4Vw8tDsOHF3CQTQNsSodtBQTRkM9uTU+bWXk
 Zum0oeYgLUGeqjvx3aUBB82d6jLmjj6EMg6CjfdJ2w2aoY4z22Zt7NWUbvC9FKGYTlpE+tutg
 VRTxxa75RvmtgxlJLesJI2ds+0vphBc8USusM2v59BRYd74Z8ecbB2cPAfMpz8JT3miTieZuF
 jAWyOhq0VE+ngHzrY7Agvt0rp6CZUGzClO0d1rKeNABToxS5L5SqHtGEoxkrjxN6g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744292974; x=1744897774; i=fiona.klute@gmx.de;
 bh=MySOe1GvBUS+gVH1XMPRQm7JyV65K8+rpZaH/7+mepM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SfNqPdPHMSEoOVbhQRI0FFuXx0WcPh4LTsKEqRSY0Yz2FyCwJU7chGpEwDCv8X5+
 m0ZQvNUxpL7w2OCSzHOYgi+QtC4gT+Jo8hDvUZR8P8tOsrP3S3pBRfcLaim6sryye
 DU8nxkve3wFJloxBs/TF96x7m4f0vsAiKW7NTv3R2svYL4Pms/4REJfQwz/azHqq6
 4/MbgQWUmUOI5tviIewFv5pH1uKS474yv6SkJU5amJ+CeKwTHW5XDmhQ+mIVd3T7A
 T9K+lrbOzXkbuycYzrO7uJo0XNWd09RZOjjphviZMbFSTHogDspDMZquPHki/iwJv
 Jm3uwCOIJYqlSDiOkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SfNqPdPH
Subject: [Buildroot] [PATCH v3 1/4] package/python-gobject: bump version to
 3.52.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://gitlab.gnome.org/GNOME/pygobject/-/blob/3.52.3/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 1dbd40d038..e49c7ddd08 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.50/pygobject-3.50.0.sha256sum
-sha256  8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212  pygobject-3.50.0.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.52/pygobject-3.52.3.sha256sum
+sha256  00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82  pygobject-3.52.3.tar.gz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 001f355844..3021937887 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.50
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
-PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
+PYTHON_GOBJECT_VERSION_MAJOR = 3.52
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
