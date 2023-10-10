Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96144CD8CA9
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 16:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6835C41762;
	Tue, 10 Oct 2023 16:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6835C41762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoEx2lIjCYN5; Tue, 10 Oct 2023 16:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA9141D92;
	Tue, 10 Oct 2023 16:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CA9141D92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0F61BF97D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 16:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC7798227A
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 16:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC7798227A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JK8UW1_cu-ji for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 16:46:06 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B13E282278
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 16:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13E282278
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b29186e20aso1004753566b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 09:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696956363; x=1697561163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dABGvq2DWfSnZAXw6lg9VBRJ4GXpZ/WXuL9QT5LwwpE=;
 b=fpw/K4JPImEgDUSK1Tei5cQTrgKXvSp7jE+63BLh1EG8/uQxQYS68JsENAzHaWaGN4
 SYmcK5Oj+nG+bvR/OQX1IMIGFjdEGS3hqawoy3FHrH/THe6KoW1ZuY+GhfSVn5qXBpmG
 S/XSlJAQgIqBXx01YcYRpN/jBbzIfD/rS9xOPi4Q6Q6ecwQ2GUklOPg1c5kr0HUe2PS9
 cavCl9X8ltpN9gY8G8IBos18mr9CNfUS7p9a5tMCPd8hp2OSeDhFTwb7M8FHWLyuKwXn
 J07GUUI/r2N5EziBdzGHX6hvRbLSkZzJHvL+8rMaSrwY98JPCXvlAU2C/VEebp+Dwzx7
 l50A==
X-Gm-Message-State: AOJu0YzBGECgJk1riPeXc6wkRILTtR16hcUZx4lzBBPOZQJcoLGcO1Ji
 hM6zL1cP3UHvTMI+hJEyoZ/v/NRbgEqxDdbaLaShyw==
X-Google-Smtp-Source: AGHT+IHsrtCu7FlxUqJLx33hgPu6DG6y1XAhNKktMAbPW8umzU758oRCyQs4mEFQ4EDJsoxJKBp32Q==
X-Received: by 2002:a17:906:301a:b0:9a5:b814:8254 with SMTP id
 26-20020a170906301a00b009a5b8148254mr16602781ejz.24.1696956363404; 
 Tue, 10 Oct 2023 09:46:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170906379100b009b957d5237asm8582838ejc.80.2023.10.10.09.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 09:46:03 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 18:45:53 +0200
Message-ID: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696956363; x=1697561163;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dABGvq2DWfSnZAXw6lg9VBRJ4GXpZ/WXuL9QT5LwwpE=;
 b=E1SJqHuQUUuxQ7BNPcXduwo4svs6JebzRgdyWOx2I8YXZN+ButozBSyFtYjYXmPQ0F
 uYzwua/L8P1KiTm5spmkO2aNE271ftEV5UMX0lFH1VDAEWTRqwAfYvAzr84WCeezoSEg
 jQgV/1EdrFJKiyUJ2W/9tjgzyrBqa3gBgQN6c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=E1SJqHuQ
