Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBE8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 22:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49C75408C1;
	Wed,  6 Apr 2022 22:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6q1l0rJ-x03h; Wed,  6 Apr 2022 22:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7361A40914;
	Wed,  6 Apr 2022 22:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3337F1BF9D1
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22DE783E2F
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 22:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsGN8tO38Alb for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 22:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79C9C83E19
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 22:29:13 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id d3so2964729ilr.10
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WtGsnBfFtu3XSxCc5ZbCwnvQtQfuu4JcA+xEi+1v9bw=;
 b=NQ6BfQOxGwuTxDO3L/tDm7uvWMJRoOYyONC+daLe63Q4n8GzBnQMyOsBLKiLACZ2uF
 O32x6ndVgTNylKCLIjGCkSz4jBlpImrPWvUt1NqDeh8pfXSPBcwnT4zqP2fqolRhYA3n
 MWWP7SYbE4oA/nvNFkR7CT0LmivWbowVHEevgXiwNGbS5PeLwm9t2Gq1reMeXn3Ywwjr
 rXuCXu0atcKXGtCDlNHHHW33xIxjNP/A9EdIfjsC+OIdmuFtLr+CjQf8mLdksqUdSocs
 odvobHkWWIln5ADpXNH19LWAQp0w2E+jcs81+e7fKhayH3A5p8omueSIWnG7S63ILze0
 i1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtGsnBfFtu3XSxCc5ZbCwnvQtQfuu4JcA+xEi+1v9bw=;
 b=BABgAbH7RK0ZllGn+dGnSZhZGzA6OgHYxh2dXe1k7+VcZVwkTFGMeY2eqsxbFnnafz
 yCZRJEaeuSw9sajQmzxvlzSvckydOf2JZgmJB9PC+209Z6JQ+HK0J4H962u0LM8MlqNI
 qUnEo6nJWrKpqE31U2VXBqLOBqxMGjCZZ6L1r0EIE5lhcyg02EeB29QgfNLKt+jZD172
 ONSANBJryptdBvHJba6OPimVLs00xOVEBBrEQTy2UZNkhez+f4quQKYhA+C5TSolCF0u
 wECP7qLWzWgmHllfSZSCoTuj2ha72NqtYfNpjTd/eIzpcFgOD+Gfnz72u/zsS3DbUktr
 yssQ==
X-Gm-Message-State: AOAM533rgpVZELUh5wHEpDhlDSM25vH2MNmYZQA+TLKQoWFCXG36ECuh
 PhEiMCeS5NB/Bq7891BcnTNG8vn+CFaMsQ==
X-Google-Smtp-Source: ABdhPJwedulrSyEqAT9HqsyNQ+mW4Bnyor/ZZVRUwUAma8rxRfA2B9xhpK5qQ05iyAkgg7YN0JcJPQ==
X-Received: by 2002:a05:6e02:1447:b0:2ca:4eb3:4881 with SMTP id
 p7-20020a056e02144700b002ca4eb34881mr5092234ilo.109.1649284151842; 
 Wed, 06 Apr 2022 15:29:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 d15-20020a92d78f000000b002ca4c409d1asm5389739iln.83.2022.04.06.15.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 15:29:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 16:29:04 -0600
Message-Id: <20220406222904.421610-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406222904.421610-1-james.hilliard1@gmail.com>
References: <20220406222904.421610-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/2] package/pkg-python.mk: remove hardcoded
 paths for host Python
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?=D0=A0=D0=BE=D0=BC=D0=B0=D0=BD=20=D0=94=D0=BE=D0=BD=D1=87?=
 =?UTF-8?q?=D0=B5=D0=BD=D0=BA=D0=BE?= <dpb@corrigendum.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTog0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+IDxkcGJAY29ycmlnZW5kdW0ucnU+CgpX
