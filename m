Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3DDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 216724018E;
	Mon, 24 Jan 2022 07:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 46Vj8vz2hslP; Mon, 24 Jan 2022 07:15:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1684740123;
	Mon, 24 Jan 2022 07:14:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0681BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 167F240123
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpMFXPW9LsCe for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:14:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EBAA400F1
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:14:57 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 187so14359648pga.10
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OCujD7rgZifXUYgX1tq+vffLeLB/3Uu8G3hv4JFSJ0Q=;
 b=kJPtM+DBRmO1WV6ITnffrYsmXdvcW7iaAOQhol7So7HHj8XcS2gt8vw2RKZI8JuJj3
 MHTKeNO8fadVExevUnbT9yd2jA2WrUyJbraojR9AMJmwqrJFVfudW3Uum+EWsbRi16aS
 dG6u5OyIh+yPLBQetYDeSb8wK+ai+42H5FK+M+kfRlDJfDXWQ9GStcpMsP7NxwC9ZKrP
 yr6wxS5gIbcTtN4sW6SgWY6zG2hN3q26NrRmplv0+joWQC6MS1csEOPbIIHNz7xjEhbv
 p8BNlK5gx7LU723sUvNqa0AnDh18tAi14whTquQ+de02kTkTy0uGNTUsffvSdCT0UMXZ
 /5gQ==
X-Gm-Message-State: AOAM5320fjbYf9CMmJ2fLQl0C8d154Yp5Aaux6VodjdJX2jlLPyaSeIq
 FnGMqcRoYPTKGEvnecF+zBZqFY7E+GojCw==
X-Google-Smtp-Source: ABdhPJwePNvVEMl9OLtKp3bt8kLaT05RSwERCrkqyXdUmOYj4EV2Bkw0Hd2SLeQMmGpB/9i6uqIHvQ==
X-Received: by 2002:a62:1ec3:0:b0:4bb:ea7d:6c4f with SMTP id
 e186-20020a621ec3000000b004bbea7d6c4fmr12866104pfe.4.1643008496222; 
 Sun, 23 Jan 2022 23:14:56 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 u2sm813356pfk.15.2022.01.23.23.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:14:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:14:53 -0800
Message-Id: <20220124071453.16225-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.5.9
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q1ZFLTIwMjEtNDM4MTY6ICJVbnByaXZpbGVnZWQgcG9kIHVzaW5nIGBob3N0UGF0aGAgY2FuIHNp
ZGUtc3RlcCBhY3RpdmUgTFNNIHdoZW4KaXQgaXMgU0VMaW51eCIKCkNvbnRhaW5lcnMgbGF1bmNo
ZWQgdGhyb3VnaCBjb250YWluZXJk4oCZcyBDUkkgaW1wbGVtZW50YXRpb24gb24gTGludXggc3lz
dGVtcwp3aGljaCB1c2UgdGhlIFNFTGludXggc2VjdXJpdHkgbW9kdWxlIGFuZCBjb250YWluZXJk
IHZlcnNpb25zIHNpbmNlIHYxLjUuMCBjYW4KY2F1c2UgYXJiaXRyYXJ5IGZpbGVzIGFuZCBkaXJl
Y3RvcmllcyBvbiB0aGUgaG9zdCB0byBiZSByZWxhYmVsZWQgdG8gbWF0Y2ggdGhlCmNvbnRhaW5l
ciBwcm9jZXNzIGxhYmVsIHRocm91Z2ggdGhlIHVzZSBvZiBzcGVjaWFsbHktY29uZmlndXJlZCBi
aW5kIG1vdW50cyBpbiBhCmhvc3RQYXRoIHZvbHVtZS4gVGhpcyByZWxhYmVsaW5nIGVsZXZhdGVz
IHBlcm1pc3Npb25zIGZvciB0aGUgY29udGFpbmVyLApncmFudGluZyBmdWxsIHJlYWQvd3JpdGUg
YWNjZXNzIG92ZXIgdGhlIGFmZmVjdGVkIGZpbGVzIGFuZCBkaXJlY3Rvcmllcy4KS3ViZXJuZXRl
cyBhbmQgY3JpY3RsIGNhbiBib3RoIGJlIGNvbmZpZ3VyZWQgdG8gdXNlIGNvbnRhaW5lcmTigJlz
IENSSQppbXBsZW1lbnRhdGlvbi4KCmh0dHBzOi8vZ2l0aHViLmNvbS9hZHZpc29yaWVzL0dIU0Et
bXZmZi1oM2NqLXdqOWMKaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcmQvY29udGFpbmVyZC9y
ZWxlYXNlcy90YWcvdjEuNS45CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hy
aXN0aWFuQHBhcmFsLmluPgotLS0KIHBhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gg
fCAyICstCiBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tayAgIHwgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaCBiL3BhY2thZ2UvY29udGFpbmVyZC9j
b250YWluZXJkLmhhc2gKaW5kZXggZjFhNjcwOTU1NC4uZDVhYWZlMmU3MCAxMDA2NDQKLS0tIGEv
cGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAorKysgYi9wYWNrYWdlL2NvbnRhaW5l
cmQvY29udGFpbmVyZC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBDb21wdXRlZCBsb2NhbGx5Ci1z
aGEyNTYgIGE0MWFiOGQzOTM5M2M5NDU2OTQxYjQ3N2MzM2JiMWIyMjFhMjliNjM1ZjFjOWE5OTUy
M2FhYjJmNWU3NGY3OTAgIGNvbnRhaW5lcmQtMS41LjgudGFyLmd6CitzaGEyNTYgIDQwYzk3Njdh
ZjNlODdmMmMzNmFkZjJmNTYzZjBhODM3NGU4MGIzMGJkMmI3YWE4MDA1OGM4NTkxMjQwNmNlZjQg
IGNvbnRhaW5lcmQtMS41LjkudGFyLmd6CiBzaGEyNTYgIDRiYmUzYjg4NWU4Y2QxOTA3YWI0Y2Y5
YTQxZTg2MmU3NGUyNGI1NDIyMjk3YTRmMmZlNTI0ZTZhMzBhZGEyYjQgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rIGIvcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQubWsKaW5kZXggY2Q5NzVkYjI3NC4uODk3NmUxMmYxYSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQubWsKKysrIGIvcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1DT05UQUlORVJEX1ZFUlNJT04gPSAxLjUuOAorQ09OVEFJTkVSRF9WRVJTSU9OID0g
MS41LjkKIENPTlRBSU5FUkRfU0lURSA9ICQoY2FsbCBnaXRodWIsY29udGFpbmVyZCxjb250YWlu
ZXJkLHYkKENPTlRBSU5FUkRfVkVSU0lPTikpCiBDT05UQUlORVJEX0xJQ0VOU0UgPSBBcGFjaGUt
Mi4wCiBDT05UQUlORVJEX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjM0LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
