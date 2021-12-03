Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4630C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 23:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62ADF60BEF;
	Fri,  3 Dec 2021 23:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvSoEF124d3m; Fri,  3 Dec 2021 23:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCD3E60BE9;
	Fri,  3 Dec 2021 23:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3741BF3FB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC941410B4
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9UEVsssF55r for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 23:17:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 122C341299
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 23:17:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so6003847wmj.5
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 15:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/cQR0ZIfEmqzqhTQixBzQKPc6Qnwd+RessOfd+AwoQ=;
 b=nhejA1DQP66KrFxmeY4cWeYQpG8tzaP+m5kGXVQSXEetspunk+e7q8vzXI1nK8y3Ra
 Ez5bk8D8q8SfXcbVV4V4BQfVw5aASOnV8PxqafTTpj+C85FfOll23niU0ae0ZWcdLWVO
 esWvjrN/t9r/wPhW8H5IQ3Z4pLuyhiUv6yX8HFmM0CItKMnEUF+dtEZsI3/KHh5J9m77
 R9leBdmOFhjZMUYw8PgdZ0d+5UbmKGXmBUpJQFMGC/NYjg4nNdICTV5MAyAr9S0Gj8E4
 PgR0IrGXFHY+Gq+aFKasO/SAuor6uBOcZZrxA75HNRUOJIG8fWRRaQx1KBr6AcJHMPMK
 BzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R/cQR0ZIfEmqzqhTQixBzQKPc6Qnwd+RessOfd+AwoQ=;
 b=uedfIvbmSLeF+/ty5yPX02t68Z1eTUoYr5dr3cgIx9iDeiousYWvbMkRYP7cLR6+y2
 8P7OqzYs+JHNsQ9AqHzfPP4JGRsdTXi9lv2L+EdhVHaxLS5yECDWNoF1GXgVbyKqhf9I
 vm/CLY2+f+HEcvVa6Uwfqz6+y3eDw1Cr4uKotKw2u9NTnKI42Kl3mqjGp+jceCoD7p4J
 ZeFHXzv+qahTC0D8r4vltsK9vVcmHRETayqYyKlFA+ZkfJhmrEOaHTv9I65ewF3N/wLh
 gHhOOEgnbtsyHCpepuTC5L8B4mF4bE8lobtl5CWcihQaQ0Z1Ydl7hsdJsr0jlyHdiEcC
 UnQw==
X-Gm-Message-State: AOAM531X159B6cuozu6Rlm/2eYzPcz7oa8lhGtTDWRCBMny4qh6RQ+BY
 IBCJ7lbJs1aEsMRdttBh2/cXaqWvDcA=
X-Google-Smtp-Source: ABdhPJwiZSjF7NAgMMabt+qeQxhb2363K5E0ozdZPvrw0QtFCCzcAkz7NJIbPfJffuIrgpT/+IiPdA==
X-Received: by 2002:a1c:1fc2:: with SMTP id
 f185mr17272796wmf.149.1638573442380; 
 Fri, 03 Dec 2021 15:17:22 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:28e3:e36b:4389:5725])
 by smtp.gmail.com with ESMTPSA id z6sm4684945wmp.9.2021.12.03.15.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:17:22 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 00:17:19 +0100
