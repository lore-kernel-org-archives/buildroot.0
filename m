Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8565DEB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 17:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA1982AF5;
	Fri,  7 Jul 2023 17:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEA1982AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ee2K275q8jX; Fri,  7 Jul 2023 17:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3048882893;
	Fri,  7 Jul 2023 17:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3048882893
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2B451BF417
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 17:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D44A82893
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 17:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D44A82893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSvHHuVGKJny for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 17:15:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A698682305
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A698682305
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 17:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1688750132; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=p4BwsPEnC+IlBIKpi05ugQmedS3TAUPGOTJ6bhhqBJDtYGufGW8Frwb/fuCnGTLy7M
 jPUfjfcNxb6IHTiDtwkmLy1H9bsXXFtfsh00D3O7SfxC5zttm1x1re7UzWhMvlQBxojZ
 9YiyV69rE8mM0stTX1zjSXuVbPfgRjKfjKegiTqpAHISKN7r0uSNxDnQkYDYBHSRUJGR
 mwUOsXeqSux2yc2SDYgGtM4eKZQJk0jUqpiEsA6/9nMT2TqimPmSlXNYBhgzLZkVbpIu
 mD7FYIWq/ZGOXqDv7nja0Rk8xpIJeZ0oirJv28aOKlRenSQe682RbNExk1VI44uFzfrW
 1X2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1688750132;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=uvDi4veY9oocYoKwoSgrkLJmVAW0IjgSA5YvOCIfBBY=;
 b=hDxDJc0KhmCD2VY6sM1tFuQyyce8hcwPfRCafDOjkrChW9VOTd7OECZBMKmMeYPvGA
 Thm6KVLupU2VFWD9Mvpc/CHF0sEnH/SDDfVaHEC18NYlxIWts+4w+pgJGrF0VjTTqWTn
 f32DJAwtyytsTiS1r1m2UB7kGdJM3xrvXvYoOZaJo7jxRCA7ktaq2YHs5zF+lXwa5Mjd
 10HyI/9Ij2fHFlCGUcOKYzPfzD1Aszm8qjaJ0wJESbl8znm+8VEOXwu9CyT6iWTH+V7S
 W6gnT5qaWswqZTVv8qNMpBc84ePDICnjiwxjLXkkE5C9ubo7Ni5+SrxqBvacWgqpoMl1
 tYEg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxl/iaU"
Received: from tesla.fritz.box by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
 with ESMTPSA id 028995z67HFWbv1
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Fri, 7 Jul 2023 19:15:32 +0200 (CEST)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 19:15:29 +0200
Message-Id: <20230707171529.1924168-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1688750132; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=uvDi4veY9oocYoKwoSgrkLJmVAW0IjgSA5YvOCIfBBY=;
 b=YoCqlFP43J3oBPzDaa0ueCBgpSwuxTlITQnWgJgldm3sGGqhLSXVI9yPSm2aput3Lm
 QJZhVusNvcn68JaSD4f93zZHo5GIi0JyqXsCFw5L6cWMha08n2VpruyEvPiBvwL59YmI
 I3qXJgrPwXCwYV+YeTWbVr1i8tHCpZBA+/jbKNZFaMqCmDeiR3OyF7uHvs/GKAGp4VW1
 ItfknCmXISHElWvP1drZb0K7Ff+FfmAy2RwCfyakIfFcTlLW8biQs6rxXukE/vFB8DJg
 R/i5ixdCG4JJ9w9V1S1B2CfDs+yUPXd47qKKyhC+Pzy9m8rDfwmQvjr8jMfDVNXigrNK
 r/zA==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1688750132; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=uvDi4veY9oocYoKwoSgrkLJmVAW0IjgSA5YvOCIfBBY=;
 b=0RVuwkIsnDs8hFeV5favYMbDuGG4pjfRNE9SGldQYC0XDYqjFxEAjscHbw4ag3belt
 McIk6J/sNN7z7iWPAsDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=dawncrow.de header.i=@dawncrow.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YoCqlFP4; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=0RVuwkIs
