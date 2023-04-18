Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA289C77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 10:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B773417CB;
	Tue, 18 Apr 2023 10:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B773417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3p3VHTV-B3c; Tue, 18 Apr 2023 10:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E33F41594;
	Tue, 18 Apr 2023 10:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E33F41594
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFD61C42A1
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 10:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1518F41594
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 10:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1518F41594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hSKLHwhcGSy for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 10:58:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C69E8400B9
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C69E8400B9
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 10:58:37 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5066ce4f490so3382651a12.2
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 03:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815516; x=1684407516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ijf86ISrzPWIUkSRGUkHtNPC9ZMbUTv84BnB3KlDCmA=;
 b=H8egEbLA0o7Y2jd89xRQstr42B80bQbsgDRAC/4JkSxNZw82H/jyIfOLDns/ve5ZXw
 p4qOZt7ykeprMyv1OEa/IxIFSZwY+jbnORoeYjYqcBvgxpSULzfGtEn4P4CPO7hoV4oV
 yiWl1TH8gLLtDYNU5wuyBA+9jVXyiSX9e2ltydTjlpWPkQ9U0g3jKgvGrXIKmcS1GZ1g
 ougZ5kUxeaO/9cHGGQguoO4LkNr+bhO2JMDnbBy+iXudstDwbYld0iAuNRizcpYu/gcG
 JnhLvBFdxV7ylTK7Xf2mTQ0LkYyEFkBm1lDIEfpJlWfMusZg9rZgJ8GcnNTqMOK0ZOqz
 8MFg==
X-Gm-Message-State: AAQBX9dbZuOZG6RtCay9W1PJukrn22fGxJJ8JfyRx/Sg+c5dS6X73UPH
 lRSgP6V1WuVMMYw0VaycuA1ijsm1qZV6Br6wd8lzxg==
X-Google-Smtp-Source: AKy350bZE4XAA/sOiwdq7biTwRfGCa6TH9WDr1X8BHnx+yn+2pwlTCnr3llrEH0wm2IaVu6auNcJDw==
X-Received: by 2002:a05:6402:1b1b:b0:4fa:b05e:ced5 with SMTP id
 by27-20020a0564021b1b00b004fab05eced5mr1526686edb.36.1681815515670; 
 Tue, 18 Apr 2023 03:58:35 -0700 (PDT)
Received: from debian-hp-1.fritz.box (94.105.100.233.dyn.edpnet.net.
 [94.105.100.233]) by smtp.gmail.com with ESMTPSA id
 b17-20020a1709063f9100b00953331b086csm139036ejj.91.2023.04.18.03.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 03:58:35 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 12:58:13 +0200
Message-Id: <20230418105814.2982312-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681815516; x=1684407516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ijf86ISrzPWIUkSRGUkHtNPC9ZMbUTv84BnB3KlDCmA=;
 b=S4mHoZrJxxdeU45P0NH6h4xjYbgv2mwKuDKvhVLx6+IF0FMNX3+T1x5BUjoLJ5GrmT
 5F7LJPsgUiP6+xs9Or0vOJK6HUC4P2lmoE/7nmxN8jnhAKw88K238o1lw6VRlN9Rzwi9
 fE6cwae2Vk+9CbOmIzIH/MTLIcQlrn/ZIKi3/Hl+WTUyUa7khjZcDRlv5+7TRrGtZo5D
 FasQbMaAdWBRmLR3Mzi52yB/LnU5U/3z/Qa7gO6b4sSN6AFqFMypACfYT44gVZK+1tKr
 JTlMBSapMzR0mtYSqtuwB74H9ylBAH6flkMqx0htsD2RgzauNc1HL00qXRZUgSURuEW1
 m70A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S4mHoZrJ
