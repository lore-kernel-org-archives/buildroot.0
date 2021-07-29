Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABFEC4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 22:50:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB37D60F4A
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 22:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB37D60F4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paral.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F4F40671;
	Thu, 29 Jul 2021 22:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzYBze3VBMIM; Thu, 29 Jul 2021 22:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD0D4065B;
	Thu, 29 Jul 2021 22:50:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0443F1BF2A4
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 22:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0100F4065B
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 22:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1yDehaiW8Lf for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 22:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A8D940654
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 22:50:02 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so17983334pjb.0
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 15:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TR9pLCfbIWl9ngeyeDGNdqzlkwUq4dwP9LmuQqY67A0=;
 b=jvHuxZCUugj2bVKLxqWjuC3wNBYciW9ux3i4rPL8/n4mxKw/xNhW1VgX3YAzG842dT
 96QUtT8UYhIR+JeN7aQLi4fPUFqa0hS2JF/ewLJfopMitpjFd6oPjJeFnT7MDNBXlQkB
 En8V/TIboe87mD8EzGBwf0WCAB79YL0lhftxop51srnUhaBhEVyateVp/pMmhPCe3oPh
 +fBWPehaIVPSv5k6TArNt2HN1StQRW5sW7LSeHheWaYKuBmOWR2TxeKhMNjnU79Cen58
 AZUPq0wwIZCmZTu3mQFAhmhaz7zDgQ6jYXJjve6RxULmBI7v2QDHxH6lCLP2EuLbYhab
 HerA==
X-Gm-Message-State: AOAM530taB6FOH45M50V0Cu0ypHlYYyG2vfcUJgWNNxKXsxzDgnFxWsI
 xDqyDbq/hIiB2pV4QhKvvWE+Nb4Pd514Aw==
X-Google-Smtp-Source: ABdhPJxTseiLgXwWoMUI6uv7yNKddwaPLH32Andbi0FKwxzkSE/ApdagGer1AGCH0JUE3S/xwyDMyg==
X-Received: by 2002:a63:fc02:: with SMTP id j2mr5799119pgi.235.1627599001262; 
 Thu, 29 Jul 2021 15:50:01 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-75-212.sb.sd.cox.net.
 [68.6.75.212])
 by smtp.gmail.com with ESMTPSA id 198sm4797327pfw.21.2021.07.29.15.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 15:50:00 -0700 (PDT)
From: Christian Stewart <christian@paral.in>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 15:49:49 -0700
Message-Id: <20210729224949.394669-1-christian@paral.in>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump version to 1.16.6
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhlc2UgbWlub3IgcmVsZWFzZXMgaW5jbHVkZSBhIHNlY3VyaXR5IGZpeCBhY2NvcmRpbmcgdG8g
dGhlIG5ldyBzZWN1cml0eSBwb2xpY3kgKCM0NDkxOCkuCgpjcnlwdG8vdGxzIGNsaWVudHMgY2Fu
IHBhbmljIHdoZW4gcHJvdmlkZWQgYSBjZXJ0aWZpY2F0ZSBvZiB0aGUgd3JvbmcgdHlwZSBmb3Ig
dGhlIG5lZ290aWF0ZWQgcGFyYW1ldGVycy4KbmV0L2h0dHAgY2xpZW50cyBwZXJmb3JtaW5nIEhU
VFBTIHJlcXVlc3RzIGFyZSBhbHNvIGFmZmVjdGVkLiBUaGUgcGFuaWMgY2FuIGJlIHRyaWdnZXJl
ZCBieSBhbiBhdHRhY2tlcgppbiBhIHByaXZpbGVnZWQgbmV0d29yayBwb3NpdGlvbiB3aXRob3V0
IGFjY2VzcyB0byB0aGUgc2VydmVyIGNlcnRpZmljYXRlJ3MgcHJpdmF0ZSBrZXksIGFzIGxvbmcg
YXMgYSB0cnVzdGVkCkVDRFNBIG9yIEVkMjU1MTkgY2VydGlmaWNhdGUgZm9yIHRoZSBzZXJ2ZXIg
ZXhpc3RzIChvciBjYW4gYmUgaXNzdWVkKSwgb3IgdGhlIGNsaWVudCBpcyBjb25maWd1cmVkIHdp
dGgKQ29uZmlnLkluc2VjdXJlU2tpcFZlcmlmeS4gQ2xpZW50cyB0aGF0IGRpc2FibGUgYWxsIFRM
U19SU0EgY2lwaGVyIHN1aXRlcyAodGhhdCBpcywgVExTIDEuMOKAkzEuMiBjaXBoZXIKc3VpdGVz
IHdpdGhvdXQgRUNESEUpLCBhcyB3ZWxsIGFzIFRMUyAxLjMtb25seSBjbGllbnRzLCBhcmUgdW5h
ZmZlY3RlZC4KClRoaXMgaXMgQ1ZFLTIwMjEtMzQ1NTguCgpWaWV3IHRoZSByZWxlYXNlIG5vdGVz
IGZvciBtb3JlIGluZm9ybWF0aW9uOgoKaHR0cHM6Ly9nb2xhbmcub3JnL2RvYy9kZXZlbC9yZWxl
YXNlLmh0bWwjZ28xLjE2Lm1pbm9yCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8
Y2hyaXN0aWFuQHBhcmFsLmluPgotLS0KIHBhY2thZ2UvZ28vZ28uaGFzaCB8IDIgKy0KIHBhY2th
Z2UvZ28vZ28ubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28uaGFzaCBiL3BhY2thZ2Uv
Z28vZ28uaGFzaAppbmRleCBiYzYxNDdiYjUyLi5jZDdmMmIzODEzIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2dvL2dvLmhhc2gKKysrIGIvcGFja2FnZS9nby9nby5oYXNoCkBAIC0xLDMgKzEsMyBAQAog
IyBGcm9tIGh0dHBzOi8vZ29sYW5nLm9yZy9kbC8KLXNoYTI1NiAgN2JmYTdlNTkwOGM3Y2M5ZTc1
ZGE1ZGRmMzA2NmQ3Y2JjZjNmZDlmYTUxOTQ1ODUxMzI1ZWViYzE3ZjUwYmE4MCAgZ28xLjE2LjUu
c3JjLnRhci5negorc2hhMjU2ICBhM2E1ZDRiYzQwMWI1MWRiMDY1ZTRmOTNiNTIzMzQ3YTRkMzQz
YWUwYzBiMDhhNjVjMzQyM2IwNWExMzgwMzdkICBnbzEuMTYuNi5zcmMudGFyLmd6CiBzaGEyNTYg
IDJkMzY1OTdmNzExN2MzOGIwMDY4MzVhZTdmNTM3NDg3MjA3ZDhlYzQwN2FhOWQ5OTgwNzk0YjIw
MzBjYmMwNjcgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28ubWsgYi9wYWNrYWdl
L2dvL2dvLm1rCmluZGV4IDQyNTI2OTEzNDMuLjdkNjM1NWRmOTIgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvZ28vZ28ubWsKKysrIGIvcGFja2FnZS9nby9nby5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUdPX1ZFUlNJT04gPSAxLjE2LjUKK0dPX1ZFUlNJT04g
PSAxLjE2LjYKIEdPX1NJVEUgPSBodHRwczovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vZ29sYW5n
CiBHT19TT1VSQ0UgPSBnbyQoR09fVkVSU0lPTikuc3JjLnRhci5negogCi0tIAoyLjMyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
