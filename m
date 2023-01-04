Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6B6C54EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 02:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDF5E40A83;
	Wed,  4 Jan 2023 02:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF5E40A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUNCdY5dejiZ; Wed,  4 Jan 2023 02:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F4A240A77;
	Wed,  4 Jan 2023 02:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F4A240A77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8E81BF47E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 02:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A7F181F00
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 02:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7F181F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iup6jciW3Z0L for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 02:13:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC51881F09
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC51881F09
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 02:13:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CtAFp2abjalKACtAGplLjZ; Wed, 04 Jan 2023 03:06:00 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 03:05:58 +0100
Message-Id: <20230104020558.1436469-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104020558.1436469-1-giulio.benetti@benettiengineering.com>
References: <20230104020558.1436469-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN7hdiwGxY15XfluX7ThFRbWPHUOiEFAl7etK22kSS9QtMZdRicVarfsKqWXl0/J/Gw241nVOeISwg2ww2fMVtQSXVkGAvJ5LxaQYNSAnhzWYAWswhR4
 aq5VOFisDj702jMv9GlrFUAEnrCdAGmYg595zw3ObqZRpijLf1ekhP+TASJsA4s+yWEAae6M6r8HsMj1ooXMwDRvFyYq0684pqf+n0h+nLefDZEcBUXrJYvn
 2PBavHiEwI+GTFHPC3KnicVlICpJStt9csFOwN9kmBQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672797960; bh=MWy2Emxipt0gPnKpW3KiwS0PwlgUf5SKegX+hOY9psw=;
 h=From:To:Subject:Date:MIME-Version;
 b=caPdOGBG40zdJlFBogAcBeIGJJPTqn0dS8gGbrO8Si3JkP58oYwFyOzYi0l5xqoz0
 vPrEJ++DdLgp1zLjVXIvq9fOpNpmeEHywnrQRtBiwf17FF7OXsjFpzq0w4nARPW6sk
 EG0I2zMvvjBzVNG2xo8jShNKa5FA/eVCCR4Zk6xnf4fGda+B78oy/QobGKjfGK6uUv
 YAV5oE8ULr6ltvtRJ6o0EzKYqgwtZuv9TyMu6jUhX3hTporkYaZ3pYNgZkgSs9zcNN
 uxNNmjba5x9AyZbUH80dS66f7BPqm6pjG+MsvsHUy57xyoSdW9rJvTPO87uzq5vZRC
 ejJrRLoomuvSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=caPdOGBG
Subject: [Buildroot] [PATCH 1/1] linux: fix LINUX_VERSION_PROBED content
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Actually LINUX_VERSION_PROBED is set with the string sorrounded by the
backquotes including them. So when we evaluate $(LINUX_VERSION_PROBED) we
end up having the command itself and instead we only need the Linux version
probed in the style x.y.z.

Verifying it turns out that:
1) --no-print-directory and -s make flags must be passed before -C flag,
The error was not visible because errors were suppressed with
'2>/dev/null'
2) backquotes don't evaluate the expression they sorround but become part
of the string they sorround and get assigned to the variable

To fix this let's move --no-print-directory right after $(MAKE) and
use $(shell ) instead of backquotes.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..23c169995a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -183,7 +183,7 @@ endif
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 # Filter out 'w' from MAKEFLAGS, to workaround a bug in make 4.1 (#13141)
-LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
+LINUX_VERSION_PROBED = $(shell MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(MAKE) --no-print-directory -s $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) kernelrelease 2>/dev/null)
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
