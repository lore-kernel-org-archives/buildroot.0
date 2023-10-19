Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64E1CDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61E9E424BB;
	Thu, 19 Oct 2023 07:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E9E424BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qIDrZluAChh; Thu, 19 Oct 2023 07:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D8A8424AC;
	Thu, 19 Oct 2023 07:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D8A8424AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECC971BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C60046FAE8
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60046FAE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjeQYQmfv31i for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:54:58 +0000 (UTC)
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
 by smtp3.osuosl.org (Postfix) with ESMTP id 157086FAE6
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 157086FAE6
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wD3P2zB4DBlCgjDAw--.46588S2;
 Thu, 19 Oct 2023 15:54:46 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 15:54:40 +0800
Message-Id: <20231019075440.2568312-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P2zB4DBlCgjDAw--.46588S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1xAFW7AryrCF13tF13urg_yoWfXrb_Kw
 n5XrW0kr97JFWUua4DCw15WFWxAa98Wr15tF45XFn5WrWktFnrXFnrXw1kZF4UKF12grnr
 Aw1rGry8urWj9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZXo73UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiTB8OXmI0boR0RAABsO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=CyOdBp13cPq1wdSaSoGah9VOezMv/4Rzaz0FbRZnQk0=;
 b=SIRsHzOMWr0R14jbYPxojmu5ytGdeI8KJ9U6nX/41tXnBeH6iSYjx20anVSbeA
 7zXYLd1kResB3I8YjiZJA2Tmfj/IW4JWvZEt3U51zBIYaW6+k9wYI82R7TwtavpU
 nz5khHrivXFmCK7HGEh3nWoZPiv+ayuQ+0nMKwLFRm8e4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=SIRsHzOM
Subject: [Buildroot] [PATCH v2 0/1] Add igt-gpu-tools
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
Cc: gael.portay@collabora.com, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

d2hlbiB0cnkgdG8gYnVpbGQgaWd0LWdwdS10b29scyBpbiBidWlsZHJvb3QsIGkgZm91bmQgdGhp
cyBwYXRjaCBpbiBtYWlsbGlzdFswXQoKSSB0cnkgdG8gYWRkcmVzcyB0aGUgY29tbWVudHMgZnJv
bSBBcm5vdXQgVmFuZGVjYXBwZWxsZS4gYW5kIHNlbmQgaXQKYWdhaW4uClswXWh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAxODEyMDQwMjI3MDEu
MjgwOTUtMS1nYWVsLnBvcnRheUBjb2xsYWJvcmEuY29tLwoKQ2hhbmdlcyBpbiB2MjoKLSBhZGRy
ZXNzIHRoZSBjb21tZW50cyBmcm9tIEFybm91dCBWYW5kZWNhcHBlbGxlIGluIFYxWzBdCgpHYcOr
bCBQT1JUQVkgKDEpOgogIGlndC1ncHUtdG9vbHM6IGFkZCBpZ3QtZ3B1LXRvb2xzIHBhY2thZ2UK
CiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2Fn
ZS9pZ3QtZ3B1LXRvb2xzL0NvbmZpZy5pbiAgICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysr
KysrKysrKwogcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMuaGFzaCB8ICA2ICsr
KysrCiBwYWNrYWdlL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29scy5tayAgIHwgMTUgKysrKysr
KysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2lndC1ncHUtdG9vbHMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMuaGFzaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzLm1rCgotLSAKMi4zNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
