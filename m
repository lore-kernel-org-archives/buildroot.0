Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CBD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A7840B49;
	Tue, 13 Jan 2026 19:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1-GK-Hx2wO1; Tue, 13 Jan 2026 19:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A7340B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333254;
	bh=QBDalg8xDvkc5j3jVMEqg4eXNGfW8udSdxc9uJ+hfY8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AzYkxtxkWY6hNoFPLt59zngvAkT0RPka3RhWviErWfynx9DuwXuQJtHes6bpHvUyo
	 kNIpdaygLcqKb0xymigT9LeFNLhRiuTFYFDlioueq/0/hR2HpH6/G1alxg/P00K5p4
	 +J6iyO/wJWBygd04CVXwjRq+2ALVeCc8fIvWTNQMmzgNBAP8IyR9282NT4rhVcHFGB
	 pb18m/h5P0Z3NfhKeAvX+hJ3ZEMFXoDeOWFwcl4nzEa1ayvUmS8OEf1BTzVqEtqRt5
	 mWcCmI5TKTdvF0cGSj/BOhftuQo4rumbHNEWoTaDfiO6rRmQxXDlJHFIT/tZcPYxwU
	 JeavEBfZtWXog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31A7340B4D;
	Tue, 13 Jan 2026 19:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DC81C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A40E829DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sev1g1LRMmM for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9BD82A0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE9BD82A0E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCB0686E70; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:09:04 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: aecb01fa11cd926f4a016238cb368537897bc5b7
X-Git-Newrev: b91b6ff646b99b8d1d521efbfc2d59bbb26ae3f0
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.BCB0686E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libupnp: disable
 blocking-tcp
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b91b6ff646b99b8d1d521efbfc2d59bbb26ae3f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Suggested by Gerbera:
https://github.com/gerbera/gerbera/commit/fcf31472239705e7d28af81cbe326f8f416f7f7d

CMake Warning at CMakeLists.txt:583 (message):
  !! It is strongly recommended to build libupnp with --disable-blocking-tcp-connections !!
  Without this option non-responsive control points can cause libupnp to hang.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 48c1e7cc6da96b12c8c8eb59c49cb917b0ae1a43)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libupnp/libupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index cd148d14d0..b81f68306a 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -17,6 +17,7 @@ LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
 LIBUPNP_CONF_OPTS += \
+	--disable-blocking-tcp-connections \
 	--disable-samples \
 	--enable-reuseaddr
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
