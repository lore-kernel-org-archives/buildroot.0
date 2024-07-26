Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE127C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 20:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB4D140E52;
	Fri, 26 Jul 2024 20:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSezUn_2-cvB; Fri, 26 Jul 2024 20:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0760A40E5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0760A40E5E;
	Fri, 26 Jul 2024 20:04:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 833BE1BF348
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B68E40BBB
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SObtujjmW9VS for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 20:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDBC340D6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDBC340D6B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDBC340D6B
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 20:04:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.233.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFvp-1sNqmP45PZ-001kPp; Fri, 26
 Jul 2024 22:04:05 +0200
Date: Fri, 26 Jul 2024 22:03:51 +0200
Message-Id: <20240726-s6-tests-v1-0-fb57b051e87f@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACcBpGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyMz3WIz3ZLU4pJiXTPLpNSkZIs0ixTjRCWg8oKi1LTMCrBR0bG1tQB
 0m3QgWgAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722024243; l=537;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=Hyrsj7+ReMjvKL4xkM8XhqnWrxYDAs/YGHMFcNNR2Z0=;
 b=0/G235C0y8JVwb5cphOeRzO9bP6r6u3AYNlJrA/DvK9S03D2Kr9whQJ+Mjn55h9khMbfsm5X9
 nf2dUWkSP0vD3F5qdFq63dKiQp77uGxsR91sOLKrOS2Xgq5BGoPkadx
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:pylpraWsoP9zcliL2gCQZdjznsAEHVlT7gvezFGZyFF7NXVt8Yn
 kk5D2EHGxeMAnHZ82/bCleKkVYTqQyiFdk19du4Tf/xAnxnX/XTgW+SgJo6HnJYp3X8feJ6
 K6ApykylFiOSRaVrT/dAOASjo2mjz/l6ztC1DjZWcH0tRVBRE+D+f2vs2attGKKAjBvAaC4
 Bjtfaegv44cfJFQTyoDQQ==
UI-OutboundReport: notjunk:1;M01:P0:hvFTty5vKPs=;XMRftgi85fA8q38IDcBgug4+qQd
 k/My9FpH8Q3OfPBIhom30fubw8UbMjmwpb9W+gzAupTLvQYa7MBF/uqeob0d2rhc297GjGNNG
 ulbukUVza5vxxtojwUo8aykvQKhx8vDbSMjfAqoKl9vUitqNYnglXUWjtijcjr4TekV/1gTga
 X2tRy2iFqVNfd3BK/XmkQE7ERwptRwDY6uEEcpEp0omezr3X2iHEvgM8P5ea2ffPLngeBq0aB
 q99SMTamWcSTiJAJrYZW6N1Ls01OpDXLu28fijqCXZ68JgL753B2f3buwdGYVZpItNbkqvSoJ
 IKEpsi3AQtNNSByBiKLDP11uIBSJo//BBrRvpDkVkImwiRcIbzvH7iRWYpT9DolkXBeCTIjRw
 IxCJFLFR7+B+7Lhlv3heAAduhQrmdBNmxMQUo1WBU5gCJc1NNQ/dQ6Cjcch6Jadqx2LAXs4Oc
 yfeJzJcxEue81SEjMQmW9QCRUtHqrFXxKQKX3hz+9mGk4xYZA+GK0ByYmT87bFomzBIP2JTAg
 hDUggUd9YDOtKx6RphnsrOwUNYodrJV90KW5YQUFHHyDRhA8GrSH3UTEisbSQjW6gcssq9cpV
 FK/oFyqQzgZjGuPjdTbdeZv5LX6iqQtUOF3ls5eux2dp4+E2OD6/Fkkc/DqLWHZdcR/s/k7z+
 5xLnySmoTm8prpFNdrezym6Z7StAHaMPw+L+QWx+ml6xuxNU0mQWKpMgcNUZM+FNI8rQQkdG5
 3ve/jowYms4VqTrZtPbgs4DBegbjuimRJfYy0rJZel+PKa2CWMrzVLSQQd+uqC/cINzUNMNql
 eVitkEesC0ZOZPX0rtR/is5A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722024245; x=1722629045; i=j.neuschaefer@gmx.net;
 bh=0pMU3eUde+IjYzqXBVJkx12GfkGFvNFbwyff308wQ5Y=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ONVf4gTJO7NnIVaAdpmn9Qdhu45TgVc/nJJlSyMEo2y2coV7ZYJ00IDx/I0PaGk+
 4it9hm8aaNwHDVQ3nsvLGrfGiEHxPEU4eC9PdS26d47K7EMYQ7nqWUvW/ZixP/Tb+
 Vgt3Yvw+MxPxh01ER48eZuslK+ABuDSbQjTDMUP9RrSLClF0OzFNEZbPHeZprszBR
 oxzUFAZiYVn/zj5Onb/MhFNG5xS+405xsUJ30eCdzGDMA9P9lFTLsNRGxDajFjd4v
 FZbzQrHQ8DREeNlohTY7olbqqxuD9el2u7N7JUzBdbPbwHc7hnjWQ6H2R7hNSkhd9
 RUWzKRmY89OSnq7s5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ONVf4gTJ
Subject: [Buildroot] [PATCH 0/2] Fix s6-portable-utils runtime tests
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CkouIE5ldXNjaMOkZmVyICgyKToKICAgICAgc3VwcG9ydC90ZXN0aW5nOiBGaXggczYtcG9ydGFi
bGUtdXRpbHMgdGVzdAogICAgICBzdXBwb3J0L3Rlc3Rpbmc6IFRlc3QgZWx0ZXN0IChwYXJ0IG9m
IGV4ZWNsaW5lKQoKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZXhlY2xpbmUu
cHkgICAgICAgICAgfCA1ICsrKysrCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3M2X3BvcnRhYmxlX3V0aWxzLnB5IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKLS0tCmJhc2UtY29tbWl0OiA1NDFlYjhiZjdkYjU1MzcwOGZm
MjI4Njk5NWNlOTRiMzhmYzhkNTM3CmNoYW5nZS1pZDogMjAyNDA3MjYtczYtdGVzdHMtNjliZWJj
OGY4ZDNhCgpCZXN0IHJlZ2FyZHMsCi0tCkouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdt
eC5uZXQ+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
