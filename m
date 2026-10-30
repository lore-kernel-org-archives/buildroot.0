Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B02B606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WIpAixJj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66EBB4061D;
	Fri, 30 Oct 2026 14:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsCrzUZ0pQCY; Fri, 30 Oct 2026 14:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6AB7D40C56
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369314;
	b=ctHpqNB83LmrTm5eMPQCpqsBolqnqtpRwfKu0JQ8eC27Kx5DN6BCMjE8Li4NZbDpnJ7D
	 YmF9qVC7j5I++PfpQXErnq0vbfJIdTBTBYq2WSmfZtcW6ktfDniTPvY862zrbfaoNqe4+
	 H9e9wVFfqpJF8bz1wb2R15S7Mtj10MpzSK7VipYbAWW92kh9EdiQdkZ+eaD/MGfX9BB96
	 wadkiog17WYxVf8249CBUWDvewgKcVM2EuD05kAlWC/fSQVsL3HelyP7c66Q34OtNEAEN
	 fZl2p8Ejk+rOpq6DPhgojDcDgrsUiKwjUOv0Vpq+IwZXo33SDOu1m0oA6zQDEUyYDww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/wnUu8ZSlm4PZPC5xTh6/OsPm5J9HmQZfD43HQZqavM=;
	b=Us7Le9implnS4SLA8L9F/df+tNJC8ivjLWQKas2dvAS4UXQHIQnV7DacYglq4u6Oj1WR
	 cFrZqvqj0mQ6G75Xvh/K57u7PrpN1JYOieOK4MLVtNrLND1UKNiIliDV9Bh75xQlOa2DW
	 6ExmMU1vDjUAQch6N+ezpg1YT73ArQSCDe3s2mBRYvLT6YMXLENZ/EcZKz6Xq67jsExgX
	 DVws/qkSL2fks6xWi0o8XUeQIv53ZHLjPEGP9MNkHznrComqAgvoNKjdJtJBTaqvXz1cX
	 TRl4H+S07MJ3q4RdHYV7VzHjbFSYo7MsAWp4UgC2Hd7GGrFUwE36RWspqIAAn/9UDPQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369314;
	bh=/wnUu8ZSlm4PZPC5xTh6/OsPm5J9HmQZfD43HQZqavM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WIpAixJjS/n+mctOYhxi8u59Cq1ym9gbEM8VQ4PQyAjBl/7gD5JULpD3lPkHIimAH
	 exi1EGhlZOD2lzB15Ycl0YM/tYpWr/IYhCkNZPm5n/Bi5C3w2h3YtygCgUNR5spU8h
	 QoCLTzlHErZgMHS6ZI7Mw9tqnJwNkREF6ixL3sobIdfuP9kWDzSo+iqzQyvdzVdAsp
	 /qK6b+ppcS+DfCIf5pyqiamm/5Z5lcdwlYKHr8+4P8uFeFdyu3cZIiFZLLHwzeSxdj
	 Amb1peix+ygkiMlAFwOTl+6NLLEAxlGMEGcrkOa3ieyDNrsf1LlCEbnb7pr/DYmM0P
	 phhE1qwZ0k7Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB7D40C56;
	Fri, 30 Oct 2026 14:08:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CCF5362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A3CB40B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnL7Zlsf21yu for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5667040B2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=fEzX2GyrljfNH5LyBUCibc9fRIYM5gGwpFvOEzZ6p6wDoslukiZJKExxZD5mwyhQypYK
 Upn2drBAtNbx89anRm46jupMte1lcidEYK3d2PnZYQguIra7IB+SeW9TQzi4nIF1yBnWZ
 h2kh7BvO8MQGDULoafYz75E9ifJUakOj07ccO3qBjE3r6p5yOTRh7DQneTAyXsb2A4v/W
 S9m5wotbi84S5FAUdOjQHO+isPO3zHR7Zgwcb5s+1pKkz2eTXFJrTf9zJSo9mG8eX3m76
 GyICxzSDXD8AVGwcO2OlMGdSpkR8iuKfF8sB7yb0gUw06plKIt2uYEae12dlOF50suA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4zWbxDLMPI+fZeZAJBATAoFp38jFVj0biT40UDh9jak=;
 b=a2/bEdKguGRjodQyWyrOVYlna/8xfvI4coLQjwffenXd4CjnovcEcNB5NLSsQ2ATK+OG
 Aw4v02nwruXQwwAKP1EAd+Sfp2XjXZ6a53CKY9C6UxIdOKWM4XAuT4PkZ341T2lz31Hkc
 BUkNJg4vfWiC/okFAfmgMnM8gU0fSiA9BDRZyfq8mY+YZ6wXIDJAYwN7KBVv2aY4IKKHX
 8An9vbkequ3y7WbVvdpzNqJvwLF+r6NxXroi2MJWxxzxo4ZlTXw+WM4bVC0xt9R+6nLhO
 a2R3ozdCJxBQgUcLbZyYBAwcTNf5OQIpRdV1kEapwZHt9qcYlsNV7ys8ea2rrrTwoZg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5667040B2C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F219D388; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 09:28:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3a36492ccd7638793ff21928764474706f283f29
