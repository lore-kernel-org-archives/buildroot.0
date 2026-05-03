Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA43CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3974F6151D;
	Sun,  3 May 2026 14:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkfWgtLgO_cT; Sun,  3 May 2026 14:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ACD661505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819872;
	bh=QpaDo3GkO2jwhrExEBeQpyLnV+dncXcalL0Y3+T4lnY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c5Yg2kRSMtbEFkTBoYPBN2LzBCQ8bYeuAVV1IEuNQANJpcKG69EDlpqXdGDVz5Z9D
	 0qJV2otoqFdvX0r0UA6lEglUWrjn63f7qfXClM9YlsuSca0Cr1ZHPHqbb4Y379t4pT
	 T7rJcVL3JRzllYkl2NAPu/PXgLxjzt+rCrg4dyYN2aseAmTix/WfidWUmQjgELkjhZ
	 ombB/xZ9wKfNjuL5CoZcyajhgR+tg4vVOrKtu0wEko1Co1wmVjRGvbBWJzkj+rO4zK
	 e1BKtTDGuZvKoyVsvGen88h1rFzHjHW9EjRnrVYrI81ll5ia40O3G2Vg4wqiQU3W6L
	 KhTCB2pxYXlaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ACD661505;
	Sun,  3 May 2026 14:51:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F41392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BA758425C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0edHEZ3-gP3C for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9488D84261
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9488D84261
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D3EF83E54; Sun,  3 May 2026 14:50:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 123136b246f93c78cf9d51df37727d1b2cfcb638
X-Git-Newrev: dddd5de2b6bb0504b90b56ff4a469dac2be6be6d
X-Patchwork-Hint: ignore
Message-Id: <20260503145041.5D3EF83E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pygments: bump version to
 2.20.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dddd5de2b6bb0504b90b56ff4a469dac2be6be6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pygments/pygments/blob/2.20.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 7071ad9aa8..703e0f05d7 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  79260d1c566a507953a81d24b1c51c72  pygments-2.19.2.tar.gz
-sha256  636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887  pygments-2.19.2.tar.gz
+md5  358297d0a1db8e4beff8eebc0620960e  pygments-2.20.0.tar.gz
+sha256  6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f  pygments-2.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 413a0b4467..1daf0db176 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.19.2
+PYTHON_PYGMENTS_VERSION = 2.20.0
 PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
