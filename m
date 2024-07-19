Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F54C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 14:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 775C640C3B;
	Fri, 19 Jul 2024 14:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCM4zKivx8qL; Fri, 19 Jul 2024 14:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6925940C27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6925940C27;
	Fri, 19 Jul 2024 14:18:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6F21BF335
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46A19409FE
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQyvQc3hWsi1 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA470409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA470409F5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA470409F5
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:18:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUosT-1svNjE2KPJ-00IOL1; Fri, 19
 Jul 2024 16:18:17 +0200
Date: Fri, 19 Jul 2024 16:18:00 +0200
MIME-Version: 1.0
Message-Id: <20240719-micropython-v1-2-9d71f1125e49@gmx.net>
References: <20240719-micropython-v1-0-9d71f1125e49@gmx.net>
In-Reply-To: <20240719-micropython-v1-0-9d71f1125e49@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721398695; l=823;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=af+vAKgY8Y33lrL5iItdwl8npemkVr96o2v7w9TObgE=;
 b=mMakA7eBvZCyX888OYU47RkigQlsYLaFiiGdn9nrACzPLaRawssmPMjyciPs34O9Y7Zd0MWr0
 3a4OLVT5tzIDJW48nTol3fgBkn631I+uzB0MU+f4NH57+SRkkbdnTGR
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:53/8lfNxr2D21Yedm1+ULLvfRv3O04q7vLQ+UBHX7aN6iRVj77P
 +pJn/RvzxQdO9RqdJl+1CQH8GtqeT6kw/fL9XaxDOu+BIrNsauaDE3NfcAsUEka7vU9otAC
 O40MjGJsoxBYl1ZZ9CaTpHHp+4NjX0WWcCOK9MBxfWJhTtWiSBNrKUn2vC/P3/m3FKvFxC8
 oVmMXctJfiOCkdJ+VpAOg==
UI-OutboundReport: notjunk:1;M01:P0:byuuvehogZk=;LxKDpTSq6ag4igJvOpziZcsHAXK
 8Ybvm7BzIKnBa2vzdbOBFJ4dlw7U+SNikExC0FfcVeLN7coGBMGPT486PjQ5Cbu+Sk57q28dr
 7IC48fJ8XZ327jIXSaZzCZDWF0yJikN452ttIssBQIoAULwiPLZlMgEmgMX/EVTfhUW36exKO
 YF5o8CEWJf2qgs4b6uBX4GrWBII+XbBEdzrcLWRy8xsVpeb6g2hQodt5pEzCkth5lKP9qhW0H
 mqV0Mlb6te0Ypcm6Y7FIUZo9cCwbeBen7xdAoRYwoKau8JdW7BwFgEMQHuUrdpKNu1N7zibQR
 9sRrACuwJVa/4nWuN07iX7b8RG/Jfbd3FOdpeq1jOV6FLBiruB8xiqMqGhF1DxlQdIvGJWc6R
 CeULcl2Yy81hkAHbAFdVcttCxY9w3/hSkAcUUZLBK4osRKBi3r2K+glTadCUq48aUbHQRRXry
 lfZhzFirlxAWk4Y/UsiV6p2Sv0MOYhH3UjxyWKF80iukCuXr7N+Ravg+QBuQsFa9vpaqYYEfP
 XOGlTnsOCgSYa5O9d1cnRqgHkHinBBAg+2TYybCoAjR7cmYgjfx4aY2k1nR+usEgT0Op/J2Z5
 VpLcC4lOafcabNYbCPlxC/sYcCMlzXSfXAXWFGkmNZzND+dUKERQp8NCCgXhuQ74WavdVcWMQ
 fEQmbXO2oXBibqF7EXp+7h8XTntezD0FTvBKk4pTt0KR/7WoUEVpRKHdSHeQqYQhFIlg8M8PZ
 ejooeJJl/sWfX7IhYmlGEkQA+0JvAXKdlCWTOo7iquPqHbrPCIfmIZzlTyW6j3U6wbGw5BtId
 yf3THUtWjqxPuWUINQu9khKA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721398697; x=1722003497; i=j.neuschaefer@gmx.net;
 bh=qtu/qCaZHsSomhob8nf4dZNuyX63k1qgyvDJg6siQVQ=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XYsy8ac3QEEc3pCPbsbdOaDJLiHYWtFc60mWAMmCmcctA2Ox0h4bZ+4jHUlDPPB9
 ljLAs+AXv4HvDYje25D2ja9wHu2d1uyquEVloGGF3MwsxUk/7XK7+m//WlwbB/uH7
 /lbFnC9bkf+MbZ0MzHkOiSOL1RHevyCRsUD+aKuo0mARR/Mp3dXodsyr5Cd4NhS5f
 zophItrTyWz1bLkHsZO1FP++b9EwO0NXSarO+8uuqkgR2XxNfD4vOxejT+GSIGhM/
 cdMSs48mbuxRKZg6y3xUht/TCjGxbBFrlkpt5oRkOmgmciUQAaUdU3TZ6LLgZxD+A
 xak08hiAgllsFf/z/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=XYsy8ac3
Subject: [Buildroot] [PATCH 2/2] package/micropython: Adjust name in
 description
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
Cc: Chris Packham <judge.packham@gmail.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlIHRoZSBuYW1lIGZyb20gIk1pY3JvIFB5dGhvbiIgKHR3byB3b3JkcykgdG8gIk1pY3Jv
UHl0aG9uIgooY2FtZWxjYXNlKSwgdG8gbWF0Y2ggdGhlIG9mZmljaWFsIHdlYnNpdGUgYW5kIGRv
Y3VtZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZl
ckBnbXgubmV0PgotLS0KIHBhY2thZ2UvbWljcm9weXRob24vQ29uZmlnLmluIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9taWNyb3B5dGhvbi9Db25maWcuaW4gYi9wYWNrYWdlL21pY3JvcHl0aG9uL0NvbmZp
Zy5pbgppbmRleCBiNDY2ZmJhZjJkLi5mNTMyYjNiZGI1IDEwMDY0NAotLS0gYS9wYWNrYWdlL21p
Y3JvcHl0aG9uL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL21pY3JvcHl0aG9uL0NvbmZpZy5pbgpA
QCAtMyw3ICszLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01JQ1JPUFlUSE9OCiAJZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCiAJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJT
CiAJaGVscAotCSAgTWljcm8gUHl0aG9uIGlzIGEgbGVhbiBhbmQgZmFzdCBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgUHl0aG9uCisJICBNaWNyb1B5dGhvbiBpcyBhIGxlYW4gYW5kIGZhc3QgaW1wbGVt
ZW50YXRpb24gb2YgdGhlIFB5dGhvbgogCSAgMyBwcm9ncmFtbWluZyBsYW5ndWFnZSB0aGF0IGlz
IG9wdGltaXNlZCB0byBydW4gb24gYQogCSAgbWljcm9jb250cm9sbGVyLgoKCi0tCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
