Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A335CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E16040723;
	Tue, 13 Oct 2026 21:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWAjRHC1ffWG; Tue, 13 Oct 2026 21:52:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 248A4406F2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928342;
	b=UvbwR59m91UA9SZGa0GiV36r0PxZ2UCJTsYU0BsdAUawIElM4QbdeIUGFfTRMuyxGk5O
	 4AKYcyUHVtxDLHX1Y0lAKn/dvr2rvIfP1SbsT7tl0fpJjHob9IvvUXJw5FcRF1GYTpid7
	 35rnza/WW/wrzFA2xhUb/cI/kQxZLXefmUHJRujp5sF9w6tf5k9Dg5a5efbZeGWY+tZNx
	 JvQEc/n9JH+20XeAiEzYpS3foOWUdvDXuug+tIM91FVq+V3XCxhAqsE4X7XhWhtcsZp2U
	 9wtO2cgv/AMcWlOTqN1ls7Q9KBd9gxsgAJTzESsof7Lx1Y9Z6WZZ3SHO/fdKWwJCiRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928342;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DldqNN7F0olZ1P6zSiJM55k1mxgQCJSZIJZZ8c+0f7o=;
	b=LLMzu3DWukKYwRe0bWYeBLLdp2G45XZLHaIvDeihPCNjliveyevHTT0Y14zd9/pgY3bg
	 4ZbIdeTHFhV8bxxuaHuTVfpXygJMd37DJow+qzSUjyRj9QmIiQZo+eUijsc9xIGqz4yJb
	 lBYu3W2lvFeEVA0A1ocur1kDsxd5XYMYpDGEQNIZxrc2Bf0CvrSyLKJvJ6hHmuvYE6Epp
	 49I4dRjByDvMx1XHZfYxh7uS0KVndBLeEBTWrneIgTUqz1WIS+30JEjDFK37b8LVVLqql
	 P1R6Hf8OoKBUTtuY9LpouVOxoZlw/9vPcAhogiHaIFV8Jg6cn9LzP3CSPWFCMWs9oxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928342;
	bh=DldqNN7F0olZ1P6zSiJM55k1mxgQCJSZIJZZ8c+0f7o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QEb9vVhLScBrV41A98Foo/moqfYSArrDnrpGgr2ixf2xxEyscZX6mitbSGvCE7qKE
	 drBFyOYnXQNdi/egyLY+ZMK8sP9clU3u8Bi9lPRKWlae2raKv/7G59p4JM8wtv763o
	 JUIisiax7QMLXcFg+wH+cHgXSDh+qQMFcR/r2omOC7KwMw+nmE9oxN3As6YeL8y4yG
	 TTTGRklrzoDaga1pe3zivWSp6c1A6tEGxk35Xb/K1IdYYFQ66psUhytX9+wfk71TyG
	 MeBqRSV2/zMJRhWQt+2P2LBvQ4zT6nsJom/i+koodrCIkx/+0sHCWC7U+C9ailPiUM
	 gdbQCJ2mlpupg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 248A4406F2;
	Tue, 13 Oct 2026 21:52:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C4B82AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E62A260899
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WxrZgtBY_XD for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:52:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15CB160681
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928340;
 b=q7WoEA4EWj05nf1I/8hh3VX6xKivFqlKUaQ4daSCKUvJCtKhuWoZOuvO6Z3uWdAVDKx/
 xfgMACjqIPg3KtKMgKQHJytSq0k7GnGl6ph7qGkF+4gQQsRl/lT5ssRD5CymfFZXW5OOd
 +bqrhuW98O/xPwphjYsypANjAj5vzEPdXhZC1kVGBmB/M/xOtyXgruQbzHVgx5FRaXdu5
 jqJ/DSlfK3yV7cLeiD8br0pzjlSBiQLLDqyQGPZEotrD+v3CEQGkqIO+U4pmdo7Hkmhov
 87KFvS+2B+AmLwmlf1N8XVPgP8Gf5IRTc/02BUKPCt2lvtAcdVsFj57W2VAzjeBUM8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928340;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EZHZjB1kE2UBFJocYXZz45ERE0j4SV8BNzXdkIvwnVM=;
 b=cTXlsbrr1HRmsdcgkT4CrQteO8ZJ68l+gbe6aHLFCGmo+QsVDT2j2g3ZiGHRRoMvXdwC
 Zp0Lm6kCop2VvfDpTxaplABH7HnP33c1tXI3DZuWZmD6inwITUfkfVz0A/htDUobUVLpo
 EF6uHOYfY4YeGOO/S+kz1292WG+d2QseCXnC/4pcwixAYCzwkXrk9ZKYWJ8rbeV1La0De
 OBxadvZ4rtckqKsE5bS9q9M0B5OD7Ds1mPjM4uFFSTjLKd9lpbqJ3mUmG6HliqdkZWkRy
 UEckzar8/UDhlXTrvWQRxSPRIWZW9aBJt9OirkyssRa4TyyvUlAZpYbaieB6Gt/S+Xw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UzH6WTtP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UzH6WTtP
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15CB160681
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:19 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6d00d120b28so2194738eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791928338; x=1792533138; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EZHZjB1kE2UBFJocYXZz45ERE0j4SV8BNzXdkIvwnVM=;
 b=UzH6WTtPDiVGVRV0LN0QyM7Z9Y4fvAhHdUh8cQApF3Kvcnw8qa289ngU2kSkF/QFVe
 Lj50kLUwkqoxfLbNffWupYrBsTbIs+Zr7BpGiOciXEBeD/lyZph0m5sUtPtjvYPDH4PD
 rerDe8SscNAwByYtH06cg6fuoghXJaugkhROqrK7/bhzDHMF7o32sN0cxtGvwBWUn3gR
 dpbspe23IwKtHAMPM/uen9Yhk/8vt3VQPLmWv3yHb+BssF//FhMV7OJ5ZPTCgCt152al
 rXwZDKuRHbJ2ybq8nS2GeYpv6OcGsX1VdulLqCcWY7xu6RjRMqxy10I6FJvZU/RF14dT
 OLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791928338; x=1792533138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EZHZjB1kE2UBFJocYXZz45ERE0j4SV8BNzXdkIvwnVM=;
 b=NIGjdABTGMRXde4cxWfWYbFdtbFXXNU7SGvrmvMqLCcUf9X5UPsleTlA5r/kh8SPWe
 9DSS31Hef32aoB96v70wLTOt6/PgBVxf+YC753mVwrQk1VWvWS66ZIoUzBOR8hvXkJT5
 koB3k200NwdtOyjoQiTDQZA8frpZJIbVH8Op71N/ZPNeyliPbZKAwej+UwUO/onEoaqG
 ROnU7lepKxRpjrYR39zLgz5oueCv2EwjODRLkFUJXrsWZLFSGSN0kvo6T9d906SzxQwh
 ZyHDJcp8XDz6+JELn2z2AXEQVuI4Vb51Go0HylbDOe2dllJLu+7fn688xef0N3RTNDNb
 7aHA==
