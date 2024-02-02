Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568DAC4828E
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 09:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C386FA5B;
	Fri,  2 Feb 2024 09:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C386FA5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5PiNwUrT7Nv; Fri,  2 Feb 2024 09:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE756FA8B;
	Fri,  2 Feb 2024 09:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE756FA8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0540C1BF39D
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDEDF42E60
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDEDF42E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2IbXaqc-QzA for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 09:36:33 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B97CA42E4B
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 09:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97CA42E4B
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2cf328885b4so23816071fa.3
 for <buildroot@buildroot.org>; Fri, 02 Feb 2024 01:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706866590; x=1707471390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bCqZt8vSNvLPN/cDKclg4YvMpXsfNyRV1TR2FSilFwM=;
 b=f/PpQR8o4U8y9dkkhEeGR2TS1+HRY6aSFh+hPcptwT3WXd0Mvxu2s6a7k2sF6Z9Bh2
 yj8O9W4bpGqLTh8Ys54JjaVlX79/uuPa+6yTOqlUte4IDeesqWYyR1ohFTvMhFAR14ni
 WuRDFgf87XgLcMvN6eywg27noVXgl9iIbBsPoAN8BiEqRFy7zcv5wlpvYF16w57zHFVM
 kJhJNUxVLx2po6EHXIdGQ3E2+lVkInFjSUxK7v820vcIGtE142zhOVMX9wfZ2ncJNQ5J
 HnnyfvSLDTrXKjRkzuMLzyXJYCXKhMZj4lEXwmpHBDvjQMjImR8/ZP5W9R5UXAXwneUN
 a07w==
X-Gm-Message-State: AOJu0YyB2UA45GfX0YngmYyKuQktVxZgnLMCSqMrD/yLn/vu2O2Du2wf
 L2ZEQ/WLnzToFIpcsoINvYKnybCVVW9bvsL4ZwTf+PKlUadZSWRLYL2bdCGUtDymv5dJ62e6XDh
 oE8EQxA==
X-Google-Smtp-Source: AGHT+IFTRqEdjguGk4pOPoawu94DY8ieNL7F+hkcpTQqMkNajRLMKYH2+AzKYhJnaQ09TwzQMo71dg==
X-Received: by 2002:a2e:bc29:0:b0:2d0:4c36:8cba with SMTP id
 b41-20020a2ebc29000000b002d04c368cbamr6217121ljf.0.1706866589663; 
 Fri, 02 Feb 2024 01:36:29 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWartdkZqK20FJC6POcRBf7crZDw+7W+SetujDWh1bqgsg1y2CuDzZtCwbdZDiitPSwLtXQXO4/uVACMYqPg2N5cGFjfHp3vgsVOBHWyXxcgJbw3lCdeo4bczLvaaXzM//9Q+9AOdcnw1E4j0x4nFYBoQxpaWSdR/Jr
Received: from localhost.localdomain ([80.215.186.96])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfe941000000b0033ae6fa7f20sm1504615wrn.65.2024.02.02.01.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 01:36:29 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 10:36:18 +0100
Message-Id: <20240202093625.1409559-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706866590; x=1707471390;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bCqZt8vSNvLPN/cDKclg4YvMpXsfNyRV1TR2FSilFwM=;
 b=ZWa9mZF0KLTX4EPCPQbcEs4469GrdZn/irBosonuIBtQ196NNOWROZYZKSFJsODLGO
 QfmQCBEex8F0SlS5suv54Usb3LCLDkgJ7Y4T//FC0/58bpMeOf9+1HscIw8jbrNRNxjS
 EatjAEosukhg9H0PQ210/672Qj3aU1Tiqdr2OrKaP/PTxVjQ7Ds8Jwa6YyCOdABxaQK5
 L63hWqmKIJSDux2t2eG2O0xo65kUbd/kDJrRkQroa+qKr5TUfH3zLYr3qXOgYPTux/po
 Ou5FlR1e7Tdj5iRIMhJ7OT/Ef3Qhp5M8WlMxaWFDVC7/JmY1yFzOdQ2aNQNwKE+LN/Co
 OgYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZWa9mZF0
Subject: [Buildroot] [PATCH v4 0/7] Adding RustiCL
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
Cc: sebastian.weyer@smile.fr, Antoine Coutant <antoine.coutant@smile.fr>,
 bernd@kuhls.net, romain.naour@smile.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UnVzdGlDTCByZXF1aXJlcyBtZXNvbiA+PSAxLjIuMSBhbmQgd2lsbCBzb29uIHJlcXVpcmUgbWVz
