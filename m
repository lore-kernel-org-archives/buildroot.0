Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337A9C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B48435DE;
	Wed, 10 Jan 2024 09:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B48435DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yBQuv_WUU0w; Wed, 10 Jan 2024 09:38:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFF1B404BF;
	Wed, 10 Jan 2024 09:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFF1B404BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 336D61BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C47C80BBD
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C47C80BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28ClDL6NOZ4L for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:38:54 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F027180BB8
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F027180BB8
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3606e211e5cso22974645ab.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 01:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704879532; x=1705484332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vFS5m7nYxQvpeJhRYn6Saa0yPLlgmd1pabNqeziYHhw=;
 b=gSiZ6XpCg/7dZ0AIMtP69ZJF9HA+TrWD1HOaHbx6pc4V1VzatPJZJHQff43bTxttET
 YyEEfVa3Q/ECX8L5kI0rKfwSQVQDaRKtgPqXxRfXqDvjfv/CCxBDnjVtNHsoyewT0Hdc
 vbc+P6nbdY8ikf0bdCy3XQZfcAnY/ovcLHjAVo2jeODylrxPef9yUzFpCMq1YNLkwYR0
 fRrPGCkRheq+niKlZBCKNirwUVRP7eTHR9Mkg3gxI3Dn7YY7pYEYGV7B/sGF+MVsyf9s
 Ock1hONsc3lMR3UhJbQA6t0VJ6UubAV8cIRsSKmiN0jR0Qvk+UcuOMtG64kzIZK6er+J
 XmlQ==
X-Gm-Message-State: AOJu0YzubKGFmhtfWvLDwtTFYMT+e9Tw1Dmc7R1bxmnpV4/k+6nY1BXa
 JXOmBAJtdSZp/bDIpZu/JhH5iltbEwZNcw==
X-Google-Smtp-Source: AGHT+IFZh2g9bQ7XHvfuI23K9l/0mEfR7QAavRnHDBQNlaDN6r7VYYd/eAisKvUYFVaae0TtEJoH2A==
X-Received: by 2002:a05:6e02:148e:b0:35d:59a2:bc4 with SMTP id
 n14-20020a056e02148e00b0035d59a20bc4mr1077015ilk.90.1704879532428; 
 Wed, 10 Jan 2024 01:38:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a05663849c900b0046d950cf82bsm1185395jab.85.2024.01.10.01.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 01:38:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 02:38:45 -0700
Message-Id: <20240110093850.2302133-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704879532; x=1705484332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vFS5m7nYxQvpeJhRYn6Saa0yPLlgmd1pabNqeziYHhw=;
 b=jW/C9nuZeyIHzEMd6WS38kHhci4kyv15Y9MJoxdN/ygUQxjRZ45PeKVxIUeR8fmhCk
 znNL//JMtLBMdcFBtYBo/eHFu/AqxcDLlhb/FSpE7xyo8cgvFf1mik3k79CQfunoPJ7e
 7a3oZWwZaYTyhAIYPmE93ki648XzxnJ1qDIK1wN2S96kd9QPFisDUDHgUCiL8ZoSqgAN
 xQMKcV0LDepTPl4wRQ0wHjzd6aPtPAq7b/zr1E1WHLQwrXAriU/AvENfbPi+L4E9jum4
 21LfFQOW8OVL2xa8O/2hzXvVtZMANzsPh1sc8o6uKzA1AAMKk7KeUbDkpQSRHO0tUDTP
 +R6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jW/C9nuZ
