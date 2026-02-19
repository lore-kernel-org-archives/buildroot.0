Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B12CE9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B045E40AFB;
	Thu, 19 Feb 2026 13:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FjCEM3tex9J; Thu, 19 Feb 2026 13:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D00EE40B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771507852;
	bh=IncimIhkLIVBG0iD0Ie/2k/i22+p7jYETcjkDZQtXyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BRFbWfO4zE1ed/sA1qDC/J5iOY2NwZ4Y6SJWw1YAycSLt/+HvdxgyN8P/PBwzXamO
	 MZ5NWsYd4G33zIHHaUAEqEae4STe94hEhRCXWz7FnIfM1fLUX4+aHVbWa6bcW0l5yc
	 /XKjUCWT6pIrkzEtiQEHGdGEOOw2+MLFAXp35MYeQaOKVbuC/jOlc6IaFVXeAcsVNA
	 xiyotJKWw0J5dAt+FOKHeU6fTVSXziPCjqi/JZYsSqFLC9bCtw02A84hT+dkOhgKWp
	 RzP7SdtWHdwWipdKl+BJdNji4osoXGvIXa66CQaRgnvQg2RHxyePQLdY88+6nUkNJo
	 qu84dfzkndgkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D00EE40B5A;
	Thu, 19 Feb 2026 13:30:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA1B2206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBC7781A16
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7HHZsfW0ITx for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E8D781916
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E8D781916
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B39087023; Thu, 19 Feb 2026 13:30:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 12:52:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 314b6f63681c42ea05724e73b6d6ea14dfb05024
X-Git-Newrev: 6c83a0b8e5658b901dd35ae23217075f035af998
X-Patchwork-Hint: ignore
Message-Id: <20260219133050.8B39087023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pymodbus: bump
 to version 3.12.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c83a0b8e5658b901dd35ae23217075f035af998
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

See the release notes here: https://github.com/pymodbus-dev/pymodbus/releases/tag/v3.12.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 8d990d0d5f..b1183fba1e 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  7485a0f834aafb48273c6adb297dff93  pymodbus-3.11.4.tar.gz
-sha256  6910e385cb6b2f983cd457e9ecee2ff580dbb23cf3d84aefec0845e71edd606a  pymodbus-3.11.4.tar.gz
+md5  c120f359fa9a0bba0c450efcb93941e9  pymodbus-3.12.0.tar.gz
+sha256  3fafe85e5d82bb9bcbda14b97a0e69a47dc46be55631e9f988adfaf95140c44b  pymodbus-3.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 1e7df6892a..75c0bdc35a 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.11.4
+PYTHON_PYMODBUS_VERSION = 3.12.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/2a/af/bbb716301ab9c60f0702c3cdf72cc0e373286a5648fe16bc4431400489dc
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/41/dc/8db192f3a66032e1bd900eb87b5bbcb539d5118f520372af0cb92ba42499
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
