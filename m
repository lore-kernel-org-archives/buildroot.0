Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93468CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604BB606C9;
	Sat,  3 Oct 2026 15:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNZwuV9JJiMz; Sat,  3 Oct 2026 15:54:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 260B1606EE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042868;
	b=A8BXSY7OD5ZhISQgd82SPzxB2Z2Agv58Ff8Pi2ve2TkxXPv3Y44XjgS4byUDIRSvBz3F
	 4v6caGkbHIta7ZdZxr70KjtPHrLSJ7rXaiGteeJXVqH6BRf1cgFPrK8JqWFRR+tnL8U0e
	 UQyOO4jLBV3GmQKiGdZ0Kbze8UbFTyA3jNHLxHFX+VhNiwDE3jiV4HoUYp9PDK7F/WFaL
	 Lx4Rx9uDUUClUoChXmAIZLR9cU7tmFBfVVn0OyROVl6zyyXSQrN9FkIdkykP+L0f715rP
	 yx+HqqjKBcTktIlHmQS9dJc2x1o1C3hUvCtDCXYJDO6ysJ8b+yp7UrhQiWlN4yGLEVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fKnUb73+G2o5TpVvE2FGYgGuKhFJMGCqA3o7LAH60+w=;
	b=Je+VBKwpxgAMefBMlHmsCqHFY0qsdOaH+Cq+9D7mGfqjBCJZCOZRPBxuezqDb+TU4D3d
	 4NKbZOfVJT+2EGlIOgoDGNRyn1d0f6Ne/sQnEhPggmWh5QPDSwXxxgNwHE5/zKxttErLk
	 H2qksYY9DdbV1DzX8MkRYrbTIFRwBaBvsIXadLc5F0qSETV2p72CQ7WGOmXBI2JISwbee
	 b/yyCwHrBG4DvGZPZni1V6fKc9NX2MYl941QDn/S9A5k1h0dAcMNd82ZCUEddEhcREOhp
	 LTRN2Fey913WpZ3SHuukhz8Cq+PV6MHF/TcwSeRrRkKy0UZWnGn/KnpV7LdBwi63bww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042868;
	bh=fKnUb73+G2o5TpVvE2FGYgGuKhFJMGCqA3o7LAH60+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eJwB53x2yP0t7caB7UktiP9bIMTRhcmIFlg7Gtl6GP/GmMqEEgYgohlNu/MaDFS/0
	 I3aCRkIn/yMfK7TX4urPJTW+bIAH4rCIErxK7JMVtWfeCXc2hLaBTS2jIkMuiGhrCV
	 cVgRWSThEoog84LMcmOmKXvEPGIYI2uwn9FQ4i9Lw2Jh1T1Ciw5HOCMAwDoLXlEK6/
	 2p1jTbBRAwz9WFTxbIk3BTY8jwk9XQ398Oo3kd5GL+Tg4xYxDTfVgr1Out9qxVwR24
	 9SSU+91NE4fkpTikcivFh9CMq1mUrJ28puvkp+E8I6nRTHTSRiyFBP1aZ7aRF4E+p9
	 ejJgGym+CJmuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 260B1606EE;
	Sat,  3 Oct 2026 15:54:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06AF34B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9B45606AA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1dVV4g5SYvs for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AC4166064E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=GHzfDVY4ZV4IwEuhRzWOgIGZUt9oIrV51fpRr52FRDwlr9grh8oc+JLShn4o98OURKwo
 7BmZJSTKCTVXKfchXzWKJp+HHTDu/nZ6RPRYzEv/YuKR3v1NOyq7nLjMqBgZvdN4gYGFm
 rPS1GbvQGH2Qzol+ocOEPsnrQnRDFI4LddQ9h8680FH18u3Gh4sF/7fV7WxrfJr7q0KqQ
 BAMROr3dXmcI0MQvT8N6fUIEsVlp4/gB34b+CxaiaUsevypZkNSEIO/5VR79uCMCphZT+
 2624Rs+jaWtgm7ouKDDcTJKzJx9TXYTskM+DALaMy4Jh6BXAOmtby35cHErkmD620DA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CYo6r4osqZR6lAANW/eIwnTmjsAQizkNZ0LXZ54VRtI=;
 b=rMW6pG0Yu8QU7YI6wkBFejJnrMIQZ2nHb8MVoieCDoPfpZZjR0cKrpcNDFdAIIyJrhSW
 caTXdindsTIP+RHGLl5/j0aJevOGj/YQH4hHLPqKj76UOfEQlbITnYGbEMyEzOGGE3Wqj
 R9GUUleNdE1408r5NGD+EW15gz9INIWAFDIsQ8umcdG+03CgHZ70Fvh5zC9devcj2ogE6
 Vg/NDzT1Axqk3c3cczvRTdAQ0J0FHrH08i8vzXgevrJsJ0Bb2m65m/Ra3gv3lR2y5Z36G
 d6pEoFSYrxh8w7+59aKmZpynQSaJzDVTMO7LqrKwbSjHPNKIeTwYUx5rMWKU6Q7fWGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC4166064E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED647886DD; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57304dcfaba5778534a5d51a70b6d2a8e642fde2
X-Git-Newrev: b9bc8ecdb710307a5ad6f2c98596b8029aece5fa
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.ED647886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zope-interface: bump
 version to 8.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9bc8ecdb710307a5ad6f2c98596b8029aece5fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 910373899c..73a4c7992e 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  e2886da91bf03fdebc437cfc8b029b60  zope_interface-8.4.tar.gz
-sha256  9dbee7925a23aa6349738892c911019d4095a96cff487b743482073ecbc174a8  zope_interface-8.4.tar.gz
+md5  f430c7c2cd576867a9908a5ae13328d0  zope_interface-8.6.tar.gz
+sha256  b40ef9b4873afb5d0dec02b8d2dfde1cf18c72337b60c99cb735961e0bac05c0  zope_interface-8.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 1f2535324a..59255ec906 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.4
+PYTHON_ZOPE_INTERFACE_VERSION = 8.6
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/9f/65/34a6e6e4dfa260c4c55ee02bb2fc53625e126ff0181485286cf0c9d453d6
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/26/39/a8481b926e42c44a6fcc670904f8251469ec42edbff1ba066719ca1e7fb4
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