Message-Id: <da65f36b9b84a11f54d38b090efc4b84ff0283a5.1638573387.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638573387.git.yann.morin.1998@free.fr>
References: <cover.1638573387.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/mender-grubenv: fix modules list
 help and variable
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
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGhlbHAgd2FzIG1pc3NpbmcgdGhlIHJlZ2V4cCBtb2R1bGUuCgpUaGUgdmFyaWFibGUgYXNz
aWdubWVudCB3YXMgbWlzc2luZyBzcGFjZXMgYXJvdW5kIHRoZSBlcXVhbCBzaWduLgoKU2lnbmVk
LW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+Clt5YW5uLm1vcmluLjE5
OThAZnJlZS5mcjoKICAtIHNwbGl0IHRvIGl0cyBvd24gcGF0Y2gKICAtIGZpeCBhc3NpZ25tZW50
IHRvbwpdClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPgpDYzogS8O2cnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Ci0tLQog
cGFja2FnZS9tZW5kZXItZ3J1YmVudi9Db25maWcuaW4gICAgICAgICB8IDIgKy0KIHBhY2thZ2Uv
bWVuZGVyLWdydWJlbnYvbWVuZGVyLWdydWJlbnYubWsgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21l
bmRlci1ncnViZW52L0NvbmZpZy5pbiBiL3BhY2thZ2UvbWVuZGVyLWdydWJlbnYvQ29uZmlnLmlu
CmluZGV4IDk3Zjc4NWFkM2YuLjM4ZGE1Yjg0ZmUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVuZGVy
LWdydWJlbnYvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWVuZGVyLWdydWJlbnYvQ29uZmlnLmlu
CkBAIC04LDcgKzgsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVOREVSX0dSVUJFTlYKIAkgIGlu
dGVncmF0ZSB3aXRoIHRoZSBHUlVCIGJvb3Rsb2FkZXIuCiAKIAkgIFRoZSBmb2xsb3dpbmcgR3J1
YiBtb2R1bGVzIG11c3QgYmUgc2VsZWN0ZWQgZm9yIHRoaXMgcGFja2FnZToKLQkgIGxvYWRlbnYg
aGFzaHN1bSBlY2hvIGhhbHQgZ2NyeV9zaGEyNTYgdGVzdAorCSAgbG9hZGVudiBoYXNoc3VtIGVj
aG8gaGFsdCBnY3J5X3NoYTI1NiB0ZXN0IHJlZ2V4cAogCiAJICBodHRwczovL2dpdGh1Yi5jb20v
bWVuZGVyc29mdHdhcmUvZ3J1Yi1tZW5kZXItZ3J1YmVudgogCmRpZmYgLS1naXQgYS9wYWNrYWdl
L21lbmRlci1ncnViZW52L21lbmRlci1ncnViZW52Lm1rIGIvcGFja2FnZS9tZW5kZXItZ3J1YmVu
di9tZW5kZXItZ3J1YmVudi5tawppbmRleCAwN2RmMjU1MTJjLi5kN2JkY2M5OWViIDEwMDY0NAot
LS0gYS9wYWNrYWdlL21lbmRlci1ncnViZW52L21lbmRlci1ncnViZW52Lm1rCisrKyBiL3BhY2th
Z2UvbWVuZGVyLWdydWJlbnYvbWVuZGVyLWdydWJlbnYubWsKQEAgLTMwLDcgKzMwLDcgQEAgTUVO
REVSX0dSVUJFTlZfREVGSU5FUyA9IFwKIAogIyBUaGVzZSBncnViIG1vZHVsZXMgbXVzdCBiZSBi
dWlsdCBpbiBmb3IgdGhlIGdydWIgc2NyaXB0cyB0byB3b3JrIHByb3Blcmx5LgogIyBXaXRob3V0
IHRoZW0sIHRoZSBzeXN0ZW0gd2lsbCBub3QgYm9vdC4KLU1FTkRFUl9HUlVCRU5WX01BTkRBVE9S
WV9NT0RVTEVTPWxvYWRlbnYgaGFzaHN1bSBlY2hvIGhhbHQgZ2NyeV9zaGEyNTYgdGVzdCByZWdl
eHAKK01FTkRFUl9HUlVCRU5WX01BTkRBVE9SWV9NT0RVTEVTID0gbG9hZGVudiBoYXNoc3VtIGVj
aG8gaGFsdCBnY3J5X3NoYTI1NiB0ZXN0IHJlZ2V4cAogTUVOREVSX0dSVUJFTlZfTU9EVUxFU19N
SVNTSU5HID0gXAogCSQoZmlsdGVyLW91dCAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9HUlVC
Ml9CVUlMVElOX01PRFVMRVMpKSxcCiAJCSQoTUVOREVSX0dSVUJFTlZfTUFOREFUT1JZX01PRFVM
RVMpKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