Subject: [Buildroot] [PATCH] package/libkrb5: bump to 1.21
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

VGhlIGhhc2ggb2YgdGhlIE5PVElDRSBmaWxlIGhhcyBjaGFuZ2VkIGR1ZSB0bzoKCiAtIFVwZGF0
ZSBpbiBjb3B5cmlnaHQgeWVhcgoKIC0gQWRkaXRpb24gb2YgYSBCU0QtMi1DbGF1c2UgbGljZW5z
ZSwgc28gbm8gY2hhbmdlIGZyb20gdGhhdCBwZXJzcGVjdGl2ZQoKU2lnbmVkLW9mZi1ieTogQW5k
csOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIHBhY2thZ2UvbGlia3JiNS9saWJrcmI1
Lmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rICAgfCA1ICsrLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5oYXNoIGIvcGFja2FnZS9saWJrcmI1L2xpYmty
YjUuaGFzaAppbmRleCA5NGRmYTJlZDZlLi4yMjE3OGQwZGVjIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2xpYmtyYjUvbGlia3JiNS5oYXNoCisrKyBiL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lmhhc2gK
QEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Ag
c2lnbmF0dXJlCi1zaGEyNTYgIDcwNGFlZDQ5YjE5ZWI1YTcxNzhiMzRiMjg3MzYyMGVjMjk5ZGIw
ODc1MmQ2YTg1NzRmOTVkNDE4NzlhYjg4NTEgIGtyYjUtMS4yMC4xLnRhci5negorc2hhMjU2ICA2
OWY4YWFmZjg1NDg0ODMyZGY2N2E0YmJhY2Q5OWI5MjU5YmQ5NWFhYjhjNjUxZmJiZTY1Y2RjOTYy
MGVhOTNiICBrcmI1LTEuMjEudGFyLmd6CiAKICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlOgotc2hh
MjU2ICBjZmFkY2Y3YjJlYWQyZjNhZjc5M2MyNWMwMDYzOGM5OTA4YWMwMDIzYjEwMTY5NWY0MGNi
OWEwM2IxNjgxMWRjICBOT1RJQ0UKK3NoYTI1NiAgMGQ1MzczNDg2MTM4Y2IxNzZjMDYzZGI5ODI3
NGI0YzRhYjZlZjM1MThjNDE5MTM2MDczNjM4NGI3ODAzMDZjMiAgTk9USUNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5tayBiL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1r
CmluZGV4IDliYWNmYWVlNTguLjYyYTM0YjIzNzkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlia3Ji
NS9saWJrcmI1Lm1rCisrKyBiL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rCkBAIC00LDkgKzQs
OCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCS1JCNV9WRVJTSU9OX01BSk9S
ID0gMS4yMAotTElCS1JCNV9WRVJTSU9OID0gJChMSUJLUkI1X1ZFUlNJT05fTUFKT1IpLjEKLUxJ
QktSQjVfU0lURSA9IGh0dHBzOi8vd2ViLm1pdC5lZHUva2VyYmVyb3MvZGlzdC9rcmI1LyQoTElC
S1JCNV9WRVJTSU9OX01BSk9SKQorTElCS1JCNV9WRVJTSU9OID0gMS4yMQorTElCS1JCNV9TSVRF
ID0gaHR0cHM6Ly93ZWIubWl0LmVkdS9rZXJiZXJvcy9kaXN0L2tyYjUvJChMSUJLUkI1X1ZFUlNJ
T04pCiBMSUJLUkI1X1NPVVJDRSA9IGtyYjUtJChMSUJLUkI1X1ZFUlNJT04pLnRhci5negogTElC
S1JCNV9TVUJESVIgPSBzcmMKIExJQktSQjVfTElDRU5TRSA9IE1JVCwgQlNELTItQ2xhdXNlLCBC
U0QtMy1DbGF1c2UsIEJTRC00LUNsYXVzZSwgb3RoZXJzCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
