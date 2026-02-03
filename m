Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96804E87852
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5415640BDD;
	Tue,  3 Feb 2026 18:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKvFl5zlNmWa; Tue,  3 Feb 2026 18:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ED9F4094A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142929;
	bh=ImlFOPlv0iq1jQP+eTjI+jzoCMWtOB8rw2yOdxemezU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YzEkyMAeWs5BUzYAxd4kyxXIPnKzNMj6OzGMU/+dr5SgArxYU73QQdfEbTFgPzlcN
	 JSkAMmXzos180B91BlriTG7wBI2Y6y0sWjSbbobgkpvZCwCkz1qF5sa+cSY+t2sBGF
	 lY/+uuqJ0n9n6FuGmVD0gD62FrK4yZdppuuMO0kVrII+PHy7yhq1BmTOm9MYDNCt9z
	 7k49ydmUxuAmw+ry3Lbwgg2W3l8Hq9VH5RgB8zo/2kvQH3xe3NHEx1uilO1W4rnRlz
	 YZvMIg+s+JktCTNlbtayaGoUyVdop2hdMW1JFalvpkUk8RPQN+Hf4mR8OjUP9UlmFF
	 uWseH4VtZF84g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED9F4094A;
	Tue,  3 Feb 2026 18:22:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D0B8F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1492260686
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSm_EnSIjpDy for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A53605D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57A53605D2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DF8D86711; Tue,  3 Feb 2026 18:22:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 19:16:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74ac7a38be67a3f136315746a203de83a9f20bc2
X-Git-Newrev: dd81c1766e1470b61f5e8d4461a066f64ce60c5e
X-Patchwork-Hint: ignore
Message-Id: <20260203182207.3DF8D86711@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: always disable man
 pages and translations
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd81c1766e1470b61f5e8d4461a066f64ce60c5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d0a03be404..af6044af32 100644
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
