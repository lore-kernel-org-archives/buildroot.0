Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533FFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 21:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3EB260A84;
	Sun, 24 Apr 2022 21:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXHXfYuCJljk; Sun, 24 Apr 2022 21:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C398860774;
	Sun, 24 Apr 2022 21:40:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 220981BF470
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FCD4401F2
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZF5G35EsScQ for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 21:40:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C89BC4002B
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 21:40:06 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id z19so9397994iof.12
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WtGsnBfFtu3XSxCc5ZbCwnvQtQfuu4JcA+xEi+1v9bw=;
 b=qiWqtz2pQErQbuhFLch/Nz8b49+n7c6WD8FuUIEzqL4oAY0H5dEOesBYic7zjTcgKU
 wNRYYwnEDmTCUPoVdlDWOGCzy0KosYKfhz/yrtJi/yg4LedMIim2r3c9UleDU4H6ZqO3
 fx3BR45j7Hxe0xzvRFpUX+Ou74Sz7/AokKczDaerwxEI/GjAigZofMvX27hUFB+c8Wrh
 7YKpoDF71yqyppniG2PGAJQVpkH/vpwtOu1zmWNYk0Nr8wL/7J5Aw5cDV274D0sXeiro
 zKMX/WMGtn/XnRvg82NLR+C+z6+jPSvaPbfm34YLXRMddXjJQcvfddrGvndGFQF56B91
 OpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtGsnBfFtu3XSxCc5ZbCwnvQtQfuu4JcA+xEi+1v9bw=;
 b=Sekcjmfo1hIWzI21RoaLlJVMcDnmvZJbmofXYrSCwOlZIjYZ5LtpfGo8byxgjy5fda
 ib6UVrCQys4r0DfhNnJLEvbHawWyTqsVzjvhLsJDOYjI6CHkGU5HjOq931XM+IWnGZEB
 lPfzbEAFTcEeHCy+0DbvOdhv4Xe6ajjFzkBMpByC+3LyLS6TSXqE3c+FMhSqhRFQ6yB2
 iT453i+4/+RmgwXKvM49rAoCMAG8+HMW7vhiYjisTKCjJmcQeG0YEFrue3GD4mS53ZPf
 OzaM1azjZMkN6oJXiRh9wuUri/nJtAglXKXsNUbst1Km9Ru48cLlIu7xY3reAuE7xwg9
 /pvA==
X-Gm-Message-State: AOAM5318McMW0X1erBsBPcTg20Si7nA9reedlRehiL/JFbZxshGANDnZ
 OExYfm02PrrF4fsfERGH2ww9s2ew/xaFdQ==
X-Google-Smtp-Source: ABdhPJygrlI9h5kaHHWDoylJk0hweWqmjgvK1JLlm4grSkU8wCOqmnwBpAF4rLDUd2tRI/0xjgpJIQ==
X-Received: by 2002:a02:234a:0:b0:32a:f07c:e8 with SMTP id
 u71-20020a02234a000000b0032af07c00e8mr564147jau.87.1650836405801; 
 Sun, 24 Apr 2022 14:40:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 o19-20020a056e0214d300b002cbec3af6casm5385084ilk.30.2022.04.24.14.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 14:40:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 15:39:55 -0600
Message-Id: <20220424213958.1747120-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424213958.1747120-1-james.hilliard1@gmail.com>
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 2/5] package/pkg-python.mk: remove hardcoded
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?=D0=A0=D0=BE=D0=BC=D0=B0=D0=BD=20=D0=94=D0=BE=D0=BD=D1=87?=
 =?UTF-8?q?=D0=B5=D0=BD=D0=BA=D0=BE?= <dpb@corrigendum.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
