Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E3A606A330
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JO3vabHP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nqtF33uB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30926616EC;
	Wed, 11 Nov 2026 18:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CELQTazQMPlT; Wed, 11 Nov 2026 18:39:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F19161B81
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794422350;
	b=TDa0hVCtoJuC6UhHAtyBfj4o44VBT3fr9CEVnzUuDpV4LwSye/jSRglhdV3oOWtNOPrM
	 5gCkAByv1QHcPKTEcu7f0z9RCuXUVbTlenEg1f3Ru3nsdHNMYBTJ9cT7zSMZlUhisX1wN
	 L54uU4MDoplZW3fV0ZjPN8KMxtGnOYJjvnCrM8UQZThoA6yZvaKSknplGYXdwzyMUj8ON
	 v71frG//bAoeC/5VSg7RZpOyV8XiYzHRoW1xJZHsPDI0GXRIxmHQ0PtJW5oOqLqoRDa7H
	 VOwd7hMBzu9DP51SzXrmpYJ1ZxzzLLHX47vahSTMx84VUxK2XBo5uy15dglow5qHKBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794422350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ksmgGqMQNjGKXcpj4ZHKkGO70MoEfBTjfmvgbhGH2lM=;
	b=q5EycgkPdvAesB+VvD5IKN1bLjNpXcZ8MFEvYUBdn2/7R6aPOWb3Km4n8APNmdvywZVv
	 XgSYRX6aOBQ5rI70mITGlfsyF8J4L1Pk+bhIPFLG/SYzcPIx6cnrSaKTWaSBAssJ8rldP
	 mwY/z5IJIVPQBOa3wOd4oMK+iIQDGcTseLjZlozXlpmEC+3KHffx/FpUhFBsX0zCYO1r6
	 AoXj9qy/W9D/4+0ihC40bMcvp/1xvvPBG1QErBpRZ/5LJg91PDde5MmR9DvVAI7MKdqJq
	 wgT1hPXwkvVspujv15aMQN1PM2IXIpncfnekdhVEwLUCFzDgwXMx4B6mlHDirihnwVA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794422350;
	bh=ksmgGqMQNjGKXcpj4ZHKkGO70MoEfBTjfmvgbhGH2lM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JO3vabHPkqDkPH3G8zQXJsvMrdHUcIIhVU0W0Y9GuRVhP4QYqqlMO29GrC5uxj4dn
	 V1W41/WbDpiLqXWLP9jurjwrGyFX07fLKO65LmIDUsnGkowoj8WbDzylGPW6fZOdPy
	 PO6Kv0M0HmxqzB5QjanJ3+fTuYLrWFSGG5bvslHxzjaqgDPxUrLNmBZh97TyZsyNf1
	 IsHieMMPc0M1CP9J0MfHXijJFyG6WMvmD4mWXS/WJBWZSblM7zNUoNA6+CqhSzi4X2
	 IFDbocDkgPpyu267UQQmpxLBBmibElA5KirbbyGzv31/hivwd85WHv5DoUFwYhruJ4
	 TOByTCCNF93Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F19161B81;
	Wed, 11 Nov 2026 18:39:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDD67EC3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A36FA429A3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3E4zJgstWzw for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:39:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 20BEB43041
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=nqtF33uB
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20BEB43041
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so2678201f8f.3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794422283; x=1795027083; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=paRRgYfS2I9EjsayhT0YAo9HI1CZ50oUOtKAx0TCYmY=;
 b=nqtF33uB8N02X1lwRPWwqPIjaLN2nAXbCzEJRt8LLYryBfP9vcq+9TmICIxeRg3La7
 QF4T77W/z65DwObBFU2UHkrLBzFaxZtnjYlnET0pSq7lX+gN8cA0dXE+JL+PN358W1FM
 Sa5HALpINN0qJgQjMeeWcdftwfvRIO6AcNVS0aRmof4yKazQW6FLANMVmHW6E5hC0L2O
 13U1VlFOBpAtIMjbO8jPQv6ZacOtyPd+GGwsOO+rZZZo981CfUhcRNPZGDrJRAGvs7MU
 R2DnzGTc18SYDhDYBr3+1L7CA5433mnapboa2urD0PIEbADqkl+0gcQmrCs1tt21UQtP
 xyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794422283; x=1795027083;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=paRRgYfS2I9EjsayhT0YAo9HI1CZ50oUOtKAx0TCYmY=;
 b=YgFt3p/v/Ex/U27Y274cIoueypx9GHDML0NS7uvQtPjZ+PbmcgxLpN+lUchWLWipw7
 KqLI1ZULLCjGCvGgD3lys4N37R1CMqsPIm8mLB15cmW9UJsT7DXrMoqhPp3nDrsucgoY
 T0WjUx1HaNotMVQStDTmL9Vuy2LjGmAkdNhfO3/buA3gtxqEInfS6LS/YH5pwRuroL+r
 7jc2R8KHsJ+wib9RTpVF+wK2kGTayklIr1zKNMUcdFr407X1Xa9wM2EXU0qmkkToT1dW
 JvMjOcvOsidaTHLoRnDPyja+No34iLl6wl6ihPByprw4RTq8In1y9OtExrEsuMOrqLG1
 Jhhg==
