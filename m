Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BD1C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 09:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B46640B99;
	Tue, 21 Jun 2022 09:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B46640B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqSdt7fM7gDl; Tue, 21 Jun 2022 09:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C7BA40B93;
	Tue, 21 Jun 2022 09:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C7BA40B93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5E51BF32A
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9E034093D
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 09:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9E034093D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlzP1f50-_cU for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 09:01:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423A340933
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 423A340933
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 09:01:53 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id e4so14656697ljl.1
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 02:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HmVJkkPPTkvgk+7WI2OWtSUjp+1m/v0EobJmk/9Q74E=;
 b=mPFxTcBCApfIYiXW4GBrgPjW9HZEhE7xk4gjdhQBx43YYqlrHNVACz7Ed/NST0amOv
 UOYLskYtRU8X2Mcp3a6M5Xc2YGyDpwkDCwnyed+0OmVB2zCvBznqemY/ci19BlcslDBk
 +uSfgertlwp/53pFCdTfY6cu8nA0eXO8erYHUzasVflvxwyr1uAbHjEpMu3yQjNzx+mU
 NWRl/vSc9u+2+ZewJugag3d5n/16XAaIT6ijPtTeFZxlHA2cRu74fpuLeVnB8uUPGoj9
 6/fgENJq5FrN7bmarw5k+s0UWButY2MvLm6aMaIRLJpraD8l7iX09LOOXmG9MXwu3pbw
 MMnQ==
X-Gm-Message-State: AJIora8rG0qU19NqncDqB2J0zmLoh8sxok6+IPy8eLgfS2o6aAknZkr5
 yLQTPUJa9P7IrwuV74ZfE4Ww5jEw8c2Zmv5jApdBxg==
X-Google-Smtp-Source: AGRyM1ujldXoESGL4JL3XSq3GP4uAE93mQyv49cCHbqqkm6ctRkr2fpO+sM20Cj5l/tcU0wyBByYiA==
X-Received: by 2002:a2e:93c8:0:b0:24e:eabd:bf6e with SMTP id
 p8-20020a2e93c8000000b0024eeabdbf6emr12967111ljh.347.1655802110813; 
 Tue, 21 Jun 2022 02:01:50 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (91-157-106-8.elisa-laajakaista.fi. [91.157.106.8])
 by smtp.googlemail.com with ESMTPSA id
 z7-20020a196507000000b0047255d211e2sm2088715lfb.273.2022.06.21.02.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:01:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 12:01:48 +0300
Message-Id: <20220621090148.3326277-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HmVJkkPPTkvgk+7WI2OWtSUjp+1m/v0EobJmk/9Q74E=;
 b=RUz9guM6GA427sX37Kz3moHG7XVafh+v2YYZ+64n8OfRY9wyQ9vF7zZeX713bTmABm
 ZLS6hbVSPmkJS0iIbcc1ogmvbiPcj3Y7N8zQxcJMHKUK/QkVyzTdr3SjldBnkwBJi9r8
 cm2D05iO7wri996L+NMNNM0DfxmAITH+9Nbmhh9EQUEC8uJz3OXnyeSo9J4a0Z92JULo
 xlx0eT1yMQO+awWKT2eBu9tQCOv0AqWvZBB3yKbrQIYsFHqFM/hL4uX2swU1nm2X2tDZ
 sxjO/5t0VAZEsxknPCWwM2K3p/wpuCPAQaYB4H5tnYl2ThRG0Gyg1+LY6cx0Cme341Bw
 sJcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=unikie.com header.i=@unikie.com
 header.a=rsa-sha256 header.s=google header.b=RUz9guM6
