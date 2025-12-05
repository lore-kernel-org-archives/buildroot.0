Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49270D4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 084B18417A;
	Fri, 12 Dec 2025 07:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJHBkJl_Oa3c; Fri, 12 Dec 2025 07:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FF683FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526277;
	bh=avmPTdTunPNhe2VpNL1z37E6QAtc0SyMKLVVih9nkCc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iVBALUDdUJqHl0+ejrjaMtBlVEZA9PQCBtqNjHKpDK0AO8ue4aMgdoD2qdcvSRVK3
	 RvWdSz7Q2Nc6j/SW/0iQmIDbNuuZ7xYFOCqaGXi64QO0Ea3yl1DFgFDvcF9KkP/pto
	 aiWTl2IP4zVZDZt+5Q2jmWF7yp2rlm1GLFDPY8GxtrFrEdTfsC8yPeUBjbdYLiJwwS
	 tT+zkBm3+GZkwBWkKzKJiat9/ckQP1yZVnlcJWKyy4ppV5fH5HfDE926l31Q2YXt8t
	 TfTzPJu8sLLLJB+H4zRVUDdXOD3KHC89V+TiB9gWXN9Tds8ncxe/81DjQYs9yY3B23
	 xjargaJDNMNRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FF683FA9;
	Fri, 12 Dec 2025 07:57:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D71BE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3C641169
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_jjSS_wOKSC for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20DCB41073
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20DCB41073
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2016581674; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 21:56:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df4a87e6e6b733536df0ae15aaa83ba00e0a364a
X-Git-Newrev: 959a94c2ded2b8ec605fa135ede8b8f5fcec84b0
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.2016581674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: add optee_os hash for
 xlnx_rebase_v4.5.0_2025.2
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