aGVuIGluc3RhbGxlciBpcyB1c2VkIHRvIGluc3RhbGwgcGFja2FnZXMgZm9yIGhvc3QgUHl0aG9u
LCBpdCBjYW4gZmlndXJlCm91dCBieSBpdHNlbGYgd2hpY2ggcGF0aHMgdG8gdXNlLiBXZSBqdXN0
IG5lZWQgdG8gdXNlIHRoZSBpbnN0YWxsZXIgQ0xJCmluc3RlYWQgb2Ygb3VyIHdyYXBwZXIgc2Ny
aXB0LgoKU2lnbmVkLW9mZi1ieTog0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+IDxkcGJAY29y
cmlnZW5kdW0ucnU+ClNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPgotLS0KQ2hhbmdlcyB2NCAtPiB2NToKICAtIGFkZCByZWJhc2VkIHJlbW92
ZSBoYXJkY29kZWQgcGF0aHMgcGF0Y2gKLS0tCiBwYWNrYWdlL3BrZy1weXRob24ubWsgfCAxMiAr
Ky0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLXB5dGhvbi5tayBiL3BhY2thZ2UvcGtnLXB5
dGhvbi5tawppbmRleCAyZTc3MDRhMGE5Li4xNTQ4MTBlMWNjIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3BrZy1weXRob24ubWsKKysrIGIvcGFja2FnZS9wa2ctcHl0aG9uLm1rCkBAIC0xNDYsMTQgKzE0
Niw2IEBAIEhPU1RfUEtHX1BZVEhPTl9QRVA1MTdfRU5WID0gXAogCVBZVEhPTk5PVVNFUlNJVEU9
MSBcCiAJJChIT1NUX0NPTkZJR1VSRV9PUFRTKQogCi1IT1NUX1BLR19QWVRIT05fUEVQNTE3X0lO
U1RBTExfT1BUUyA9IFwKLQktLWludGVycHJldGVyPS9iaW4vcHl0aG9uIFwKLQktLXNjcmlwdC1r
aW5kPXBvc2l4IFwKLQktLXB1cmVsaWI9JChIT1NUX0RJUikvbGliL3B5dGhvbiQoUFlUSE9OM19W
RVJTSU9OX01BSk9SKS9zaXRlLXBhY2thZ2VzIFwKLQktLWhlYWRlcnM9JChIT1NUX0RJUikvaW5j
bHVkZS9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikgXAotCS0tc2NyaXB0cz0kKEhPU1Rf
RElSKS9iaW4gXAotCS0tZGF0YT0kKEhPU1RfRElSKQotCiBIT1NUX1BLR19QWVRIT05fUEVQNTE3
X0JPT1RTVFJBUF9JTlNUQUxMX09QVFMgPSBcCiAJLS1pbnN0YWxsZGlyPSQoSE9TVF9ESVIpL2xp
Yi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikvc2l0ZS1wYWNrYWdlcwogCkBAIC0yMjUs
MTEgKzIxNywxMSBAQCBpZmVxICgkKDEpLGhvc3QtcHl0aG9uLWZsaXQtY29yZSkKICMKICQoMilf
QkFTRV9JTlNUQUxMX0NNRCA9IC1tIGJvb3RzdHJhcF9pbnN0YWxsIGRpc3QvKiAkJChIT1NUX1BL
R19QWVRIT05fUEVQNTE3X0JPT1RTVFJBUF9JTlNUQUxMX09QVFMpCiBlbHNlCi0kKDIpX0JBU0Vf
SU5TVEFMTF9DTUQgPSAkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL3B5aW5zdGFsbGVyLnB5IGRp
c3QvKiAkJChIT1NUX1BLR19QWVRIT05fUEVQNTE3X0lOU1RBTExfT1BUUykKKyQoMilfQkFTRV9J
TlNUQUxMX0NNRCA9IC1tIGluc3RhbGxlciBkaXN0LyoKIGVuZGlmCiBlbHNlCiAkKDIpX0JBU0Vf
QlVJTERfQ01EID0gLW0gYnVpbGQgLW4gLXcKLSQoMilfQkFTRV9JTlNUQUxMX0NNRCA9ICQoVE9Q
RElSKS9zdXBwb3J0L3NjcmlwdHMvcHlpbnN0YWxsZXIucHkgZGlzdC8qICQkKEhPU1RfUEtHX1BZ
VEhPTl9QRVA1MTdfSU5TVEFMTF9PUFRTKQorJCgyKV9CQVNFX0lOU1RBTExfQ01EID0gLW0gaW5z
dGFsbGVyIGRpc3QvKgogZW5kaWYKIGVuZGlmCiBlbHNlCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
