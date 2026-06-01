Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4937CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859AD606A2;
	Mon,  1 Jun 2026 19:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddaVz7RlYqnH; Mon,  1 Jun 2026 19:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B5060690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780341284;
	bh=P1eUvKl/dk9Q/rTckahAPWWsWNYKIlQ3cfCkRdSvGOo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h/FthbiJBnMEbzwXR2AqxXDGdBM4gOFIvc4zfa729byd6kQkqBES/lQrxIirWXYwy
	 xCsA6XDlq9V6Qs0azjrIsLBgOJhVsT/Jv7rHmTqwfhvHBbN+pVa4BVaOmjCdLbyMrz
	 1F1DU9N9ftHfiUP/ycWE32AsXEqxNo06+rNO4yedqY04tB6q4dO9NOH1/NfaPmHGEl
	 t5LzcX6pj7Hm4I6ioNGo5NW3kcwuMaLpr6gxM3+GRF4JjV1exuKmsXSUBNcIpmwETz
	 Z+8/EhCH4irnS7xJXKGLov+fU9Jk1m5Vh2/2NMAwZzBNwE1OxzAT1pWx9aB84Qf0Zh
	 tlGgTjoHo/Xbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B5060690;
	Mon,  1 Jun 2026 19:14:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE82D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74FB5409A5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGEOWIL0iMws for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AF74094B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99AF74094B
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:14:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B8F28780C; Mon,  1 Jun 2026 19:14:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 21:14:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2df4f1d573685234cc59361cde6c624885056c79
X-Git-Newrev: 79431203c3951aaeea145d06760fe3426309fc05
X-Patchwork-Hint: ignore
Message-Id: <20260601191427.8B8F28780C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: update upstream URL of
 patch 0001
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79431203c3951aaeea145d06760fe3426309fc05
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 49a4dc97456b9b777c25acb0cc3d1fdaacf9859d added a patch
from the master branch which was now cherry-picked to the 2.43 branch.
Update the upstream URL accordingly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
index 5b7172df44..ae832a6035 100644
--- a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
+++ b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
@@ -12,7 +12,7 @@ years ago, the rest last November).
 
 Reviewed-by: Florian Weimer <fweimer@redhat.com>
 
-Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=243bdfec8f7cd4a85a8ce6e4e9a5a5accd3ce1aa
+Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=18b97b03b7442d8ba0860e43145f8724c9e77b17
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
