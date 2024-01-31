Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308FEC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 15:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A789761508;
	Wed, 31 Jan 2024 15:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A789761508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HL-7Srp-UqIk; Wed, 31 Jan 2024 15:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1930261549;
	Wed, 31 Jan 2024 15:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1930261549
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC13F1BF584
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 15:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0EE640A48
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 15:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0EE640A48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-UMXUCkKLUG for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 15:09:33 +0000 (UTC)
Received: from mx.msync.work (mx.msync.work [62.182.159.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77FB340438
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 15:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FB340438
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A0D79D1851; Wed, 31 Jan 2024 15:09:30 +0000 (UTC)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Jan 2024 18:07:11 +0300
Message-ID: <20240131150927.194406-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1706713771; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=M42Sk7FUfTNjAXzem0bv9YvAOuyGfoQqj/xSJdCIoj0=;
 b=Enqq4n1KCROwYbYxQeI5eWER1FKHtz9lV6k3WjyC7tv+NRt89lX70G3s9X8UKYCGyPqc0I
 BtaKHjSO6yWjudqRU8G07NH5n2uglEQlsw/nR+a0lVqeb9kZJfueXMSCUfm1H6RQwOh7Df
 s+CdmK0RvKWV+3sMtQz3OPZmO5NnTwyuWlsGqXVbLQlH7zhauCa4IN2mnGR5xA9/3iHiAJ
 P8kNu2F6LVJPYBfnriQTrN44SCQATBmJiE/Fe7Y+cOVnFNk7YgqI2ykjIhhd1/fQrIjN6D
 wkvGpRQcRcz0riUAajnMH7a8tSy6jZwQETCPxI+1bkGm9kG+PHSZjWpoiOsCgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=lexina.in header.i=@lexina.in
 header.a=rsa-sha256 header.s=dkim header.b=Enqq4n1K
Subject: [Buildroot] [PATCH v3] package/rtl8822cs bump driver version to
 latest
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update driver for kernel 6.7+
- Fix warning/errors on build

Fixes: http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

---
Changes from v1:
 * improve commit log  as suggested by Giulio

---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 4b44512913..34bcc412ce 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b3b8543ff6d6d602ffaf60342969830edc8205917b96d004f84ed79524894dc7  rtl8822cs-2e4e99ae1502b173a938357dc1087e49475b26ed.tar.gz
+sha256  d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9  rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 6036acb864..dbdc7d84bf 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 2e4e99ae1502b173a938357dc1087e49475b26ed
+RTL8822CS_VERSION = fda6cd263e89567272060e6182a39aee20b894c4
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
