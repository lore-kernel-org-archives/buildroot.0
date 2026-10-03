Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3915FCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C72708145E;
	Sat,  3 Oct 2026 13:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsB8xRMTr92V; Sat,  3 Oct 2026 13:56:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C680081457
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035818;
	b=TjWcF9fNeBMJLUnOEGQ8C7VSmiZcWgXXIBBNu7nifqOEwACUyTOHH9IZJm+CnDGBxl/r
	 IbposjNjRS1fPWm6N2DrUomN+yU1EyS0aOsrlwY6y6kbVALYA8DPEoHwcUA+KzB9HHifl
	 BrT/JVPuJdyo9thcKFlzYHGoYmpX34uVTxrNqWLBiH2zN0v9ZV6ULRmHIhpUaBKG7JkEU
	 EenB2LjFQgsxJLehaQskC8LVpGWqc0C3KAw7ZR/ZnOgiqDxJKjy+VETjRmtTVg/4x6vBg
	 WLtwv1dYEIlIdqdiJOecKt3xuQFRijUYpwweTVcw8oOTXvrQT2pexdVzPXIMhXAlV/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FOUAmh9jJZPqX+sOhXGbprnwfryqJs68JvPRN/xmh30=;
	b=EIEsyfAXOK2riC2R/1vzNhBtjLjBW4EQuA3K4KmiRJSpM7XZOYWfKysGaoQwiUO076fa
	 ArbFvxvaBtIPpbSxvz6H9YVCjg+Td4dnKaVwPHnZPIQN+GecNTZu34zQkXvTvEx70ynx5
	 jBaVr1pLfzGYRYrro8UGfaoJ8D7d0AW3IkLCRSVaecX8FZL9PNbkV+lo/oE5kA5Ydp0ru
	 jhkguh5+DQXm7BVFHqmZjO9Ku7DdJtzhxsbMSoxVfjQW4NPqdqesXW2JoLqsFazLNrJzg
	 qqDTuqoVY4RI1u/QNUyLSLKvzgByRH+bgC6/ENV1Helqzpfy9Kcz+lBRv4G4/oM6SXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035818;
	bh=FOUAmh9jJZPqX+sOhXGbprnwfryqJs68JvPRN/xmh30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JI1pc7ftPjV0JpGKb0FUaUs7uSH9kijDX8wUGt2iYb3q9MVOwyE8fY2LULFldtchW
	 03Pb+8lCoyZ8s+tDtHWIDygs/2io11A9fJRn6jy1p/96CkThkx6NGUjSCdY9A3fKc/
	 66aa1n93wbz8WxS/htBO5q5hqjkiu8CeVSSNw2qK+6YeaHxlIi4ley4Y/P2Za84d/R
	 7riXhM/0vqjlncrrjHHifBqhs0WLROVRd/Gg164HLS6lUbQdYIiltaM5nb5QEwQfUj
	 jDwma3h9Bu/3Q0bKKIgLSWk14chXTvsb22VVhCtcz4SfhRrC0uWdy31JfvajYYiV9u
	 eUin+BIW2Pcvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C680081457;
	Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC3E179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8AFC606A3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsNiZKZSo4Uz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E209760675
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035814;
 b=FSzaPStZHEjxMV5nekww8C/4CJCyaGNN+2A/VajFk6kGbaytiagRVSv4Dz0vjEDr4xzj
 QveKFXdE4NbTybjKkUNByeKxTCqZFJFPu5f2/pgMzivBNN7OwBxouRua/gU+tjpTQoYW/
 RZUK9t68Z+PDzNkWzZJkmuvqKVnrPNZqGc2JAQoS3prvcEzofgYkMcQl2bbqrC41PqxmZ
 K99utv7nqPY3siUkSGjb4O/SjB2JvOLPUlBQxQCjuOraUqD/5Qk/uFLq6QsQ3imEGangf
 6qpRMYwjnKhB4yiH5iVLx9oVd3zzgEKrAxU/5fZLqKlVezuaIQPv0E2L7SWv8sgiIBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035814;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=k/HNV6r8zViZf4UN/zj6l6jR53PSrk3HzywMfK0LcpY=;
 b=qx7/cBNMo/S9nVT3xlVnPToCu0O1w2fVsLQdUL25qkJlzob5h/FiMREzooevtQPwQnwE
 efUryxaAfHZXYqAXa27Tlt3jCIHDRMlvzWgO1PVyU76jhCtMQBoZY55lIGyVdegJoiA4J
 Degl6/uGQZ+dfoRa5grfnGa3wXgpJ9YXZt5KpI/AUR/Cr2zDi1njWwnCjg1c9MdZSVzwe
 +4Pfz4u1jiD5LhwAHAVjEzX0vuGKocdj+XgAMpZG6U2Bdi7HXCExYa6DKu8T1dHTONC3O
 KrX869KtjckyxQIN7vlRKf5pRN+teNC78+xRoLtVC8lYGD/IkbtpyYjwT6Eo2yGf6XA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E209760675
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B6848A31D; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96cb3581c0f65945a4b5a4458737e250e5c55b83
X-Git-Newrev: e825373a0a622098658e33a8b930677c2112ea5c
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.2B6848A31D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aerich: bump to version
 0.10.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e825373a0a622098658e33a8b930677c2112ea5c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index 7990532a2e..698d2bd38d 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  e4c7fcf3593c22d58c372595ca3d2e6c  aerich-0.9.2.tar.gz
-sha256  02d58658714eebe396fe7bd9f9401db3a60a44dc885910ad3990920d0357317d  aerich-0.9.2.tar.gz
+md5  208ef8a512bf98cfa08b701819679d45  aerich-0.10.1.tar.gz
+sha256  d090b486de5f632a8c8e349e9227d076b26ba6ffabb522732bb681a9bc2e81e5  aerich-0.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 916279be78..423ae03eb2 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.9.2
+PYTHON_AERICH_VERSION = 0.10.1
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/c4/60/5d3885f531fab2cecec67510e7b821efc403940ed9eefd034b2c21350f3c
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/47/a4/928e971cfdbff75cae335898b3a27643fc2564bc28e23efa182a8843e78c
 PYTHON_AERICH_SETUP_TYPE = pep517
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
