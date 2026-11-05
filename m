Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F747606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VXe/JQXU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D428B407F5;
	Thu,  5 Nov 2026 07:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VICLlBE1xFc3; Thu,  5 Nov 2026 07:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8936A4080A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793863757;
	b=FGqJgfOQcGILKbXzN8vVCjZb30rGP8w5IIv1AGHIhydj/sDnyaS5cU/FWyQxPwbMb0si
	 0D/F90WcWdDnabHlfEToYvmlfxn+5iGjwO1gkP5aeY2XUVXd78QTEZ0ysEuFtlXz8xmXR
	 i7hMNrW4B4nlTgHp9h/JkWtahxoRie5cnMSULxuysb3zea0i/3a+X3ujEJMw6TdIU3LBM
	 5SYukENFcJ8zxQcYWyCrfYSbrsxnL2WlrD7/6JKgccJQmE7HI4PdynqsZZSQcn16oyvLO
	 JpzKcou0gpWmRplAipHEUHJo0Dtqv3vTHvt+7l08O33kacoPjnfeuXVpxCB7FOGz6lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793863757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=91dnl3YzMCAuclhmY1yKEqYtybgTcrmZT4torwLfzpQ=;
	b=VhkehCY4RozZm3NNzSoCO8YFA4eg0E7kWbNfO2Sv2/Djlj7N9HlOK1oOjzZVr4nVYL+t
	 568WsziRHEaUkR82ER6/Hy2Az0sp/fA4bV8R4VTsDoLGLKP+HGWxzUSYe39NamA7RtSNc
	 vmHQHTyje7ZPfh2diLdi3b15Q2rakt+Rew863U4gomWiimmKxTpKi6a1e1N/TVdm5aBfr
	 DpQqjQmrejaLvK1LMqO+6PvtsClaAdF+vt9Vj9Qa+rJhO/APu9qrnGeAJIenRPpcThLKY
	 qeEE4h7w8wIiS8x8bs/VCbAiDoFGGtNQrEfwevp6cPTfq/IFjGz2qrG22f92pxKGctA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793863757;
	bh=91dnl3YzMCAuclhmY1yKEqYtybgTcrmZT4torwLfzpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VXe/JQXUCMGmLSn2k3sZTNHwRp5toD/yb9zgREs1gCU8ZrsJ7oTA9RYgNThJRXwPq
	 n1NZtGw7jbxnEgo0q70iy84gKuODJnRFvVI9CyTMlGjL/A8qVrofNc8jp3FW+7ttfc
	 xCu7lZRU7arbiiOjoUdfFWQw+qQ2gn+NcLGWOfcpWjrNRxzgNqV5fJnQfBfyl9YKrf
	 i/6yLXUDtzu+HayLsLsQVaM/xtrzTryOV8qSDJMyIVSKzKq2BGDN1VnBrylrcegOYk
	 VMSQekfsCjpqMd3SNRBm1x0Qn7QMcH8cpcgsHBfTBAAXSOQ702QJ6ZD9yEjU9vsJkj
	 6t/8TxrhIA4eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8936A4080A;
	Thu,  5 Nov 2026 07:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B714C362
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AAC9407FE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyJP-8ee3-Ji for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F2857407F5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2857407F5
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1B489DFB5; Thu,  5 Nov 2026 07:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 08:26:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 797fe39f04009c6e753b661a44b20d8357afb7b6
X-Git-Newrev: 2b3ab90e22cdcac548ce6b49aa989ecaeef89faa
X-Patchwork-Hint: ignore
Message-Id: <20261105072741.D1B489DFB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender/x86_64: add a udev rule to
 create /dev/root
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b3ab90e22cdcac548ce6b49aa989ecaeef89faa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As /dev/root does not appear automatically, add a rule to
create /dev/root. Without this rule, even running a simple command
such as `mender -version` outputs the following warning:

```
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
```

Note: This rule is only guaranteed to work properly with the
mender_x86_64_efi_defconfig example configuration.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
new file mode 100644
index 0000000000..7d2ae8cb89
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="block", ACTION=="add|change", PROGRAM="/bin/grep -q root=/dev/%k /proc/cmdline", SYMLINK+="root"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
