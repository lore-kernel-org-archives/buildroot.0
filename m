Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6131ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0814C60E92;
	Sat,  3 Oct 2026 21:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9M-6rXCXr3Y; Sat,  3 Oct 2026 21:09:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DA86E60E90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061767;
	b=e+QT67UCdtoeZd2ufF6Hr34BKDNewfUQbxwf+LKcl6O8slDOvaQDDKkkLenGyJlCp6k0
	 UusizmQ+UAArpdUPMPgr9ANSG6hdc3f0JfOlZjhebHGunk/SfBTm7OH3T1Dzjho8EmwI9
	 hOs8SJf5sII0IC4BAiq31mwfcmKiWUAYtG1y4Oa4etSl9Mo00F6nVkvX4WrFeh5ub2Hst
	 wHvI71x0TYn/lwbQWzWT8u24hN8ICe/VjQhg4kSddy/Yz8PHeo6OMxJX4+uOax8PB/wj9
	 K+h/pDTvb9bAdsFiBwAXrz93HmTwmymm95wELISmv8N34a2UXYe74azCXFklMySPyhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p30uxaUE/Yw6Ii9BgUwcw67Vv8lYgNNzF8lVRJykAts=;
	b=jJFscfPf7kBs1s83jZjJjy3Tq9n4zbzuNIb5/afX6VO7Q9USBLs+6pIoI8FsCydRI/vL
	 j/zG+akKnmlUAVZwkwUcYzXjROISedYjgdUJPG1uxxyGVWSSvC03FB4zkIQEKIhMGFRyH
	 3Vl+usm3meM68JYNdNDsewx8VNEmLtRW+82YMwu9HSAbm0YCdTVNiCw0r4cHK2jDJK5zU
	 0PGyqkUuCRHrD8Fl9+iH9X2fYw0WZ+xIHTZmTP2g/ikFT9NBjcFxup0soFsqZxvPbVvGe
	 pXiyNCEQpWZ/WjlmqBZW/2P1tgHT8G6Pl3Wdk0bqZpxdOqy/oKMmjeeM1DDPVqA9fnw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061766;
	bh=p30uxaUE/Yw6Ii9BgUwcw67Vv8lYgNNzF8lVRJykAts=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ee6pR5aaGCJvkzv0H7aGdxHyvp8TBSFMYLsPReUts/o8TK+xPZ+O5XEoQ/s0hzykg
	 tgGQect/4463Jy8i7RlQ0z51xoxndDa9xl5f4N6oybyavUcGIcnbqsJLPbSSeHn6fg
	 baSUVNqFfPU97B/AeJpoYgiK47Zmyk8zIyNe8PgFtpw0YjROrpwudsbChM+85qK67k
	 xuR1pvV0Uo4p5fDfxGGJHJJLrN9znIaLSBK6p5ggfcRpoE9z4vLfxdnVIIP1OCoero
	 JRD6MB0JPVLqof5C8hf5viyE/rWv5KqOySooaXjkGWV5231m9YBOIrOHKCvqQ/TYFZ
	 NtH4CHYFTwVXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA86E60E90;
	Sat,  3 Oct 2026 21:09:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A5FC9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC10E40A99
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVSPIh-BsSrX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E0A0740A7E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061758;
 b=s//ZP3gap9xvvgpEkLCQyFyoAOrH1Rhsxs25NNyG1mejWBshs9E3pKNAgiD/o4roUYub
 f9qE//ch2AHdYZyFYGVYIRj57JweiKQ48IyKbtVROKqaYcni+CL8REop+lHYKJxGL/vBp
 iB/4xQYM61VTYZfZ66Uiag83Uo+forfMEv9jhUdbWnxq1k0/6gDJND4npSe9mFuy2LZ79
 dI3DpFdRcuPCjgVc5VKcj2ro6y2tFbhz5C/gdjwJzxnuau1nuK7fs4jIwx3rld9N6YCVN
 +DAWX6zX8OjsW1FJFd6ilchVaJ6n4hH7yvtqbQowh4R16kZiYhwKlXMsM7YSr4DkRWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061758;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=RzXLnP6miBKPU4zOo1lRmUwd1s6IfTKo+MlYACQBIaU=;
 b=ZzG0Pf/SGA6Q0vrbHoGDrSpUIqEm7SSdnTLTeQJWrl50R2JbzI1yI3C+AH3TYMDfvwIG
 QjwTZGCaPueFqQdwicE5Q7B8EVMlxxmCzIjfMqQg4nPeTcAPiud2bj+gFKothxNcqV/MZ
 txv9C174O8R8KEeYlem+u4kFhHja94ZDNSychBogPK5tinsDsKLLdqGqYGDcuLm+aRUQj
 vbmOZJq0WshFrnIYbXvug5Ceo9ruJHsGK2VexCJaYcRjGh037flWUtNqcklvBJi7lFOJd
 cK6jUhW2qZCZnZrQFBRXIuvz3pt1yc7BW/1ktQ7GODLIYfiSq88IDxIfKKpTcXhb3XQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LyS9b+0e; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LyS9b+0e
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0A0740A7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:17 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-7f4f0c89e34so996032a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061756; x=1791666556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RzXLnP6miBKPU4zOo1lRmUwd1s6IfTKo+MlYACQBIaU=;
 b=LyS9b+0eBLaWA464lj12cn4jDIBdnc2eIefdo61fBAKXtU/coBuXPArh/UJaSAlCdE
 30B+o2ilzfWY4urqSsARy89MDQq/iIK8m7Djg4AZpFCemUqjEW6uUu0mjRt4srVGijpf
 xCXkk6VT7hTiwMohWw38OykdVFFlOk7BN/KKeB/KamRjy1o3LL3RTt5RwPu80e+le1Fo
 qT0XcmwDjsYolld+dmU+xkulD3KKT1MEItGKiiCmk6KdO5J6C/K8vKarBq03DXo/5hUY
 pkoRmWvD0xdF8lTQeTFcY1ppNMDMAWpb0Ru2ikXwJONYRCHmfxtsX0yx8TG5S0K5kFQW
 lnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061756; x=1791666556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RzXLnP6miBKPU4zOo1lRmUwd1s6IfTKo+MlYACQBIaU=;
 b=d+kOCMdiHKJi2zt6/4u1dqOQD1prSSboIJAdr1dVs7xLE0By4YA2BbFQV7gHRNzr9p
 JZ4BJl7kwE9n5bVrjPKxHk3U+qr/WhdRTjC3eJa6YpiUdpSNgIxLqDvEy+s4yLTOABdk
 jhxAyEBCYjPRbFlzF3/WTbvUxkd0DiShlrNM6AUunHwBZp/3Iwhr8UfXbqBnLEciZnwD
 ePmLDVGIp6hlYnGQJL/qxLCrkyzTOaL+/C1LXiLiwDjas0YXTUfoS1d+wfBuhXVdOUjT
 1DvLD15LAHKSYuAtrRtfaQXFYmFzSI7FBn7m0dFKwpP0y2Q9FKibOiWu8Tza6AxfRuQ0
 xRpA==
