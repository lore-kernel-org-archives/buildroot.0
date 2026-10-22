Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8DA606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UlmGYALV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139E940889;
	Thu, 22 Oct 2026 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvubLacuwgIg; Thu, 22 Oct 2026 21:05:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 19B4B40959
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703151;
	b=ROkqB9utxziD29Rjrt105A3DCrMInncTVaK7Xce18z5SUoGUuv7B1g9NxCdl3IXwJmgL
	 Ecc4Z95tqoq+3abstu5PaDag4LXI562571j/SoX1w36mdBUBCJOIsrVM5oujdihqoNSEF
	 zk71CpfRUBJGUQoepJh6OGczLdWOH3TXIi3JEtJU3J2oUgo/kbZIBXCNl/t7aHjMKQYtB
	 cM8YVdNlDxhSPZM2meAJoRiW/Od/PZdYFLrWCXCxhfwQrsBhq9vDWHwuQGxCEiLXtJxD1
	 IbOon//BPTTjAe+kX15gOnZijUs2wdpxebY2ClzuZ5pg/SR2l0uQveCf2mNVFuL0reQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZtQHiXd89cVs9EFYxG1HzhcPMpr+iuJJnA3Lf8EvLYQ=;
	b=tPaFvtd0rcKnzqm1FKXmrZ9mWQnMDfqM28BMy1QdF9BUV+hrGL3n5/WhW6sDH6QEDRTr
	 6Al7SO1fjuApx+3loQpuxFd31+M1QiKZeSXo3adY1g2aNMy3bFK7A/0n44mdQr7xmu9G9
	 +cY+38aKCZxZ9MuPvPXG92Vhhi21c8sxBuoLRtIbRs9hS9cWNEYh4bIBPFCuTVvTtdxKD
	 kwKjPfFie1y0IxGqoF3W8wz3RRYEnw5iLkpGI31UXwaLJ43EkPQ209EiFBvkLEjbNG8RV
	 oaR48X0DuXA5niIcE5V3mJclraqZOajtkGjWBmryw2iptGgDE/0QgF0qwTp5Jeo79/g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703151;
	bh=ZtQHiXd89cVs9EFYxG1HzhcPMpr+iuJJnA3Lf8EvLYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UlmGYALVvEHZiolmvnJqa9++fI+tAel2nMxJpgKmIZsbLdUlDHui24OjaYvtVrABA
	 eegVCUbMvZV0x4gyvnGKqM5MMAI+QCLb6DbvEoZezoIFhkbDG+Gw6nAoFOTNbbk0GF
	 QYcYOr83FBUERDCJWCMoib6N60UpvX6KVIhdV2IYChTV6llu2L3e7Hz7zp8JFB/bS3
	 1eya7ikAOi6C6wK1Az/A2mk6TNRn3BzL8xOl4QkQQvWffecr2fpwPPVHMQRrKDlTTZ
	 lbpny9zjFyS3Va/Sbgvx4AzW+JuT7bAHsfyrOzkiD992EYp8kgnNblFL1QPHVEJL4p
	 2+pZt427O160Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B4B40959;
	Thu, 22 Oct 2026 21:05:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2CB91C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB6B38122A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUYCoZazjrBv for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 32BAE81255
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703147;
 b=Wz0C/3C7JNdMJhKkCfEVpRrJKeLjqQH1drBTY3SE4jE/eyHsMJn8YHJZhqEv+8tazWXh
 2+eoJh8PpSIbwsb9v2ibZDK5xL0JrgE+/DyfrdVQGzm6/qn6TTP+fKlV2ZsJEgO2jv3iH
 3mnEuprhnntQEFZsPAEbjh0Fzn3E5sKfvFPVcalNNwRZOvJ0m+6rsqYDdPVsMYNTv+xkB
 wOawumuCp5m4VC+JvynfJ+pL5h81iDyNMNxjulsgNuE4mtX/sY38rMqidz/GZkMtozELL
 y9XyBu31U5Gtcxdw7ew+uNL1q4D4bZHKjOFPXYJdMQl08e6yqnsK6p3YMyfE54kK+7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703147;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8CDuhAopcfpHUQ6ro1MgPa97vHCc+l7YeWYVVL0Uh4w=;
 b=oE7toeuZh67H5ibLjEjALNdrWDvO31/wy9SioTWIRRqeplRt46Y0rxK5e2H94Xlj6WUM
 AQs2IMzcVtrdGq+8/wEroHcrFeQrPvTKGs9YedeHv/dyqQ7QyTUftE8SCdc+9+7nfmsUa
 ATqrWx3qh57SM7lwNnGHWplgaQBu/DWnxROTrrpfJ/u4Cu9IivQDZk37SD7/KyEqyen4g
 iuhxBDx94oCgrhjAF75AIdegOMqfkWGpZhcCOrY4jYGuISXg8u8lwEMGcXdyWPXgttmGN
 l83fSnb/rXUJA99pBTyEOI+yri98Q/TCstC6E+p8qv347JiQWRQ8A9TT+lFBLbsP4RA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32BAE81255
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEF999BD01; Thu, 22 Oct 2026 21:04:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:05:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86a9a153451071dfcf462a666d55850fa3ea2d2a
X-Git-Newrev: 10ad7d4cc104ff2ef197ff26bf046f6c376c2e3f
X-Patchwork-Hint: ignore
Message-Id: <20261022210422.EEF999BD01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: build with nftables only
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10ad7d4cc104ff2ef197ff26bf046f6c376c2e3f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The kernel configuration fixups enable nftables support, but do not
enable the additional kernel options needed by legacy iptables. The
package also does not select the iptables userspace tools.

Build with ts_omit_iptables so tailscaled uses its native nftables
backend instead of potentially selecting iptables based on which
tools happen to be installed. The nftables backend communicates
directly with the kernel through Netlink and needs no external
firewall tools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tailscale/tailscale.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 950f9786ca..8ac2ae41da 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -11,6 +11,7 @@ TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
 TAILSCALE_CPE_ID_VENDOR = tailscale
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
+TAILSCALE_TAGS = ts_omit_iptables
 TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
