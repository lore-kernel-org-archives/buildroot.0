Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51204C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 12:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCD3942251;
	Thu, 16 Mar 2023 12:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCD3942251
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJuvjJvOLRBc; Thu, 16 Mar 2023 12:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1932C417CF;
	Thu, 16 Mar 2023 12:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1932C417CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52E641BF3AF
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 12:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 263B0610AA
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 12:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 263B0610AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAOjPnRK8yeu for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 12:53:35 +0000 (UTC)
X-Greylist: delayed 00:16:34 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6207561064
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6207561064
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 12:53:35 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pcmqo-0009XI-70; Thu, 16 Mar 2023 13:36:58 +0100
Received: from [185.17.218.86] (helo=rap..)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pcmqo-000LJE-1y; Thu, 16 Mar 2023 13:36:58 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 13:36:53 +0100
Message-Id: <20230316123653.3648067-2-martin@geanix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230316123653.3648067-1-martin@geanix.com>
References: <20230316123653.3648067-1-martin@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26844/Thu Mar 16 08:24:08 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=7VD04GgoS6vaRyXme+b2Tcxbq7K5Rvb5OrbzI8iXz6E=; b=FDEqkQdjGTdOf4yKe5auOdJbv0
 5sJ3+zjKvyUNXulpTManiH4TMlgJHqvPn0WCL/4c7iufEzkTM4nPKK6Nfys3Gfl4/QnafqwZbgDN9
 PtL9O7uEhMxOPK6FUY0ZqizZyDFK893Kx3SWzZfLcHuqUNz4M9A5ngs4cV8tMCzgYSYnoAb72n1Nm
 FUflPzJwp65ywjZvbUwD7tG9a+5xQqak/Xk+Bb6L7eObElai9QzTh4KVeOcJxnGsXYxIt90pT8MLa
 PS3hiHeesjVqQ46uSMZ82rUPedsM+0TRpGKzIYTiN0XA79dDJHhZXDbV2Z005PuDHF/+yq2E+Avmd
 oJIJk80A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=FDEqkQdj
Subject: [Buildroot] [PATCH 2/2] python-marshmallow-sqlalchemy: bump to
 version 0.29.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgotLS0K
IC4uLi9weXRob24tbWFyc2htYWxsb3ctc3FsYWxjaGVteS5oYXNoICAgICAgICAgICAgICAgICAg
ICAgICAgfCA0ICsrLS0KIC4uLi9weXRob24tbWFyc2htYWxsb3ctc3FsYWxjaGVteS5tayAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLW1hcnNo
bWFsbG93LXNxbGFsY2hlbXkvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkuaGFzaCBiL3Bh
Y2thZ2UvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkvcHl0aG9uLW1hcnNobWFsbG93LXNx
bGFsY2hlbXkuaGFzaAppbmRleCA2Yjg0N2RlOTRkLi5kYjA2MWI2MjNmIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy1zcWxhbGNoZW15L3B5dGhvbi1tYXJzaG1hbGxvdy1z
cWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tbWFyc2htYWxsb3ctc3FsYWxjaGVt
eS9weXRob24tbWFyc2htYWxsb3ctc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBt
ZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9tYXJzaG1hbGxvdy1zcWxhbGNo
ZW15L2pzb24KLW1kNSAgNWUwMTJiMDdjY2Y0YWQ2N2RiZDNmMzhjYzY4Y2IxZjQgIG1hcnNobWFs
bG93LXNxbGFsY2hlbXktMC4yOC4xLnRhci5negotc2hhMjU2ICBhYTM3Njc0NzI5Njc4MGE1NjM1
NWUzMDY3YjljOGJmNDNhMmExYzQ0ZmY5ODVkZTgyYjNhNWQ5ZTE2MWNhMmI4ICBtYXJzaG1hbGxv
dy1zcWxhbGNoZW15LTAuMjguMS50YXIuZ3oKK21kNSAgIGUxYjI4NThiZTJmMGNlNmRlYWQ0OGU2
NzA4MDYzMWM0IG1hcnNobWFsbG93LXNxbGFsY2hlbXktMC4yOS4wLnRhci5negorc2hhMjU2ICAz
NTIzYTc3NDM5MGVmMGMxYzBmN2M3MDhhNzUxOTgwOWM1Mzk2Y2Y2MDg3MjBmMTRmNTVjMzZmNzRm
ZjViYmVjICBtYXJzaG1hbGxvdy1zcWxhbGNoZW15LTAuMjkuMC50YXIuZ3oKICMgTG9jYWxseSBj
b21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDYyNWRmOGUyNzU4YTI3MWI0YmM5MDUy
NWMwYjYxNjE4MTRlMGY3MmNiMzUwNGIwM2FiNTIwNmI3YWJmNTAwNzIgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkvcHl0aG9uLW1hcnNo
bWFsbG93LXNxbGFsY2hlbXkubWsgYi9wYWNrYWdlL3B5dGhvbi1tYXJzaG1hbGxvdy1zcWxhbGNo
ZW15L3B5dGhvbi1tYXJzaG1hbGxvdy1zcWxhbGNoZW15Lm1rCmluZGV4IDI5M2VhMjliZTYuLjhm
MTc2ZmViNGQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hl
bXkvcHl0aG9uLW1hcnNobWFsbG93LXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24t
bWFyc2htYWxsb3ctc3FsYWxjaGVteS9weXRob24tbWFyc2htYWxsb3ctc3FsYWxjaGVteS5tawpA
QCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9NQVJT
SE1BTExPV19TUUxBTENIRU1ZX1ZFUlNJT04gPSAwLjI4LjEKK1BZVEhPTl9NQVJTSE1BTExPV19T
UUxBTENIRU1ZX1ZFUlNJT04gPSAwLjI5LjAKIFBZVEhPTl9NQVJTSE1BTExPV19TUUxBTENIRU1Z
X1NPVVJDRSA9IG1hcnNobWFsbG93LXNxbGFsY2hlbXktJChQWVRIT05fTUFSU0hNQUxMT1dfU1FM
QUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9NQVJTSE1BTExPV19TUUxBTENIRU1ZX1NJ
VEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZWIvOTYvMzg5NWJk
ZTIyNDdmYTY1M2MzNmQ4ODdmZjA4ZTQzOTY2NTY2OGFhN2M5OTFhMzkyNGFlMTk5YmU4OGQ2CitQ
WVRIT05fTUFSU0hNQUxMT1dfU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2ZhLzBkLzRkZDI3NTczMjIxM2NlZmI0ZTQ5YTg2YzYwNDQzY2Ix
ZTNlMGQwYmQ2MDU2MjVhZWQzZmE3YmIyMmZkZAogUFlUSE9OX01BUlNITUFMTE9XX1NRTEFMQ0hF
TVlfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9NQVJTSE1BTExPV19TUUxBTENIRU1Z
X0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9NQVJTSE1BTExPV19TUUxBTENIRU1ZX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCi0tIAoyLjM5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
