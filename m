Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB92C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 09:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FB876081C;
	Fri,  1 Mar 2024 09:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e13aiFvXadLe; Fri,  1 Mar 2024 09:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC7EA60726
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC7EA60726;
	Fri,  1 Mar 2024 09:22:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA37D1BF83E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97660418C3
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8q0ixSgD5wD3 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 09:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9029E4180D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9029E4180D
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9029E4180D
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 09:22:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so2544598a12.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 01:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709284918; x=1709889718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kQ5HExGdtC9Z7QxtoSFpEBW2H8aGFD8Skg/2ruTIDsA=;
 b=GwkCWsqnC8A0Du+uqFjxcyJjD0FzwcPmDVHJWan2Ht7sp/tHhNbVdjKHHPYBrZTety
 ljvp/uF8VRPzI7b5dlPEvotBXMHsFW30qa5bHhud8eIGoTG1hN8mIj+gk8JH1+d4W1aS
 2vNbXncDkmlvmA76exZa5Sp02ehf8arAYM4WO8rZ9sOAPX21MgK9aygzT28ZjnI0C0Kd
 +Zi19YDRxarDCL0pqbPY3FdZ5Ympmo5lP0zpSoADLIQLZQRuxpwWcsEQ9YcxnE5ibu8c
 uIXJJ5GANyBRntfGP9n0yM4VNshZixxw8P4IZpNwSXyagqAhRIWpem0+updORo5CGbns
 13sQ==
X-Gm-Message-State: AOJu0Yzm7++VJQ+zTaNmx3EaGitDLOEnehkaUOFVWDlQZRZr4CixW0bG
 0qAXUs0oovHRp4LZiZZQynFyw865qY8FJr5x+3kelZA40BgksnPOsE7TqM6Ch8z13xsmc4UiOzg
 qYGI=
X-Google-Smtp-Source: AGHT+IGU1fqk1caBoxgd+8dRW5lIDCWcXWtWq3lLYIKWEOnwXackMbEJrkAQliGi5SH7hgNqLznB1A==
X-Received: by 2002:a05:6402:222a:b0:566:2a20:fc20 with SMTP id
 cr10-20020a056402222a00b005662a20fc20mr902019edb.9.1709284918299; 
 Fri, 01 Mar 2024 01:21:58 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05640243c300b0055edfb81384sm1372291edc.60.2024.03.01.01.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 01:21:57 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 10:21:02 +0100
Message-Id: <20240301092103.3902039-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1709284918; x=1709889718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kQ5HExGdtC9Z7QxtoSFpEBW2H8aGFD8Skg/2ruTIDsA=;
 b=APtu4ouk8yKSOQCOMs/H3wcCb43tWkLO2CBb8N4SVHhJOxKq1qf1CDZeg/aRqeTlid
 6gEKKCX1oJ8Lmqjvluzs/wxICbjQIJhZ8yAAM7xRAQU6lasVOngzGAU75P1IboMc5O/k
 djrbQTAIUQQlH/3q1HuH8Uxl+UlXYQtLducDmjy2ukC2PSqDKrbFFIdBTF+AMSVq0dY5
 07QMci5zhHwjG5TmmKh9O0sFpin4wDEWsJ9fSD6i09UOMwh1l8vP+Lkd/np+MG910oss
 /aPLkJlu+UpUKp0EScJd1ScWnGlLvXW03HR4X5mP3T5TQNgTH4HpdPEgZgAPCwnaTcXn
 Wvag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=APtu4ouk
Subject: [Buildroot] [PATCH v2] package/nfs-utils: only install fsidd binary
 and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RlNJRCBkYWVtb24gYW5kIGl0cyBzeXN0ZW1kIHVuaXQgZmlsZSBib3RoIGRlcGVuZCBvbgpCUjJf
UEFDS0FHRV9ORlNfVVRJTFNfUlBDX05GU0QgYnV0IHRoZXkncmUgbm93IGFsd2F5cyBpbnN0YWxs
ZWQuIFJlbW92ZSB0aGVtCmJvdGggaWYgQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19ORlNEIGlz
IGRpc2FibGVkLgoKUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBi
ZW5ldHRpZW5naW5lZXJpbmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJv
bkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1rIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsgYi9wYWNrYWdlL25mcy11dGlscy9u
ZnMtdXRpbHMubWsKaW5kZXggNGYyYjQxYzc4Mi4uYjc1N2UzZTUxZCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1rCisrKyBiL3BhY2thZ2UvbmZzLXV0aWxzL25mcy11
dGlscy5tawpAQCAtNDIsNyArNDIsOCBAQCBORlNfVVRJTFNfVEFSR0VUU18kKEJSMl9QQUNLQUdF
X05GU19VVElMU19SUENERUJVRykgKz0gdXNyL3NiaW4vcnBjZGVidWcKIE5GU19VVElMU19UQVJH
RVRTXyQoQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19MT0NLRCkgKz0gdXNyL3NiaW4vcnBjLmxv
Y2tkCiBORlNfVVRJTFNfVEFSR0VUU18kKEJSMl9QQUNLQUdFX05GU19VVElMU19SUENfUlFVT1RB
RCkgKz0gdXNyL3NiaW4vcnBjLnJxdW90YWQKIE5GU19VVElMU19UQVJHRVRTXyQoQlIyX1BBQ0tB
R0VfTkZTX1VUSUxTX1JQQ19ORlNEKSArPSB1c3Ivc2Jpbi9leHBvcnRmcyBcCi0JdXNyL3NiaW4v
cnBjLm1vdW50ZCB1c3Ivc2Jpbi9ycGMubmZzZCB1c3IvbGliL3N5c3RlbWQvc3lzdGVtL25mcy1z
ZXJ2ZXIuc2VydmljZQorCXVzci9zYmluL3JwYy5tb3VudGQgdXNyL3NiaW4vcnBjLm5mc2QgdXNy
L2xpYi9zeXN0ZW1kL3N5c3RlbS9uZnMtc2VydmVyLnNlcnZpY2UgXAorCXVzci9zYmluL2ZzaWRk
IHVzci9saWIvc3lzdGVtZC9zeXN0ZW0vZnNpZGQuc2VydmljZQogCiBpZmVxICgkKEJSMl9QQUNL
QUdFX05GU19VVElMU19ORlNWNCkseSkKIE5GU19VVElMU19DT05GX09QVFMgKz0gLS1lbmFibGUt
bmZzdjQgLS1lbmFibGUtbmZzdjQxCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
