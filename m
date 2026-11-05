Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815E606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ljL70ykm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95E1060833;
	Thu,  5 Nov 2026 07:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmZ8RUg4tb2v; Thu,  5 Nov 2026 07:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D1B56078E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793863759;
	b=jIJyuDMH/CqyiYxDbKHJwjRaL+Qh692MKkBP8fSwuxSnSRNZU2+2upnQeyXUHQw3fiG8
	 vHQL0SJXVJzt07wiiSwMT0TFkhkPxUQB6oGy1Pk16SXz7M1h9TDY28VeZCO2n8EkzAvXG
	 lh2DLnXHYwr65qA4cOuH/QkKAZGzgSY1N9Tk3mMbez2buYCP2fCZIYi8OccJtRgAOztEi
	 UpBndClWh4dq0RUB7U3lK4V2h7S/EjhFAcUK3QswR0HVGQ3slA1LIdwly5SX/ZPAZVNeH
	 18vLn2SP3rAp8ONbHVmhOCA0GC9iP+RTCWazD/lh7D024J8EDwEOs6CX9R8M/GJhmJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793863759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g/4SSJg6tp49zh03uIahxdCRwTf0wPTaEpNn46bg5CU=;
	b=I5rcpcY7SaMxGcBF4msAocQkUI5eE3fWVo4SU71H2h/P+lekDPRCiQ+Flmwx09p7gCN/
	 /auzwyLPFtcZCap+E46hc5nLsloe6eHFmcilZTlDNjRdi69bSwYDCHuXNP0hdoMH7Vz3n
	 UBXWMKEp91OrA90ePvpBYfQ3XA66QnTO++TrperPnMNRtcEldyUImw/zudwGTmZ+pNsTw
	 8h70BhtqIGXQs1HmBmc1adiOyXTDGF6nYHAJAjiFbmTzwdEiZmepMfSuseI1FLh+uKNOS
	 AJ0nzLLfGDRfECkL9uY0smHH5e8apXab9d9QG0PNY5Oz6Ly7g4CCe0BLrGiOKgdgqpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793863759;
	bh=g/4SSJg6tp49zh03uIahxdCRwTf0wPTaEpNn46bg5CU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ljL70ykm76T6dQMUzWTpCPeRffdPzInncVq63BbP55eKHXMk6O0Y/nOsODK1rpFFj
	 yqE97jPB2wDV/lX/tT69oD3yYgDilAfyDvPI540rd6JTVxXl8E0dI2ytnGMYfB7ORb
	 S7lhlSM7uJG+ABTOXdnZhpjRQ0VT2LFJrbbAOFvt08zcMl0qEXzcb4ffZTGAIAaCN6
	 1N6CK1JFhzCvZfDVRdEMKE0nSKXIhtlkyqbeXhhVfst667YHFoqMPuzrJdCD9UXFGv
	 yHDBc+Oly79yVNF57kw2z8+SBTzMm7V9OQd0gitgoT2us2ej1Xf25S3X817GBZrYxx
	 so0plySAPzgwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1B56078E;
	Thu,  5 Nov 2026 07:29:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C09B2177B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2A9E80BDB
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZDspL4DaIzr for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A92981036
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A92981036
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E229A9DF70; Thu,  5 Nov 2026 07:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 08:26:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b3ab90e22cdcac548ce6b49aa989ecaeef89faa
X-Git-Newrev: 59349bdd0ffca2b5ccf289e6a4e0d36622c7ba6a
X-Patchwork-Hint: ignore
Message-Id: <20261105072741.E229A9DF70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] test_mender/post-build.sh: use
 /etc/mender/device_type
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59349bdd0ffca2b5ccf289e6a4e0d36622c7ba6a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

To keep parity with board/mender/x86_64/overlay/etc/mender/mender.conf,
change /var/lib/mender/device_type to /etc/mender/device_type and
add a /etc/mender/mender.conf file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_mender/post-build.sh       |  3 +--
 .../package/test_mender/rootfs-overlay/etc/mender/mender.conf | 11 +++++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index db075628e0..f27b0f9417 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -21,8 +21,7 @@ generate_mender_bootstrap_artifact() {
 function mender_fixup() {
   rm -rf "${TARGET_DIR}"/var/lib/mender
   mkdir -p "${TARGET_DIR}"/var/lib/mender
-  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
-
+  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/etc/mender/device_type
 }
 
 mender_fixup
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
new file mode 100644
index 0000000000..5f423fb2cb
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
@@ -0,0 +1,11 @@
+{
+  "InventoryPollIntervalSeconds": 1800,
+  "UpdatePollIntervalSeconds": 1800,
+  "RetryPollIntervalSeconds": 300,
+  "RootfsPartA": "/dev/vda2",
+  "RootfsPartB": "/dev/vda3",
+  "ServerCertificate": "/etc/mender/server.crt",
+  "ServerURL": "https://docker.mender.io",
+  "TenantToken": "dummy",
+  "DeviceTypeFile": "/etc/mender/device_type"
+}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
