Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E1BC77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 09:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D14C408AD;
	Tue, 18 Apr 2023 09:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D14C408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3UFJEI9dkUE; Tue, 18 Apr 2023 09:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62EA4408B2;
	Tue, 18 Apr 2023 09:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62EA4408B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B80431C425C
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 09:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E56860A7B
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 09:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E56860A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZVProLKFgCj for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 09:43:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB2AF60A62
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB2AF60A62
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 09:43:50 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id xd13so37642360ejb.4
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 02:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681811029; x=1684403029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7vIpYu65+6KStIfyIWejs2qBOppFlp1fiIsbvAeAsvQ=;
 b=G/5d2TkdGNAwb9AiR5CwONCZ7b6N02+hC4oQE3poUqFRodDcI2gTNt1u9/cW8sAg+k
 dtaMkAuOehYQG03KPXzvVLvX6kkwBpPs0XjzBFnW32BULGCoSh2UcDm+xeZOJrYEwjmb
 1jqFw0Ili9XtersQWXl58TwGrPeHajjCvDLSMtS3JxB6k9P6Ggxat2mv4A28mGf70f3m
 lFGWSN2xx73wQDvsT1FspAo4Ffl/INy7v649Oz8qNfdsk5ABhO/R9YyNrhV3yLxmynpL
 yhWcIJ1IG0T+ZY3ozPC6/l2/yX6d/+svi6baRPmFLOFigKH7BgRwy11a39QMm50wPYOZ
 wDFw==
X-Gm-Message-State: AAQBX9eWg92NdQYkM213DYylJ5cY05uOQ7gJpM2qvWDE2Ut1/VsRPi86
 BVsoJKd4mgLru83/vGGm9w2XZ0G8YZ1aF/EzTE9VUQ==
X-Google-Smtp-Source: AKy350YbOwpWEKU3PvY9xMmRmmLxyN8pz6JfbtTVGIlp39Qim2MO+MUmXPKHfRbL8D9JI8N5A1SLRA==
X-Received: by 2002:a17:907:918c:b0:94d:f66c:3cdc with SMTP id
 bp12-20020a170907918c00b0094df66c3cdcmr8741762ejb.51.1681811028737; 
 Tue, 18 Apr 2023 02:43:48 -0700 (PDT)
Received: from junian.fritz.box (94.105.100.233.dyn.edpnet.net.
 [94.105.100.233]) by smtp.gmail.com with ESMTPSA id
 d9-20020a17090648c900b0094f4f2db7e0sm3714208ejt.143.2023.04.18.02.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 02:43:48 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 11:43:15 +0200
Message-Id: <20230418094317.2236091-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681811029; x=1684403029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7vIpYu65+6KStIfyIWejs2qBOppFlp1fiIsbvAeAsvQ=;
 b=TghKuXcGVEubP7Qj4m1BA89rlt5Tx+tTy55UDOs4ysrnGxX5xGvfrgD+dczNjZLEUB
 RK2kTyNdkgeCL23HV+6AM89wGoFcpOEYD+WCW3gqcOF/NBnqAkOrOLhpeGDwua1+//2F
 7Qyl5JQIpfodyibNiyUpegSShVocYNI3xYmElyJFvf25yxWCaSFnt/7nY44yXd3ezV1I
 45xgaJg2kfVIl6Wi7Hnj96M7pyCTIDdIWXSMwv2+TL5yM7wVh7XvdjhXVukc45FTZN48
 sAhm7762uPL1cCrXHchfHdE8ZwJaRBE9Pxkb0ZwO1iPp8Ioy3IIIfhlc+He04eESEbEP
 2lyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TghKuXcG
Subject: [Buildroot] [PATCH 1/2] package: python-botocore: bump to 1.29.115
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNoIHwgNSAr
KystLQogcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1rICAgfCA2ICsr
Ky0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gg
Yi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUuaGFzaAppbmRleCA1N2Qw
N2E2NzExLi44OWY0YzA2ZGU4IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9w
eXRob24tYm90b2NvcmUuaGFzaAorKysgYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24t
Ym90b2NvcmUuaGFzaApAQCAtMSw1ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczov
L3B5cGkub3JnL3B5cGkvYm90b2NvcmUvanNvbgotbWQ1ICBjNjA4NzA5YTVjZjNlNjc0NDJmNDI1
NGEzNGQxZmFhYiAgYm90b2NvcmUtMS4yOS45Ni50YXIuZ3oKLXNoYTI1NiAgYjk3ODExMDg4MTBl
MzNmODQwNjk0MmMzZTNhYWI3NDg2NTBjNTlkNWNkZGI3YzlkMzIzZjRlMjY4MmU3YjBiNiAgYm90
b2NvcmUtMS4yOS45Ni50YXIuZ3oKK21kNSAgODA1ZTYzOGMzNTNjNTMyYzJhZjdhNzUzOGQ1YmQ0
ZDYgIGJvdG9jb3JlLTEuMjkuMTE1LnRhci5negorc2hhMjU2ICA1OGVlZThjZjhmNGYzZTUxNWRm
MjlmNmRjNTM1ZGQ4NmVkM2Y0Y2VhNDA5OTljNWJjNzQ2NDBmZjQwYmRjNzFmICBib3RvY29yZS0x
LjI5LjExNS50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEy
NTYgIDBkNTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4N2Ux
MWI5MzhlOTQ1OTQgIExJQ0VOU0UudHh0CitzaGEyNTYgIGNmYzc3NDliOTZmNjNiZDMxYzNjNDJi
NWM0NzFiZjc1NjgxNDA1M2U4NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIHRlc3RzL3VuaXQvYXV0
aC9hd3M0X3Rlc3RzdWl0ZS9MSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ib3Rv
Y29yZS9weXRob24tYm90b2NvcmUubWsgYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24t
Ym90b2NvcmUubWsKaW5kZXggNmQwNzQ3YzBkZi4uM2U4MjhmZWY3OCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1rCisrKyBiL3BhY2thZ2UvcHl0
aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawpAQCAtNCwxMSArNCwxMSBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX0JPVE9DT1JFX1ZFUlNJT04gPSAxLjI5Ljk2
CitQWVRIT05fQk9UT0NPUkVfVkVSU0lPTiA9IDEuMjkuMTE1CiBQWVRIT05fQk9UT0NPUkVfU09V
UkNFID0gYm90b2NvcmUtJChQWVRIT05fQk9UT0NPUkVfVkVSU0lPTikudGFyLmd6Ci1QWVRIT05f
Qk9UT0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8y
ZC9iNS80YTk4NmFlYjRlM2QxODJmN2VmMTE2NzA1OTYyZDNjOThjMDI2M2JlYWY4N2M0OTgzNmI3
ZGZiOTE4MzcKK1BZVEhPTl9CT1RPQ09SRV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzLzllLzAwLzQ1NjAwODFhNDMxYWFhMTRjMjI1NzA0MGQ0M2Y1NmMyY2Ni
YTgxNmQ4YmNlM2I4ZTE1NzdhMTlmNDA3NgogUFlUSE9OX0JPVE9DT1JFX1NFVFVQX1RZUEUgPSBz
ZXR1cHRvb2xzCiBQWVRIT05fQk9UT0NPUkVfTElDRU5TRSA9IEFwYWNoZS0yLjAKLVBZVEhPTl9C
T1RPQ09SRV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKK1BZVEhPTl9CT1RPQ09SRV9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRS50eHQgdGVzdHMvdW5pdC9hdXRoL2F3czRfdGVzdHN1aXRlL0xJ
Q0VOU0UKIAogJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQotLSAKMi4zNy4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