X-Git-Newrev: ab849408e33a335d7636b799232ad0c81e2a2f52
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.75F219D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fluidsynth:
 upstream patch for CVE-2026-58264
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2144989906233661582=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2144989906233661582==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab849408e33a335d7636b799232ad0c81e2a2f52
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This patch fixes the following vulnerability:

- CVE-2026-58264:
    FluidSynth is a software synthesizer based on the SoundFont 2
    specifications. From 1.1.2 until 2.5.6, the FluidSynth command handler
    accepts a pitch_bend_range command whose channel argument is not
    bounds checked before the supplied value is written through the
    selected synth channel. An out-of-range channel can therefore cause an
    out-of-bounds heap write, leading to denial of service or possible
    code execution. The issue is remotely reachable when the TCP server is
    enabled through new_fluid_server() or fluidsynth -s, and it is locally
    reachable through malicious commands delivered to the FluidSynth shell
    on standard input. Applications that do not use the shell, command
    handler, or TCP server are not affected. This issue is fixed in
    version 2.5.6.
    https://www.cve.org/CVERecord?id=CVE-2026-58264

This vulnerability has been fixed on the master branch by the following
package bump [1].

[1] 566bdcb97f package/fluidsynth: security bump to version 2.5.7

(alternative to commit 566bdcb97f5706aa08f40a88e4728e4a0bed8257)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/fluidsynth/0002-CVE-2026-58264.patch | 26 ++++++++++++++++++++++++++
 package/fluidsynth/fluidsynth.mk             |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/package/fluidsynth/0002-CVE-2026-58264.patch b/package/fluidsynth/0002-CVE-2026-58264.patch
new file mode 100644
index 0000000000..753ca02e36
--- /dev/null
+++ b/package/fluidsynth/0002-CVE-2026-58264.patch
@@ -0,0 +1,26 @@
+From 762a3bd39a431cd45abf3bbcce7286c87909d087 Mon Sep 17 00:00:00 2001
+From: derselbst <tom.mbrt@googlemail.com>
+Date: Fri, 19 Jun 2026 20:11:54 +0200
+Subject: [PATCH] Fix a heap-based buffer overrun in pitch_bend_range command
+
+Upstream: https://github.com/FluidSynth/fluidsynth/commit/762a3bd39a431cd45abf3bbcce7286c87909d087
+CVE: CVE-2026-58264
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/bindings/fluid_cmd.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/bindings/fluid_cmd.c b/src/bindings/fluid_cmd.c
+index 19cb78216..76723a2ba 100644
+--- a/src/bindings/fluid_cmd.c
++++ b/src/bindings/fluid_cmd.c
+@@ -795,8 +795,7 @@ fluid_handle_pitch_bend_range(void *data, int ac, char **av, fluid_ostream_t out
+ 
+     channum = atoi(av[0]);
+     value = atoi(av[1]);
+-    fluid_channel_set_pitch_wheel_sensitivity(handler->synth->channel[channum], value);
+-    return FLUID_OK;
++    return fluid_synth_pitch_wheel_sens(handler->synth, channum, value);
+ }
+ 
+ int
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index bde3f416a7..747aa5c1eb 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -15,6 +15,9 @@ FLUIDSYNTH_DEPENDENCIES = libglib2
 # 0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
 FLUIDSYNTH_IGNORE_CVES += CVE-2025-56225
 
+# 0002-CVE-2026-58264.patch
+FLUIDSYNTH_IGNORE_CVES += CVE-2026-58264
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-alsa=1
 FLUIDSYNTH_DEPENDENCIES += alsa-lib

--===============2144989906233661582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2144989906233661582==--
