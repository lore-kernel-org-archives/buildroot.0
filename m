Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D346EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864BF4109B;
	Sun, 24 Apr 2022 20:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GqZF2DR8Dbrh; Sun, 24 Apr 2022 20:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4A440A04;
	Sun, 24 Apr 2022 20:57:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A69A71BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A354260A92
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSaWFhAwtkd0 for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:56:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED79360A78
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:56:48 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id t4so8219618ilo.12
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WtGsnBfFtu3XSxCc5ZbCwnvQtQfuu4JcA+xEi+1v9bw=;
 b=DiCjFZfkJVp65j0FsO1V5nbkkF0ZphOxnOR7UxwZAcHXv3hCCBhMHSv/XIOCWuSLxA
 95XMv4ykX04+Mykp/DSkp+aKEru1MN1khIytVVjxSFFLjEDt9p/TMPmh+Rfs261TKsSE
 R1wB8CWKtvLMH7krDBI3u7JZTkS81RTwSwBce3x8nr3unfXzPIOwx7fuqo1AyjmvQEbP
 h9qY//DUvCpIT+gnI9MZgEyrzXrHTJzQFksaebwaZSjq6Wv2FwU01T2VthnbzxnspCRc
 xQ9eqYvbKhPhEDo6b1Wfs9pz/3A3yx/fpWQhv9/AF/Yg8RM88E6QWqG/fznMUBWMTrWx
 UeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtGsnBfFtu3XSxCc5ZbCwnvQtQfuu4JcA+xEi+1v9bw=;
 b=vcTxonY/Ut8Q23Zkx1lzmq0nRxg0QFhCJeS6CY+5pfyz15t0jDUZiNuE3wky9929jS
 4q5eCF8LfvDgDalndk9PSzroYNxygCE2QM6Cw8GfCKzfOSrKOt/jsH+jEtjuxQ+Nrz3g
 uWRg+W1YafOKJsYfMCRKmxvhuoTRn1d2iEVLD2AueHHbnQwpHWxGVkIxYeBzXjUafJ4S
 eUlyzS9X5FOCxLsJLNlU6icoaR++bTzdNEpD92vSkFo39Cb4gLVdCx7ybge6qgEFk7L0
 ZlS45rt0u5kS3X2bCb6l78ej5K9U7mvgOt0/mvW3WYhWS8hla1pyxcKm5mw37kEHniF6
 Xd+A==
X-Gm-Message-State: AOAM533RN/qKR4cjcpmpIE7ViTJpl0pAEUaB0RKtsUtQG9D8ThbVrX0y
 isF/H4aa53X3C+rFFq7ZhIKSJRnyXJfySw==
X-Google-Smtp-Source: ABdhPJxB7cW42mkmJ4QtQCefZJMprWDt6wucG07Tzv12hZHR2rUXOpllqX27779fxEcwGJToD66BMw==
X-Received: by 2002:a92:d212:0:b0:2cb:7635:9940 with SMTP id
 y18-20020a92d212000000b002cb76359940mr5472379ily.132.1650833807896; 
 Sun, 24 Apr 2022 13:56:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm5152350ilc.35.2022.04.24.13.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:56:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 14:56:36 -0600
Message-Id: <20220424205639.1618386-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424205639.1618386-1-james.hilliard1@gmail.com>
References: <20220424205639.1618386-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/5] package/pkg-python.mk: remove hardcoded
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
