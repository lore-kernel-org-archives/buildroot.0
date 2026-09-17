Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5439DC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D45E580EDA;
	Thu, 17 Sep 2026 07:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtjwXWgJBr7v; Thu, 17 Sep 2026 07:45:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E013E80EDD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631101;
	b=l3a7tfBfZ1J5fZ0nCsRqc3TByavPSmVYMrdvTDOvHiHwovLo33ikMgJCV2oMVa+a8GaA
	 MfE8CxL5aRO1cWOc325mEWw0A5Ip6nKVUxzZPp/EjA899YsNX2NnVfWYpIYLDIDeDYXm8
	 MHTZjraIFQhKaBvPMlDMHKyX2yv/oG6NT5R0rEM10f9iUUNd25Kh3fuSZh5nfO6aCRVjk
	 EL/6+7/YWhebso+YxYDCuOEwvtwLPRY0SzK3DzuTulxBU2GyipfF3x06YgA9n/VJffv8l
	 1PO/POEDfXYvghTb8zp3varPxiNNKSoakENBKwAPDGN/9R9xC9mBFrpXMKrIQb2pHSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MJvlB3H2rY2ztjHSYIjmyUYBrz7EIdRjqhWg1VNhgjM=;
	b=S2W5PZWuwg7W+nhR6zrlzXuAuo32Gl7Y4dAK6gTu4aCIsXCtTCXGbm19GMG5IGnVJBj9
	 JhvyAw1stQdmGwwmJjGuwoYwXim1s9qpGi7I3yy4zSDnk4rwrlyAVcMItmvIjOYDWTw2i
	 d/yqGpyCVuSbmPh3f3YNZPaM4MwcxVE4ouO2vyGx8HiIRHbFS09HqXXcHDe/15TbRb66O
	 VQF7D0VIV0IxBBBf7u+/VIE/oUkHPlQUiHAkuTv0BBB08VHFR0BrYQHZ4CMpagjITAl3O
	 TotYMZyY4wlgrrz9FRcoysjnfYpvyLVk0RAGuzlZin9rhhTp4Ysgc1AEY0RtHGu74Dw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631101;
	bh=MJvlB3H2rY2ztjHSYIjmyUYBrz7EIdRjqhWg1VNhgjM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ww/r8xuY5uM3No2DsK5D4wsrZzY+81eZ7cVjBcoivKJMvQsBqWTcdXBQV/8vp5TEP
	 /oDdnztyAoOnnFJxiYtRLcBbZV2sSaTx4D/EPxDInHsdDnVNa/U5GTYUlto+CI3IUQ
	 cqQVIyRBogxgy59uv00wuFlJBsfcTWtpTRBeuPkJeiFOoR4eRLq7aiR9OgpY9UGCV4
	 KQ3N+CGdBTGNxNlz9XXmQ3pOLHXQ5HFo8wxBu+bCV6GKps14ubfGnvoiarR+ST1nVz
	 UGsMyGFdj7kYgqaEghUVapFPG1B3nQeggRYCd1qYUa8nq5xrOWF50CfqF/vg0m/p6x
	 KVlAUlC++LXcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E013E80EDD;
	Thu, 17 Sep 2026 07:45:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8895A29
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A678407A1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDvXetILArLs for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E6A5E407A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631096;
 b=mXu+Mj7mucCgW1ffugE+1VH8xqRRjkCQHNsy72dcawTOxw23O7Y7NlMNyrlAydNGkYF2
 rMaBY2Pnrfx6SHwkJs7W/1X1fCYUGJ/nh7iz83nO4CDdWAmct8ia71e872PuojATPj06K
 5xeu9gOOvHs4DE8nMppNTe4sUwgoOgu979gjECcHocYfShyvapQWFdJ0SqqRhmmhSl7wK
 ry9FESCQT7HPyqpwvE2uNurILJwkZTeUGUQf3x4csUazPaPw/5QWmCL8KyjIDlJEFM1QZ
 b0CWzZCv42uKCchxLOgScsHck40TJbsC5IRckavCH+uCEE6Wx51Dl3PtVtR66XC+jCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631096;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KqEowenq+srB+80tl0B40cfU4JMivncKZYllxfTwD14=;
 b=md2+SPJnn+qr6aGts8zCCvYaqS8fLlAqmfBZOrq+0iQ9Qmvtx0/FDh690TzMYJ6i1wEd
 IkiS/AwMLf+B8zwfVi1irbcuxcQU1vRvaCL/hjZzJN2LHoAzdanX9Kjht4YlkMhhu3pcb
 OjcbtiLW3iXofUYq1jr1xkq0itEN7VDXGlcfTB83OW3iski1O/AG1aW7y5eKp/UiTLll8
 TTaagMWbx7SWbSmHevZhACUwYKwlGcCNSuHHyFUPO++AcZ+Y/AKJHuwOjjKwOPs6QG1pn
 AuJuNRNaCnDqSb6mPAlINsgCzkBAOrJWIbzEUCRXwEXOAFk0ntQWf2PZxjzaOyiM4jw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6A5E407A0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:44:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E0E296AE1; Thu, 17 Sep 2026 07:43:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:43:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e38f9b9f969754b15996829abc95868456e3ee8e
X-Git-Newrev: b1708d7055e0f9ee46b3223bf480dae07c58c915
X-Patchwork-Hint: ignore
Message-Id: <20260917074350.1E0E296AE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mg: bump to version 4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1708d7055e0f9ee46b3223bf480dae07c58c915
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Adds double-width UTF-8 rendering with Unicode 17 character widths,
a new line-wrap-mode, shift-PgUp/PgDn selection, and yaml, text,
git-commit, diff, conf and makefile modes with syntax highlighting.
Fixes shifted-key selection in VTE terminals built --without-curses
and several ~/.mg startup file bugs.

Release notes: https://github.com/troglobit/mg/releases/tag/v4.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mg/mg.hash | 2 +-
 package/mg/mg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 147809f719..85e5efa8db 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
 # From https://github.com/troglobit/mg/releases/tag/v4.0
-sha256  7040117fc8177b73038027fc59e62012c77842e4ef40ab07e57f7b69832446e2  mg-4.0.tar.gz
+sha256  6b33adb70d59d1449b40343be1162201576026242470dbf76985aefad5d4b0ee  mg-4.1.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index 0b5c14d8fc..49e90532f9 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 4.0
+MG_VERSION = 4.1
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
