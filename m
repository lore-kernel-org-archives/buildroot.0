Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FAA606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l2wwY5LR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD295607D5;
	Thu,  5 Nov 2026 07:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXiN23j0z3Ku; Thu,  5 Nov 2026 07:29:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA87A60778
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793863754;
	b=CmjFi1Gjn2TSRT6IdldgPmsO0+RIqE+fzG+MLr/05BWG88/65Hd90HXZFsFsAj7wi7M0
	 n3Dl9cHwQ1zIrUPvj2YVd4sHaQJOn0XOL8XKO8quUSGkkf1/tAoH9xskThpYMYYYQDpRL
	 Dk6l/2TfZPCsVE5wUiUKGdEKe1okGRr63k8VzWx6ETG6wFQ2HENLupvcOE9YS5dHCnLNI
	 jZ9EZGF0EvL9AzUVHeYW3ThSUj12tWQpQpjtdCCvoJn7AamxzxK3B/eM0HwT7BL+/y5nq
	 hkcHbGZkvl/Jx6nI4qVKM7Rco/O5fQmsAcYpATWHLolMxr+dICf/YqFwAlULESqhg8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793863754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+wB/KgyXPmaNlJesMW2c9Ni31zu/Oq0ZQstt3j4hkYE=;
	b=PXhmTnKSUzGDGSBZyQyELHkQDrDyyioeInld/nsNRmwpV0a0GJVJCFa8EdoVKCfjMqRk
	 z66/K2nH3bH0QbNpTJbXmqEjMm8X3hYQ/gsiL+8vJ9HXwmmR7fvbUw9AbeD/A/Yz8YwC7
	 eJ8fWyH6z6TpaGv52kW/v+Jf/vs3VHlLE/4ft1JpXhTTPAqZ4UTmBAP2eCF/gkbeFzwPG
	 p8hYt7WV4I/PXjgKdzshRUJRAYj4GelMXbphNaJ9+jjo9TaesJy6sZ6vlbyf+ZHnE0Neb
	 63pPc/Siqz6BQfndjrx7Oa/LRjDoIoPT7rw2IOAGJOsFiNV3OROiUqLynFyeMuc2NFg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793863754;
	bh=+wB/KgyXPmaNlJesMW2c9Ni31zu/Oq0ZQstt3j4hkYE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l2wwY5LRaG2ppZoFDhuWu1Og1fcU/0Uv/LGcwJgYLtr23UwjuLXfm6WpCG9HowmXT
	 F7HVYihRBlxBzwuxckeRQgf7eebEh5M5kZnQG0nQZyUmkFpwf/FnXOftiqrfriV6NZ
	 FeVFRypkU4LPAOmUEYFwgwy7ydLajqzaeuhB68Wgsh7Ctag+aG5ELYADZjJ3NGy116
	 233M06OQFdvRqJwvTHwPwGo8Pa+fWglQD7nTujCozyJn+y7R1HmtgX43Wrn9w48v+7
	 XOoW04jW+5hVFeiSWxmBx31vAKexgbcbb1h9lrNhcYYIX97oPmBUZ5b9++qzsV3Qdr
	 TNSBtDtZb0C9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA87A60778;
	Thu,  5 Nov 2026 07:29:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9072B362
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81D52810C3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjesHoihGiaz for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:29:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBEE180BDB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBEE180BDB
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5A989DFA9; Thu,  5 Nov 2026 07:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 08:25:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 683f63f3bd3d4cc88d8262a3fd8f135e290deb83
X-Git-Newrev: 6cc6d7c83f5198edb47efc0d93f1a57d74d5406f
X-Patchwork-Hint: ignore
Message-Id: <20261105072741.B5A989DFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-update-modules: add banner
 module
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6cc6d7c83f5198edb47efc0d93f1a57d74d5406f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in                | 12 ++++++++++++
 package/mender-update-modules/mender-update-modules.mk |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 0c00ce2933..01439b30a4 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -16,6 +16,18 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES
 
 if BR2_PACKAGE_MENDER_UPDATE_MODULES
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER
+	bool "banner"
+	help
+	  The Banner Update Module manages the system's message of
+	  the day (MOTD) displayed when users log in via SSH or
+	  console. It uses metadata-driven updates to change the
+	  banner text without requiring any file payload, supports
+	  rollback functionality, and operates without requiring
+	  system reboots.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/banner
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU
 	bool "DFU"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index c0b69de7e6..f3ea0e15cd 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -12,6 +12,10 @@ MENDER_UPDATE_MODULES_DEPENDENCIES = host-mender-artifact mender
 
 MENDER_UPDATE_MODULES_MODULES = script
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER),y)
+MENDER_UPDATE_MODULES_MODULES += banner
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
 MENDER_UPDATE_MODULES_MODULES += dfu
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
