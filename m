Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317CBCD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1230685A9D;
	Tue,  9 Jun 2026 13:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbUDDH2uitB2; Tue,  9 Jun 2026 13:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B3D285ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010227;
	bh=sRFKUa/JIQ9tCN1t5/DkehEDUJnoig87FweZShIlJ0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FeXbAuWLfIvysgBXqe82QyVq6o5PpHNCr0YeTkYGvTwXP9eoX+q4xHKAR/jjG/Umu
	 As6M4OBjocnOBGWd0QVrjEfGcpVtV1qrQ3jn3Gx5H9LQin4frul6wQFgTQ0vbB01yv
	 RKHIF4MfEjWOqRVtDJhZ45OV6isQBYL8tT1KK4eTaooQ95I0Z5AcGxHfx8JeRu4r0Y
	 rueeMNb8LLBxuuJlWg7vMc7qFAcaUU2ntG7DPVHKjX5F0qARB1R1V+d17gjERAtKh1
	 s6yRwlTIq8eP58TOaCqoWQxSqcVmUwWfFnrvkzWrWMaTmpzQ78O0l6jdZeq5Z0XgUb
	 YRxtoxtNcPipA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B3D285ABA;
	Tue,  9 Jun 2026 13:03:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 204C0196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE04C45F1D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcRXKQ0ba7tJ for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0745411B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0745411B2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2808687E7E; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:52:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce1394ee0ed07c2d06223dc5b1bbf73482316896
X-Git-Newrev: abcaada9fd31abf697253d37e645485cd220cadb
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.2808687E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Shubham Chakraborty for
 libenca
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/abcaada9fd31abf697253d37e645485cd220cadb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 28fe821a6a..0d67faa0e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3053,6 +3053,7 @@ N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/dos2unix/
 F:	package/hyperfine/
+F:	package/libenca/
 F:	package/pv/
 
 N:	Simon Dawson <spdawson@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
