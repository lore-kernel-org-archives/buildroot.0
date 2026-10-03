Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B1CCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D0EC60F7A;
	Sat,  3 Oct 2026 13:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS8zdVx1tAOx; Sat,  3 Oct 2026 13:57:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B22760F86
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035862;
	b=qaJVi77KUH8CsjTe7XhljOswU3MzUBC0hNyBTw8Un1A2R5aclUDifx/LUB7cqn4pBJRX
	 gPKwf1FfxsMPx+ulbwZDEU/NyrkLCg9zPtOrkUF29Azr8GbFTF9TRVifv3jxYqvm/4BGt
	 HO0SJIKAF6OO2DV6WS2Deg3DhXdnZBBe/RTINbfbXAEfMN2cdwbgt3J8swQwX2Ao0wIHI
	 d6VWBplWPj8ASVXF7pLBYxjSm31nT9JHQMJ5QrNPXP7G7m6ZzTaDZfq3Dn9DXso6cvtci
	 UJuWkC/Julxbn+hBJd8GSUIrlVQSduBDw6LtWoORbPew43ymazVzb0+otrpqWTBtz/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VMqW9cAunDdvbqOaLpN2BLQMvS/jI5kMY+0Q5nR1kFc=;
	b=Ewd0v0hYRPRK4+c1bujWtvSv4TZLCdCPnYXieJng9tKQIaiCPQlGJPTrSX4CYtZntmgo
	 3LCmk1WJFiSBQumDTSJ1S+Uc4ttwz3wxadQr1SW0HASgNYmOuu1bQsD8pLrG+S4ael7AR
	 3H7+DgnRH+BgO3a5qyx0ZVmFGejTzD7azfaLxqT0aU67KQQoFd7u+9KCxvQROpWDrN2zM
	 TAdmZVs2shDaUh8zkVL9lqZ7yThd0THjfhu6gPNqwr4iKo7tdVJM6jryZ3nEbSrR4Gxey
	 U4vWboAPBZcTvipRTszb2OcK4Z5FFPBNbalhgKOWnBZJYaPVeiSXN4GBgwHwyJ3JO5g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035862;
	bh=VMqW9cAunDdvbqOaLpN2BLQMvS/jI5kMY+0Q5nR1kFc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ieh53QXgJWqciQzidMbAKJhZP+N6CsvdN2O+NfsfAxxJJUgfYiCJ9GZZOXGcQFS35
	 +tV9by5EHe/xzut/mHTN1RQJ3XhEKYlYrrLVkkjR9w+LcqP3vJ2u342yfIQ+1lmyX6
	 T1M2JKmvGuAH8oy6hBMaq8SRkHL3RSm+gh3UaMvTmdUs8BdVxyA8qHKEl5WuzHnXij
	 jL6ZNFa0OOCdcYoMIqWOIqnrSf6jwpkNYqA26jT2Nf1RRCaSn5nsMc6CW99nJpXwr5
	 NoqE5FXzBuvUKTCrx/Tqu0TcgJ30kGCq2UWnQ1OSDO7at3XjCYJGTCKPA7hUjF18S8
	 KCq4fFwFC0gUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B22760F86;
	Sat,  3 Oct 2026 13:57:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B9BFA10
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDD52414FF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BygA0aVGn2-f for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C100414F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=HTbmw51UYflFpmZzvdGq6oOs96OOOvTGLYNcCkW6yOlWhuSq1DmmCuy1r9oLNMr3VTXm
 2sQ/5prmqFv0eNhaj6tuCMbm9/vqKSTNxuJwg9QoVIMe7RXmNlXJk0kXmyXvzbcCe2Zbu
 CVoFh85sF3PbKWI2LgXJanxByEBdV1v/sr61MfOz2+hZMruQKjK0sBLDUL01TgHSkg57t
 L5RymwxgUk3C4RcAskid9ikHm188dn11DohdYH851AdPnrJlxtt+yRld4/97tr+v3400A
 fMKKlcv7JbE4hAF6RqAyfbNFM0oIfvdmptVE7TQCuGQTdoQTJIJExfCxOWJGrerCn0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YwMyZmR8jV+f9JxIStha1Shjtr5qs0WaNJPnU6EfHQc=;
 b=Rhn6bYjMkIU7Z/er6bBV755gUrY39Cj9wrlUSoOfopBXflpOEPYp0GLCxlRPJaCjF9Kd
 4qxU016eJRyo6E3e4jwF6887yWogJ4R4R1nWACdwe52Z7C9WRwRxzmyQ3wSEL0yDpbdjd
 Z7NtlRpu1rHYe545WmWmmgxB+FhWsvTsanswzmnsTV8PMKmefTpQCQ51Ha5rXmp3UNO6L
 /nLxgup750BdaTLDpkh03rl1KJ8AKkEjvqlHCHdHj2GjMFGNnDypNvqFXU5bMDsS4h/ZB
 3690KuogJyo2AUWis1wHXnGLMGXUKtpgIZLUpCHdVxn+YN5Ce5kc6XxlccPnHayiUoA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C100414F4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B75AF87089; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58ba800c62ce183eadfe216a25826d0efe3f2673
X-Git-Newrev: 5cddc0d6ed9f6c53bf74379419932ff64d42cafe
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.B75AF87089@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urllib3: bump to version
 2.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5cddc0d6ed9f6c53bf74379419932ff64d42cafe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 92425d125b..524de89f94 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  e79707b798a66c8165c9c441440f4e80  urllib3-2.7.0.tar.gz
-sha256  231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c  urllib3-2.7.0.tar.gz
+md5  e8ed250b4d520f9e3c0df3165953aa94  urllib3-2.8.0.tar.gz
+sha256  63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63  urllib3-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 8e598818a1..ae0f4f48fd 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.7.0
+PYTHON_URLLIB3_VERSION = 2.8.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