Subject: [Buildroot] [PATCH 1/2] package/postgresql/postgresql.service: set
 locale for initdb to C
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgoKRnJvbSB0aGlzIHBhdGNo
IGZyb20gU2VwdC4gMjAsIDIwMjAsIHBvc3RncmVzcWwuc2VydmljZSBpcyBzdGlsbCBicm9rZW4g
b24Kc3RhcnR1cDoKClBvc3RncmVzcWwgc3lzdGVtZCBzdGFydHVwIGZhaWxzIHdpdGg6CgogIFN0
YXJ0aW5nIFBvc3RncmVTUUwgZGF0YWJhc2Ugc2VydmVyLi4uCiAgW0ZBSUxFRF0gRmFpbGVkIHRv
IHN0YXJ0IFBvc3RncmVTUUwgZGF0YWJhc2Ugc2VydmVyLgogIFNlZSAnc3lzdGVtY3RsIHN0YXR1
cyBwb3N0Z3Jlc3FsLnNlcnZpY2UnIGZvciBkZXRhaWxzLgoKICAkIHN5c3RlbWN0bCBzdGF0dXMg
cG9zdGdyZXNxbC5zZXJ2aWNlIHwgY2F0CiAg4pePIHBvc3RncmVzcWwuc2VydmljZSAtIFBvc3Rn
cmVTUUwgZGF0YWJhc2Ugc2VydmVyCiAgICAgICBMb2FkZWQ6IGxvYWRlZCAoL3Vzci9saWIvc3lz
dGVtZC9zeXN0ZW0vcG9zdGdyZXNxbC5zZXJ2aWNlOyBlbmFibGVkOyB2ZW5kb3IgcHJlc2V0OiBl
bmFibGVkKQogICAgICAgQWN0aXZlOiBmYWlsZWQgKFJlc3VsdDogZXhpdC1jb2RlKSBzaW5jZSBT
YXQgMjAyMC0wOS0xMiAxMjoxNjozNSBVVEM7IDM1cyBhZ28KICAgICAgUHJvY2VzczogMTY0IEV4
ZWNTdGFydFByZT0vYmluL3NoIC1jIGlmIFsgISAtZiAvdmFyL2xpYi9wZ3NxbC9QR19WRVJTSU9O
IF07IHRoZW4gL3Vzci9iaW4vcGdfY3RsIGluaXRkYiAtRCAvdmFyL2xpYi9wZ3NxbDsgZmkgKGNv
ZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJFKQoKICBTZXAgMTIgMTI6MTY6MzUgYnVpbGRyb290
IHN5c3RlbWRbMV06IFN0YXJ0aW5nIFBvc3RncmVTUUwgZGF0YWJhc2Ugc2VydmVyLi4uCiAgU2Vw
IDEyIDEyOjE2OjM1IGJ1aWxkcm9vdCBwb3N0Z3Jlc1sxNjZdOiBUaGUgZmlsZXMgYmVsb25naW5n
IHRvIHRoaXMgZGF0YWJhc2Ugc3lzdGVtIHdpbGwgYmUgb3duZWQgYnkgdXNlciAicG9zdGdyZXMi
LgogIFNlcCAxMiAxMjoxNjozNSBidWlsZHJvb3QgcG9zdGdyZXNbMTY2XTogVGhpcyB1c2VyIG11
c3QgYWxzbyBvd24gdGhlIHNlcnZlciBwcm9jZXNzLgogIFNlcCAxMiAxMjoxNjozNSBidWlsZHJv
b3QgcG9zdGdyZXNbMTY2XTogaW5pdGRiOiBlcnJvcjogaW52YWxpZCBsb2NhbGUgc2V0dGluZ3M7
IGNoZWNrIExBTkcgYW5kIExDXyogZW52aXJvbm1lbnQgdmFyaWFibGVzCiAgU2VwIDEyIDEyOjE2
OjM1IGJ1aWxkcm9vdCBzeXN0ZW1kWzFdOiBwb3N0Z3Jlc3FsLnNlcnZpY2U6IENvbnRyb2wgcHJv
Y2VzcyBleGl0ZWQsIGNvZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJFCiAgU2VwIDEyIDEyOjE2
OjM1IGJ1aWxkcm9vdCBwb3N0Z3Jlc1sxNjRdOiBwZ19jdGw6IGRhdGFiYXNlIHN5c3RlbSBpbml0
aWFsaXphdGlvbiBmYWlsZWQKICBTZXAgMTIgMTI6MTY6MzUgYnVpbGRyb290IHN5c3RlbWRbMV06
IHBvc3RncmVzcWwuc2VydmljZTogRmFpbGVkIHdpdGggcmVzdWx0ICdleGl0LWNvZGUnLgogIFNl
cCAxMiAxMjoxNjozNSBidWlsZHJvb3Qgc3lzdGVtZFsxXTogRmFpbGVkIHRvIHN0YXJ0IFBvc3Rn
cmVTUUwgZGF0YWJhc2Ugc2VydmVyLgoKRml4IGl0IGJ5IHNldHRpbmcgYSBzYW5lL2Fsd2F5cyBh
dmFpbGFibGUgbG9jYWxlPUMgaW4gdGhlIHN0YXJ0dXAgZmlsZXMuCgpBIHNpbWlsYXJlIGZhaWx1
cmUvZml4IHdhcyByZXBvcnRlZCBieSBQYXNjYWwgZGUgQnJ1aWpuIChbMV0pLCBidXQgd2l0aApl
bl9VUy5VVEYtOCBpbnN0ZWFkIG9mIEMuCgpbMV0gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3Bp
cGVybWFpbC9idWlsZHJvb3QvMjAxOS1Ob3ZlbWJlci8yNjY3MDAuaHRtbAoKU2lnbmVkLW9mZi1i
eTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgpTaWduZWQtb2ZmLWJ5OiBBZGFt
IER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiBwYWNrYWdl
L3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5zZXJ2aWNlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb3N0Z3Jl
c3FsL3Bvc3RncmVzcWwuc2VydmljZSBiL3BhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLnNl
cnZpY2UKaW5kZXggNTM5ZWVhODk2NC4uMjQ1Mzc1Yjc3ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9w
b3N0Z3Jlc3FsL3Bvc3RncmVzcWwuc2VydmljZQorKysgYi9wYWNrYWdlL3Bvc3RncmVzcWwvcG9z
dGdyZXNxbC5zZXJ2aWNlCkBAIC0xNiw3ICsxNiw3IEBAIFN0YW5kYXJkT3V0cHV0PXN5c2xvZwog
U3RhbmRhcmRFcnJvcj1zeXNsb2cKIFN5c2xvZ0lkZW50aWZpZXI9cG9zdGdyZXMKIAotRXhlY1N0
YXJ0UHJlPS9iaW4vc2ggLWMgImlmIFsgISAtZiAvdmFyL2xpYi9wZ3NxbC9QR19WRVJTSU9OIF07
IHRoZW4gL3Vzci9iaW4vcGdfY3RsIGluaXRkYiAtRCAvdmFyL2xpYi9wZ3NxbDsgZmkiCitFeGVj
U3RhcnRQcmU9L2Jpbi9zaCAtYyAiaWYgWyAhIC1mIC92YXIvbGliL3Bnc3FsL1BHX1ZFUlNJT04g
XTsgdGhlbiAvdXNyL2Jpbi9wZ19jdGwgaW5pdGRiIC1EIC92YXIvbGliL3Bnc3FsIC1vIC0tbG9j
YWxlPUM7IGZpIgogRXhlY1N0YXJ0PS91c3IvYmluL3Bvc3RncmVzIC1EIC92YXIvbGliL3Bnc3Fs
CiBFeGVjUmVsb2FkPS91c3IvYmluL2tpbGwgLUhVUCAkTUFJTlBJRAogS2lsbE1vZGU9bWl4ZWQK
LS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
