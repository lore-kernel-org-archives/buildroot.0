Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB7CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD3D61002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAD3D61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4BD04064D;
	Wed,  4 Aug 2021 10:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pz1hlw1XAqYb; Wed,  4 Aug 2021 10:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C3584063A;
	Wed,  4 Aug 2021 10:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 298AC1BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13EAB4042A
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osLKe8jg74dT for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:34:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D77BA40418
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:34:09 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0350920004;
 Wed,  4 Aug 2021 10:34:05 +0000 (UTC)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:33:53 +0200
Message-Id: <20210804103353.468494-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/optee-os: use dedicated 3.13.0 patch
 directory
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RXhpc3RpbmcgcGF0Y2ggaXMgZm9yIDMuMTMuMCBvcHRlZSB2ZXJzaW9uIGJ1dCBpcyBsb2NhdGVk
IGF0IHRoZSByb290Cm9mIG9wdGVlLW9zIGZvbGRlciwgbGVhZGluZyB0byBlcnJvciB3aGVuIGFw
cGx5aW5nIGl0IG9uIG1vcmUgcmVjZW50CnZlcnNpb24uIE1vdmUgaXQgdG8gYSBkZWRpY2F0ZWQg
My4xMy4wIGZvbGRlci4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5s
ZWdlckBib290bGluLmNvbT4KLS0tCiAuLi4wMDEtY29yZS16bGliLWZpeC1idWlsZC13YXJuaW5n
LXdoZW4tX0xGUzY0X0xBUkdFRklMRS1pcy5wYXRjaCB8IDAKIDEgZmlsZSBjaGFuZ2VkLCAwIGlu
c2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiByZW5hbWUgYm9vdC9vcHRlZS1vcy97ID0+IDMu
MTMuMH0vMDAwMS1jb3JlLXpsaWItZml4LWJ1aWxkLXdhcm5pbmctd2hlbi1fTEZTNjRfTEFSR0VG
SUxFLWlzLnBhdGNoICgxMDAlKQoKZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3MvMDAwMS1jb3Jl
LXpsaWItZml4LWJ1aWxkLXdhcm5pbmctd2hlbi1fTEZTNjRfTEFSR0VGSUxFLWlzLnBhdGNoIGIv
Ym9vdC9vcHRlZS1vcy8zLjEzLjAvMDAwMS1jb3JlLXpsaWItZml4LWJ1aWxkLXdhcm5pbmctd2hl
bi1fTEZTNjRfTEFSR0VGSUxFLWlzLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUg
ZnJvbSBib290L29wdGVlLW9zLzAwMDEtY29yZS16bGliLWZpeC1idWlsZC13YXJuaW5nLXdoZW4t
X0xGUzY0X0xBUkdFRklMRS1pcy5wYXRjaApyZW5hbWUgdG8gYm9vdC9vcHRlZS1vcy8zLjEzLjAv
MDAwMS1jb3JlLXpsaWItZml4LWJ1aWxkLXdhcm5pbmctd2hlbi1fTEZTNjRfTEFSR0VGSUxFLWlz
LnBhdGNoCi0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
