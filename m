Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222FCC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:35:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D911160F41
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D911160F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A19224033B;
	Mon, 26 Jul 2021 22:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZtvmWfxQs0q; Mon, 26 Jul 2021 22:35:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A82F740377;
	Mon, 26 Jul 2021 22:35:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E138A1BF995
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEE3160793
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_8_OQrNWOHH for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 22:35:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEA196009C
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 22:35:19 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.155.191])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 89BrmQHp3nxSq89BumxN5f; Tue, 27 Jul 2021 00:35:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627338918; bh=kVwVXmZLUjjHXxzgX3fRaQXQ7X6QRMUWaOK/1HvfR3I=;
 h=From:To:Subject:Date:MIME-Version;
 b=B4S/bXgrcw0TYMvOI2vU9lZR08ITtYiVVLzSzgHZqWPbDomv0fMWFMHaCbsshTvGY
 uPlZxENBAy2ePEs/UuNFfgRizwvOrdHwHH7EfsBZT6TNodV072nbe2ZsCU5JPcg2Wo
 lxWlnRB97aKlN1ktgpeHm8rjpZqI6IwP1+wCkt58Wo7DwCqIn9nUq5aaH5c8wSP4hT
 BeB1PlRAHzHa0eR9cHxmr4L4CHEl2HdfV47QlF413PSIb1wv/A6erqSFuFQQq1DmG7
 O9PN/isN0spWH0SybXhH8QWQJ/+cG0P7sqRNeITiRJoAYlw2LTRLrOEPZU5pbVs5iw
 LCIj0fEt8BD6Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 00:34:34 +0200
Message-Id: <20210726223435.2906458-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfANeqTx1khsoR+a6AQZltZLSJ6lWjzXhDEPjUSeSNOYbTJsyWYcw3XQh1l5g8wCNcx9BOa28Os4x/hVmexEO6zp41NpQ9UmpjFcI/Fdtw0gUpwlaf485
 3mA9xi9W3sSxo5R31P1YvtpohFlZ7cc/mFO3oMKHveCKufr2qPweiyMFsuJS5DAkQFldaKc8nQA+QLfgAAEhBe4hbAbrXCM5zE9kUWfvFxCUjWUTNt51a+GM
 sdDtlvWx//K0szAruoq1mZbEy4RNKWhY373dVKiqVl1Y+Cn+ByEZAGmiQj5mIsJIGBQWjJjm7wbx+IXM5TKnjVu5DBgbOtwl6vo/m0MG9fppOk7ssYvntJxy
 D1obm+fZRGUA2qwzEtBsriGrES6hlaEPtGXf/1ZBKJgu5Ph8P0lnXcl482VxqHkVBQ5cAY3O9vBwadPfHV74MSF/M6bfmLuzf54MPIHBHVxtVck7SIMbxjyE
 TJ7OPCh7/DCKftcO
Subject: [Buildroot] [PATCH v2 2/3] package/protobuf: fix build failure due
 to missing -mcmodel=large
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Nosthoff <buildroot@heine.tech>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

When building protobuf for or1k -mcmodel=large is needed to link, so let's
add that gcc option in case we're building for or1k.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/protobuf/protobuf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 492917c5e8..75791fade2 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 PROTOBUF_CXXFLAGS += -O0
 endif
 
+ifeq ($(BR2_or1k),y)
+PROTOBUF_CXXFLAGS += -mcmodel=large
+endif
+
 PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
