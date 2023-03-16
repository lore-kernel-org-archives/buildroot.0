Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24018C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 12:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73840417CF;
	Thu, 16 Mar 2023 12:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73840417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aWJwn6WvsZi; Thu, 16 Mar 2023 12:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D6D24225D;
	Thu, 16 Mar 2023 12:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D6D24225D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06FB51BF3AF
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 12:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4500610AA
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 12:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4500610AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoTf51ZPWevJ for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 12:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4C7B61064
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4C7B61064
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 12:53:37 +0000 (UTC)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pcmqo-0009XF-3U; Thu, 16 Mar 2023 13:36:58 +0100
Received: from [185.17.218.86] (helo=rap..)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pcmqn-000LJE-Uk; Thu, 16 Mar 2023 13:36:57 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 13:36:52 +0100
Message-Id: <20230316123653.3648067-1-martin@geanix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26844/Thu Mar 16 08:24:08 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=42MxenrqaAAdxSD5Kpyuke6Kqw7i8aoQhi/Rurk4AxA=; b=ApWEHTCi1Sj1uW5R/5yqCnF+Ns
 ymU6U9GJMSCcWyrMfHdzIbqo4uMPCqMrxFTF7+E3mpJfkPeOFIxoz3PINB3XtcOdPk/Axc+EvJ/aU
 gcD7EIG4wSik85YWYfvxdZWUparh+5+DSe7JQKSgkhG2t77TbRVg9qsKY6Yz9g3PgtKWHGKA2ttFD
 ls+n2cC1xtoOW8aZ7wP/7xI7szvJ5OJWpPhrJeOI8FnviKsQga05QXqQYhcMJPC6tAL6cDaFORx6c
 dveRhbOhlk5SILGs7IiWD7t5vssHKo8H6q84OLuLolCmu3AdpLRUGPlnjC0lAb1D1y2O43p4lzw9q
 ddlJccYQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=ApWEHTCi
Subject: [Buildroot] [PATCH 1/2] python-apispec: bump to 6.3.0
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
IHBhY2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMuaGFzaCB8IDQgKystLQogcGFj
a2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5tayAgIHwgNCArKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1hcGlzcGVjL3B5dGhvbi1hcGlzcGVjLmhhc2ggYi9wYWNrYWdlL3B5dGhv
bi1hcGlzcGVjL3B5dGhvbi1hcGlzcGVjLmhhc2gKaW5kZXggZjI4NjFmOTIwYS4uZjhhMjM1MGVh
ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5oYXNo
CisrKyBiL3BhY2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMuaGFzaApAQCAtMSw1
ICsxLDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvYXBpc3Bl
Yy9qc29uCi1tZDUgIGI0ZTkwMDA2YTI2MjE1ZTJlMGE2ZmUyNjI5ZDEyYzEwICBhcGlzcGVjLTYu
MC4yLnRhci5negotc2hhMjU2ICBlNzZkODBiNzM5ZWRlZjRiZTIxMzA5MmE2Mzg0YWQ3ZmQ5MzNi
YTdkNjRmNmQ1YTBhZmY4ZDRkYTFiZWY3ODg3ICBhcGlzcGVjLTYuMC4yLnRhci5negorbWQ1ICBk
NmNjNzU4Njc1NGNmMWM2NTNmZmI3ZWU4Mzk1NWQzYSAgYXBpc3BlYy02LjMuMC50YXIuZ3oKK3No
YTI1NiAgNmNiMDhkOTJjZTczZmYwYjNiZjQ2Y2IyZWE1YzAwZDU3Mjg5YjBmMjc5ZmIwMjU2YTNk
ZjQ2ODE4MmJhNTM0NCAgYXBpc3BlYy02LjMuMC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBz
aGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIGE0NTJhZmNlZjc1MDk1NmE4Mzk2ZjdlN2E2ZjkxM2Ex
MTdkMjhlZjk5YTEzMTcwYzI5ZGM3NGMzYjdhOTVmMjkgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMubWsgYi9wYWNrYWdlL3B5dGhvbi1h
cGlzcGVjL3B5dGhvbi1hcGlzcGVjLm1rCmluZGV4IDQ2NzRjZTBjM2QuLjc0NGZiNzY4MTAgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWFwaXNwZWMvcHl0aG9uLWFwaXNwZWMubWsKKysrIGIv
cGFja2FnZS9weXRob24tYXBpc3BlYy9weXRob24tYXBpc3BlYy5tawpAQCAtNCw5ICs0LDkgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVBZVEhPTl9BUElTUEVDX1ZFUlNJT04gPSA2
LjAuMgorUFlUSE9OX0FQSVNQRUNfVkVSU0lPTiA9IDYuMy4wCiBQWVRIT05fQVBJU1BFQ19TT1VS
Q0UgPSBhcGlzcGVjLSQoUFlUSE9OX0FQSVNQRUNfVkVSU0lPTikudGFyLmd6Ci1QWVRIT05fQVBJ
U1BFQ19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2E3LzJh
L2I0MmMxN2UwZDY1MzM0MWI4ZjU5MTY5OTk4OTJjZDJkODQ4OWRlMTI3ZGFjNjExOGFlNDQ1MzE2
NzRmNQorUFlUSE9OX0FQSVNQRUNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9y
Zy9wYWNrYWdlcy8zZi8xZS8yMDdjM2U2MWM4MDVlZWYyMTRkN2U1YzU4MTA2MzEyZjlhZjQ3MzNi
MDdmNDcwMjI0ZTRlMzA5ZGM2NWUKIFBZVEhPTl9BUElTUEVDX1NFVFVQX1RZUEUgPSBzZXR1cHRv
b2xzCiBQWVRIT05fQVBJU1BFQ19MSUNFTlNFID0gTUlUCiBQWVRIT05fQVBJU1BFQ19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