Subject: [Buildroot] [PATCH] package/python-lark: new package
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
b20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFj
a2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9weXRob24t
bGFyay9Db25maWcuaW4gICAgICAgIHwgIDcgKysrKysrKwogcGFja2FnZS9weXRob24tbGFyay9w
eXRob24tbGFyay5oYXNoIHwgIDUgKysrKysKIHBhY2thZ2UvcHl0aG9uLWxhcmsvcHl0aG9uLWxh
cmsubWsgICB8IDE0ICsrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1sYXJrL0NvbmZpZy5pbgog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWxhcmsvcHl0aG9uLWxhcmsuaGFzaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWxhcmsvcHl0aG9uLWxhcmsubWsKCmRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBmYzMyOWZlYzI3Li5lZDcw
OGRkNzc0IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE1NDUs
NiArMTU0NSw3IEBAIEY6CXBhY2thZ2UvYWxmcmVkLwogRjoJcGFja2FnZS9ibXg3LwogRjoJcGFj
a2FnZS9weXRob24tYWV4cGVjdC8KIEY6CXBhY2thZ2UvcHl0aG9uLWFsZW1iaWMvCitGOglwYWNr
YWdlL3B5dGhvbi1sYXJrLwogRjoJcGFja2FnZS9zb2Z0aHNtMi8KIEY6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYWV4cGVjdC5weQogRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fYWV4cGVjdC5weQpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBmMDlkYTA1YmUwLi43Nzg1
YWNhMmNlIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZp
Zy5pbgpAQCAtMTA3Nyw2ICsxMDc3LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMi
CiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hL0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvcHl0aG9uLWtleXJpbmcvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRo
b24ta2l3aXNvbHZlci9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3B5dGhvbi1sYXJrL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWxpYmNvbmZpZy9Db25maWcuaW4iCiAJ
c291cmNlICJwYWNrYWdlL3B5dGhvbi1saWJ1c2IxL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2th
Z2UvcHl0aG9uLWxtZGIvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tbGFy
ay9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1sYXJrL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xZjQ1NjkwZjhkCi0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9weXRob24tbGFyay9Db25maWcuaW4KQEAgLTAsMCArMSw3IEBACitjb25maWcgQlIy
X1BBQ0tBR0VfUFlUSE9OX0xBUksKKwlib29sICJweXRob24tbGFyayIKKwloZWxwCisJICBMYXJr
IGlzIGEgcGFyc2luZyB0b29sa2l0IGZvciBQeXRob24sIGJ1aWx0IHdpdGggYSBmb2N1cworCSAg
b24gZXJnb25vbWljcywgcGVyZm9ybWFuY2UgYW5kIG1vZHVsYXJpdHkuCisKKwkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9sYXJrLXBhcnNlci9sYXJrCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1s
YXJrL3B5dGhvbi1sYXJrLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1sYXJrL3B5dGhvbi1sYXJrLmhh
c2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzc3M2MwMGY3YwotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLWxhcmsvcHl0aG9uLWxhcmsuaGFzaApAQCAt
MCwwICsxLDUgQEAKKyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvbGFy
ay9qc29uCittZDUgIGZkM2NhOTZhOGQ5ZDY3Nzk4NTA4NDcwMDMyOTIxMDc4ICBsYXJrLTEuMS4y
LnRhci5negorc2hhMjU2ICA3YThkMGMwN2Q2NjNkYTkzOTFkN2ZhZWUxYmYxZDdkZjQ5OThjNDdj
YTQzYTU5M2NiZWY1Yzc1NjZhY2QwNTdhICBsYXJrLTEuMS4yLnRhci5negorIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKK3NoYTI1NiAgNmU4M2FkOGUwZGU1MTY5MGE1M2VhYzAy
ZGQyYjYxODhkZmQ3OTQ5MDUzYmU1NmZiYTViNjUxMTQwZDI3ZWU1NyAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tbGFyay9weXRob24tbGFyay5tayBiL3BhY2thZ2UvcHl0aG9u
LWxhcmsvcHl0aG9uLWxhcmsubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uNTJjMjQ5NTUyZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLWxhcmsvcHl0
aG9uLWxhcmsubWsKQEAgLTAsMCArMSwxNCBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMK
KyMgcHl0aG9uLWxhcmsKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1BZVEhPTl9MQVJL
X1ZFUlNJT04gPSAxLjEuMgorUFlUSE9OX0xBUktfU09VUkNFID0gbGFyay0kKFBZVEhPTl9MQVJL
X1ZFUlNJT04pLnRhci5negorUFlUSE9OX0xBUktfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9u
aG9zdGVkLm9yZy9wYWNrYWdlcy9hMy9jNS8xMWQwYTA4NjU5MGIyMDdhZDFiNmM5YmE2ZTAxOWY4
MjkwNjUyZjNkNzAzY2RiMDAyZDcyZTIyMGRkOTkKK1BZVEhPTl9MQVJLX1NFVFVQX1RZUEUgPSBz
ZXR1cHRvb2xzCitQWVRIT05fTEFSS19MSUNFTlNFID0gTUlUCitQWVRIT05fTEFSS19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQorCiskKGV2YWwgJChweXRob24tcGFja2FnZSkpCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