X-Gm-Message-State: AFuF++lIpn/KjI8CxfOwSVHK0C9Wcvs1u1fWy8Fz0wyjNuj7zdhyH5g0
 OVd4qShyBuLv3/9y1uExXIbGtzUZssFPIeXyTGT8iPHKSr7SDb3KHIDAFqjuVw==
X-Gm-Gg: AYBFou317BUIBKhfLQwrMRpXrv5dNGeG+cKhutD/ys4CZK+jNtjD5jmxuiPwNafG/Pv
 yzC9W8D/7dBQbN51uSaXbqezvMVxNhUz2yFYaa9qn2XliaH+FZfxBLVtc508ap2jl7XVfkbFrqa
 fk6ukaKb62nSTNbJirtV36qrc5/++L6Zbh638+tBkcYRtRZdoviNQHQ7+1jGMd9RFoI3Xd+tItf
 RxI+p1mMPkuUaDo7waLCo2akKV4bd78vHcjv6CR6SpL3g133ZlI7GMGa3awc6OYBDM3jPTOuWJo
 U30frXs4gHC/HyYhFbKUvvrfB/AeaFmDpSFpCSQOZPv1mUY8+AD1aEUeNTrBSeHHwfL0pynbM8Q
 0fi532klm9+7BArWyjj3rHQfB8u/WXgOAWmp00XhSMJyNLv2GI8MYKrutKkQwambLdg9hRQlAfS
 47JnyDCmk7rfkgtaOIDNUjy0UTf7yden5b6zntH97+fGA7WOdayOxuZ+tOxXXjVFuCNqtpjFW/v
 w3wcvJeUUwQMVF34aLEPDKF/NxcgyHn8FOb1Ig5f7IEMlMgeM+howaqrP4Xx+Gj/hGbE0/s7DLX
 9WU4CItywGmLZ6ZkSApWcHbDl+dAwgqQrEuKnmCnVw1rKWwZa2x9a0tDZx5wxbbAA5cDuEIFn2h
 Pv/elS7r1ITx+aVPJkKoXQPDaxL4FnTnjoM3edJ6xSDE=
X-Received: by 2002:a05:6830:6f82:b0:7fa:5c49:523e with SMTP id
 46e09a7af769-82283387447mr6735147a34.23.1791061756576; 
 Sat, 03 Oct 2026 14:09:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:11 -0600
Message-ID: <20261003210833.735937-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urwid: bump to version 4.2.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
