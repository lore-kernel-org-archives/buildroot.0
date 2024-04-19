Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CAEC4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D84941ABD;
	Fri, 19 Apr 2024 21:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr2tgRSNi6tD; Fri, 19 Apr 2024 21:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71A5041ACC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71A5041ACC;
	Fri, 19 Apr 2024 21:32:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 945511BF977
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809BF41E57
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdwL8ziRsDoD for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6438041E56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6438041E56
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6438041E56
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:32:29 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso4147108a12.3
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713562347; x=1714167147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YtdkjfRUgKDB5qjpyxdfO9xycZqVJyyELhdSf1/KVo=;
 b=RLQWCHcrXNmpvfEy1ayxlPsBxIuSalFvKD1TOBld6MLStZDREXx7JpOU4qDEqNh6Cg
 lyvCZjc8IYU4OZvl0malwBVXY/F089VUfIHoaS27iq5fvB/rVf0BqLkMv2DLDfW+KzvM
 tsxUeDOSDyJwA7xz9dSJX1pVWADxarBZtlphbG1exPRhH64NFDsaHutXg67ekPg9I77I
 mUX/6LwUInqwa4IMSDV11bWZhHSU5sx3bGtpjLXFLm43SeOJZz/LwivxCKC0Rcpldvz7
 fNs79XrZAkqrDMlwtauj9w7wJvIfOJP2ZWqdAGdvutcKWC4zbyYk1yvMA2SqmIqgaZ7E
 M5Tw==
X-Gm-Message-State: AOJu0YzI5p1KzzrEAucxUsJzTILAeFrvbbjoIyDY5NC40medqf6A3P8z
 gPH0MndUdC2602dXVfMSxMkH9k+cilWvGgKc0wCvy8MdEpl4G2AZuBNTBw==
X-Google-Smtp-Source: AGHT+IHEo20j3cSQhX7ouFmeEqArz0OB8pCYA8JBXe0OgXHH6vBu9G3CA2h2YCmAnAbZfT4JcHV3Cg==
X-Received: by 2002:a05:6402:2695:b0:571:e17e:3208 with SMTP id
 w21-20020a056402269500b00571e17e3208mr1215658edd.3.1713562346747; 
 Fri, 19 Apr 2024 14:32:26 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm2529297eda.96.2024.04.19.14.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:32:25 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:32:15 +0200
Message-Id: <20240419213216.518041-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713562347; x=1714167147; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YtdkjfRUgKDB5qjpyxdfO9xycZqVJyyELhdSf1/KVo=;
 b=FuQsY1m/ukNU2nP36RfAsAb4J+WjhrZB9c1SKRfXHocFaK9CedvhWfsn+F+ngQ+vyJ
 L6ErliXCEX59T4VPNOJLK9Ly+myQdidKJCZvxSWuI4YyuQMV7ZK8QE0FuwZCeSr2ygLt
 cLPdNPx9Te+tcwrLQwB7ISuPrHSy2nnP9sCS+ceACv8wyeBAYk/xbDY9lUOHZZPNY6To
 PAMEODwJuGi5f+uOIhLvjD0X9MFflXODU5B3BgpKy4pSIlldiF4sMRbT+7wcG93MxzAV
 EY3A77JU/gRcHm45E1abzqI28zlFlosUuXj9aJd7MME8wxez2S9WZH3vpSe9mt4hfkiP
 /4sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FuQsY1m/
