Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08334C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB3B401C0;
	Mon, 22 Jul 2024 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzPu6Le7ZpnV; Mon, 22 Jul 2024 16:27:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EBA5401C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EBA5401C5;
	Mon, 22 Jul 2024 16:27:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE4121BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C928B6059E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4ZUcYQO2B2R for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A236059A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03A236059A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:27:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC5C870A0; Mon, 22 Jul 2024 16:27:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:27:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f40757781ffca285053ef2fa8ea9e0971fd65678
X-Git-Newrev: 4f828733c51f3db095920ef93d019293d03005cc
X-Patchwork-Hint: ignore
Message-Id: <20240722162719.DDC5C870A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: add tpm2-tss comment
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f828733c51f3db095920ef93d019293d03005cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Thomas Petazzoni, add a comment about tpm2-tss
dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/gnutls.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index cf2f02cc9d..eae017aac2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -14,6 +14,8 @@ GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
 
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 libunistring nettle
 GNUTLS_CPE_ID_VENDOR = gnu
+# Don't add an optional dependency on tpm2-tss as it creates a
+# circular dependency: tpm2-tss -> libcurl -> gnutls -> tmp2-tss.
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-libdane \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
