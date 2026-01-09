Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A3ED26D9D
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 21:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A776983B51;
	Fri,  9 Jan 2026 21:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlFja4uDNec0; Fri,  9 Jan 2026 21:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D78E583B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767994313;
	bh=YIgTxQg0nSTImmNhgFOEhwgjvHBas0uxJ4LzogyOkbg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T+sT/G47L475zmT/mS3bVc+ZFr/X7gv7KwrL23ZAZhR6/3vtObHi6azWblwL49aeO
	 ApCsqrY21VmcD127ANVl3BjObiL5G99EuTvLb6HBf2qp71HG58tUZzg+dQhJ+Vm98i
	 jtE3exGyj1VVFyzuNE81SBgYnhqsvnd18wOMIJFW92KF5iTzcHwj1xA3CR9oEyfQjH
	 NomapAHOsxT1zbAWnKjsDOlUnlt4tvai84aiZS+cmy8j+RuvYz4XwaSxeipMTf/z+a
	 nbQiZ8vlVh+2Dh79wzdwLc6kQ7sCytARokJNUN5aQ28Hp1JWjSWWqK0jUinMd/T2cz
	 wXEiU2O4e9i/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D78E583B81;
	Fri,  9 Jan 2026 21:31:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E7CF12E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1561540CC5
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FdfYohDANvu for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 21:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 578C640CB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 578C640CB3
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:31:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 416CD883CE; Fri,  9 Jan 2026 21:31:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 22:22:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e25cf276fedcb600efdce8f3472f9ff40c0d3c9d
X-Git-Newrev: 555114a0ecae0a62a4d4a5de9327eeaa0543eb53
X-Patchwork-Hint: ignore
Message-Id: <20260109213151.416CD883CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitcoin: broken on m68k
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
Content-Type: multipart/mixed; boundary="===============6849624468204510312=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6849624468204510312==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=555114a0ecae0a62a4d4a5de9327eeaa0543eb53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit a3a88ff1c85ba0067af1028bc232f8f61b628979 bumped bitcoin
to version 26.0 which includes upstream commit
https://github.com/bitcoin/bitcoin/commit/b8401c3281978beed6198b2f9782b6a8dd35cbd7
causing an assertion on m68k:

/home/thomas/autobuild/instance-7/output-1/build/bitcoin-30.0/src/support/allocators/pool.h:92:36:
 error: static assertion failed: Units of size ELEM_SIZE_ALIGN need to
 be able to store a ListNode
   92 |     static_assert(sizeof(ListNode) <= ELEM_ALIGN_BYTES, "Units
      |                   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
 of size ELEM_SIZE_ALIGN need to be able to store a ListNode");

/home/thomas/autobuild/instance-7/output-1/build/bitcoin-30.0/src/support/allocators/pool.h:92:36:
 note: the comparison reduces to '(4 <= 2)'

To fix the problem we disable bitcoin on m68k.

Fixes:
30.0: https://autobuild.buildroot.net/results/268/2688e4a2aa8dc34343f0218fd6727d0ae3adb132/
26.0: https://autobuild.buildroot.net/results/fb0/fb05401c7de289e0f87f5c9e3a7f92f5589b590b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bitcoin/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 3240462f56..eedb0897a5 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -6,6 +6,10 @@ config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	# support. BR2_TOOLCHAIN_HAS_ATOMIC does not provide a
 	# size-level granularity to express this dependency.
 	depends on !(BR2_arm || BR2_armeb) || BR2_USE_MMU
+	# error: static assertion failed: Units of size ELEM_SIZE_ALIGN
+	# need to be able to store a ListNode
+	# note: the comparison reduces to ‘(4 <= 2)’
+	depends on !BR2_m68k
 
 config BR2_PACKAGE_BITCOIN
 	bool "bitcoin"

--===============6849624468204510312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6849624468204510312==--
