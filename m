Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C9B606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HRzoPDLj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D2281217;
	Fri,  6 Nov 2026 15:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeyoV7nPlr22; Fri,  6 Nov 2026 15:58:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B5D5B8119E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980731;
	b=HJzkmbX2GA1j7yxzcQQg2X5Vrt/J3YTmfjKJGFTV7jCH7DHGtP/N1Pd4wRZE8M72HSa/
	 mdjp4DEaC0lmNgVSflfjW3nZ4u+zOllI6SPKU4L/nT2WMrnGsmQsmis5Q/9vPoEvDYZPA
	 sfTHEJf55IP/OolEFYj9fJRYqMo/lqPhJi9djRsZcsev5TdjyCOUU2v2u3RRSEIUXnfdQ
	 GwnPNeu2j50xs3q/tfmeQPEwnqSLCCrnjAv08bAUYcSXfp2vGjJDcVRqea4N6buvE2WnB
	 xyitj5FybdQgsZWYIXDaTmgXLZjhwIV4JbOeprHtuyBO8ZR7GdbNTWav0Ktg33FWT/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980731;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gGX76XqidbDpkpZrNiTwdhp+SgXyU44GEq0oCwKGf8I=;
	b=OwoZuubGMuO5m6U888RQVWiiGPFOJbKfkOd0dIFFvzKWLhUMh47UM7nq3mHb0tqAMX0H
	 57ByT1Lb2Qz2xKuIHZ50+UUx04TRQ+jCwEmQlGAEbUfJPZNa2LX5U/xCv6VsQZLQP7xmR
	 EaY3p8QcUWHWK55ZbH9MLQq1IWIbITNTI0AbwMx+eB6YcNzi/HxNdO1+7xhSZxqUwTTlc
	 wjn+4osAG2BroWN7H8v1nC0E1PGZdovFGqGB42xX1PEu9qdjzp+9ZfkMFc6+QfqusPTP5
	 Pe6Ldoy0ACM7QtPl6Pmu8unfzkBFZ61urrNZAOyZMbB48X18BqjbECseZNcSdLqzYEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980731;
	bh=gGX76XqidbDpkpZrNiTwdhp+SgXyU44GEq0oCwKGf8I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HRzoPDLjxpmFzYzyW8ouvGAICMx0IENByG4fZIJExc04xVcpfHYZ7mWlOnYJlgeVZ
	 rt370TF8K7N8tIuWMHgQ/fwxx/lsoHU4w4dsS386Lmo9yd80lYHxrkfEPNOuFQuJkD
	 Y4CFxb27ksgzyC63ZO3Othh1/uf2E98X7Vu72Naj47T2Xa6PYAcI17cjLce3C15tOa
	 W7MANVeAmVoxQpQRWd7Vwvv+Co8xoWkk2+8n6MSNDOazHyeNpZN+ufUx3WejT8V7UN
	 2ETd/YvHtaZJwNA/VWJs68Zg+pOYB6fhpZQXycz5p0IvqXzYeTQ7aNTScGmBGoEoYN
	 RlVGrjDkiwe4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D5B8119E;
	Fri,  6 Nov 2026 15:58:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF93E7AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1765400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id En6WVWJVdMyQ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 76437403D9
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76437403D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADD6E9E09B; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:25 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6f03f11d1e19c2f433494f0b563ee9954b1a7314
X-Git-Newrev: 20f4955e1b93ccdc5114b2e70dc7123e6f8cadfd
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.ADD6E9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] .mailmap: create a
 mapping for Markus Mayer original BRCM email address
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
Content-Type: multipart/mixed; boundary="===============6534504877307280009=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6534504877307280009==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20f4955e1b93ccdc5114b2e70dc7123e6f8cadfd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Map my classic Broadcom email address from older commits to the new
standard format. (The old address now bounces.)

With the mapping, Git will show the new email address in the "Author"
field of old commits, unless --no-mailmap is given. Signed-off and other
footers do not change.

Using .mailmap is a first for Buildroot, however it was introduced into
the Linux kernel in back 2007 (see [1]) and is a standard Git feature.
See gitmailmap manual [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e0ab1ec9fcd3799e874ff9086729a480f6c06cd3
[2] https://git-scm.com/docs/gitmailmap

Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
[Julien: reword commit title, add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 57e1b04f39fe1ae50efda34e74df9ec93f2c59f9)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
new file mode 100644
index 0000000000..bda50ce6c6
--- /dev/null
+++ b/.mailmap
@@ -0,0 +1 @@
+Markus Mayer <markus.mayer@broadcom.com> <mmayer@broadcom.com>

--===============6534504877307280009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6534504877307280009==--
