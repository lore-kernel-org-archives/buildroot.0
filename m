Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5EDCA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D016E606EE;
	Sat,  3 Oct 2026 16:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWiUqYc8f3qB; Sat,  3 Oct 2026 16:29:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ED75E606A2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044983;
	b=mimb2nuVk6Yps/AZlmE0AIacuWrCP6AqBmQT7TY4GWj67yPja1JrNBkS6sJbjdM/oJ0w
	 BJ+ryzWEBhOG+aDFDsveKTRVZgW4RBj7b7BBNqFST7poxO9VasbGFRjfDgLGpr+unhMIZ
	 69y/eMbHVmP12ZKe1i9SwZzriRKHKFUHH2cDWKJgxv4q+G5IbWb76K9Ai/7dVLcmvEXrD
	 GGYc/svcDsSFcrxtI068IzZ7kIgu/WFQqUAa4ad1etdXJ0VeSx+8Xdyf3eXPr4j05C/0O
	 2uW1t7XgdQ6AxNj4Uc++OIk0pZBDptTrUb9LBb+yXL8CLJeMkRjocX3+EkjBEsTCRBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UgBLvmZjU9RvIJlwV1a+CE9NRKbMxSqTP8u05j0+3R8=;
	b=ZzAZYcBIWPVm+TZ7gRRDfke2h9d3ZBz2IMS0YDiISf+7C2C7KQP8v7rH4lUYUjeByj3l
	 H86aKvn1QUpwAptqkXu3io1ypZDXeR2yjvb5T6qTN+SLTaG1QqOz+soqdzkisK0qdBRn8
	 bCxPkSMCnj6Fkyu3DIKumgVu6sJIAX3/OcNatt4IoLTNmbgmPnLDob0d3by7WQCIP2kCf
	 Thd6BRS25Ftam2V+fdbcxEq2cC199wg+ZrO+5WsHYQdb3o7f7flSUoEoHhotN7WRZQInD
	 o3qo7j88M3bkgWw+MmOwcHMJ3JeohPJ4ovlAJbtMg/Vm+GKEqn7HkVAnPR/c46Iyt2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044983;
	bh=UgBLvmZjU9RvIJlwV1a+CE9NRKbMxSqTP8u05j0+3R8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=icU8MgvehImgNBmxEdbLeEonra0XGRe9PW8k3/iD+m8gh3DXspQd8x5yK3f4SE0Nl
	 eJczMfp0JtaHOwJdS+k/FgvUSnSYUHT3cv7pvVCafUyIEmrze3cxEqlyVMqcDSihnW
	 APo+tk/lWQlQUJdn1DtlV8mYJ+twmFiQGF3sJUOEuBI/H/n9dEfNXnd9NnV+LzJCZX
	 mQCnehOg70j/37L57mNdbNYm20uZZMooQpAbZMzpKyggOlUObncanPAiMUWhe8UP8W
	 8SXAaY/Wt00Hs7uqenOFCzGy7FE04UNYfSSg7lFXdmdRzB9Yl6ee82O+hoPeRyxIQc
	 AjHq4WjShe8kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED75E606A2;
	Sat,  3 Oct 2026 16:29:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5016A335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35F3F40BFD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_6X2RyFdAmg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:29:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 72F1C40BF1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044980;
 b=OKtg4J8dMT7wXm7cZxydXxJZSgeGThZN2QlExmxabcyyD9xeuzYG82Bv1hhCgSr2Dfd1
 01TJbPuuTp+ED1qFjU9zBMHth4PUL5JUYptX7eYLuFFzLplfNLJfZrBG9xh4cLNUv28EN
 fofWr6VLo2LnIqSepwhWxjhV9NJ7mbFvj80H8rrO6f3Oug0nc0emaV9HEIzBW6qtR6eaZ
 a8zZ4lXUOXkh4ts3KvByxREcY1XEtlSgXCML4GGDg0A8Jr0fb61fxUfpvn8jH2BC/tcKP
 jxDtaCMIgMmzr/9ieTjuCMCWV+ZsOBowTpsjy9KTyHoMzTRiev8+QnL4rolV7naivrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044980;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ltyBwCvJ8j5c5neT0FF6UMwvtVZrQGFoCH78PUKV8q8=;
 b=fyRrn/UwnesepjMNxXjuGkG8qwUp7sZfrg45EPol+DwY+L44Eeu3B9masqFmE5sxpDW/
 WW82c9Y0ZgsdatMRmzgbDrel3WZTTm9gvHFfGIZrT0F3Zhgk9Q+s8z0coWibMItF+629H
 aq1k3kA8cynkTiRnqxFXby2bs7FxB9+hnzMJSKfJXEnqI+l/B+BTqj0/ShABZ+7YgA0uM
 71iK8rOqvznylwL0S7OmDfJnemKTBNTZarkDjVUzuBfYiUBzpSsUHeuM+F9/ovK7QcofP
 YRb9cBA49YX98AqD1feAi9vzGUVTDO84mdlc+7GTHeBihc34bZ+zktFBBynz2M7o7+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F1C40BF1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADC768A30A; Sat,  3 Oct 2026 16:28:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:29:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e6cd0c6156fe6f098fb78a64579956e98bd98e6
X-Git-Newrev: b1990243cad222ec438fe14ac26976b85981e08a
X-Patchwork-Hint: ignore
Message-Id: <20261003162825.ADC768A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: enable libarchive for
 host package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1990243cad222ec438fe14ac26976b85981e08a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

mke2fs need libarchive to populate a newly created filesystem from a
tarball with "-d tarball|-". Enable it in HOST_E2FSPROGS_CONF_OPTS,
and add a dependency on host-libarchive.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index d9ebf4c73d..e9dd367ce9 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -16,7 +16,7 @@ E2FSPROGS_INSTALL_STAGING = YES
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
+HOST_E2FSPROGS_DEPENDENCIES = host-libarchive host-pkgconf host-util-linux
 
 E2FSPROGS_SELINUX_MODULES = fstools
 
@@ -34,6 +34,7 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--enable-symlink-install \
 	--enable-elf-shlibs \
 	--with-crond-dir=no \
+	--with-libarchive=yes \
 	--with-udev-rules-dir=no \
 	--with-systemd-unit-dir=no
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