Subject: [Buildroot] [PATCH 1/6] package/mupdf: bump to version 1.23.8
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCB3aGljaCBpcyBub3cgdXBzdHJlYW0uCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KLS0tCiAuLi5pc3NpbmctbGltaXRz
LmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2ggfCA3MCAtLS0tLS0tLS0tLS0tLS0tLS0tCiBw
YWNrYWdlL211cGRmL211cGRmLmhhc2ggICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogcGFj
a2FnZS9tdXBkZi9tdXBkZi5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1m
b3ItVUlOVF9NQVgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmLzAwMDEtQWRkLW1p
c3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2ggYi9wYWNrYWdlL211cGRm
LzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDk1ZjJmODY2NjYuLjAwMDAwMDAwMDAKLS0tIGEv
cGFja2FnZS9tdXBkZi8wMDAxLUFkZC1taXNzaW5nLWxpbWl0cy5oLWluY2x1ZGUtZm9yLVVJTlRf
TUFYLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNzAgKzAsMCBAQAotRnJvbSBlYmNlOWYxYjEy
OWViYzhmMmIxN2FmYTAyYTRmZmNiOTQ1M2MxMWQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogPT9VVEYtOD9xP1JhcGhhPUMzPUFCbD0yME09QzM9QTlsb3R0ZT89IDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KLURhdGU6IE1vbiwgMjQgQXByIDIwMjMgMTc6Mjc6MzUgKzAyMDAKLVN1
YmplY3Q6IFtQQVRDSF0gQWRkIG1pc3NpbmcgbGltaXRzLmggaW5jbHVkZSBmb3IgVUlOVF9NQVgK
LU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotZW5jb2RlLWJhc2ljLmMgdXNl
cyAnVUlOVF9NQVgnLCB3aGljaCBpcyBhdmFpbGFibGUgaW4gdGhlICdsaW1pdHMuaCcKLWhlYWRl
ci4KLQotSW4gc29tZSBjb25maWd1cmF0aW9ucyB0aGF0IGJ1aWxkIHdpdGggemxpYiBmcm9tIFsx
XSwgYnkgY2hhbmNlCi1saW1pdHMuaCBnZXRzIGluZGlyZWN0bHkgaW5jbHVkZWQgd2hlbiBpbmNs
dWRpbmcgJ3otaW1wLmgnICh0aGUKLWluY2x1ZGVzIGFyZTogJ3otaW1wLmgnIC0+ICd6bGliLmgn
IC0+ICd6Y29uZi5oJyAtPiAnbGltaXRzLmgnKSwgc28KLXRoZSBidWlsZCBzdWNjZWVkcy4KLQot
V2hlbiB1c2luZyBvdGhlciB6bGliIGltcGxlbWVudGF0aW9ucyBob3dldmVyIChmb3IgZXhhbXBs
ZSBmcm9tIFsyXSksCi1saW1pdHMuaCBpcyBub3QgbmVjZXNzYXJpbHkgaW5jbHVkZWQgaW5kaXJl
Y3RseSwgd2hpY2ggbGVhZHMgdG8gdGhlCi1idWlsZCBmYWlsaW5nIGluIHRoZSBmb2xsb3dpbmcg
d2F5OgotCi1zb3VyY2UvZml0ei9lbmNvZGUtYmFzaWMuYzogSW4gZnVuY3Rpb24gJ2RlZmxhdGVf
d3JpdGUnOgotc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmM6MzQzOjI3OiBlcnJvcjogJ1VJTlRf
TUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKLSAgMzQzIHwgICAg
ICAgICBuZXdidWZzaXplID0gbiA+PSBVSU5UX01BWCA/IFVJTlRfTUFYIDogZGVmbGF0ZUJvdW5k
KCZzdGF0ZS0+eiwgbik7Ci0gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn4KLXNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOjI2OjE6IG5vdGU6ICdVSU5UX01BWCcgaXMg
ZGVmaW5lZCBpbiBoZWFkZXIgJzxsaW1pdHMuaD4nOyBkaWQgeW91IGZvcmdldCB0byAnI2luY2x1
ZGUgPGxpbWl0cy5oPic/Ci0KLUFkZCB0aGUgbWlzc2luZyBpbmNsdWRlLCBzbyB0aGF0IHRoZSBi
dWlsZCBzdWNjZWVkcyBubyBtYXR0ZXIgaWYgemxpYgotaW5kaXJlY3RseSBpbmNsdWRlcyAnbGlt
aXQuaCcgb3Igbm90LgotCi1TaW1pbGFybHksIGFsc28gYWRkIGl0IGluIG91dHB1dC1wcy5jIHdo
ZXJlIGl0J3MgYWxzbyBtaXNzaW5nLgotCi1bMV06IGh0dHBzOi8vemxpYi5uZXQvCi1bMl06IGh0
dHBzOi8vZ2l0aHViLmNvbS96bGliLW5nL3psaWItbmcKLQotU2lnbmVkLW9mZi1ieTogUmFwaGHD
q2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotVXBzdHJlYW06IGh0dHBzOi8v
YnVncy5naG9zdHNjcmlwdC5jb20vc2hvd19idWcuY2dpP2lkPTcwNjY2NwotLS0tCi0gc291cmNl
L2ZpdHovZW5jb2RlLWJhc2ljLmMgfCAyICsrCi0gc291cmNlL2ZpdHovb3V0cHV0LXBzLmMgICAg
fCAyICsrCi0gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBh
L3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jIGIvc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMK
LWluZGV4IDAzYTRmZjc2Yi4uODRmMGMzNWU2IDEwMDY0NAotLS0tIGEvc291cmNlL2ZpdHovZW5j
b2RlLWJhc2ljLmMKLSsrKyBiL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jCi1AQCAtMjQsNiAr
MjQsOCBAQAotIAotICNpbmNsdWRlICJ6LWltcC5oIgotIAotKyNpbmNsdWRlIDxsaW1pdHMuaD4K
LSsKLSBzdHJ1Y3QgYWh4Ci0gewotIAlmel9vdXRwdXQgKmNoYWluOwotZGlmZiAtLWdpdCBhL3Nv
dXJjZS9maXR6L291dHB1dC1wcy5jIGIvc291cmNlL2ZpdHovb3V0cHV0LXBzLmMKLWluZGV4IGVm
MjJjM2NkNi4uM2RjOGVhMTdkIDEwMDY0NAotLS0tIGEvc291cmNlL2ZpdHovb3V0cHV0LXBzLmMK
LSsrKyBiL3NvdXJjZS9maXR6L291dHB1dC1wcy5jCi1AQCAtMjQsNiArMjQsOCBAQAotIAotICNp
bmNsdWRlICJ6LWltcC5oIgotIAotKyNpbmNsdWRlIDxsaW1pdHMuaD4KLSsKLSB0eXBlZGVmIHN0
cnVjdCBwc19iYW5kX3dyaXRlcl9zCi0gewotIAlmel9iYW5kX3dyaXRlciBzdXBlcjsKLS0tIAot
Mi4zOS4xCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaCBiL3BhY2thZ2Uv
bXVwZGYvbXVwZGYuaGFzaAppbmRleCAxZjYzNjA5N2VkLi44YWNkOWFmYThhIDEwMDY0NAotLS0g
YS9wYWNrYWdlL211cGRmL211cGRmLmhhc2gKKysrIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNo
CkBAIC0xLDggKzEsOCBAQAogIyBGcm9tIGh0dHBzOi8vbXVwZGYuY29tL2Rvd25sb2Fkcy9pbmRl
eC5odG1sOgotc2hhMSAgYjk5MDc3MjlkNjA0ZjBiZjM4NDZiNDVjZDU4OTFlMTBkN2E2NmUyNCAg
bXVwZGYtMS4yMi4wLXNvdXJjZS50YXIubHoKK3NoYTEgIGJmZjI5NDUyZWIzMGU0NzdlNTQzMTk2
OTcxOTM2ODc0NDU0ZmY5ZDUgIG11cGRmLTEuMjMuOC1zb3VyY2UudGFyLmx6CiAKICMgTG9jYWxs
eSBjb21wdXRlZDoKLXNoYTI1NiAgYmVkNzhhMGFiZjg0OTZiMzBjNTIzNDk3MjkyZGU5NzlkYjYz
M2VjYTU3ZTAyZjZjZDBmM2M3YzA0MjU1MWMzZSAgbXVwZGYtMS4yMi4wLXNvdXJjZS50YXIubHoK
K3NoYTI1NiAgOTM3M2ZjMjkzZTBhZTE4ZDg3ZDMwMmQ3NGEzZGIwNzE0NjI2MThlOWEwYjYwYWUy
OWMyMTMyZTYzNmFjMTU1NCAgbXVwZGYtMS4yMy44LXNvdXJjZS50YXIubHoKIAogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICA1N2M4ZmYzM2M5YzBjZmMzZWYwMGU2NTBhMWNjOTEw
ZDdlZTQ3OWE4YmM1MDlmNmM5MjA5YTdjMmExMTM5OWQ2ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9w
YWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawppbmRleCAwODg5
NGQ3OTgwLi5kNDYyYTJlNDgxIDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRmL211cGRmLm1rCisr
KyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwogCiAjIHB5dGhvbi1weW11cGRmJ3MgdmVyc2lvbiBtdXN0IG1hdGNoIG11cGRm
J3MgdmVyc2lvbgotTVVQREZfVkVSU0lPTiA9IDEuMjIuMAorTVVQREZfVkVSU0lPTiA9IDEuMjMu
OAogTVVQREZfU09VUkNFID0gbXVwZGYtJChNVVBERl9WRVJTSU9OKS1zb3VyY2UudGFyLmx6CiBN
VVBERl9TSVRFID0gaHR0cHM6Ly9tdXBkZi5jb20vZG93bmxvYWRzL2FyY2hpdmUKIE1VUERGX0xJ
Q0VOU0UgPSBBR1BMLTMuMCsKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
