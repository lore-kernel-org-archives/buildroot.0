Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DAEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 13:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BAB83EA5;
	Tue, 12 Apr 2022 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oqRydFo18we; Tue, 12 Apr 2022 13:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33AE183E83;
	Tue, 12 Apr 2022 13:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17CB11BF859
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 13:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 069B360E61
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 13:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H23B2XWRe3bo for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 13:27:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32FD8606CB
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 13:27:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.82.161])
 by Aruba Outgoing Smtp  with ESMTPSA
 id eGYlnD9hNzBRqeGYln2Wok; Tue, 12 Apr 2022 15:27:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1649770075; bh=wraVBTelHlFpWLoZ5BCtQBpXF50tKDu4O5EPrTMocCQ=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=mOUb1TzwU3rhipmFpKh08W84A8A3YliXBNYu9iKpn3z0+vWco9HQ9jBWOrtcxzZ4V
 JkusgCE6Vivv6V7jjEY69f/t8wdkzapcGlTPfciOtB+M5frTKHCP72Aw2GHTFcFSdM
 QHDxx8IYadO+EasFCmg8J3ZZ+3jJmTR56KSLnHygRXMGGx2lSmX64M4hsFe7Eae9/A
 10bhYSE4r6Iw6Ao73avp1J3Quht0asPU3cok8l7Y/c+g3YezEu6dOfUekWIeQO8MoK
 +YfenX+hjd2bkKR+9sRKYyp1joFcS7qJ7FcdyCl/vkxXOn0S4+CPZF3S/eZKBtkyvt
 pmNSK+QNq3BEQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 15:27:52 +0200
Message-Id: <20220412132753.89827-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG4fm4vWbc7jF6/QboUKpmDWgyL4yzfhaYHY9uC7TqpJhKy1v7q9qZF4R/vG3rYXQl6TJFvux7nEwx+uM8BMlbma9E/GgH2TIVMdaoly/VH8XOAIkreQ
 taxvBcywvNz9iHsPSu0fpgTFPUt2Oh6rTg/yVo/Xn7rvhyXDSvfTUso0LVobyVIyVoQA4Gfp1B5voTDWNBxfeoJ+nn/mpmOYNuD39+2Huz8qLiWmbUd52rvC
 /gPHVKzA1BBLzPykrOsLvnJWvanfHmSfOGkAXlvUnVf/O/ptOvp8PaQV2cfJgv2xe7006JOr1xLxZk+cGJaqOkZwoH30r+gwcuunVyFUy/o=
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_DEVELOPERS=3A_add_missing_Miqu?=
 =?utf-8?q?=C3=A8l_Raynal_e-mail?=
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+Ci0tLQogREVWRUxPUEVSUyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IGQ1MDM1YjMyMzkuLjdhODdjY2VhZWYgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjA2Nyw3ICsyMDY3LDcgQEAgRjoJcGFja2FnZS9saWJm
cmliaWRpLwogTjoJTWluIFh1IDx4dW1pbnJlYWR5QGdtYWlsLmNvbT4KIEY6CXBhY2thZ2Uvc2hh
ZG93c29ja3MtbGliZXYvCiAKLU46CU1pcXXDqGwgUmF5bmFsCitOOglNaXF1w6hsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KIEY6CXBhY2thZ2UvbWFsaS1kcml2ZXIvCiBGOglw
YWNrYWdlL3JvY2tjaGlwLW1hbGkvCiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
