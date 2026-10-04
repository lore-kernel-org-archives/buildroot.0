Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92051CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6398E80D7B;
	Sun,  4 Oct 2026 16:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azQ1-94GMZ6k; Sun,  4 Oct 2026 16:08:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1A2D580DF0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130090;
	b=c9cXyxslkPZsJeLDwBkBSR/MRkTZe6n5OId+IY5Cs3V1gOsjDYmngFyjgoXtwVivlK/+
	 4B0Xu8RUvMVKkVEBCKEEVC+KR00L/vt0i/tAeg0rDTIIyGLxy4HifI3vZvMpHT/623ykP
	 6dtofpJiffsainuV5OdeYKr1QLXuto30c9N1+ER/fAi19as6CyzTLeCe0Ka2bQNuCg2wK
	 kWn81ZMdeKLwr5mfDdbe1ezTXq1/9u1/+VEhrGaRcZRDZneLdbj1HZxb/2EnbmLhOzuRo
	 CxGNyrP8oVeO/5s9CPyiGTKicKSqU0X309DYQq6HgyoCewmm/vKea4dVpAm4ZVZEMxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KLl8JbNDc74igdBikJnbhPiAQH9Y4Hc7krEuRCJZD+g=;
	b=UAHEa/QpxMginbyFStOxZxk/5M9naRE/izda789Tav3+aaEud4H/HHtHrnskUeMmy2UM
	 5QX53JsOkDMQo1cXZBvs4xrxK4QxTgruA5DXVLJxlhqKDW/jiMR5UX9o2DMiQ7akYkA7R
	 jEM1LK45hfiOxFq0bck1uJHhNxPJEIKb7amFygbdNhQvkRAhBtU9KKTYF1+fZYTHU7OAh
	 JuJLHvzYfHRtAfOr3l75P3cy3XkmyV1evNY/GGVeDfEGDgv2WKD9JEVxZOIV+hIxuXzIk
	 BfuaVjtd6EaBJ3FYZUcciylOjmycRVXjNKOhXiBeoK6kawhQB8IK6vouCPDUSWl1tNQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130090;
	bh=KLl8JbNDc74igdBikJnbhPiAQH9Y4Hc7krEuRCJZD+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hN1h6/AWoZhQbjnTthVPln+8LOz1Mp9VlU/d9AFuE06ZxSv1Kl0IAYNyRuWZhwd5E
	 JIPgDACGFKfxIGL+5kJOraIAYXbl1TVQ9arRozCSDeSMvI2Bf+VUjbEYIVV4tdrjIs
	 aC2qw8PMOtX/gfc/aGB1tn/LV206dcuLNHGoN/4ZAvL44dUIBI58xOKIUNbZzX+E21
	 K+K82Fb86TX0+ABdhcMI3fKrEl0jqyzBUwHxObyXPulKxTmXV/6J/gmcwSu+Az7a8V
	 ax2JRowssQLtavJmFkA5x0y6qV4KP6xXToXrBwliauLg/faxS5qPnr39P7XGhazkUI
	 Ihyioh2m0t6+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2D580DF0;
	Sun,  4 Oct 2026 16:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 862C82E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 755F76065C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BHY8qnop7NO for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 94B26606EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=M613SNIZ++DrRN8y0KqTF848ZCdW1eBjEnrDA6qzCpo245fXSh35+L0V+3L0WDqYX9dq
 TJgjWEAHdJmvUOzfngDKlkXzEcvrrF09QF2o13ai5WCTdu0VQVISnXyxRuQyf1FRoBK3J
 ilcBAD3WjxeeJjlmpvohchT5EGcHxDQpV/AeJhBWaPdqywP3jWsT38SQwi3v9nRNs7jbr
 CNzuvX7qXI+9Ki8ZQr0WAHpNGe82zI1Fxer3NS7xiKqCSOWzWo1bY3cKarP1JStlUI50O
 uGqf+YYqYLDaNkjzkrE8b0PS/P7bUFvYVWclA61DbnnnYUq1Jg0xupUiCB14XBz9HOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AFgrUUaWiKsvNWPjx3wIpSCLJ3eeIKJN+dKtxVJ2+Tg=;
 b=eVJ2SIPhBSRrB7tAFRSYOkwwy5cOrNnw28jpNUsWHf3aUaTazVSGVoj21YTWI9y6NGXN
 9zNMWlOym09l9aKFsfToo4E/bAe7HoMpUO8Q0QLeBde1/ptRfPV8LGNskCSsFgbVU2Je/
 283EK9UGra7LYlAJQEI7ZMCZHXREzIpj3gQ1X2xwusC+gFnbrjKiEnvS6zESi2/cWgeq7
 RIHVtOPNC7vJ8Gld9ORgUzXi5D4afjCCICW1yOo/IG58qJVx/poj8CNDOmdiI7ZqX5suA
 RvrByLMN3hxNWZc8mfZ49E6LCQ915fcGvoEkSc/tDf9OrDm+Yood0007xUwtpUZkKJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B26606EE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59BC78D21E; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:03:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e6f6cec204a003c4fee5d672fdc2a33d822f551
X-Git-Newrev: b12c9294ff5369120bd99b7af9a7a9c343c37b40
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.59BC78D21E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump to version 4.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b12c9294ff5369120bd99b7af9a7a9c343c37b40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index b106a0d9e9..ae77f9c047 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  32766817ecb7ed597cb2822939c63b03  urwid-4.1.7.tar.gz
-sha256  e69c299f0e9cdedb839d5ec6d58d31b08fa6895cfc5dfd59c8cb016377aab26f  urwid-4.1.7.tar.gz
+md5  d4a8797e31d5ae93ed24df29be0188de  urwid-4.2.4.tar.gz
+sha256  a4bff322e8b8e407d7809e942e63177790509f5a2a740d27199ce8368f36f113  urwid-4.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 58b212a61a..40bdbea8f3 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 4.1.7
+PYTHON_URWID_VERSION = 4.2.4
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/6f/55/ae4b607277b6c6a7d02e145e9a24c777e5bd2b9189d7145f0afc731bf639
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/5d/d1/cb25a9236e6a6a53321dbf8538982134035dce940046e63ac864a4418151
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