Subject: [Buildroot] [PATCH 1/2] package/fail2ban: fix data_files
 installation path
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBwYWNrYWdpbmcgZGF0YV9maWxlcyBpbiBhIHdoZWVsLCB0aG9zZSBmaWxlcyBzaGFsbCBo
YXZlIHRoZSBkZXN0aW5hdGlvbgpwYXRoIGV4cHJlc3NlZCBhcyByZWxhdGl2ZSB0byB0aGUgd2hl
ZWwgaW5zdGFsbGF0aW9uLgpUaGUgcmVhc29uIGZvciB0aGF0IGlzIHRoZSB3aGVlbCBpbnN0YWxs
YXRpb24gc2hhbGwgYmUgY29udGFpbmVkIGluc2lkZSBhCnNwZWNpZmljIGZvbGRlciBhbmQvb3Ig
aW4gc2l0ZS1wYWNrYWdlcy4KV2hlbiBidWlsZGluZyB0aGUgd2hlZWwgZmlsZSBieSB0aGUgYmRp
c3Rfd2hlZWwgY29tbWFuZCwgcHl0aG9uIHdpbGwgcGFja2FnZQpmaWxlcyB3aXRoIGFic29sdXRl
IHBhdHMgYXMgcHl0aG9uIGZpbGVzIGVuZGluZyB1cCBpbnN0YWxsaW5nIHRoZW0gaW4Kc2l0ZS1w
YWNrYWdlcy4KCkZpeGVzOgpodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8z
NmFjNTI3OGQxOTE5NWEyMWMzZDAyZDA4Nzk2NWUwOGY0OTIyOGVmCgpTaWduZWQtb2ZmLWJ5OiBB
bmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+Ci0tLQogLi4u
MDAxLXNldHVwLnB5LWZpeC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoIHwgNzMgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2ZhaWwyYmFuLzAwMDEtc2V0dXAucHktZml4LWRhdGEtcmVsYXRpdmUt
cGF0aHMucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZhaWwyYmFuLzAwMDEtc2V0dXAucHkt
Zml4LWRhdGEtcmVsYXRpdmUtcGF0aHMucGF0Y2ggYi9wYWNrYWdlL2ZhaWwyYmFuLzAwMDEtc2V0
dXAucHktZml4LWRhdGEtcmVsYXRpdmUtcGF0aHMucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uZTFiNWJjNDkwYgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
ZmFpbDJiYW4vMDAwMS1zZXR1cC5weS1maXgtZGF0YS1yZWxhdGl2ZS1wYXRocy5wYXRjaApAQCAt
MCwwICsxLDczIEBACitGcm9tIDdiN2ZhM2MwMmQ0NTc1YzA5MzYyMzM2YmMzMTA4MzVjMzc4NTlm
MWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFu
Z2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+CitEYXRlOiBGcmksIDE5IEFwciAyMDI0IDIyOjQ3
OjIwICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIHNldHVwLnB5OiBmaXggZGF0YSByZWxhdGl2ZSBw
YXRocworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNl
dD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitBcyBwZXIgZGlzdHV0
aWxzIGRvY3VtZW50YXRpb246CisKK1RoZSBkaXJlY3Rvcnkgc2hvdWxkIGJlIGEgcmVsYXRpdmUg
cGF0aC4gSXQgaXMgaW50ZXJwcmV0ZWQgcmVsYXRpdmUgdG8gdGhlCitpbnN0YWxsYXRpb24gcHJl
Zml4IChQeXRob27igJlzIHN5cy5wcmVmaXggZm9yIHN5c3RlbSBpbnN0YWxsYXRpb25zOworc2l0
ZS5VU0VSX0JBU0UgZm9yIHVzZXIgaW5zdGFsbGF0aW9ucykuIERpc3R1dGlscyBhbGxvd3MgZGly
ZWN0b3J5IHRvIGJlIGFuCithYnNvbHV0ZSBpbnN0YWxsYXRpb24gcGF0aCwgYnV0IHRoaXMgaXMg
ZGlzY291cmFnZWQgc2luY2UgaXQgaXMgaW5jb21wYXRpYmxlCit3aXRoIHRoZSB3aGVlbCBwYWNr
YWdpbmcgZm9ybWF0IFsxXS4KKworV2hlbiBwYWNrYWdpbmcgdG8gYSBiZGlzdF93aGVlbCBpbmRl
ZWQsIHRoZSBmaWxlcyBpbiB0aGUgImRhdGFfZmlsZXMiIGRpY3Rpb25hcnkKK2FyZSBub3QgcGlj
a2VkIGF0IGFsbCBhcyBkYXRhIGZpbGVzIGlmIHRoZXkgaGF2ZSBhbiBhYnNvbHV0ZSBwYXRoLAor
YnV0IHRoZXkgYXJlIGluc3RlYWQgYWRkZWQgdG8gdGhlIHdoZWVsIGFzIHB5dGhvbiBmaWxlcy4K
K1RoaXMgaGFzIHRoZSBlZmZlY3Qgb2YgaW5zdGFsbGluZyB0aGVtIGFzIHBhcnQgb2YgcHl0aG9u
IGZpbGVzIGluIHRoZQorc2l0ZS1wYWNrYWdlcyBmb2xkZXIgd2hlbiB0aGUgd2hlZWwgaXMgaW5z
dGFsbGVkLgorCitUaGlzIHBhdGNoIGNhbm5vdCBiZSBzZW50IHVwc3RyZWFtIGJlY2F1c2UgaXQg
YnJlYWtzIHRoZSBsZWdhY3kgd2F5IG9mCitpbnN0YWxsaW5nIHRoZSBwYWNrYWdlIHdpdGggKnB5
dGhvbiBzZXR1cC5weSBpbnN0YWxsKiBhbmQgaXQgaXMgbmVlZGVkIG9ubHkgdG8KK2NvbXBseSB3
aXRoIHRoZSBwZXA1MTcgYnVpbGRyb290IGNvbXBhdGliaWxpdHkgbGF5ZXIuCisKK1sxXSBodHRw
czovL2RvY3MucHl0aG9uLm9yZy8zLjEwL2Rpc3R1dGlscy9zZXR1cHNjcmlwdC5odG1sI2luc3Rh
bGxpbmctYWRkaXRpb25hbC1maWxlcworU2lnbmVkLW9mZi1ieTogQW5nZWxvIENvbXBhZ251Y2Np
IDxhbmdlbG8uY29tcGFnbnVjY2lAZ21haWwuY29tPgorLS0tCisgc2V0dXAucHkgfCAxNCArKysr
KysrLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCisKK2RpZmYgLS1naXQgYS9zZXR1cC5weSBiL3NldHVwLnB5CitpbmRleCA5MWY3MWNmMi4u
OTliYTJlMzIgMTAwNzU1CistLS0gYS9zZXR1cC5weQorKysrIGIvc2V0dXAucHkKK0BAIC0yMzgs
MjYgKzIzOCwyNiBAQCBzZXR1cCgKKyAJCQkJZm9yIGYgaW4gd1syXV0KKyAJfSBpZiB3aXRoX3Rl
c3RzIGVsc2Uge30sCisgCWRhdGFfZmlsZXMgPSBbCistCQkoJy9ldGMvZmFpbDJiYW4nLAorKwkJ
KCdldGMvZmFpbDJiYW4nLAorIAkJCWdsb2IoImNvbmZpZy8qLmNvbmYiKQorIAkJKSwKKy0JCSgn
L2V0Yy9mYWlsMmJhbi9maWx0ZXIuZCcsCisrCQkoJ2V0Yy9mYWlsMmJhbi9maWx0ZXIuZCcsCisg
CQkJZ2xvYigiY29uZmlnL2ZpbHRlci5kLyouY29uZiIpCisgCQkpLAorLQkJKCcvZXRjL2ZhaWwy
YmFuL2ZpbHRlci5kL2lnbm9yZWNvbW1hbmRzJywKKysJCSgnZXRjL2ZhaWwyYmFuL2ZpbHRlci5k
L2lnbm9yZWNvbW1hbmRzJywKKyAJCQlbcCBmb3IgcCBpbiBnbG9iKCJjb25maWcvZmlsdGVyLmQv
aWdub3JlY29tbWFuZHMvKiIpIGlmIGlzZmlsZShwKV0KKyAJCSksCistCQkoJy9ldGMvZmFpbDJi
YW4vYWN0aW9uLmQnLAorKwkJKCdldGMvZmFpbDJiYW4vYWN0aW9uLmQnLAorIAkJCWdsb2IoImNv
bmZpZy9hY3Rpb24uZC8qLmNvbmYiKSArCisgCQkJZ2xvYigiY29uZmlnL2FjdGlvbi5kLyoucHki
KQorIAkJKSwKKy0JCSgnL2V0Yy9mYWlsMmJhbi9mYWlsMmJhbi5kJywKKysJCSgnZXRjL2ZhaWwy
YmFuL2ZhaWwyYmFuLmQnLAorIAkJCScnCisgCQkpLAorLQkJKCcvZXRjL2ZhaWwyYmFuL2phaWwu
ZCcsCisrCQkoJ2V0Yy9mYWlsMmJhbi9qYWlsLmQnLAorIAkJCScnCisgCQkpLAorLQkJKCcvdmFy
L2xpYi9mYWlsMmJhbicsCisrCQkoJ3Zhci9saWIvZmFpbDJiYW4nLAorIAkJCScnCisgCQkpLAor
IAldICsgZGF0YV9maWxlc19leHRyYSwKKy0tIAorMi4zNC4xCisKLS0gCjIuMzQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
