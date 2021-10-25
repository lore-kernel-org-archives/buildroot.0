Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2A5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:19:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D38760C4A
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D38760C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E80B74014B;
	Mon, 25 Oct 2021 20:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bd1g1sLEVjYQ; Mon, 25 Oct 2021 20:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE66400F0;
	Mon, 25 Oct 2021 20:19:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 717CF1BF983
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E495403E4
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x33ari85KKgk for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5603B403CB
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A4CA288984; Mon, 25 Oct 2021 20:15:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17358061ad2b58d3eb96ea8c5631e235a484ac87
X-Git-Newrev: 95a63a34ac9204c4fe069154783bd97ed48c3ae2
X-Patchwork-Hint: ignore
Message-Id: <20211025201508.A4CA288984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: add host
 variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=95a63a34ac9204c4fe069154783bd97ed48c3ae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f,
python-cryptography depends on python3. So python3-cryptography became
redundant at that point. As python3-cryptography is a host-only package,
while python-cryptography is a python-only package, add a host variant
to python-cryptography to be able to drop python3-cryptography.

Update ca-certificates to use host-python-cryptography instead of
host-python3-cryptography.

While at it, drop host-python3-pip and host-python3-six as these
dependencies are not needed. Indeed, pip was never a dependency of
cryptography and six is not a dependency with python3 and will be
dropped in version 3.4 and
https://github.com/pyca/cryptography/commit/e66db8079d3fbd0110e87ece1fd48f4bfd9e48b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

squash! package/python-cryptography: add host variant
---
 package/ca-certificates/ca-certificates.mk         | 2 +-
 package/python-cryptography/python-cryptography.mk | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 0b75a8c778..eb75d23f44 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -7,7 +7,7 @@
 CA_CERTIFICATES_VERSION = 20211016
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python3-cryptography
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python-cryptography
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 98c65e1528..1d903b03e9 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,5 +14,8 @@ PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
+HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
