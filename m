Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB72EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B06EC616FD;
	Fri, 13 Feb 2026 19:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2rjJ_nMOMvp; Fri, 13 Feb 2026 19:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51F1616FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011571;
	bh=AVVCwhKe+H9lWAsoKgpNP0jbjX4dpmoJ4GiFyZr9iw4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jhBfer+IGeL3CdCafWmXh23KmK8G/y8h3D9tSM3D0oA4yu5DqFIIT0OwcAiEmALWf
	 AecBIMdlrxsgFf5nVA2LLn9YU48Tgk/yuZd1fOhfm2Q2N8MYM2FGSFjpLPMhrPvTnF
	 QpQt89lIRUJ4unV7ZjibTDa8shz3RT54bX2U8MY6174/f6J+F9J0/wlKBFxfqdVMI6
	 kSw1JNSNSWpwf1kM86MOOY8RKsSJA+XCPXfxeW0LGr5h4ZTXVmHaovErQ4hm82XtWH
	 4yoyadajyM1vfaDoa+SqMtxOwA2XxIemKs1bcizFGHofaXEbXcRp/1qtSmzFhY3B51
	 sqAgH5lHh+aWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51F1616FE;
	Fri, 13 Feb 2026 19:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A82283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9B9F413AA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Wu4BjhaxHqI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F41A4035F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F41A4035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24BCA825CC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:04:58 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cec80fc0679121c63cd2935b13d21681569425dd
X-Git-Newrev: 2a93146b3d8f52bd437aba21aa29760aed634718
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.24BCA825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/util-linux:
 always disable man pages and translations
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a93146b3d8f52bd437aba21aa29760aed634718
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

When the host system has asciidoctor and po4a/poman installed,
util-linux detect them and automatically enable manual pages and
their translations. This can significantly increase the package
build time (in my case, from 20s to 1m50s). See upstream
commit [1] and [2].

Since manual pages are not needed in Buildroot, this commit adds in
_CONF_OPTS for host host and target variants the options to always
disable the detection of those programs (--disable-asciidoc
--disable-poman). This will always disable the generation of manual
pages.

Note: Buildroot attempts to globally disable documentation for
autotools packages by passing various --disable-docs configure
options (see [3]), but those are not recognized by util-linux.

This commit also reorder the options for UTIL_LINUX_CONF_OPTS.

[1] https://github.com/util-linux/util-linux/commit/9acfc349e0ea68a92baf818cc659121f40ab9c04
[2] https://github.com/util-linux/util-linux/commit/236421a49103ea510bcba1e7ef90b57d24aeab76
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/package/pkg-autotools.mk#L184-186

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit dd81c1766e1470b61f5e8d4461a066f64ce60c5e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d1abdbdc9e..f43a1a128b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -47,8 +47,10 @@ UTIL_LINUX_DEPENDENCIES = \
 # system is not Y2038 compliant. util-linux will support year2038 if
 # the system is compliant even with this option passed
 UTIL_LINUX_CONF_OPTS += \
-	--disable-rpath \
+	--disable-asciidoc \
 	--disable-makeinstall-chown \
+	--disable-poman \
+	--disable-rpath \
 	--disable-year2038
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
@@ -57,6 +59,8 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
 HOST_UTIL_LINUX_CONF_OPTS = \
+	--disable-asciidoc \
+	--disable-poman \
 	--without-systemd \
 	--with-systemdsystemunitdir=no \
 	--without-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
