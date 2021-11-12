Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BEEC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 17:22:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE6C60FE3
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 17:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBE6C60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E2A61529;
	Fri, 12 Nov 2021 17:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oj-bRBLUhcqZ; Fri, 12 Nov 2021 17:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA0E161527;
	Fri, 12 Nov 2021 17:22:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 091511BF3BD
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 17:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC352405E2
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 17:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGuEm48HoV1N for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 17:22:03 +0000 (UTC)
X-Greylist: delayed 00:39:59 by SQLgrey-1.8.0
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6CE2405DA
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 17:22:03 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7D9A5218FA;
 Fri, 12 Nov 2021 16:04:17 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 12 Nov
 2021 17:04:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003b552c385-7184-46bc-a8f5-36d24b04c3c1,
 F9CF0200ECD1631E1678AE6CCE6AA99FD507468A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <buildroot@buildroot.org>
Date: Fri, 12 Nov 2021 17:04:13 +0100
Message-ID: <20211112160413.2736382-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112160413.2736382-1-clg@kaod.org>
References: <20211112160413.2736382-1-clg@kaod.org>
MIME-Version: 1.0
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 302701e7-1561-4574-a5e3-8c5ee087b68a
X-Ovh-Tracer-Id: 10412603817331755814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Subject: [Buildroot] [PATCH 3/3] configs/qemu_ppc_e500mc: Enable dhcp on
 network interface
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgdmlydGlvLW5ldC1wY2kgZGV2aWNlIHdpdGggYSB1c2VyIG1vZGUgaG9zdCBuZXR3b3Jr
IGJhY2tlbmQKCkNjOiBCaW4gTWVuZyA8Ym1lbmcuY25AZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGJvYXJkL3FlbXUvcHBjLWU1
MDBtYy9yZWFkbWUudHh0ICB8IDIgKy0KIGNvbmZpZ3MvcWVtdV9wcGNfZTUwMG1jX2RlZmNvbmZp
ZyB8IDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9ib2FyZC9xZW11L3BwYy1lNTAwbWMvcmVhZG1lLnR4dCBiL2JvYXJk
L3FlbXUvcHBjLWU1MDBtYy9yZWFkbWUudHh0CmluZGV4IDc3YTg2NGVkMmJmMy4uNzZiYWQwMTVk
MmQ1IDEwMDY0NAotLS0gYS9ib2FyZC9xZW11L3BwYy1lNTAwbWMvcmVhZG1lLnR4dAorKysgYi9i
b2FyZC9xZW11L3BwYy1lNTAwbWMvcmVhZG1lLnR4dApAQCAtMSw1ICsxLDUgQEAKIFJ1biB0aGUg
ZW11bGF0aW9uIHdpdGg6CiAKLSBxZW11LXN5c3RlbS1wcGMgLU0gcHBjZTUwMCAtY3B1IGU1MDBt
YyAtbSAyNTYgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL3VJbWFnZSAtZHJpdmUgZmlsZT1vdXRwdXQv
aW1hZ2VzL3Jvb3Rmcy5leHQyLGlmPXZpcnRpbyxmb3JtYXQ9cmF3IC1hcHBlbmQgImNvbnNvbGU9
dHR5UzAgcm9vdHdhaXQgcm9vdD0vZGV2L3ZkYSIgLXNlcmlhbCBtb246c3RkaW8gLW5vZ3JhcGhp
YyAjIHFlbXVfcHBjX2U1MDBtY19kZWZjb25maWcKKyBxZW11LXN5c3RlbS1wcGMgLU0gcHBjZTUw
MCAtY3B1IGU1MDBtYyAtbSAyNTYgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL3VJbWFnZSAtZHJpdmUg
ZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGlmPXZpcnRpbyxmb3JtYXQ9cmF3IC1uZXQg
bmljLG1vZGVsPXZpcnRpby1uZXQtcGNpIC1uZXQgdXNlciAtYXBwZW5kICJjb25zb2xlPXR0eVMw
IHJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEiIC1zZXJpYWwgbW9uOnN0ZGlvIC1ub2dyYXBoaWMgIyBx
ZW11X3BwY19lNTAwbWNfZGVmY29uZmlnCiAKIFRoZSBsb2dpbiBwcm9tcHQgd2lsbCBhcHBlYXIg
aW4gdGhlIHRlcm1pbmFsIHRoYXQgc3RhcnRlZCBRZW11LgpkaWZmIC0tZ2l0IGEvY29uZmlncy9x
ZW11X3BwY19lNTAwbWNfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3BwY19lNTAwbWNfZGVmY29u
ZmlnCmluZGV4IDFhNWIxZTNjMmM4My4uMjMyYmMxZjcwYzY5IDEwMDY0NAotLS0gYS9jb25maWdz
L3FlbXVfcHBjX2U1MDBtY19kZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11X3BwY19lNTAwbWNf
ZGVmY29uZmlnCkBAIC0yLDcgKzIsOCBAQAogQlIyX3Bvd2VycGM9eQogQlIyX3Bvd2VycGNfZTUw
MG1jPXkKIAotIyBTZXJpYWwgcG9ydCBjb25maWcKKyMgU3lzdGVtCitCUjJfU1lTVEVNX0RIQ1A9
ImV0aDAiCiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5UzAiCiAKICMgSW1hZ2UK
LS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
