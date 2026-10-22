Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B2E606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HuRCr/Hu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A519481469;
	Fri, 23 Oct 2026 12:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDkHOfd-YDGU; Fri, 23 Oct 2026 12:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A4223815DC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758762;
	b=CGw+KENa6SpEl1p3kM0zck8UPw/OBygX1dXwneu81A+tXBkDmlRA2dILzj4kYkFRdEhf
	 5kCfOHF3xGMPMPSXPW8NQMyQl1vVEF4XHlNOsWnIhDF+brX+8MxGVD7IAtH7rYJaBf2Tm
	 LlbXhxLzs/WeeIJFibJiBfCFKlSjNHx5J6NMttYrL8M97ZUKkf+bkK9ikhk8fBwFhsfNh
	 lWu5XDvxkEYj3J/gf1nyg+7EnRo1PkCtByx1XxsF80XrnL1ShUzvJ1d0jZMeJfI92J1q6
	 KkKQniGpBbEtMUwgVwTRAlZWSq2EuRKYIJWnzFwNYdbfphxEsmG+MNp7COPf0LEeKdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XuAZo9guBITSCtAodOVQ7EO1uW0gVW0jRaGlfxY4eBc=;
	b=iXw8ImNpS7iRR/uspd+dauGiZ6Y510wewT5NIQG5l4KSw5oLoCuTre1L8HA3HpDtl7/t
	 JbFNkmzLLaUy6Q/KqBNkJMCk78Fw3GYPCweEoHZtQyVzFeSmJkZP5G6mPfUPprPALb8SU
	 8rpeKaO6Ep3NtLkM6h2fZkLdKBCt/iAqK15qYOgvQBCLCnp+bjfBTB4PMFxHywQLDb7gp
	 Ad+rJiowvdP4Q6qGkeUCOQzvbCMRVdeT3Om6RziSSq5bHcpTnmeoqwBXfazpKsBNrPhbP
	 GaX/OYvE/hdgYVpj41FbiVJgJoZePhB45dVwJyeuTVNG8kzLn+X7KVTr9Cm22Wt8LTA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758762;
	bh=XuAZo9guBITSCtAodOVQ7EO1uW0gVW0jRaGlfxY4eBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HuRCr/HuKJ5WX4ibPy6YdwOvfTh7nmbiMKv2gtxtcAgXPK5yBE783bHYkwhpC0utz
	 2wa4CyLWHexMmCW5Bk4QO9AEPPGsxrfZhaiMnSE4vrPDumq30z/JP0kJJnXeVB8VBS
	 njxgqZocuLLsvOW1UODUAo2ZVOsyTvEQU376gtevlGWMj1AahKbeTNpp1Vh0tDhfFA
	 gR7zd+6FMenmVaLZDskOpn2gV7MgYhqGP3a8PsrqCrEBlSmkMWYff3lhgSUq3Vlg7P
	 qjLVeHTj+fN+N+qVrARdpUok79VrKyb0HZV540Vv6Zs8EPw6RCepgeBbrbhf2KKPiy
	 Kuc4mCD5Bn80A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4223815DC;
	Fri, 23 Oct 2026 12:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8867412C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F37040956
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z4k4YegcN6C for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CFD8540934
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758727;
 b=if+akFimqzs81L3W+tws9/Lq3ZbJqV2slZRUrBsIrNE76v98OkA23oi2raxOcWl1h81r
 oLXuJ0zfjGwUhdat6PhvxN3p2aDa5c64ZOGN1ndfaeEpxknvmHG5AztA8O/yR8X9cOpov
 cEF0/ky8v3rARSg6gx0c8YeBWJLNgy78lnWGmfRnH0gpwoJjNiZKhoD1BYe+3VStYXyO3
 hWqg+P/uZhHeQoabPu8xbK8b59A8F2s7w02Q/s3ew4E1/8pBfKUKwm/hMWNef1EMpk1+j
 a2E0KCgAy5XiVdlZdhSCq71UaJydrs20xg4bwIuhjA115FA3mV0rE/GEcsMSDYKbFmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9fP/ri4T9XFjqRtECG7AytIgLeXMZKzWZAo5eqYZJOU=;
 b=Ca3txpM6GX5nYhsXlpp1F+s2ibNFEHuCA8y2gMPuj3NokfSu8i3lsiaHpK8FBKKf6btg
 B33iNmuvhuO6nZGgSOv0rIT79tNJ5yVQveEyXtp7GogBjj+zoV3fUkCMfmS8P/piACHUp
 7josGT1xtmhBkY185nzUBlIYWS9VHO69jKhG0bug+CdocbCaVlZLUeNf+5Ixb6vqM/K+t
 kul6e2XAyEXkyu/e9m5iuEqPSJrRqBnFYTwXU9O5EmQGcGjubLFSAqzOefNZSIS6mtalv
 74wiVSM69Ek+Z1mjN4TmWAm/+qOtiwCzMCaJR37k+/XYQaX+LEl7w9IE4dvIWZsiFAw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFD8540934
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56E419C66A; Fri, 23 Oct 2026 12:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2e919a4cb688e2b36c1033978476c47daa2d1bcb
X-Git-Newrev: b100bc0a91aa656846e839a688f457ea7467f6f7
X-Patchwork-Hint: ignore
Message-Id: <20261023123043.56E419C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 support/testing/tests/package/test_uboot_tools.py: fix typos
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1000655204712325076=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,T_PDS_OTHER_BAD_TLD
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1000655204712325076==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b100bc0a91aa656846e839a688f457ea7467f6f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5b61def5b3b15b85f93a4d9c17474e003c4f64f7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/tests/package/test_uboot_tools.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 8cff6fda21..13f77c3379 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -96,7 +96,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
         keydir = Path(self.builddir) / "keys"
         keydir.mkdir(exist_ok=True)
 
-        # We generate a prublic/private key pair to sign the image.
+        # We generate a public/private key pair to sign the image.
         cmd = [
             "host/bin/openssl", "req", "-batch", "-new", "-x509", "-nodes",
             "-newkey", "rsa:2048", "-keyout", str(keydir / "dev.key"),
@@ -150,7 +150,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
         ]
         infra.run_cmd_on_host(self.builddir, cmd)
 
-        # We check again the siganute, and expect a failure.
+        # We check again the signature, and expect a failure.
         cmd = [
             "host/bin/fit_check_sign", "-f", "signed.fit",
             "-k", "test-key.dtb",

--===============1000655204712325076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1000655204712325076==--