Subject: [Buildroot] [PATCH 1/1] package: {, python-py}mupdf: bump to 1.22.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxzbyByZW1vdmUgdGhlIGxhc3QgdHdvICcqX0lHTk9SRV9DVkVTJywgc2luY2UgdGhlIGNvcnJl
c3BvbmRpbmcKcGF0Y2hlcyBoYXZlIGJlZW4gcmVtb3ZlZCAodGhleSBhcmUgbm93IHBhcnQgb2Yg
dXBzdHJlYW0pIGluCjFmYjY0NjgwYmZmYmRhMWU1ZmI5NTIxNTA2NTJmNzMyMDUzMjI3MDcuCgpT
aWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+
Ci0tLQogcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNoICAgICAgICAgICAgICAgICAgIHwgNCArKy0t
CiBwYWNrYWdlL211cGRmL211cGRmLm1rICAgICAgICAgICAgICAgICAgICAgfCA4ICstLS0tLS0t
CiBwYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLmhhc2ggfCA0ICsrLS0KIHBh
Y2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsgICB8IDQgKystLQogNCBmaWxl
cyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaCBiL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaAppbmRl
eCBlZjkxYWJlZTE4Li4xZjYzNjA5N2VkIDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRmL211cGRm
Lmhhc2gKKysrIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNoCkBAIC0xLDggKzEsOCBAQAogIyBG
cm9tIGh0dHBzOi8vbXVwZGYuY29tL2Rvd25sb2Fkcy9pbmRleC5odG1sOgotc2hhMSAgZjc1OWQ5
MTRlYzZhZDZhM2I5NmY5OTQ2MzBmZjcwYjc1ODIzODMxYiAgbXVwZGYtMS4yMS4xLXNvdXJjZS50
YXIubHoKK3NoYTEgIGI5OTA3NzI5ZDYwNGYwYmYzODQ2YjQ1Y2Q1ODkxZTEwZDdhNjZlMjQgIG11
cGRmLTEuMjIuMC1zb3VyY2UudGFyLmx6CiAKICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAg
NjZhNDM0OTA2NzZjN2Y3YzJmZjc0MDY3MzI4ZWYxMzI4NTUwNmZjYzc1OGQzNjVhZTI3ZWEzNjY4
YmQ1ZTYyMCAgbXVwZGYtMS4yMS4xLXNvdXJjZS50YXIubHoKK3NoYTI1NiAgYmVkNzhhMGFiZjg0
OTZiMzBjNTIzNDk3MjkyZGU5NzlkYjYzM2VjYTU3ZTAyZjZjZDBmM2M3YzA0MjU1MWMzZSAgbXVw
ZGYtMS4yMi4wLXNvdXJjZS50YXIubHoKIAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgogc2hh
MjU2ICA1N2M4ZmYzM2M5YzBjZmMzZWYwMGU2NTBhMWNjOTEwZDdlZTQ3OWE4YmM1MDlmNmM5MjA5
YTdjMmExMTM5OWQ2ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1r
IGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawppbmRleCBkNmNjNDA3YzQ5Li4wODg5NGQ3OTgwIDEw
MDY0NAotLS0gYS9wYWNrYWdlL211cGRmL211cGRmLm1rCisrKyBiL3BhY2thZ2UvbXVwZGYvbXVw
ZGYubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIHB5dGhv
bi1weW11cGRmJ3MgdmVyc2lvbiBtdXN0IG1hdGNoIG11cGRmJ3MgdmVyc2lvbgotTVVQREZfVkVS
U0lPTiA9IDEuMjEuMQorTVVQREZfVkVSU0lPTiA9IDEuMjIuMAogTVVQREZfU09VUkNFID0gbXVw
ZGYtJChNVVBERl9WRVJTSU9OKS1zb3VyY2UudGFyLmx6CiBNVVBERl9TSVRFID0gaHR0cHM6Ly9t
dXBkZi5jb20vZG93bmxvYWRzL2FyY2hpdmUKIE1VUERGX0xJQ0VOU0UgPSBBR1BMLTMuMCsKQEAg
LTIyLDEyICsyMiw2IEBAIE1VUERGX0RFUEVOREVOQ0lFUyA9IFwKIAl4bGliX2xpYlgxMSBcCiAJ
emxpYgogCi0jIDAwMDItQnVnLTcwMzM2Ni1GaXgtZG91YmxlLWZyZWUtb2Ytb2JqZWN0LWR1cmlu
Zy1saW5lYXJpemF0aW9uLnBhdGNoCi1NVVBERl9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyMS0zNDA3
Ci0KLSMgMDAwMy1CdWctNzAzNzkxLVN0YXktd2l0aGluLWhhc2gtdGFibGUtbWF4LWtleS1zaXpl
LWluLWNhY2hlZC1jb2xvci1jb252ZXJ0ZXIucGF0Y2gKLU1VUERGX0lHTk9SRV9DVkVTICs9IENW
RS0yMDIxLTM3MjIwCi0KICMgVGhlIHBrZy1jb25maWcgbmFtZSBmb3IgZ3VtYm8tcGFyc2VyIGlz
IGBndW1ib2AuCiBNVVBERl9QS0dfQ09ORklHX1BBQ0tBR0VTID0gXAogCWZyZWV0eXBlMiBcCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLmhhc2ggYi9w
YWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLmhhc2gKaW5kZXggYmRhMzU2ZDkw
NS4uOWZkODE1MDA4OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24t
cHltdXBkZi5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYu
aGFzaApAQCAtMSw1ICsxLDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3Jn
L3B5cGkvcHltdXBkZi9qc29uCi1tZDUgIGJlMTA5NjM2NzlhYzZkNTJiN2FlZDIzMTFjYTdlM2M1
ICBQeU11UERGLTEuMjEuMS50YXIuZ3oKLXNoYTI1NiAgZjgxNTc0MWE0MzVjNjJhMDAzNmJiY2Jm
NWZhNmM1MzM1NjdiZDY5YzUzMzhkNDEzNzE0ZmM1N2IyMmRiOTNlMCAgUHlNdVBERi0xLjIxLjEu
dGFyLmd6CittZDUgIDQ2OGZlNTYzNzVhMWZjYTk5ZTgzZmUwYWEwYjlmOGJkICBQeU11UERGLTEu
MjIuMC50YXIuZ3oKK3NoYTI1NiAgNmUxNjk0ZTVjMGNkOGI5MmQ1MDNhNTA2ZWU4ZTRiYTFiZWQ3
Njg1MjhkZTU4Njg4OWQzZWM5MGU5ZGM0YTdkMyAgUHlNdVBERi0xLjIyLjAudGFyLmd6CiAjIExv
Y2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICA1N2M4ZmYzM2M5YzBjZmMz
ZWYwMGU2NTBhMWNjOTEwZDdlZTQ3OWE4YmM1MDlmNmM5MjA5YTdjMmExMTM5OWQ2ICBDT1BZSU5H
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLm1rIGIv
cGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24tcHltdXBkZi5tawppbmRleCA3MDQ0OGU4ZDkw
Li41MWQ5NTVkODM1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1w
eW11cGRmLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsK
QEAgLTUsOSArNSw5IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIHB5dGhvbi1weW11
cGRmJ3MgdmVyc2lvbiBtdXN0IG1hdGNoIG11cGRmJ3MgdmVyc2lvbgotUFlUSE9OX1BZTVVQREZf
VkVSU0lPTiA9IDEuMjEuMQorUFlUSE9OX1BZTVVQREZfVkVSU0lPTiA9IDEuMjIuMAogUFlUSE9O
X1BZTVVQREZfU09VUkNFID0gUHlNdVBERi0kKFBZVEhPTl9QWU1VUERGX1ZFUlNJT04pLnRhci5n
egotUFlUSE9OX1BZTVVQREZfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9w
YWNrYWdlcy8zMC80NC85ZmNlNzk2ODllNWRmN2RlZWJlMmQxN2NiMmI5YjJhNmI4ODg0MzljMjQx
ZTcxMjk2ZTczMmFlZmE2NDkKK1BZVEhPTl9QWU1VUERGX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMjgvYmEvZDZiYjZmZDY3OGU4Mzk2ZDdiOTQ0ODcwMjg2
ZmIyNWZkNmY0OTliOGNiNTk5YjU0MzZjOGY3MjVhZGJmCiBQWVRIT05fUFlNVVBERl9TRVRVUF9U
WVBFID0gc2V0dXB0b29scwogUFlUSE9OX1BZTVVQREZfTElDRU5TRSA9IEFHUEwtMy4wKwogUFlU
SE9OX1BZTVVQREZfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKLS0gCjIuMzkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