X-Gm-Message-State: AFq9FYJQERtSfWdr2DfgncQXYKCl7LI7HgFnQQU3gDTKr0dAe9oR9WSu
 PJEgceBJXqdsV5DPAtEcjmoFra3FmL6P3FU1QMvds6zjW1LXub21CSbd0kxlryjQ
X-Gm-Gg: AYBFou0roxvenV7iv7uATQQFm7Gao6/gwoyLz0Y+nyo60OzmqOxKIVGI9Mjp7hKWfTX
 RKKEQpl7vOBu/yBADsMRlH5XCQoNefErkfQ6xPU5CjDJV5WAR6oHDPAhOMgYKIhlmcjCF6ch7g4
 nsbt9ZkYKXK85LXo6q1VfVnfZ0kwypxmxnQAeS5xem7pd/h8Db9MxxBEyR1guPv8idssEU/VI6K
 +xSpuMD/pPSoepLK8ejrEf1gbn7QUVHT8C3iuSPZbgPQTkDWAKwCMskwEY02V2QARJTogqYCijP
 10oF1XEsFRbc9cQdXKGNHtLVg5odyslmS0mcsAZ39t92Zwj7Bj+Nuf9iIsk2nth2sCtyaw3iKYf
 Cm6EkuYe6dZktJHApWo9McpBEj0SXAr+Xla+hnfH18qw6z8JkXUozOYbqUWaFwRHmlciyqxYICR
 ox45M07dkcZFZNs6MkqEdway4/djg/J023dhEMd8Bq4rDSkUv+sIsZoT6MxQtMRJObizfLN0eeF
 6TAZvks9b12HiuLG3C5kOmAZ9lYref0KzAPW1utckOj6TIk9iLZAtIp/cxr9MKJOJgCqaNzciGJ
 BHrAOsyDg7G4NJG79pukCeeGmD+dWJPrvrNhds5jRbaQ6+NLy7P+iNfz+HmAoazHMf5MJIxIlIY
 j+apVjXGQN1fKRctN6FmEj5wb7Ka5zsAKf1/j1o7zm/8=
X-Received: by 2002:a05:6820:61e:b0:6f7:1238:70cb with SMTP id
 006d021491bc7-6f71238889fmr5285679eaf.6.1791928338409; 
 Tue, 13 Oct 2026 14:52:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6f56b25672bsm6813224eaf.11.2026.10.13.14.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:52:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:52:09 -0600
Message-ID: <20261013215216.2460255-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-markdown: bump to version 3.11.1
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index ffda094bc9..eb43ffe260 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  b5032b0df41befcc3c96f9fc966a0668  markdown-3.11.tar.gz
-sha256  180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090e24b84502bbf9f  markdown-3.11.tar.gz
+md5  0a601cc89d8507e1409ed41ab718d929  markdown-3.11.1.tar.gz
+sha256  496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606  markdown-3.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 9e7559804e..e4f183588b 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.11
+PYTHON_MARKDOWN_VERSION = 3.11.1
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f8/4f/700155c8c20d9e655dd0732b5fc3c7614f291b9148da271d7388e50bf774
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/4e/d4/f3f4b6ed70b7c7608fa026ff3bbe59ace9b1ebca43d8ae4886c87c95e81d
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