b24gPj0gMS4zLjEKKHdoZW4gbWVzYSB3aWxsIGJlIHVwZ3JhZGVkIHRvIHZlcnNpb24gMjQuMC54
KS4gVGhlIHByb2JsZW1zIHRoYXQKYXBwZWFyZWQgd2l0aCBob3N0LXFlbXUgZG9uJ3QgZXhpc3Qg
YW55bW9yZS4gU28sIEkgdGhpbmsgdGhhdCBtZXNvbgptdXN0IGJlIHVwZ3JhZGVkLgoKV2hpbGUg
dGVzdGluZyBSdXN0aUNMIG9uIHRoZSBraGFkYXMgdmltMywgSSBlbmNvdW50ZXJlZCBhIHByb2Js
ZW0Kd2l0aCBtZXNhIGNsYyBjcm9zcy1jb21waWxhdGlvbiBhbmQgbWFkZSBhIG1lcmdlIHJlcXVl
c3QgdGhhdCBqdXN0CmdvdCBhY2NlcHRlZC4gVGhlIDMgYWRkZWQgcGF0Y2hlcyBhcmUgZnJvbSB0
aGlzIE1SLgooaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdl
X3JlcXVlc3RzLzI1NTY4LikgIAoKVGhpcyBuZXcgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggc2VyaWVz
IGNoYW5nZXMgdGhlIHdheSBPcGVuQ0wgaXMKc2VsZWN0ZWQuIFdoZW4gYW4gaW1wbGVtZW50YXRp
b24gaXMgYXZhaWxhYmxlIChDbG92ZXIgb3IgUnVzdGljbCksCmEgbWVudWNvbmZpZyBhcHBlYXJz
LiBUaGVuLCBpdCBpcyBwb3NzaWJsZSB0byBzZWxlY3QgQ2xvdmVyIGFuZC9vcgpSdXN0aUNMLiBC
b3RoIGNhbiBiZSBzZWxlY3RlZCBhdCB0aGUgc2FtZSB0aW1lIHRoYW5rcyB0bwpPcGVuQ0wtSUNE
LUxvYWRlci4KClJ1c2l0Q0wgaGF2ZSBiZWVuIHRlc3RlZCBvbiB0aGUga2hhZGFzIHZpbSAzLiBV
c2luZwrigJxraGFkYXNfdmltM19kZWZjb25maWfigJ0gd2l0aCBib290bGluIHRvb2xjaGFpbgri
gJxhYXJjaDY0IGdsaWJjIGJsZWVkaW5nLWVkZ2UgMjAyMy4xMS0x4oCdLgoKSSBob3BlIHRoYXQg
dGhpcyBzZXJpZXMgd2lsbCBiZSBtZXJnZWQgZHVyaW5nIHRoZSBGT1NERU0gYnVpbGRyb290Cm1l
ZXRpbmcuIEluZGVlZCwgSSdtIG5vdCBzdXJlIHRoYXQgSSB3aWxsIGhhdmUgdGltZSB0byB3b3Jr
IG9uCnRoaXMgYWZ0ZXIgdGhlIDV0aCBvZiBtYXJjaC4KCkFsc28sIEkgd3JvdGUgYW4gYXJ0aWNs
ZSBpbiBGcmVuY2ggdG8gZXhwbGFpbiBob3cgUnVzdGlDTCB3b3Jrcy4KSXQgY2FuIGFsbG93IChG
cmVuY2ggc3BlYWtlcnMpIHRvIHVuZGVyc3RhbmQgd2hhdCBpdCBkb2VzIGFuZCB3aHkKaXQgcmVx
dWlyZXMgaXRzIGRlcGVuZGVuY2llcy4KaHR0cHM6Ly93d3cubGludXhlbWJlZGRlZC5mci8yMDI0
LzAxL2ludHJvZHVjdGlvbi1hLW9wZW5jbC1ldC1ydXN0aWNsIAoKQW50b2luZSBDb3V0YW50ICgy
KToKICBwYWNrYWdlL21lc29uOiBidW1wIHZlcnNpb24gdG8gMS4zLjEKICBwYWNrYWdlL2xsdm0t
cHJvamVjdDogYWRkIG9wZW5jbC1jLWJhc2UuaCBvbiB0YXJnZXQKClJvbWFpbiBOYW91ciAoMyk6
CiAgcGFja2FnZS9wa2ctbWVzb24ubWs6IGFkZCBydXN0IGNyb3NzLWNvbXBpbGVyIHN1cHBvcnQK
ICBwYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcjogYWRkIHRhcmdldCB2YXJpYW50IHRvIHBy
b3ZpZGUKICAgIExMVk1TUElSVkxpYgogIHBhY2thZ2UvbWVzYTNkOiBhZGQgUnVzdGlDTCBzdXBw
b3J0CgpTZWJhc3RpYW4gV2V5ZXIgKDIpOgogIHBhY2thZ2Uvb3BlbmNsLWhlYWRlcnM6IG5ldyBw
YWNrYWdlCiAgcGFja2FnZS9vcGVuY2wtaWNkLWxvYWRlcjogbmV3IHBhY2thZ2UKCiBERVZFTE9Q
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArCiBwYWNrYWdlL2xsdm0t
cHJvamVjdC9jbGFuZy9jbGFuZy5tayAgICAgICAgICAgfCAgOSArKwogLi4ubmNsLWV4dGVybmFs
LWNsYW5nLWhlYWRlcnMtb3B0aW9uLWFuLnBhdGNoIHwgNzIgKysrKysrKysrKysrKysrKwogLi4u
b3ItZXZlcnktdXNlci13aGVuLXVzaW5nLXNoYXJlZC1MTFZNLnBhdGNoIHwgNDAgKysrKysrKysr
CiAuLi5sYy1yZXRyaWV2ZS1saWJjbGFuZy1wYXRoLWF0LXJ1bnRpbWUucGF0Y2ggfCA4NiArKysr
KysrKysrKysrKysrKysrCiBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gICAgICAgICAgICAgICAg
ICAgICAgfCA1MCArKysrKysrKystLQogcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rICAgICAgICAg
ICAgICAgICAgICAgIHwgMTggKysrLQogLi4uZGVuY2llcy1iYXNlLnB5LWFkZC1wa2dfY29uZmln
X3N0YXRpLnBhdGNoIHwgMjkgKysrKy0tLQogcGFja2FnZS9tZXNvbi9tZXNvbi5oYXNoICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0KIHBhY2thZ2UvbWVzb24vbWVzb24ubWsgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL29wZW5jbC1oZWFkZXJzL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgfCAgNyArKwogcGFja2FnZS9vcGVuY2wtaGVhZGVycy9vcGVuY2wtaGVhZGVy
cy5oYXNoICAgIHwgIDMgKwogcGFja2FnZS9vcGVuY2wtaGVhZGVycy9vcGVuY2wtaGVhZGVycy5t
ayAgICAgIHwgMjIgKysrKysKIHBhY2thZ2Uvb3BlbmNsLWljZC1sb2FkZXIvQ29uZmlnLmluICAg
ICAgICAgICB8IDEyICsrKwogLi4uL29wZW5jbC1pY2QtbG9hZGVyL29wZW5jbC1pY2QtbG9hZGVy
Lmhhc2ggIHwgIDMgKwogLi4uL29wZW5jbC1pY2QtbG9hZGVyL29wZW5jbC1pY2QtbG9hZGVyLm1r
ICAgIHwgMTkgKysrKwogcGFja2FnZS9wa2ctbWVzb24ubWsgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTMgKysrCiBwYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci9Db25maWcuaW4gICAg
ICAgfCAyMiArKysrKwogLi4uL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci5tayAgICAgICAgICAgICAg
ICAgIHwgMTIgKystCiBzdXBwb3J0L21pc2MvY3Jvc3MtY29tcGlsYXRpb24uY29uZi5pbiAgICAg
ICAgfCAgNCArLQogMjEgZmlsZXMgY2hhbmdlZCwgNDA2IGluc2VydGlvbnMoKyksIDI2IGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzYTNkLzAwMDYtbWVzb24tcmVt
b3ZlLW9wZW5jbC1leHRlcm5hbC1jbGFuZy1oZWFkZXJzLW9wdGlvbi1hbi5wYXRjaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzYTNkLzAwMDctY2xjLWZvcmNlLWZQSUMtZm9yLWV2ZXJ5
LXVzZXItd2hlbi11c2luZy1zaGFyZWQtTExWTS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvbWVzYTNkLzAwMDgtY2xjLXJldHJpZXZlLWxpYmNsYW5nLXBhdGgtYXQtcnVudGltZS5w
YXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbmNsLWhlYWRlcnMvQ29uZmlnLmlu
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaGVhZGVycy9vcGVuY2wtaGVhZGVy
cy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaGVhZGVycy9vcGVuY2wt
aGVhZGVycy5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbmNsLWljZC1sb2FkZXIv
Q29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaWNkLWxvYWRlci9v
cGVuY2wtaWNkLWxvYWRlci5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wt
aWNkLWxvYWRlci9vcGVuY2wtaWNkLWxvYWRlci5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2Uvc3BpcnYtbGx2bS10cmFuc2xhdG9yL0NvbmZpZy5pbgoKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
