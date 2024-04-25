Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250EFC4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 07:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF9282375;
	Thu, 25 Apr 2024 07:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8QA6P3lDMDz; Thu, 25 Apr 2024 07:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2B278230A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2B278230A;
	Thu, 25 Apr 2024 07:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A01531BF588
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 07:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BBD81799
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 07:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voWD4w1qjHuD for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 07:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A51781754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A51781754
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A51781754
 for <buildroot@busybox.net>; Thu, 25 Apr 2024 07:09:37 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 32102440511;
 Thu, 25 Apr 2024 10:09:16 +0300 (IDT)
To: buildroot@busybox.net
Date: Thu, 25 Apr 2024 10:09:21 +0300
Message-ID: <d443c6f25e4fe949695d7b952f196cd087e91de2.1714028961.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1714028956;
 bh=8xrMIjST9R55B+P9ATn31PhzZGtwwwclPKOglbvVeMs=;
 h=From:To:Cc:Subject:Date:From;
 b=IeJgj8//j0cxpIbB/paO8LTAiQVc+w90ml4wPjhfqkfGgIH6DACQAB/9hYmjFIG2v
 JEMxCnluVH5an7F7MRZcKTnJgB0yVgP1bF5QT5iG3PcaxkLvmfrDyhL+9RHKdoN1wF
 2fVv8BvjAPA5QhHuSwuSg4YWSlO2QkDhJK3N8fvEop3HwSbx46s4G5HYKLxjZKKhrT
 hSkCMYQXkkEeZsYTHa2cUowb4erxV7kyF8gKcqByGhDsBQDrFI265MhEv4rmDhi2zb
 15UjeAPqWFjj63e0eA95szPfEGolJfvbQXGNZEEeqXlqoBWKFkxJDxr3HbhaPXPfTB
 KFIN2R8pumXlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=IeJgj8//
Subject: [Buildroot] [PATCH] configs/solidrun_clearfog: bump kernel to 6.6.28
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRqdXN0IERUU19OQU1FIHRvIGN1cnJlbnQga2VybmVsIHNvdXJjZSB0cmVlIGxvY2F0aW9uIG9m
IERUcyBpbgpwZXItdmVuZG9yIGRpcmVjdG9yaWVzLgoKRml4ZXM6Cmh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjY2NTc0OTkwOQoKQ2M6IEphbiBLdW5k
csOhdCA8amFuLmt1bmRyYXRAY2VzbmV0LmN6PgpTaWduZWQtb2ZmLWJ5OiBCYXJ1Y2ggU2lhY2gg
PGJhcnVjaEB0a29zLmNvLmlsPgotLS0KIGNvbmZpZ3Mvc29saWRydW5fY2xlYXJmb2dfZGVmY29u
ZmlnIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jb25maWdzL3NvbGlkcnVuX2NsZWFyZm9nX2RlZmNvbmZp
ZyBiL2NvbmZpZ3Mvc29saWRydW5fY2xlYXJmb2dfZGVmY29uZmlnCmluZGV4IGI3M2I5ZThlY2Ji
NS4uN2Y2MzNkMzBkNTJkIDEwMDY0NAotLS0gYS9jb25maWdzL3NvbGlkcnVuX2NsZWFyZm9nX2Rl
ZmNvbmZpZworKysgYi9jb25maWdzL3NvbGlkcnVuX2NsZWFyZm9nX2RlZmNvbmZpZwpAQCAtNSw4
ICs1LDggQEAgQlIyX0FSTV9FTkFCTEVfTkVPTj15CiBCUjJfQVJNX0VOQUJMRV9WRlA9eQogQlIy
X0FSTV9GUFVfTkVPTj15CiAKLSMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA0LjIw
IHNlcmllcwotQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV80XzIwPXkKKyMg
TGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA2LjYgc2VyaWVzCitCUjJfUEFDS0FHRV9I
T1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNj15CiAKICMgU3lzdGVtIGNvbmZpZ3VyYXRpb24K
IEJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3NvbGlkcnVuL2NsZWFyZm9nL3Bv
c3QtYnVpbGQuc2giCkBAIC0xNiwxMSArMTYsMTEgQEAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9B
UkdTPSItYyBib2FyZC9zb2xpZHJ1bi9jbGVhcmZvZy9nZW5pbWFnZS5jZmciCiAjIEtlcm5lbAog
QlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjQuMjAiCitCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjYuMjgiCiBCUjJfTElOVVhfS0VSTkVMX0RFRkNP
TkZJRz0ibXZlYnVfdjciCiBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0i
Ym9hcmQvc29saWRydW4vY2xlYXJmb2cvbGludXguZnJhZ21lbnQiCiBCUjJfTElOVVhfS0VSTkVM
X0RUU19TVVBQT1JUPXkKLUJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhcm1hZGEt
Mzg4LWNsZWFyZm9nLWJhc2UiCitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0ibWFy
dmVsbC9hcm1hZGEtMzg4LWNsZWFyZm9nLWJhc2UiCiBCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExf
VEFSR0VUPXkKIAogIyBGaWxlc3lzdGVtCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
