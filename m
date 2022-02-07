Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4135C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 11:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C6860B31;
	Mon,  7 Feb 2022 11:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L76AlXhB8J_Q; Mon,  7 Feb 2022 11:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784FC60AE5;
	Mon,  7 Feb 2022 11:22:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 846611BF28C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 11:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 727B381456
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 11:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X33r7d-Xglgl for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 11:22:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5C64813D7
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 11:22:32 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z7so19063105ljj.4
 for <buildroot@buildroot.org>; Mon, 07 Feb 2022 03:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dRlHFTsA5+Q1SpauQ99RMl8cyogYd3dnnFhAIU6iDQE=;
 b=fcknAJRMU2/rA3T4VwQRFU09gAetMX1+SBq+yiRGZpJgKtx8/aYwkAtujBlhHDBgJG
 ikVobDPg5GZ4Ag4Z9oVaPPE7UwIZey/pCuGhOL5COJlY3NZiLeWqGmpjgi7VFoPa7vli
 AekcYt7A0ARJdikROK6rjbbTmAdqbsJrClld3caLXkjVIO+qcDP4kWLR/vc+MJH/q1qo
 G/zI3EVH1a1NDvW1mHjsBQXph+FNZVpoMADzdiuFT+/XJnTuen/VxK8dH3BjuJhcsqI1
 L86NgjkLNjT+EtnkltBQ9xed3BMMxnRNlV/oGWhC9K27OTic2YMhzIjcmYYDsH6dy0+P
 7sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dRlHFTsA5+Q1SpauQ99RMl8cyogYd3dnnFhAIU6iDQE=;
 b=kwN3wdxfJr6kd+SjPEnH9p2Abi3qOCjeWCGFw6X2HKKp2ktsZgfQcSrHW9SMoRysJN
 3aTRTkqJ7cuUcLyHADIC2PuEjc1ST+qx1fJQWa9NF4MtR4b20sd7zSXmunRgeafONt8c
 xLygM8uW9+L2HW9tz0aevdf/sl434xGZExSj5S5Jsnj7597tJq6E/vjSwYZUmLcyRHCU
 OPnR7V80E5IKPyX1Rhh8LYVn3s5SfMT81thTLlHHGJ1ZnM8NzXiZLdbzl/2tXEXLHgfW
 M5QjiqyP4JMkM0OTiMlxWGWUP7jNa9GMq+un0cd67HlwzDzPodUpAv1XgJHrgG5p3dKq
 7Mww==
X-Gm-Message-State: AOAM532t5ASz7DJ1MRVZcRuWdvX7gQrwR8qjmH1zi7LyLxi0uR1Hwjyx
 a1PlOL+kVYHYFgsmWZYZIf456rLMOINRIQzYl73Ifw==
X-Google-Smtp-Source: ABdhPJznuRxwHMZqqK2F0v46KkjlglfKQHgxFUEOajiAQNAXKgYC/B+2evY0kFt7U4PUiMkugh0LrA==
X-Received: by 2002:a2e:8715:: with SMTP id m21mr8461204lji.327.1644232950597; 
 Mon, 07 Feb 2022 03:22:30 -0800 (PST)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id h2sm1563319ljk.41.2022.02.07.03.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 03:22:30 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Mon,  7 Feb 2022 13:22:28 +0200
Message-Id: <20220207112228.1753927-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/alfred: bump to version 2022.0
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly93d3cub3Blbi1tZXNoLm9yZy9uZXdzLzEwNwoKU2lnbmVkLW9mZi1ieTogSm9zw6kg
UGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci0tLQogcGFja2FnZS9hbGZy
ZWQvYWxmcmVkLmhhc2ggfCA2ICsrKy0tLQogcGFja2FnZS9hbGZyZWQvYWxmcmVkLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFzaCBiL3BhY2thZ2UvYWxmcmVkL2Fs
ZnJlZC5oYXNoCmluZGV4IDA3OTkwNzEyMzEuLjJkYTdlYjMxYzggMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvYWxmcmVkL2FsZnJlZC5oYXNoCisrKyBiL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5oYXNoCkBA
IC0xLDUgKzEsNSBAQAotIyBGcm9tIGh0dHBzOi8vZG93bmxvYWRzLm9wZW4tbWVzaC5vcmcvYmF0
bWFuL3N0YWJsZS9zb3VyY2VzL2FsZnJlZC9hbGZyZWQtMjAyMS40LnRhci5nei5zaGExCi1zaGEx
ICBiZTFlOWMxMzE3ZDQwZTQ2Y2ZjODgxYTMxYzYzMmZlYzc4YzYyMGExIGFsZnJlZC0yMDIxLjQu
dGFyLmd6CisjIEZyb20gaHR0cHM6Ly9kb3dubG9hZHMub3Blbi1tZXNoLm9yZy9iYXRtYW4vc3Rh
YmxlL3NvdXJjZXMvYWxmcmVkL2FsZnJlZC0yMDIyLjAudGFyLmd6LnNoYTEKK3NoYTEgIDhlMDA3
ODlkM2UxZTVjOTU5ZGQ5ODU4MDk4NjFmZjYyNGQzNzI2OTQgIGFsZnJlZC0yMDIyLjAudGFyLmd6
CiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgNGM3OWI2YzQ1ZGU0YmNjOGNiZmU2NGNiYTlh
MGY4YjRlZjMwNGNhODRjMTk0NjIyZjJiZmE0MWUwMWUyY2I5NSAgYWxmcmVkLTIwMjEuNC50YXIu
Z3oKK3NoYTI1NiAgYWJiYTFkYWM2MWVjY2ZjZDYzMjllNzMzMWQwNTU1ZmVjYzkzNzc2MGZiMzZj
NmNmNTVjZTZjMWQ3NTFjZmQ5OCAgYWxmcmVkLTIwMjIuMC50YXIuZ3oKIHNoYTI1NiAgY2VjYmY1
M2QxMTQ4ZTEzMjU2YWMyOWY4YjkwMDY1NWI3ZmM4ZGMxMmQ1OTkzOWE5NWJjMjMyM2VhMTc0NzAy
NSAgTElDRU5TRVMvcHJlZmVycmVkL0dQTC0yLjAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWxmcmVk
L2FsZnJlZC5tayBiL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5tawppbmRleCBlZDU5MDY2MzkzLi4y
NGI5OTU2YjExIDEwMDY0NAotLS0gYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQubWsKKysrIGIvcGFj
a2FnZS9hbGZyZWQvYWxmcmVkLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKIAotQUxGUkVEX1ZFUlNJT04gPSAyMDIxLjQKK0FMRlJFRF9WRVJTSU9OID0gMjAy
Mi4wCiBBTEZSRURfU0lURSA9IGh0dHBzOi8vZG93bmxvYWRzLm9wZW4tbWVzaC5vcmcvYmF0bWFu
L3N0YWJsZS9zb3VyY2VzL2FsZnJlZAogQUxGUkVEX0xJQ0VOU0UgPSBHUEwtMi4wCiBBTEZSRURf
TElDRU5TRV9GSUxFUyA9IExJQ0VOU0VTL3ByZWZlcnJlZC9HUEwtMi4wCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
