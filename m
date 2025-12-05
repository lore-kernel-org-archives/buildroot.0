Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E7D374AD
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7FF260833;
	Fri,  5 Dec 2025 21:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IT9Df2j_IhAq; Fri,  5 Dec 2025 21:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCF4560717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764971000;
	bh=2LUnRXFPICQ8mEBThQ3YrEwQQCIU6Hqdf7K5nqbatQs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rXcuXqg8pY0+iHEfPwiQs60nCZfvoCLLsb3lRphyhm3SDzdz7xyu8FZBaI9+HjCj5
	 T5CN3YvPVxSkW2gn1k+2wyIYc56/9ZwD3P28fTGH40+FJrmBtW8xPbW2icr6mUIn2w
	 VX0gaBv7QNIKF8aV1ZWfPj/hbmYkN8tMTGC4fLJGHxlOxwTFVfQ9APdWmaS2M47GwD
	 cqi1je11Fy73Q8Qb0nPyS/OTng2w1epYPL32rHaz+bR+1UwBkiTVexU+w4AH8yO/yS
	 1VAdz01KoxBW+n+0OFByMjvuIftPQYn4IZDe2QHbhdKqqn3j6KvMYZUJEt8CFzqV0v
	 KSttjVenv/zeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCF4560717;
	Fri,  5 Dec 2025 21:43:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 844AF258
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B66680D2E
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZX6vcU8o4OtT for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B682B80D1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B682B80D1D
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A715A86625; Fri,  5 Dec 2025 21:43:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 21:56:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: df4a87e6e6b733536df0ae15aaa83ba00e0a364a
X-Git-Newrev: 959a94c2ded2b8ec605fa135ede8b8f5fcec84b0
X-Patchwork-Hint: ignore
Message-Id: <20251205214318.A715A86625@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/xilinx: add optee_os
 hash for xlnx_rebase_v4.5.0_2025.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=959a94c2ded2b8ec605fa135ede8b8f5fcec84b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for optee_os xlnx_rebase_v4.5.0_2025.2 release tag for Xilinx
devices.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/xilinx/patches/optee-os/optee-os.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/xilinx/patches/optee-os/optee-os.hash b/board/xilinx/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..69bca84314
--- /dev/null
+++ b/board/xilinx/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3b8969a25815a0be84f34033827e5eb557e10f0f13ebabaee339461f8520ec72  xlnx_rebase_v4.5.0_2025.2.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
