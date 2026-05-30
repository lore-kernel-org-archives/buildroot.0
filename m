Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3798CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65BF853FA;
	Sat, 30 May 2026 17:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkRxplkTKcWd; Sat, 30 May 2026 17:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03161853EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780163287;
	bh=4uaCxOPOqDknaEdtBIqLIWM+AabY+P016buXoGrAjcU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nUPVVkfIkBh9cnDLWaR6ly13RLdLfKJ2NQiXzb13KTIasI7tGNN/FzrHwjyPJLqYI
	 E9mOXUSGYhzLMG3pznm9WhlrXN3/GKO4rjxnmBnkEGsrWJ11ZFdxKilLKChAMHWj42
	 AuQpVrAQOhNLD0udLIfz8EGbyILhXjk3NhZDvjsYeZct256l7OHyWU7keZxDM+4YSm
	 A0mHvyfTJavfO0Mz/JCIgNRY2DJNXP5uW2C0sIBuNJVP05DaFMQ08ypEM9o1hVGfub
	 e2HX8U7oh9ViK4jBs6faJz7MrNPx3MzXB4Eeznm1qOHAl75fAjcYyOC/S1W7fRU6ev
	 tQ+6ccis/KAGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03161853EE;
	Sat, 30 May 2026 17:48:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7D56D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0040360F2F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbHb91ZV_eZ6 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DFD060749
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DFD060749
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CC7987538; Sat, 30 May 2026 17:47:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:44:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d1abbae02ed573ebd29b3c0984bb9a8f04232ff3
X-Git-Newrev: e6e989615286e317992bfab7de878c3ae7069443
X-Patchwork-Hint: ignore
Message-Id: <20260530174749.2CC7987538@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Shubham
 Chakraborty for font-awesome
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e6e989615286e317992bfab7de878c3ae7069443
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b474c96324..95fa87d448 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3056,6 +3056,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/dos2unix/
+F:	package/font-awesome/
 F:	package/hyperfine/
 F:	package/libenca/
 F:	package/pv/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
