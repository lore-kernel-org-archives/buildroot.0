Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5693AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 11:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6DA6830E6;
	Wed, 20 Apr 2022 11:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JZFYX2ZZGnZ; Wed, 20 Apr 2022 11:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2ED982443;
	Wed, 20 Apr 2022 11:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 537921BF5A3
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 11:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41A1782443
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 11:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3-lnloCwXmv for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 11:24:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90F3C823C6
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:24:43 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id k23so2885241ejd.3
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=3Llu98XqvkZ0uePvRemlk91DC4tKTSewTOoJ42Arw3I=;
 b=Uj/zd/DMSOFkxfJe2blHcz0XsM0kt/gGOJdfTXGDZxq8M9x678by58LIFF8iBHVTzM
 r+fqarXTCfY+6HCwpBv+fRsTTea+idYagFBIMwbgA2Af9zXeq61hoAIyBLYbbHvtYZJ0
 ZbaPIA7SEEO5Nw5QWus+fUvMeKAtLuf3lTPczs67Pja1/qz+f53DZeLqXCj6HM/v2yfE
 caWFE9ayY3/We0gRUfwj/ZWKa5LGaXIXXudw00eHzQhuW+FcsY0hsxCcVZJzAgH65Rcq
 oVKgd981dB7JwZVT4ZQYiy8r8ohzUOxWsyUayhjgHH3KQqYqr1lnKu5xbClO7GfXpxOA
 XkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=3Llu98XqvkZ0uePvRemlk91DC4tKTSewTOoJ42Arw3I=;
 b=uJ74Xqj2mP53lW3cyDiPIqLV/KNp+OpE8yGqP0Ft/5NF0Y/uXiUJYnkx4fB7NQ+7Jv
 XetRSx7rjF9U5KXCbZiOvc/leBWLfmhXoIUrisV7itaU2HiRAyIYrSGT34hyzvSXgY92
 B4Hj6XHomGO5HGA+VVduKK/+IdFjf4uHjUq7o+u6XPl9stv5DhkknUjzWKeOqbBXtZ68
 V50dEvp7mcTw8b3SueGwSvqNd7qWJ10vGnak1XNAi58az/AbstAryG+xmKqXC0FuiG5i
 VXVEyOlK55XbGbaSmjMdEf+Uoe1XinTLprdmfVnv2ZqOGJQZvk+Mzn8IzFGE+Flz/4dK
 Eglw==
X-Gm-Message-State: AOAM533CKavUQbWZScxHukTCQ/O9yUVRzZviH58inp9YbCiFBAIPsE5Q
 kjCljQgQ5oXpQsfR5ZwhRQT6G3yIh7rj79MV2/JslngKV5/imw==
X-Google-Smtp-Source: ABdhPJwtxOucbpUUjiLyb533/2unMMo5HGsVi/ft10Sf5bE5FaskTqPlqM8abUUjcW6226mB5gA/9uBsMDcrQKFOEpU=
X-Received: by 2002:a17:906:1692:b0:6e8:d245:44a9 with SMTP id
 s18-20020a170906169200b006e8d24544a9mr17835374ejd.639.1650453881218; Wed, 20
 Apr 2022 04:24:41 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Wed, 20 Apr 2022 12:24:30 +0100
Message-ID: <CAEXMXLSfJb_POn6fxsg1Gwi7odHx0yj9LWN4XQ_mc9epsi=dsg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATCH] package/gcc: don't install
 libstdc++.so.a.b.c-gdb.py
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGlic3RkYysrLnNvLmEuYi5jLWdkYi5weSBpcyBub3QgcmVxdWlyZWQgYW5kIGluIGFueSBjYXNl
IGl0IGlzIGN1cnJlbnRseQp1c2luZyBob3N0IHBhdGhzIGFuZCBzbyBub3QgZnVuY3Rpb25hbC4K
ClNpZ25lZC1vZmYtYnk6IE51bm8gR29uw6dhbHZlcyA8bnVub2pwZ0BnbWFpbC5jb20+Ci0tLQog
cGFja2FnZS9nY2MvZ2NjLWZpbmFsL2djYy1maW5hbC5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MvZ2NjLWZpbmFsL2djYy1m
aW5hbC5tawpiL3BhY2thZ2UvZ2NjL2djYy1maW5hbC9nY2MtZmluYWwubWsKaW5kZXggYWE4ODNi
ZWI3Yi4uNTAxOGYzYTZjMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9nY2MvZ2NjLWZpbmFsL2djYy1m
aW5hbC5taworKysgYi9wYWNrYWdlL2djYy9nY2MtZmluYWwvZ2NjLWZpbmFsLm1rCkBAIC0xOTks
NiArMTk5LDcgQEAgZW5kZWYKCiBpZmVxICgkKEJSMl9TVEFUSUNfTElCUyksKQogZGVmaW5lIEhP
U1RfR0NDX0ZJTkFMX0lOU1RBTExfU0hBUkVEX0xJQlMKKyBybSAtZiAkKEhPU1RfR0NDX0ZJTkFM
X0dDQ19MSUJfRElSKS9saWJzdGRjKysuc28qLWdkYi5weSA7IFwKICBmb3IgaSBpbiAkKEhPU1Rf
R0NDX0ZJTkFMX1VTUl9MSUJTKSA7IGRvIFwKICBjcCAtZHBmICQoSE9TVF9HQ0NfRklOQUxfR0ND
X0xJQl9ESVIpLyQke2l9LnNvKiBcCiAgJChTVEFHSU5HX0RJUikvdXNyL2xpYi8gOyBcCi0tIAoy
LjMyLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
