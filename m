Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F5606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 01:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mpC6KyFR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA09580F71;
	Tue, 10 Nov 2026 01:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQqPEZ43ucZw; Tue, 10 Nov 2026 01:31:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCE5580F92
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794274262;
	b=dmqiHxj7cZXzrVOHT8QaPWGJ3EvL1zlNl3Vu5Y7N4ptV3MLiq/4qvZzsWREsNHcoNk/G
	 IsM19ckqVZOkIk+wlvYy4pN1LWsOryUUXCeLbe5vdLDCq2afHDympO6h3OBbliU2DN3UA
	 FJcu6kNAjqzj/LS4j3/8nVn7ZPe4ocT7XYAAYC8pmcWRnDxZJY/Bor6RAafbypZ8TAVd2
	 Bc9naxqxGunx1QCmFhdMAPWR/NOOo9ZODQdS+INOOnNXth5Q88legnvDwdlzEwIJtHC83
	 H9S+nre4I61MEt4RY3MGOjzbTghyTaHrBvmqblPkO5GllQQf+JxWbJ4WNfwWAevGlRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794274262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9SBEtppT8ctRYAhf2Q+y32tuPxkq9aditNNJFUwqkGA=;
	b=DwLAbsRbkFbxBgdCEC2c3j2txfvRCjCBORHIHkM314+v2kXIEN4bJWXmMToGkspBUnoh
	 h2U5NSrUcnvr/NOibLk2InGVCRf6770rdbsPrsFmn3upTwh/7ksWZU0pUBEeCLG6NLiHq
	 RvxLhiQKhR2ZLb/dHahgexEoiP0gJlXcA6/6tZzFwyz/084KF2mV8OiS3P+6XlPvnAKIV
	 Dkwk/kkWBg6UPo/eq+kkNbNx6H8kr6QGMRqIvU7I2HeJvqbMlnLH6F0GNnOVS92L7jRDD
	 nRFR1TplFaOeunWopZpomppTlD90PgfovS9qpQTSyTCiNBpWTudnJ+1rBc79NNx+OFQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794274262;
	bh=9SBEtppT8ctRYAhf2Q+y32tuPxkq9aditNNJFUwqkGA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mpC6KyFR5LSPNNzfbAmhsj0XR3hWM0LUPjZUF9AOSaQqYpCuS/kgFA8qYxkpAFPZJ
	 WGw2bah45ZmBssC4SxI+N+d3LqGN7idOxS+ipPRDrxq8CbVUBwcAT+t8WFdVcpMZix
	 tli9a+yi2UddJnc5IWJgv7zJT/ZLPw5FoWI4mgNrGbLddPzUIR2bX0/4tvt3fH+f6u
	 v///c4k1UeDP+XvDc8HmwgsnNSpczJSFb2Y6zrN4cKbCN5MuhvRZ3WhkejdAPpXKTM
	 d0Nz2XconaSRYiNj/ZskjHGTmBQxw4b3WSb43lLgVQAOHhXq8ThqK8EPS+8Asnh9Jx
	 q1d2bG6suBXGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE5580F92;
	Tue, 10 Nov 2026 01:31:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D49D5D7
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 01:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B867680F28
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 01:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_EbYKJ5NWUO for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 01:31:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FAE080F71
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FAE080F71
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 01:31:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7EEA8CAA0; Tue, 10 Nov 2026 01:29:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Nov 2026 02:29:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f753f0980f5952cd57f51081ad09573aa5640aa7
X-Git-Newrev: c2f93a8076b27880754d827f2b5801f19de801fc
X-Patchwork-Hint: ignore
Message-Id: <20261110012926.D7EEA8CAA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zstd: disable optional compression
 libraries for host build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2f93a8076b27880754d827f2b5801f19de801fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-zstd auto-detects system zlib, liblzma and liblz4. Updating the
build host's LZ4 to 1.11.0 breaks compilation due to the removed
contentChecksum_t alias, even with an unchanged Buildroot tree.

Disable these unused codecs to avoid undeclared host dependencies.

Proposed fix in zstd: https://github.com/meta/zstd/issues/4897

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Marcus: add context to upstream link]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/zstd/zstd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index c5a19c76f3..b0fbf3a1a5 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -114,7 +114,12 @@ define ZSTD_INSTALL_TARGET_CMDS
 	$(ZSTD_INSTALL_PZSTD)
 endef
 
-HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
+# Disable auto-detection of optional compression libraries.
+HOST_ZSTD_OPTS += \
+	PREFIX=$(HOST_DIR) \
+	HAVE_ZLIB=0 \
+	HAVE_LZMA=0 \
+	HAVE_LZ4=0
 HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)
 
 # We are a ccache dependency, so we can't use ccache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