X-Gm-Message-State: APuU4Z9kn3EGBWcQp895Z+mP/MrHedVJYjjTXbiAlctkcP1/dal0X6J+
 O65TW/gAvvFUophA5a3w4yYZ3KoodK7qXwV8YdGfeva7ByCtq/+1stE+Q1FLsJI4
X-Gm-Gg: AYBFou24gWYEeOQKYG0+R4EqMkQl+8IYeA+3bjsQTbidvWpKCO6mHFZw/3pMMqdPyyR
 XULIAY60mBcu3/jgF9N+tWEujG8E0R756wpVjfYO5bLVXznghm7fH/gaGftKP8gP+1y7nR7yZEl
 gzEqh69bDY+DJsCOVjAsxGEJY4ieRsOsHUBKt9tGTOmtw5AobfpjV8n5vQEgjkpfntQg99Dv8BS
 Q5Xkwa2NsOAowbnk/jfhxiM0FkPQ8+4wavHb6OKhq9O2ruVYFBa0MuZCItK7X8a9oBjuXtI2mOC
 FP1ZRe0wMGz27S99cmWAPTdKdWNyi1T+NdQUmUYrxuN3USmO5NlhxjuhYzjqIEURdqlm2qvkowG
 HNpPGFPhSzJhe6MYzf88WTbKebkSq5HGAStavneBjMQ9WWK8RY92f/nPRxf+/zdJb0TbLeiAcu+
 ae8iZ9bl74AWRADld7NWqVCUHHl69Sre85NWY8o4NgtCzrtTCTl6QJItohX8NbwgVDuJH4ZXlgK
 4kEjFh8cvlTtpu3rD3XdMADQaMvdWo+SXAsPaJJmFP04uYXwxuWjNImSmL7dzy14+soYQneHQM0
 h1CaAcFYZilyoqNi+yPidWqsYjOLCJeOb/lEKVEqtSg0wAjmTXENpSMeANEeu/ihVt0BQjTVRw=
 =
X-Received: by 2002:a5d:5f05:0:b0:48e:6092:dea1 with SMTP id
 ffacd0b85a97d-499ca377c20mr5384507f8f.47.1794422282457; 
 Wed, 11 Nov 2026 10:38:02 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm11007672f8f.20.2026.11.11.10.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 10:38:01 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:37:53 +0100
Message-ID: <20261111183756.2235235-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
References: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/7] boot/at91bootstrap3: drop the patch for
 3.10.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tm8gZGVmY29uZmlnIHVzZXMgQVQ5MUJvb3RzdHJhcCAzLjEwLjMgYW55bW9yZTogdGhlIGJ1aWxk
