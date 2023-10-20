Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A8DC001DF
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 12:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFE170516;
	Fri, 20 Oct 2023 12:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDFE170516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWihPz6Qmttg; Fri, 20 Oct 2023 12:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 303CC7050D;
	Fri, 20 Oct 2023 12:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 303CC7050D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2831BF2CF
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 12:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D0840A90
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 12:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D0840A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFfWTVIHxVBA for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 12:17:31 +0000 (UTC)
X-Greylist: delayed 920 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 20 Oct 2023 12:17:30 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CB3F402F5
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB3F402F5
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 12:17:29 +0000 (UTC)
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wBnTpQ3bDJl7tQCAg--.22522S2;
 Fri, 20 Oct 2023 20:02:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Date: Fri, 20 Oct 2023 20:01:58 +0800
Message-Id: <20231020120158.2684019-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wBnTpQ3bDJl7tQCAg--.22522S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1xAFW7AryrCF13tF13urg_yoWkGrXEk3
 Z5ZrW8Krn7JFWUZa4qkr15WFWxCay3Wr4UtF45Xrn5WrWktFnrXF17Xr1kZF1UKF12gr13
 Aw1rGry8Wr4j9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZF4_3UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiOx8PXmC5n-CGPgAAs7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=Zp9fQyTV0Aa7+Bb+MV5k+cZFA3lyNwf5NynjrtvGGz8=;
 b=LcyV76HKtkUTu1SaLAPRz37J6XE6KdGJbrCeyQ1rVnirodvAB3s1XSjJxam/DJ
 LAR1Cgpexlr0ZdDqK4UqovgUmiaeEiilkBdvBmG0zIyoisle3/r08jAF7ipEMtcs
 hJKaCZRP6gckxbYa4/3AneGB3e7Wfn+LF14PPlz2ZOb0E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=LcyV76HK
Subject: [Buildroot] [PATCH v3 0/1] Add igt-gpu-tools
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
Cc: gael.portay@rtone.fr, bernd@kuhls.net, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

d2hlbiB0cnkgdG8gYnVpbGQgaWd0LWdwdS10b29scyBpbiBidWlsZHJvb3QsIGkgZm91bmQgdGhp
cyBwYXRjaCBpbiBtYWlsbGlzdFswXQoKSSB0cnkgdG8gYWRkcmVzcyB0aGUgY29tbWVudHMgZnJv
bSBBcm5vdXQgVmFuZGVjYXBwZWxsZS4gYW5kIHNlbmQgaXQKYWdhaW4uClswXWh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAxODEyMDQwMjI3MDEu
MjgwOTUtMS1nYWVsLnBvcnRheUBjb2xsYWJvcmEuY29tLwoKQ2hhbmdlcyBpbiB2MzoKLSBmaXgg
Y2hlY2stcGFja2FnZSB3YXJuaW5ncwotIHJlbW92ZSBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX09Q
RU5TU0wKLSBzZWxlY3QgQlIyX1BBQ0tBR19MSUJHTElCMi9CUjJfUEFDS0FHRV9FTEZVVElMUwot
IG1ha2UgQlIyX1BBQ0tBR0VfTElCVU5XSU5EX0FSQ0hfU1VQUE9SVFMgb3B0aW9uYWwKLSB1cGRh
dGUgZW1haWwgb2YgR2HDq2wgUE9SVEFZCgpDaGFuZ2VzIGluIHYyOgotIGFkZHJlc3MgdGhlIGNv
bW1lbnRzIGZyb20gQXJub3V0IFZhbmRlY2FwcGVsbGUgaW4gVjFbMF0KCkdhw6tsIFBPUlRBWSAo
MSk6CiAgaWd0LWdwdS10b29sczogYWRkIGlndC1ncHUtdG9vbHMgcGFja2FnZQoKIHBhY2thZ2Uv
Q29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2lndC1ncHUt
dG9vbHMvQ29uZmlnLmluICAgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrCiBw
YWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy5oYXNoIHwgIDUgKysrKwogcGFja2Fn
ZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMubWsgICB8IDIyICsrKysrKysrKysrKysrCiA0
IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2lndC1ncHUtdG9vbHMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9p
Z3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzLm1rCgotLSAKMi4zNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
