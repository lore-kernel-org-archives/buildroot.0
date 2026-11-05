Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E1606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OU4EmRQc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE87D811E0;
	Thu,  5 Nov 2026 23:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKw9d7eUhpkl; Thu,  5 Nov 2026 23:50:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E472811DA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793922645;
	b=mMyc1pvfiuWO9IpQtHI3jb/5WZNzJ4DGR9bkD2beUVDM0vOuDuuBwK5pETuQxQncsOym
	 OPLSyw7SHvZerGRsOEC0TWfY0lWfRgHQV6J0sM28KiVZiS/5Lxr3mBD+DEAeiAZVy5OsI
	 zsZrm5LqqVMU4eS+hZbw1WvG6e5PrqnG216qesy2y7XuJhyJW9TNx3lgce6YNVhk+asOQ
	 JlHycxd1vwibNqmP5N+l0CqN2vJ7nnXbdDVz4LI770oHlO0Ddz7TiC1nE+WxM1q3enlZ9
	 B8VjmMD53AY/E5gSDYu+LRWRTni63zzDNyWfcB3qGzX5qnwilmifPm+z1g5/r1S3nsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793922645;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0f+hJOQs/nyhWhbinfczft131MF1Dtwo9sGzp4vEf4s=;
	b=QeUChd6MpJVzkGzB8peFvGqvpEVZFC9dI+XSzy+FfU9z28htY+qAnp0Adcm3iRF3jFCr
	 6V86dAwIHU69B0QvAbHHdb5op4IOKP3JnXCTVW7bwMOFqxi2yCeB/g24G6pgxEn+BL0O+
	 hRhxZg0M8Ls3Jz1G0LywK050icaLR0ZpbHXImnoR39sb0YZkjRbvfadVmhVwhW3fTY2NR
	 J2Vx/KrTY7A7II166ungHkucYAfZVydrC138O8K+H8GSJGCj3dwM3GfV/h3TM5/sS9dH7
	 9u3yNG8wu7fb8uWtnQ0HlCy8ylS4hWG9TJk5SW/24eDIOW0Fw4bw0HvbcKhxvgszYNg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793922645;
	bh=0f+hJOQs/nyhWhbinfczft131MF1Dtwo9sGzp4vEf4s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OU4EmRQcovZtVa7HkWp65dfepRzcOkmy7W/LU9zzuoOgGEWo1BJKF0VNTuROQUdVV
	 sux+UfF62O50p514zt6i/AVVTY5qZX/NE1hMM4lNgLdGafP0ZC+NHlg83VyU/1TurS
	 8YNitr1t8Yc0su7d/p009eF4XvvUQneEPQqkJy7kek81lXcgOFYHlkUyiy+1e/TydJ
	 D6U/S/77rT+4Bied89ITkoTnj02aE1/+gss69HJIFMhO3jf14uiKAoa4TXhfyrHbWz
	 k1OlAcqiTmt3B8W2xT7R9EiHYpZqUbnV37TNkCl85p6byeCOP0JLVJ8+Wf1ToAGJfG
	 xIsn6W146iPMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E472811DA;
	Thu,  5 Nov 2026 23:50:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE2A649B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F72F811D9
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZUWjYs542bz for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:50:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0EA8A811D8
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EA8A811D8
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:50:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ADA89CEFC; Thu,  5 Nov 2026 23:49:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 00:42:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8be4ea1bb3ab599d6f8ad4ff3da2e8659ee656bb
X-Git-Newrev: b21d9e744cd35dd5fd4e0cceb7918d05fcc4b705
X-Patchwork-Hint: ignore
Message-Id: <20261105234911.8ADA89CEFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Angelo Compagnucci for
 imagemagick
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b21d9e744cd35dd5fd4e0cceb7918d05fcc4b705
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f86c777c3..febf03773c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -236,6 +236,7 @@ F:	package/grep/
 F:	package/gtkiostream/
 F:	package/httpdate/
 F:	package/i2c-tools/
+F:	package/imagemagick/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