IGZpeCBmb3IKR0NDIDE1IGlzIGNhcnJpZWQgZm9yIDMuMTAuNCwgdGhlIDMueCB2ZXJzaW9uIG9m
IHRoZSBwYWNrYWdlLgoKU2lnbmVkLW9mZi1ieTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdlbG8u
Y29tcGFnbnVjY2lAZ21haWwuY29tPgotLS0KQ2hhbmdlcyB2MiAtPiB2MzoKICAtIG5vbmUKCkNo
YW5nZXMgdjEgLT4gdjI6CiAgLSBub25lCi0tLQogLi4uY29uZGl0aW9uYWxseS1kZWZpbmUtYm9v
bC1mYWxzZS1hbmQtLnBhdGNoIHwgNDcgLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQ3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvYXQ5MWJvb3RzdHJh
cDMvdjMuMTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29s
LWZhbHNlLWFuZC0ucGF0Y2gKCmRpZmYgLS1naXQgYS9ib290L2F0OTFib290c3RyYXAzL3YzLjEw
LjMvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1h
bmQtLnBhdGNoIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBl
cy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMzUyYzFjMGE0My4uMDAwMDAwMDAwMAotLS0gYS9ib290L2F0
OTFib290c3RyYXAzL3YzLjEwLjMvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1k
ZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDcgKzAsMCBA
QAotRnJvbSA5MDhjNjU2Nzg4Njc1NjVhOTM0ZWE1YTk2N2JmZTdlMjA0ZDFjY2FmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMu
ZnI+Ci1EYXRlOiBXZWQsIDI1IEp1biAyMDI1IDExOjEzOjQzICswMjAwCi1TdWJqZWN0OiBbUEFU
Q0hdIGluY2x1ZGUvdHlwZXMuaDogY29uZGl0aW9uYWxseSBkZWZpbmUgYm9vbCwgZmFsc2UgYW5k
IHRydWUKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotaW5jbHVkZS90eXBl
cy5oIHR5cGVkZWZzIOKAmGJvb2zigJkgYW5kIG1hY3JvLWRlZmluZXMg4oCYZmFsc2XigJkgYW5k
IOKAmHRydWXigJkuCi1Ib3dldmVyLCBzaW5jZSBDMjMsIHRoZXNlIGFyZSBwcmVkZWZpbmUga2V5
d29yZHMuIEFzIEMyMyBpcyB0aGUgZGVmYXVsdAotQyBkaWFsZWN0IGZvciBHQ0MgMTUsIGJ1aWxk
aW5nIHdpdGggdGhpcyBjb21waWxlciBmYWlscyB3aXRoOgotCi0gICAgaW5jbHVkZS90eXBlcy5o
OjIzOjIzOiBlcnJvcjog4oCYYm9vbOKAmSBjYW5ub3QgYmUgZGVmaW5lZCB2aWEg4oCYdHlwZWRl
ZuKAmQotICAgICAgIDIzIHwgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Ci0gICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgXn5+fgotICAgIGluY2x1ZGUvdHlwZXMuaDoyMzoyMzog
bm90ZTog4oCYYm9vbOKAmSBpcyBhIGtleXdvcmQgd2l0aCDigJgtc3RkPWMyM+KAmSBvbndhcmRz
Ci0KLUZpeCB0aGlzIGJ1aWxkIGZhaWx1cmUgYnkgb25seSBkZWZpbmluZyDigJhib29s4oCZLCDi
gJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmSBvbiBDCi1kaWFsZWN0cyBvbGRlciB0aGFuIEMyMy4K
LQotVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRzYW0vYXQ5MWJvb3RzdHJhcC9w
dWxsLzE4OAotW0VkZ2FyOiBiYWNrcG9ydCB0byB2My4xMC4zXQotCi1TaWduZWQtb2ZmLWJ5OiBF
ZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KLS0tLQotIGluY2x1ZGUvdHlwZXMu
aCB8IDMgKysrCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0
IGEvaW5jbHVkZS90eXBlcy5oIGIvaW5jbHVkZS90eXBlcy5oCi1pbmRleCAxMjQ2YTRkZi4uMmMx
YTQxY2YgMTAwNjQ0Ci0tLS0gYS9pbmNsdWRlL3R5cGVzLmgKLSsrKyBiL2luY2x1ZGUvdHlwZXMu
aAotQEAgLTQyLDggKzQyLDExIEBAIHR5cGVkZWYgc2lnbmVkIGxvbmcgbG9uZyBzNjQ7Ci0gdHlw
ZWRlZiB1bnNpZ25lZCBsb25nIHNpemVfdDsKLSB0eXBlZGVmIHNpZ25lZCBsb25nIHNzaXplX3Q7
Ci0gCi0rLyogYm9vbCwgZmFsc2UgYW5kIHRydWUgYXJlIHByZWRlZmluZWQgc2luY2UgQzIzLiAq
LwotKyNpZiBfX1NURENfVkVSU0lPTl9fIDwgMjAyMzExTAotIHR5cGVkZWYgdW5zaWduZWQgY2hh
ciBib29sOwotICNkZWZpbmUgZmFsc2UJMFUKLSAjZGVmaW5lIHRydWUJMVUKLSsjZW5kaWYKLSAK
LSAjZW5kaWYgLyogVFlQRVNfSF8gKi8KLS0tIAotMi40My4wCi0KLS0gCjIuNTMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
