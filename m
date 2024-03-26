Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1310AC54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 17:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6C182021;
	Tue, 26 Mar 2024 17:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qd8y2Fw7lM2P; Tue, 26 Mar 2024 17:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB5DD82024
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5DD82024;
	Tue, 26 Mar 2024 17:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 884F61BF37B
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 17:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 828DB605AD
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 17:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvA9w_7mfh91 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 17:28:28 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=85.215.255.21; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=nerv@dawncrow.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23D2060B06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D2060B06
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23D2060B06
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 17:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1711474105; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=AuhW/uH69H+fq/2Lvo5YE8zo7jg+0DNxhZzxU7FNzWRCbVlaCB488qjyjSZSlrf728
 oZplsaKMK0ThIDeTe8DOF7pCwi1vPLwZxW0FsnjDiOmrYA5L0WPOMzVVjno30fBYo35t
 5wPKd7bBA1WrOfPWvmOyOIALd2WiEuSRlZcfWMKrgPPuqKmZazfFOFOdcHIciTEfqRAH
 uKK4ApqkDeeUER3BfA+neGP37d27yqcyX5Arrem5qBPhSAap5oyla+IIPOzeNC05MEg8
 8xCrMN9Y+8E3geV6lTZTTAizyau+PanokWmpEqQe/rz906D7nfx4/l5pFzGNGQqAm3ig
 aUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1711474105;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=Hc5ApGrB7gy4PZ7zoKVFr12uVIf0eSMVS5or+wL3Q/U=;
 b=bOY+AuOt7BU1AFUGvuCeXcqAx8S/CUr6rsD8nUIrWuAiOWa+oY80hpXW9ayDKRbARe
 ySH98Tuyyb7sUr7/otNqE50VKBQnRCxgUr4X3BShxzezAPJAWSbiM/VupiJGfufnlzMX
 /DwWJOmbdPljksS2EMW+ScaIxkK5D9308HFsjTstqCdm4M4Z3PF7PdceCR9ADGpJFl9w
 ZP40c/bWyzOiMB900oUm84OPDE8ZVOjvYvxP4sSTWYfvGHsW4uepwkp6o/K0YRU3v1w7
 KMt71THDcPTY0w96keFVaahb5SgwJSe+A6yyvepVEb58r4U2Wl9Gl5zJta3J6rutKi1z
 pVtw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxm+CmU"
Received: from tesla.fritz.box by smtp.strato.de (RZmta 50.3.2 DYNA|AUTH)
 with ESMTPSA id j8711202QHSPGra
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Tue, 26 Mar 2024 18:28:25 +0100 (CET)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 18:28:22 +0100
Message-Id: <20240326172822.1820862-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1711474105; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=Hc5ApGrB7gy4PZ7zoKVFr12uVIf0eSMVS5or+wL3Q/U=;
 b=ViXe0oEL5kAJGsj7Anfz5QqJ+b5AJbNFafZjP1gc8Aw4hGobeg/PGbRVZ+xt1kUOBC
 1lBp2uIBbRTXPCg5Dcb5eU/ZgG2U1SFDemPJ8VcQIiO0bzcF+0eVQnThy6qPLCGarfLo
 2eLXYdnr6Uwb28ABkr31BF9pqaQVnUlDVcIcn7w5mnWm6j22g8MRL7SLNJeZ+gsCaSO8
 dhRngHV/WuXMpN9C/x0Dxa/6TuvVhmia5As30CXrVyA2D0GGxiPWjLQ/uSv5WLRh8czi
 hdKpW3LCaSFsgi9/cDEWs6HFWqJsT87rZaHBhK3gjCqGWNGeVsFk70KkhrmWBlTQfBb9
 QWBA==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1711474105; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=Hc5ApGrB7gy4PZ7zoKVFr12uVIf0eSMVS5or+wL3Q/U=;
 b=95PPegXLEYn+XFCb7C20cRhI2sttk48fDbhwF5AswDm0g5j3TSFlauqbh7CV9/R62+
 OL0KPYq0Adgu5jBb5WCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=dawncrow.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dawncrow.de
 header.i=@dawncrow.de header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=ViXe0oEL; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=95PPegXL
Subject: [Buildroot] [PATCH] package/libkrb5: bump to 1.21.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIHBhY2th
Z2UvbGlia3JiNS9saWJrcmI1Lmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5t
ayAgIHwgNSArKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJrcmI1L2xpYmtyYjUuaGFzaCBiL3BhY2th
Z2UvbGlia3JiNS9saWJrcmI1Lmhhc2gKaW5kZXggMjIxNzhkMGRlYy4uMDJjMGUzMzk2ZSAxMDA2
NDQKLS0tIGEvcGFja2FnZS9saWJrcmI1L2xpYmtyYjUuaGFzaAorKysgYi9wYWNrYWdlL2xpYmty
YjUvbGlia3JiNS5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0
ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZQotc2hhMjU2ICA2OWY4YWFmZjg1NDg0ODMyZGY2N2E0
YmJhY2Q5OWI5MjU5YmQ5NWFhYjhjNjUxZmJiZTY1Y2RjOTYyMGVhOTNiICBrcmI1LTEuMjEudGFy
Lmd6CitzaGEyNTYgIDk1NjA5NDFhOWQ4NDNjMDI0M2E3MWIxN2E3YWM2ZmUzMWM3Y2ViYjViY2Uz
OTgzZGI3OWU1MmFlN2U4NTA0OTEgIGtyYjUtMS4yMS4yLnRhci5negogCiAjIEhhc2ggZm9yIGxp
Y2Vuc2UgZmlsZToKIHNoYTI1NiAgMGQ1MzczNDg2MTM4Y2IxNzZjMDYzZGI5ODI3NGI0YzRhYjZl
ZjM1MThjNDE5MTM2MDczNjM4NGI3ODAzMDZjMiAgTk9USUNFCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYmtyYjUvbGlia3JiNS5tayBiL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rCmluZGV4IGM1
ODc2M2VkZGQuLjA4YmM3NGViMzQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1
Lm1rCisrKyBiL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rCkBAIC00LDggKzQsOSBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCS1JCNV9WRVJTSU9OID0gMS4yMQotTElCS1JC
NV9TSVRFID0gaHR0cHM6Ly93ZWIubWl0LmVkdS9rZXJiZXJvcy9kaXN0L2tyYjUvJChMSUJLUkI1
X1ZFUlNJT04pCitMSUJLUkI1X1ZFUlNJT05fTUFKT1IgPSAxLjIxCitMSUJLUkI1X1ZFUlNJT04g
PSAkKExJQktSQjVfVkVSU0lPTl9NQUpPUikuMgorTElCS1JCNV9TSVRFID0gaHR0cHM6Ly93ZWIu
bWl0LmVkdS9rZXJiZXJvcy9kaXN0L2tyYjUvJChMSUJLUkI1X1ZFUlNJT05fTUFKT1IpCiBMSUJL
UkI1X1NPVVJDRSA9IGtyYjUtJChMSUJLUkI1X1ZFUlNJT04pLnRhci5negogTElCS1JCNV9TVUJE
SVIgPSBzcmMKIExJQktSQjVfTElDRU5TRSA9IE1JVCwgQlNELTItQ2xhdXNlLCBCU0QtMy1DbGF1
c2UsIEJTRC00LUNsYXVzZSwgb3RoZXJzCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
