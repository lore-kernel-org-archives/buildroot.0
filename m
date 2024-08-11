Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D5CC3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 10:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32FAA405B3;
	Sun, 11 Aug 2024 10:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q59tj5kuBJF5; Sun, 11 Aug 2024 10:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C23405A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C23405A3;
	Sun, 11 Aug 2024 10:01:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B6D41BF2AA
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78CBD40B87
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejQxA8_Iu418 for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 10:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 189F140B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 189F140B7B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 189F140B7B
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 10:01:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1skKMc3WX4-00URfB; Sun, 11
 Aug 2024 12:01:20 +0200
Date: Sun, 11 Aug 2024 12:01:14 +0200
MIME-Version: 1.0
Message-Id: <20240811-s6-multicall-v2-4-14249fd20cbd@gmx.net>
References: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
In-Reply-To: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723370475; l=871;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=L4aApybrJNBJibNDebrS1Qoc5y12u3AbqrGAeBWDQSI=;
 b=HIkG2KJAU3/24y5tkaaQ9pekEzoPv/IgwSRuFUtOFpy9CMwlRxuoV35HXnpZQzfSIXs4criei
 19IDqtHNzOQBJJOd3FIO1dM1w/S5R8fcQ2JIS8GHmuIVKJWclsqCONs
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:w79vslF52V5W9az5X25IhMpMKdL5yPZKwDh/2xFA5JQCRZbX8Qb
 yHHDSbF+8AQ/Wb8e4P8C1B4sWsQ+PUp65TOQKNqlyxHGr3kfmN6r/KRZ2E0uZEAWQ2M3WPm
 jNBHgRPma/Vv/w4zj2+/ZwNwGSoWrHKevLnOppB3IzIUzrjYR8AaMec5yBfxfQJE478rwSR
 irDYh3mL2DwPbvYbUedxw==
UI-OutboundReport: notjunk:1;M01:P0:LHp5ZAst8RQ=;6dTruoCuV4NtWhv6cipli5fyamN
 VtwvThuIhrqe3FoHcuCKrxpn5io/o4agSnJv+QO7HLDBnxgyUkI3LrQnZFaHTaxhLMcJJpESV
 9QNBK2ZxnD9w2+Ss/yJnKETYyzgHda8nhJb2VcoR3ZMSMe8CTvcvgS5x0iHtecBzcTkfWxrjH
 SMDexoTBD1+kvJCs1RKx7Lhf1FHsMveTB8nQAoFdXFbfW0iunA2skmue5FgVAHFb1QvVFUn4B
 BEvLD3cIDN1+VCO1mrR17g0CE14NaCnjXortF61oeYbe3D08705AStCtZbK5Tp03/BPV/O2Vv
 McrZOj8mVcjKDnz3D1HW0ybTsjdQISgp41/7/aUXWiWmwuzbDghFdUd3NGrOFF5MEopSI1M0s
 8K7ZnuSV73yS/+P2FrNny4ayXhLeE/WjdQys4w3/UVKZjfBjWPgDolOZO3GesQgY5xK31++RM
 dL+K4Ok1yFey4MTmOHkaXMvVmvZdbkHPHx3qdlyKlbPIYMBeglaC/F1L8XX5s4LQJx4KuJxzM
 qLcYB6jL6gN4y+9cXKLWZuHa2Ic4b3zMHD28LHm6b7cCZyb+aPFYWz2UkQ/dnws4/vihtcuB4
 zhsXrLRjHTU7qHX0KwXrHe14QUoUNuoiRgYCS93ed1qDAgb0OvPMAb2D4SnU8MBWGu5YAICH4
 Q7cSwS34BSYqYJAih9809njivZCrBDK25QMz2KXBVkkztzNDY0QBU5os55TLWOJXqq5SRE/gt
 YZcAeiQO2xWnXoFzkYDK+SbvCXO8MyQsTo3vMqmiNQ1BXGbfGuR0wIdzNZEPeuUNE1IXUwgjK
 wp8N32XXt4ZCM/GXTPAJaGzQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1723370480; x=1723975280; i=j.neuschaefer@gmx.net;
 bh=sIxH7PMBaHVWHUu+at5rzmDnHHq3JQklSbrg10bDXEc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ps3GK4FKYydqpW2fTNBnvNVnsxWXnRPAx4k8bXyCEPWJDTueYhsC3IxlyPMKddu9
 U918OW+D3qr7jALwVZ5+YsgdpC26ktvxcHDoMqS2UsLgFTGiJQq+gbeCcWS+1Osr8
 c1foA1aEH4LjhaPCR3Ul3fy4NUq6GduRdzqrOWmoQ5se2HFm70HiKnWUqN2HWdGR4
 mWrV1ASQp7SihSjBB7He5rgCDMYJLUO+kKAlYfI1H9GhYZg0iejKFuCgEZkZAAYU/
 YtK/01gVAeTna98TINqRcWoEMT99KLkl+mn88Dt8m9zu2I5b/2wkT+fcy/z8SFDNj
 JCBPBfJ9b0hbG4q07Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ps3GK4FK
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v2_4/4=5D_DEVELOPERS=3A_Add_skarn?=
 =?utf-8?q?et=2Eorg_packages_to_J=2E_Neusch=C3=A4fer=27s_entry?=
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgSSd2ZSBjb250cmlidXRlZCBzb21lIG1haW50ZW5hbmNlIHRvIHM2IGFuZCBvdGhlciBw
YWNrYWdlcyBmcm9tCnNrYXJuZXQub3JnIGluIHRoZSBwYXN0LCBJJ20gc3RlcHBpbmcgdXAgdG8g
YmUgbm90aWZpZWQgb2YgZGV2ZWxvcG1lbnRzCmluIHRoZXNlIHBhY2thZ2VzLgoKU2lnbmVkLW9m
Zi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0tCiBERVZFTE9Q
RVJTIHwgMTEgKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXgg
ZDdkMGFmMzU0My4uYzE0OWQ1ODcyYSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZF
TE9QRVJTCkBAIC0xNDQ5LDcgKzE0NDksMTYgQEAgRjoJcGFja2FnZS9heGVsLwogRjoJcGFja2Fn
ZS9tYXdrLwoKIE46CUouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci1GOglw
YWNrYWdlL3RpcGlkZWUKK0Y6CXBhY2thZ2UvZXhlY2xpbmUvCitGOglwYWNrYWdlL21kZXZkLwor
RjoJcGFja2FnZS9zNi8KK0Y6CXBhY2thZ2UvczYtbGludXgtaW5pdC8KK0Y6CXBhY2thZ2UvczYt
bGludXgtdXRpbHMvCitGOglwYWNrYWdlL3M2LW5ldHdvcmtpbmcvCitGOglwYWNrYWdlL3M2LXBv
cnRhYmxlLXV0aWxzLworRjoJcGFja2FnZS9zNi1yYy8KK0Y6CXBhY2thZ2Uvc2thbGlicy8KK0Y6
CXBhY2thZ2UvdGlwaWRlZS8KCiBOOglKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25z
LmNvbT4KIEY6CWJvYXJkL2FtYXJ1bGEvCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
