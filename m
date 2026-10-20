Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEB2606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oszUB8f+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4DAB80DCE;
	Tue, 20 Oct 2026 09:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZ-lfrB1exiz; Tue, 20 Oct 2026 09:02:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C3DD88109A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792486944;
	b=DT4Z4FS5vqpIfR4T2W0yLsXB6oK375bwj7Jjauejuc9qwWARHkWlUjmRGJueFW7Ab1yW
	 V/r0Wwze109UnxFOAls5bDhUIzsgZZxsW00LeMqErMZGjil4UIASMLUGA0gygw32NitAG
	 FJedyl3QHIJ+qJ5OT4cHJYJg+2vEPIkaNa/arzrne7jUIo48YPcShqRXKluFGw+uNzTuu
	 rGIhf5HcjsIRPdlnB6HZMYC4onwY3PRpKB98jSgV8UlzgJco77G6fpsmZG4QYbbX1r+Rb
	 zAcU7zqXHY3ts4KMW3k9QoJrMYeHhqc6rQK9yPLxsOMBxpXzB1QVDAfNtape7XlWSSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792486944;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=B4LPV6pcjU99vTDA/49aiTYAAsFvTcZsADgC/5XzMQg=;
	b=An5EyTMPl6IL4JOxjIPGl1MmHWgR4UNdg0H83UpCD54MoT3NtAgI1dtdojsdYglqYUMq
	 7AtoTaKyGxLSEH6TlKE3GQF8FHqDSQCGdpL+a/h27OaD61Pi+LMpCsWl2Q7dOjB6fsBdF
	 YsIzpPsqGGWVB7zKDCNoGpTsKdo1RfXwdoe0F3L8eeuI67N/4RZ55XDzWEA6ptQyGZ1CT
	 SU7dcvlI8/pNe7rkx3OeQ0AClZkN1boTE0FF39zAxwLHxrVTR42otDiY3u1wwvxCm5N84
	 9t0fiQReQQdo3fuORgAl/pb2Sfli7+l3MoN0gmaUvu5UqLPebnJl17DO4Sdvyqa8aHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792486944;
	bh=B4LPV6pcjU99vTDA/49aiTYAAsFvTcZsADgC/5XzMQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oszUB8f+HjnNfYVnlcm/SooUwlrPTrJnDWWamCzf0P2RA+Zl/vKFgiX5r1T4l1j6j
	 eiQZCwN5QprI1u11yjQOlN9dW35K5wY3aiSn7iDbpz1UujS6SNNtnjepop0PJs+IuT
	 DGCy9ZuFwspAH2dKZRWI8EozT+CAsF62t/BWK/s7E3gP+7H1axa2mVrN67t2Y3Y228
	 0vZ0S1Uv2Puy9M3l9zaeTk/B8oZH0JeMxNZhSsxmItW0QY+IY9Q4gQN/oGfeaDYEAP
	 GZWR1j+9JttFYxLSqvOlK/oYtmUlxRGsX70SKJJS8GNuyy/L9fABg9ET9A+tpLDYIc
	 hdSAxK7KQ13jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3DD88109A;
	Tue, 20 Oct 2026 09:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D011DE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5249180DCE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoD6052FRPzv for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 09:02:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 945D78109A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792486942;
 b=oimNJP9MI8Chyt+AuHjyDTFoquSasFxEG/VzSJOtiNu/sxi/IMVPrVDK/rVymgSfd+BJ
 rzZdWN1PTqsaQoUK38UVFrrTanwP/r74NtMiGk9aXKjXLB8xzdZiR1znj4a3+WpLm9C7x
 xgDDeOMqnxAFpAqNhVeAyo1WJBGHdVAPE81k51Hx8qPX9zUhma5kEju7X/1JGt2sekEdK
 SJK/tSgUy/nIe+cYOs3yfLjet7dY3xk33eJpKGmCOyDtUCbV5iHsyP2RH8mDGDeTrtigL
 59+FEjl7FSrLIabV6iVLqs+E6sgMYA0kdLXianD6Ng3j3vc+SnlwxIlFixkTO2Ku40g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792486942;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p+pgArdaHBlMzOyHR4Aa0pZQN9ep2yGjjD116UkROdY=;
 b=evp3OBmDywVFwGhho+wuJHs0gwtBIdDDYV2kLutmlj8hTF3Bhg3YQBaMN5wqkZJ4AKEd
 G/JKR+CCpMwVLWjo6Legh+dBlTTAV55WBaMe+xbp9xrfcNIbaB7iTuDI001QQ8SviByZD
 Niix0lHmHPnwZHtByuwoAWpEfuvBCVz2IdwITejdZTbro+6R8rUvkA8s3bS/8jPyh9pa6
 81ByQIbyMc3CbaHiACEww1iB1ZgDna4pqj5OucGAnYa4j2om5JRVyS9G9CHQJTqv7Mukq
 +iC8dfiSvX0xjtgu0SizUX/W1EUhWLW7oqfM8kYjXviKBe9gbguNXJ5Il2lsJgKPKFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 945D78109A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:02:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80E65996C3; Tue, 20 Oct 2026 09:00:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 11:01:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97179e17d4e777720bbcabdc6aa0f355ed9443ae
X-Git-Newrev: 8a6f6aff73437174ce21d2f8026cbebdb1c8b992
X-Patchwork-Hint: ignore
Message-Id: <20261020090059.80E65996C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf3: fix build with LibreSSL
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
Content-Type: multipart/mixed; boundary="===============5645896831172998361=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5645896831172998361==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a6f6aff73437174ce21d2f8026cbebdb1c8b992
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============5645896831172998361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5645896831172998361==--
