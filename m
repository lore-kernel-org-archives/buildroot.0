Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C9CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A581481770;
	Sat,  3 Oct 2026 15:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHwtpsnFFVdc; Sat,  3 Oct 2026 15:56:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D4C5981758
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042998;
	b=mKwPsqXt17lq2k6IXc8BkwGSGOf5AZzfpew94hL1PdX38lnFWVKq2zLXR7mcuhYxyT08
	 31K5nIoylkh/vckBy+xldVYPiZbsp6qQjd5qQQywq2gKg6QDQclra/adgxWTQaGQRpf+b
	 V4/AAtWexIG8hT+VCKVIqUZ1ZHC74LPtg+cS0eRfjNjDdRQ7RD/UFtr3efT/H6ffrIYEw
	 6Hvdh2qcuz2lFgy/7jPELdaN9UH5hrlsd1v3X5dtSFLNzxpf9gVYp0lNXn8bQrzcJjEvp
	 QpHAuYqON4w7CQEDGXNRI4k0y+7MU7+otCTmRc/94dScwO2m4JeiU22aIARsfeGOgJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4sRp3j7Y5mLyvzTexC5ZNcDYHS/z6lxMdo0tAK0o+gA=;
	b=schbHWzkcc9xX+QVg4RxFb5lD5C4BjP2moWMN4fyYRWdCuquJr/B8WdQN68GOxyeVFWl
	 WA/6dVhD29GIu2uzuuU5DzwgP7bsJVdMz6Urc2hjxKab+tHYXKkQKbzkiOqGltEQo9Kdm
	 4vMdxIHHdti9BYJwY/1UbYN+1au8QmTjGj03tqPCxrKPk6A0eFg5eVGFN7Y/rHxaVtBe+
	 XnVLU+kukUYLBfMn+VJYsTKAkAS+dKPZxUt/yhLsptLyIlwWdSRggZh3Sl4rlbkwXs8PU
	 4r4+BI70FSJTZbiqt6s8WlMwcyiUDGICp3yfMrF4aIYRJf40E1KzID9tC5nqirZYNUA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042997;
	bh=4sRp3j7Y5mLyvzTexC5ZNcDYHS/z6lxMdo0tAK0o+gA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BeBixa9u8AhSeRAJycSrkAMUd9T46uOIUvf5ijJmNb2DAfad1UqLR+FFE4QnoonKk
	 AlYZxSMvWfcaMgh0joo+7j4ngsZfGLcbz+YR5EUY7JW27RHEVKqtilS8Jj42J4zz+V
	 cvKrBaVAAoZ+zVE7pDqss+mTflS96ju12Q5wg70O/1SPZpJlVHQgaJOuULZ4fym0T4
	 ZwzM6lyorVNx/u4UG7cUxfE0rELGiT+2NdiZfpSOcF/oR7eWaYO1uGLtb36+1pO10H
	 1LFigWHwWDayFzTXDBNCXJS7W6KnIYRBy0WhPO/JiIdQ8R9ln0BmtXhT3B8pvg2c8a
	 fWJicKxHp4OgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C5981758;
	Sat,  3 Oct 2026 15:56:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3662476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D10DE60680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJx3vjVGvfsW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8A4F660666
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=Bs6i7Egb/4xjJ4ye8eezt/uW2yfabGLzdD+oUZ81CKPnFPoaB/NvtW8zjVdBi+pkwWCJ
 2G47CEE44/3wu047vMIvHFKk+VBdNsVvFevPvB3LBq8w/kO6s4dOQrHM233zuP1bxOs7z
 sXbMqbyP6fIfzJ40dUG2OWrKKDHilvuy3tHdmcFA04Ph52NFdRaQta4fMjE7tx7rmi0D5
 ROreEEuHW65ELaIzGGjb5uC/wEnyxvV2OMSbqvIQLIu7PjI1KwimJK9dUVBHyYCe/15ks
 eGW1lmLkEZifSVEstpsHJKxNIkovm3i9EPUifrwBA+3gN5EPQfAtH8VIlzVKyPOrupg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nLTT6+Nl3yxy45/JiNwXhywAHDVmvMHVwB2JOhlbMic=;
 b=S+vThpg7geu9b1qJyvEzBRgPgENHs+RaU1FWYDdZ2Ujk+Wact28Aj8JXz258tHRin9Ly
 v7bww4MitgHYYqNX3MGzhvEP5SCIe03OjRx42RIseJVKMqw4sJKpHF/OeBblUSgkaEknM
 V7TgvVWTl1qk0dworbVT3z8qPKwRiWnUxmqvPZxaPiwMa9aeDPWkfquBEjkZNliLclENL
 kmhBNct0sHzJ9YP2whzxy5tNGXPFX6TnhUT0ohVg3a2tfQ0wTnDJpbXb2A4c3YzkvIL+F
 1lR14cXyt3mrXXDwOz+X52T/MOib82+AZy89uNrqO0s/fh6pi3WL8SaQLHUcy8s+4pw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A4F660666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB5F388806; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06c22b977a56bc0f09c4028950bc85076024b659
X-Git-Newrev: 869410a5a42dcc86c1f357132b2bca3606622b44
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.CB5F388806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: bump version
 to 2.58.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/869410a5a42dcc86c1f357132b2bca3606622b44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 9a8aa4b204..af30f9dff7 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  9e586b998d814cf0a35e98f3221181ae  google_auth-2.49.1.tar.gz
-sha256  16d40da1c3c5a0533f57d268fe72e0ebb0ae1cc3b567024122651c045d879b64  google_auth-2.49.1.tar.gz
+md5  9bd25191c4cf31e6bde58788a297e8fb  google_auth-2.58.1.tar.gz
+sha256  1480461d8b2347e679af758f4003700ea79a59b603c9134e18bfa95e8004ee70  google_auth-2.58.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 8e54c52f49..c3d6d3ed13 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.49.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.58.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ea/80/6a696a07d3d3b0a92488933532f03dbefa4a24ab80fb231395b9a2a1be77
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/52/aa/8055c583f8eb69dd4544f0d6a83e22d2f01ab38bd2ce848ea599c259a2d2
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
