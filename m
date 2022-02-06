Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D40EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 12:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7842401ED;
	Sun,  6 Feb 2022 12:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwd3QgKe9GPa; Sun,  6 Feb 2022 12:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8FDB400D7;
	Sun,  6 Feb 2022 12:13:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9DEC1BF5F5
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D56C3400D7
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1iiBB2bcy3X for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 12:13:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2564400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 12:13:48 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u14so21605013lfo.11
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 04:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev-ru.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56Wie8eb1HaM19h5y0K5k1e7aVhCdwJ/4+EVOyB8ma0=;
 b=25MmD7C+j4UxVgLQ6taifSIqWNYNAQUrq0T1/XCoE8RLI2uEUb1HgWqyxxSo/mUOwy
 XINgJmv0EEoH1gggVkGa/jpLdXxQo8vuUJeUq9RWZ2OCtxEFJGcvkMYb69wfBXPbUu/w
 g/Aom5DfM5UG/d+4fu5He54QMkd4dFgeFJ2cqyi7+YXd/ckt6kGdX+HauL2R6TcYGvk+
 Ngx/QZvtpXU/hOmS86C9Zh+IYn2FuGY5PS5YXShZLCHTCg5IAGIIYlXdlrlh/4ayfkOU
 +vdDG6bKCWON9Ma2puosl1v6aT8eP6i3cylTwxAIzgoDH994OVkc56SBZM4xh3hs9iT7
 E9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56Wie8eb1HaM19h5y0K5k1e7aVhCdwJ/4+EVOyB8ma0=;
 b=6Z3rjjtX+cN7F7OYKDOuhYASmOThl/j/H++Zq9L04iVjDYdcqZRaOPElyK3A+9CnXF
 6ieZjOlFVfHKMC0V5pxqtwPkSFQbf1KbC7kvatkMDEau4tGVJKZHcGJjGHZD6GdqGDH6
 tcKrwUHWsGJrjQiGDB+jw4wHr9OpjBe70WfhRq1anELMMYkeQwch49i+6DbnvFdNiOeb
 DBgGdOPV7HHwfm2TajqCIdwSC891iAB+vhvKC5TrBU5elvqtGZ6HiGQKANXvR8fjJGbb
 PSETdHk2W5N2gGc6pBF2ojjQxTQWkAMFcgFG1cwnfq5WHvuI2xV9MHe73jTM/s0VK75A
 EW4g==
X-Gm-Message-State: AOAM533ax++guwYf6+67OoLMZoECmkrJ4W62VY88PrFLFpTcsDbPn3ap
 IEn4Tj7811WDAq13+XCDcDB/FYHOL0OHL0Ar
X-Google-Smtp-Source: ABdhPJxDdf8ND9U4b+uIHj1rJwUXeAdBirxNozypK6eTKXTPnvAD/pS3aI649+XqSxaURkqN5D1WQA==
X-Received: by 2002:a05:6512:2313:: with SMTP id
 o19mr5227396lfu.642.1644149625857; 
 Sun, 06 Feb 2022 04:13:45 -0800 (PST)
Received: from ly-ThinkPad-X1-Carbon-2nd.router.bigbrother-matrix.ru
 ([31.130.36.33])
 by smtp.gmail.com with ESMTPSA id y22sm1176248lji.129.2022.02.06.04.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 04:13:45 -0800 (PST)
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:13:35 +0300
Message-Id: <20220206121337.1491403-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.4
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
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBzdGFibGUgYnVnZml4IHJlbGVhc2Ugb2YgbGlibWRieC4gU28gaXQgaXMgcmVhc29u
YWJsZSB0byBiYWNrcG9ydAp0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2Jy
YW5jaGVzIG9mIGJ1aWxkcm9vdC4KClBsZWFzZSByZWZlciB0byB0aGUgQ2hhbmdlTG9nIGZvciBt
b3JlIGhpc3RvcmljYWwgaW5mb3JtYXRpb24gYW5kIGFjdHVhbCBUT0RPcy4KaHR0cHM6Ly9naXRo
dWIuY29tL2VydGhpbmsvbGlibWRieC9ibG9iL21hc3Rlci9DaGFuZ2VMb2cubWQKClJlbGVhc2Ug
bm90ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9lcnRoaW5rL2xpYm1kYngvcmVsZWFzZXMvdGFnL3Yw
LjExLjQKClNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVy
aWV2KSA8bGVvQHl1cmlldi5ydT4KLS0tCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwg
MiArLQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlibWRieC9saWJtZGJ4Lmhhc2ggYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCmluZGV4
IGM4YjUwZjlhYzMuLjI0ODNkMTRkZDEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJt
ZGJ4Lmhhc2gKKysrIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaApAQCAtMSw1ICsxLDUg
QEAKICMgSGFzaGVzIGZyb206IGh0dHBzOi8vZ2l0aHViLmNvbS9lcnRoaW5rL2xpYm1kYngvcmVs
ZWFzZXMvCi1zaGEyNTYgIGY5NTRiYThjOTc2ODkxNGE5MmMyYjQ2YWFjMGQ2NmJlYzY3NGRiYjRk
N2IwZjAxZTM2MmVhMjkyMTc0NmRkYWEgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMS4xLnRhci5n
egorc2hhMjU2ICA4ODRkZTUyOGY1YzJhYmFiMjE4N2I3YzRjODRiNzY5ZDI1NTFlMWE3NDhjYmZk
ZjBhZTRjMGY1YzlmOGRiZDI3ICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTEuNC50YXIuZ3oKIAog
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgMzEwZmUyNWM4NThhOTUxNWZjOGM4ZDdkMWYy
NGE2N2M5NDk2Zjg0YTkxZTBhMGU0MWVhOTk3NWIxMzcxZTU2OSAgTElDRU5TRQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5t
awppbmRleCAwMmQwMGIxYTVhLi4xYWZmOGZiYjRkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1k
YngvbGlibWRieC5taworKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQk1EQlhfVkVSU0lPTiA9IDAu
MTEuMQorTElCTURCWF9WRVJTSU9OID0gMC4xMS40CiBMSUJNREJYX1NPVVJDRSA9IGxpYm1kYngt
YW1hbGdhbWF0ZWQtJChMSUJNREJYX1ZFUlNJT04pLnRhci5negogTElCTURCWF9TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL2VydGhpbmsvbGlibWRieC9yZWxlYXNlcy9kb3dubG9hZC92JChMSUJN
REJYX1ZFUlNJT04pCiBMSUJNREJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0tIAoy
LjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
