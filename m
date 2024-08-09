Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D92C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A6D640163;
	Fri,  9 Aug 2024 11:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPMmFV6MSGRE; Fri,  9 Aug 2024 11:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1ED341056
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1ED341056;
	Fri,  9 Aug 2024 11:44:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54A9B1BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 733FE60AF2
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUzLhI7SAp-J for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AEBE608F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AEBE608F7
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AEBE608F7
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:43:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-36bcc168cdaso1310662f8f.0
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 04:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723203835; x=1723808635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=THgtoCQCWs59ojhVikFUAoQsykYhNWjEE+5qPN+RRy4=;
 b=fENxFQfLsHJ9B+R2YQz5SqIqnWbpVnqzJarFByZp7yS31WRWm6HFmxh56ltHyNn0rX
 fhuaWEUlK7JDFu/TaJoaZlw8qzEtpfe+3kHhfs95wQWcF0atEJGCM45APqKmreXwwTUp
 OWPkvvR2d+fBnQqBEff/JkiSBWWS5+f1llRNQFmD06OPA+XHA9UOzFvHSpiXbrbqTwe2
 20njoAcZa6Fzn1+1FlvVLqylzkTSRuEMYzQyGOoRDODHLsspF44zRjAImZ/XMMyNpBgP
 K4gpmcylzUFS+0LABRNSBSdPSwwyX+IojFIKq6e+dqSwsetFtR2yWUXox3sFXFuahCF8
 Ww3Q==
X-Gm-Message-State: AOJu0YwpwPe+xktDqOzutJASaAzNyyLso1flYCOo5wDdpvycdIW9bOFO
 kp5pDeUjOjlTShNpzNbeb98jMBbfg72/0o1+KTcT73HVN0ugL5hz8VTf7CbD7xJ04Q==
X-Google-Smtp-Source: AGHT+IHtE+O8PCGhk/R21xZ2G1Qkyba85bZHrqevtiFdISgmuGQDKZAQqyxXVdTP665Zb/hWfrFY7g==
X-Received: by 2002:a5d:4985:0:b0:368:6f64:307c with SMTP id
 ffacd0b85a97d-36d5e1c7a02mr1124877f8f.15.1723203835028; 
 Fri, 09 Aug 2024 04:43:55 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d27208c81sm5081233f8f.73.2024.08.09.04.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 04:43:54 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 13:43:45 +0200
Message-ID: <20240809114345.693108-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723203835; x=1723808635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=THgtoCQCWs59ojhVikFUAoQsykYhNWjEE+5qPN+RRy4=;
 b=bWHgYAK0XGpSgBj8BtgLQwv9mEJ4fJSTcD2kIyUen/cvTpfHx4VEFbitJDYV6KCiFx
 kP9UL/RxjDUwYNN+zg06ZocdJnENwm8LNXOS54nS+BSNSGsFdwEWCz34/ASD8QKCoBD+
 IVB2VMk6ndosv9mjXAVE8/zV2d17GAGHtgAsbq4iu5CA9SmJZimGZ/ERWtHrK3xRVL2P
 V/uu2kaFbaefuzsqBOfqsdktORn3U4UHbR3Js8m3YzgUfMbNa7CzemK6OPbU3enHd4F/
 Fpb1gV4jO8i/UYuvSCpt/G+Fm0rtVhRsa5ywAC9Mh/7s2VRXrNxAIN6wpSLMaLNpA2KS
 3/BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bWHgYAK0
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi5_defconfig: use correct
 CPU
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQXRoYWFyaXEgQXJkaGlhbnN5YWggPGZvc3NAYXRoYWFyaXEubXkuaWQ+CgpUaGUgUmFz
cGJlcnJ5IFBpIDUgdXNlcyBhIHF1YWQtY29yZSBBUk0gQ29ydGV4LUE3NiBDUFUgY2x1c3Rlclsx
XS4KClRoaXMgZml4ZXMgaW5jb3JyZWN0IENQVSBhcyBpdCBpcyBubyBiaWcuTElUVExFIENQVS4K
ClsxXTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJz
L3Byb2Nlc3NvcnMuaHRtbCNiY20yNzEyCgpTaWduZWQtb2ZmLWJ5OiBBdGhhYXJpcSBBcmRoaWFu
c3lhaCA8Zm9zc0BhdGhhYXJpcS5teS5pZD4KU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxn
YWVsLnBvcnRheUBydG9uZS5mcj4KLS0tCkhlbGxvIEF0aGFhcmlxLAoKSSBob3BlIHlvdSBkbyBu
b3QgbWluZCBpZiBJIHVwc3RyZWFtIHRoZSBmaXggeW91IG1hZGUgYWJvdXQgdGhlIENQVT8KCgkj
IGZvciBpIGluIC9wcm9jL2RldmljZS10cmVlL2NwdXMvY3B1QCovY29tcGF0aWJsZTsgZG8gY2F0
ICIkaSI7IGVjaG87IGRvbmUKCWFybSxjb3J0ZXgtYTc2Cglhcm0sY29ydGV4LWE3NgoJYXJtLGNv
cnRleC1hNzYKCWFybSxjb3J0ZXgtYTc2CgpSZWdhcmRzLApHYcOrbAoKIGNvbmZpZ3MvcmFzcGJl
cnJ5cGk1X2RlZmNvbmZpZyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29u
ZmlnIGIvY29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29uZmlnCmluZGV4IDBkNzUzMzk5ZTIuLmQ0
MzUwM2FiMjYgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZworKysg
Yi9jb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcKQEAgLTEsNiArMSw1IEBACiBCUjJfYWFy
Y2g2ND15Ci1CUjJfY29ydGV4X2E3Nl9hNTU9eQotQlIyX0FSTV9GUFVfVkZQVjQ9eQorQlIyX2Nv
cnRleF9hNzY9eQogCiAjIHBhdGNoZXMKIEJSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9yYXNw
YmVycnlwaS9wYXRjaGVzIgotLSAKMi40Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
