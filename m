Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB937C52D7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59C5A40FCD;
	Thu, 15 Aug 2024 20:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8J31PbJPOk4e; Thu, 15 Aug 2024 20:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BBF940144
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BBF940144;
	Thu, 15 Aug 2024 20:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 095BB1BF3F4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB72A60AFD
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kN3MwH0eKl6y for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08B660AE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F08B660AE3
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:36:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E91A7825B9; Thu, 15 Aug 2024 20:36:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 22:36:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8160fb4643fb8ce123638b60692d76143994ed6
X-Git-Newrev: c025a655c6adba41df0d8cba0009bbfd5a95ac24
X-Patchwork-Hint: ignore
Message-Id: <20240815203659.E91A7825B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tpm2-pytss: add missing
 'depends on'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c025a655c6adba41df0d8cba0009bbfd5a95ac24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit
c72c6f26ed706474f6607f97be2925834c8baa03 ("package/python-tpm2-pytss:
new package"), when the package was introduced, a dependency of a
package being selected was not properly propagated:
BR2_PACKAGE_PYTHON_CRYPTOGRAPHY depends on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS, so we should replicate
this dependency.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_TPM2_PYTSS [=y] && BR2_PACKAGE_PYTHON3 [=y] && !BR2_STATIC_LIBS [=n]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tpm2-pytss/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-tpm2-pytss/Config.in b/package/python-tpm2-pytss/Config.in
index 60d9e8b9d3..dec9a311d4 100644
--- a/package/python-tpm2-pytss/Config.in
+++ b/package/python-tpm2-pytss/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TPM2_PYTSS
 	bool "python-tpm2-pytss"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
@@ -11,4 +12,5 @@ config BR2_PACKAGE_PYTHON_TPM2_PYTSS
 	  https://github.com/tpm2-software/tpm2-pytss
 
 comment "python-tpm2-pytss needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
