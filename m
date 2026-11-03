Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C622606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=odfTdzIG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650B3608BE;
	Fri,  6 Nov 2026 15:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksrItbYoc6pQ; Fri,  6 Nov 2026 15:58:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B676608AA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980719;
	b=EswKsOI+x28kXYfrHHS18Tco9L6RrTV2sxOuWmUygDs+hCjF9rfgVN5sOaqLNSIDeb/d
	 hIaE7EufRnt02BhsCzB9k0GTqGBWrabG26AmaNHzVY02iuq5L7HKFCMylk4dzAfDnseX9
	 B/W/apZJFT8WrbCI4W5/PycyS1/VbHUu3k1eVkXvAgX1Sg1twZDBoJAM1itWWeWEAfF5r
	 9T5vvlNZy71wMEGRWYr1GSv0oKDOvM5fnh7G91pS+HNHez4qL60TEbpaLD8Dp+XECnX/3
	 L0WKvDjSi3iW7XAzyPtc1/D8oAV5c8YsU/hAvv7I0OrpoDXZYfnbp/6KnQcLytd+ioQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980719;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=GrxxeU0uzPXiU9dVORoeJxg9q3+WOyEJ51ssruLsi5o=;
	b=Mq1KoaOFDxVBGJyWfewbPCQ6ZQs201dbJ1fpX9DG1vHlTO7CqnurJDR1JCgcqLJyy8My
	 ASw5GGsnj37q4j9cLVGTsxI5q/qqBdb0PtmGHzY7pVYLPtTOMYZ/77zurxtFtqqloqGmV
	 geDTiZsIoZ8wl7ZyljFbtSLy1KzrYWho9oKYZ1xuFWB+XPHHbfJrWt1C4x1WcAW7NUHlH
	 DIrHzCyJGPquHQDeuOlSKTVu6aDcu5Vo5xRQyfDBQNxAKk8wD4mqzmmSxWaAJ4vpEOzkL
	 s91Lw9yqpvFW7TtcL5jZbJqSBkYdGRflYpJ0MvD3PxvUimFcFC2eFza2XRtvSLSnHdg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980719;
	bh=GrxxeU0uzPXiU9dVORoeJxg9q3+WOyEJ51ssruLsi5o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=odfTdzIGA0pK3HVtQuZADOMXezkTV9WRlcHP/KLLOmYEYvcHcBsrxbPhoDcAsmeX5
	 l42qq72S7hh98F5GtzC5LUmb3OicALrKLDT4Sa0GEEZGNH15dDJDpkGm1BgXFkJowT
	 /ICAnXJ+d11BxYw36WlhRI/Kyjg2MQsp1x7WKCNt7s4/MD7/APT2wlPfxbnHejYYEF
	 t6g9oLRKVwQ/YRglrXm6N6UNSE9TDXZmT0Wg+Vu5U0+lC8M4/8UmTOc37SytI1cAn/
	 guTpPAT+7JmND57zAcK+KNxwd1MZWSflMQHCMNjKWNebeaGPFYtLnb/ETb2ACPNv/r
	 0VmlvDrIu+4pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B676608AA;
	Fri,  6 Nov 2026 15:58:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B91A14
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C7F8102F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQEYULDZPTsT for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1263680FAF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1263680FAF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D5BD9E0AC; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Nov 2026 11:18:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 88a52501e0c9fd82a148ef1faa11b7d09291c1b7
X-Git-Newrev: 6dd37e1af95538ef6f587f7464446c148b09f1ba
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.3D5BD9E0AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: fix build
 with LibreSSL
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
Content-Type: multipart/mixed; boundary="===============7214217492348236475=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7214217492348236475==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6dd37e1af95538ef6f587f7464446c148b09f1ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

iperf3 3.22 added a new "goto errreturn" to decrypt_rsa_message(), on
a code path that is common to all OpenSSL versions, but the
errreturn label is only defined when OPENSSL_VERSION_MAJOR >= 3.
LibreSSL does not define OPENSSL_VERSION_MAJOR, so the build fails
with:

iperf_auth.c: In function 'decrypt_rsa_message':
iperf_auth.c:343:9: error: label 'errreturn' used but not defined
  343 |         goto errreturn;   /* or: return 0; — never read more than output_buffer_len bytes */
      |         ^~~~

Backport the upstream commit that defines the label unconditionally.

This issue has been present since commit cb129a641b40 ("package/iperf3:
security bump version to 3.22"), as the broken code first appeared in
iperf 3.22. That commit is not part of any release nor of any
maintenance branch yet, so only master is affected, but this fix
should go along with the 3.22 bump if it gets backported.

Fixes:
https://autobuild.buildroot.org/results/6ed8f60f56f7fcd11eaa1ba160837275b8113e1a

Fixes: cb129a641b403cfc4c1b2ea9280b966e19837b62 ("package/iperf3: security bump version to 3.22")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8a6f6aff73437174ce21d2f8026cbebdb1c8b992)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ove-OpenSSL-version-check-in-iperf_auth.c.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/iperf3/0001-Remove-OpenSSL-version-check-in-iperf_auth.c.patch b/package/iperf3/0001-Remove-OpenSSL-version-check-in-iperf_auth.c.patch
new file mode 100644
index 0000000000..45b581e5a7
--- /dev/null
+++ b/package/iperf3/0001-Remove-OpenSSL-version-check-in-iperf_auth.c.patch
@@ -0,0 +1,29 @@
+From 96208f2e413d7fddc19e6888be5fbd2acdb04606 Mon Sep 17 00:00:00 2001
+From: Peter G <55786000+WatcherOfTheSkies@users.noreply.github.com>
+Date: Wed, 30 Sep 2026 12:27:43 +0100
+Subject: [PATCH] Remove OpenSSL version check in iperf_auth.c
+
+Removed conditional compilation for OpenSSL version check.
+
+Upstream: https://github.com/esnet/iperf/commit/96208f2e413d7fddc19e6888be5fbd2acdb04606
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/iperf_auth.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 51d1a1b6e..cf0bd7449 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -380,11 +380,9 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+ 
+     return plaintext_len;
+ 
+-#if OPENSSL_VERSION_MAJOR >= 3
+   errreturn:
+     fprintf(stderr, "%s\n", ERR_error_string(ERR_get_error(), NULL));
+     return 0;
+-#endif
+ }
+ 
+ int encode_auth_setting(const char *username, const char *password, EVP_PKEY *public_key, char **authtoken, int use_pkcs1_padding){

--===============7214217492348236475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7214217492348236475==--
