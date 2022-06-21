Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1C2C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 06:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40A0E6104E;
	Tue, 21 Jun 2022 06:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A0E6104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKA0feNomeaO; Tue, 21 Jun 2022 06:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DF761049;
	Tue, 21 Jun 2022 06:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DF761049
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F28341BF2A1
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 06:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC4E061049
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 06:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC4E061049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jAzXjxRMMdI for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 06:49:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75CEB6101F
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75CEB6101F
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 06:49:59 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id o23so7159720ljg.13
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 23:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXSEKQNhFW06vLondSmQAuiVZCC2qUfXl/S2KNqtZJU=;
 b=VWKKdOdeVlO5qnm2J1G+04WKjR25gIDmgo5ATl93yZOmtwY0ZFD3iiB4BZwHhKFk/n
 kTHNfIijCgeRDle1v2nN29mZJIKAiKQQwGXZRbV1UfaDD9rGexwzBA4LTTcTWEqj2OYG
 12d+X5FaTg6lE2NfhrU6UbeGRLqC/DzetVbG5HRPDuMGWepLRqBpIf2Hlfh/STUSY9ZW
 YtHgUu83fampnelk5M26wNFTv3iRC45VpVOdLSShNSgwJ/256S7TXBIROIyOCTatY/xB
 uQZeSUUxMaM/AlVNygxFhJjkEwcDVWrRzbLj0dslHN6o7qU/IdUIvy4WHcF9QWehu/rS
 am2A==
X-Gm-Message-State: AJIora9JWEJlABTnEt/jMHGzRPZUUKjfijlX7Ji49kgpfvVINOcazON2
 5EcgbKDnPOGkeGdsQrIrDU87HQx+CusSgY/XJbCy6g==
X-Google-Smtp-Source: AGRyM1s6DnNcbRZCtszjxhgDj1GqbZNS0oHJjvH8TZb5Me8d5SwiG3bQoq8vysbogoNtRA0nmipwSw==
X-Received: by 2002:a05:651c:179a:b0:247:d37b:6ec5 with SMTP id
 bn26-20020a05651c179a00b00247d37b6ec5mr12777946ljb.112.1655794196868; 
 Mon, 20 Jun 2022 23:49:56 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (91-157-106-8.elisa-laajakaista.fi. [91.157.106.8])
 by smtp.googlemail.com with ESMTPSA id
 s23-20020a2e9c17000000b00258e91823f3sm1213474lji.31.2022.06.20.23.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 23:49:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 09:49:52 +0300
Message-Id: <20220621064952.1633761-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXSEKQNhFW06vLondSmQAuiVZCC2qUfXl/S2KNqtZJU=;
 b=l5MxnzlT4c2yJCnf9Vw27yXShijrODWGra0omoQsL84cJw3hxzbstVNM+9PKiNSZqV
 VpDD26dy4Yzdy7Mj8d7rIk39ozWZAX79kkUZio2VSZTWAX69sOqsCCYMkxCb3nZRMDM1
 T3v53T3d+P13gubpy5tQgC8XXh9mvxBGhKXbKxo6ooU6hbom+MXXWNtroMFkj0D5/HRc
 qhsHDOpYIhAtJtJECuNR+JiEeNF/nsCt7CH7PAJbFL/WceoFMkVpn+DsKov/efRW3aoi
 30oqcI1BvKQwtQpIiaxfh+uoVpf2482sVjLP2W5hM3Q0J5mbd5xi+4aVH5OQCmjkGcYU
 Rh6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=unikie.com header.i=@unikie.com
 header.a=rsa-sha256 header.s=google header.b=l5MxnzlT
Subject: [Buildroot] [PATCH] package/python-alembic: bump to version 1.8.0
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
From: =?utf-8?q?Jos=C3=A9_Pekkarinen_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5j
b20+Ci0tLQogcGFja2FnZS9weXRob24tYWxlbWJpYy9weXRob24tYWxlbWJpYy5oYXNoIHwgNCAr
Ky0tCiBwYWNrYWdlL3B5dGhvbi1hbGVtYmljL3B5dGhvbi1hbGVtYmljLm1rICAgfCA0ICsrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMuaGFzaCBiL3BhY2th
Z2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMuaGFzaAppbmRleCA4ZjVjYmI2ZmEzLi42
YTY3ODJiMzk3IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1hbGVtYmljL3B5dGhvbi1hbGVt
YmljLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tYWxlbWJpYy9weXRob24tYWxlbWJpYy5oYXNo
CkBAIC0xLDUgKzEsNSBAQAogIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlw
aS9hbGVtYmljL2pzb24KLW1kNSAgNDRlODIzNDFhNmVlMGE0MmY2M2RjMWY1MWNhZjkxZTYgIGFs
ZW1iaWMtMS43LjcudGFyLmd6Ci1zaGEyNTYgIDQ5NjEyNDgxNzNlYWQ3Y2U4YTIxZWZiM2RlMzc4
ZjEzYjgzOThlNjYzMGZhYjBlYjI1OGRjNzRhOGFmMjRjNTggIGFsZW1iaWMtMS43LjcudGFyLmd6
CittZDUgIDNkMzM2YzI0ODk5MGNhZmM2OWVhNDAzZDZhZjE4OTk0ICBhbGVtYmljLTEuOC4wLnRh
ci5negorc2hhMjU2ICBhMmQ0ZDkwZGE3MGIzMGU3MDM1MmNkOTQ1NWUzNTg3M2EyNTVhMzE0MDJh
NDM4ZmUyNDgxNTc1OGQ3YTBlNWUxICBhbGVtYmljLTEuOC4wLnRhci5negogIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgZjBlM2Y3YTUwODA4NzljY2FlNzk4ODgy
ZDliZWUzZDQ4ZmUzMzVkMGJhZDg0Y2E4ZWVjODZmYTU5NDM3NWVhMCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tYWxlbWJpYy9weXRob24tYWxlbWJpYy5tayBiL3BhY2thZ2Uv
cHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMubWsKaW5kZXggOGJhMzI2NDdhYi4uZDQwYWNl
ZjVmNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tYWxlbWJpYy9weXRob24tYWxlbWJpYy5t
aworKysgYi9wYWNrYWdlL3B5dGhvbi1hbGVtYmljL3B5dGhvbi1hbGVtYmljLm1rCkBAIC00LDkg
KzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX0FMRU1CSUNfVkVS
U0lPTiA9IDEuNy43CitQWVRIT05fQUxFTUJJQ19WRVJTSU9OID0gMS44LjAKIFBZVEhPTl9BTEVN
QklDX1NPVVJDRSA9IGFsZW1iaWMtJChQWVRIT05fQUxFTUJJQ19WRVJTSU9OKS50YXIuZ3oKLVBZ
VEhPTl9BTEVNQklDX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvMzAvYjkvNTUyNmI0M2E0YzU0ZDE3N2FiMTRhZjBhZjRiNWMzMWQ3M2RiMzNkMWFkM2UzMDk3
NmQzYjAyM2UwNTk0CitQWVRIT05fQUxFTUJJQ19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzLzQzL2YyL2Y2MDk2ZDIzZWI0M2Q0MzZmN2MzNDA4YTZjODNmODJh
MWM3MDRiZmI1MGZiNjA4NTc0YjA0ODQ4NDQ4MAogUFlUSE9OX0FMRU1CSUNfU0VUVVBfVFlQRSA9
IHNldHVwdG9vbHMKIFBZVEhPTl9BTEVNQklDX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9BTEVNQklD
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
