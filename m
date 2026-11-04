Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6BB606A339
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YuggFpc3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88A380A76;
	Wed,  4 Nov 2026 17:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCxZFD3kHNad; Wed,  4 Nov 2026 17:23:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0F54809E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793813024;
	b=ei1PhvOnVqslpyTWbHL2CJiQTxfLyiC+U5dyy4I3X0EOqEaBfKx8yWJeEcu3dpY8RooE
	 tr2ooZp2bQbZpYVm2NlK52KYezu7c4Jnyy651Gx4krHbIogH6vDdiFhJObOZefKO/6SSf
	 g74nW8l0BmgUBAlXAu66BkMfGQ7Mr4hvrP6YKZfo27T5yCGt5VGMSS1p9BvK7F0/UDKu6
	 yjLg6i9UaQu1SVEbQ6HZzZ/cLNG6o1jSZ8/AI8TRa0cddBWMy9iz2utqzJ9P2QRrZEgIE
	 ms7U0KElCy3Krb66UtrhXUi6mDxrIquiF/QICUniVym06Vprhkwf8ha4C7va9Gy7zJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793813024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dnOmb/neWBRs+RN4G0/0695W61MRdQ4RZUiRCYIZUNo=;
	b=TQlsDLsHfA5zDLFZzko61q2/mzqpnicT8N5D3X/hBZHY9RyiDGRtf6ct1t9aIGmTb/J3
	 tEWtCaxebUYzCY3jFcxYjazAMUdzLn6lCadz1J1IwZ/ltCAiZuR5fEME/SjjvvxRHjaF2
	 RqCI6yCY1YLYartw8HoyHEa7wyML1CiHJa3mFj7juwlfAtzwwleyf6k9PgjL1nyivFo/M
	 L5/Jp4lGsic1ev7pEsOsJRVBxlmaC5RsobzvLLmubxy8EGVMLxU/Cl5u3dicgfsoW+DkA
	 GU/IM+VIHWQuSgGNBiGV4Vl5kXzi9yduYRT76KbhvH2j7F0Qp+jgenZFASzTjBJJoxg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793813024;
	bh=dnOmb/neWBRs+RN4G0/0695W61MRdQ4RZUiRCYIZUNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YuggFpc3YU1mfwAORx60d3Uxh2CHSyWSGYgrBfFLCiThNgE8z0j886pn3KdaQeQ7y
	 qKxnhTBP9D96sLF+38ATAvKotnYR8oKodDBfokAOzeXjZcR0HTzchOzoSX/hHK9KcO
	 hDO1ccbGVIogJcxy3Q04gizqv4ZMmExuWXVfiTdL113UDKqookSyVEV1pyrb5SetVh
	 K85TfRc4dectsXvCLdvk34EMx5asJ9IttXQwYLFmbwXlyJus4JoO/53Vg3qX0Br9++
	 jLMEnsbN1jNXYHIIMFGtXR6WwQbsLqJwbJmbwzKoAh+ZIJnFTOZfvsmf+dUZWbSKQ+
	 B/okDmbPWEKog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F54809E7;
	Wed,  4 Nov 2026 17:23:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F26CEA10
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89C8404C0
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_6hv9CAq0SH for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 291D4404A2
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 291D4404A2
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:23:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61FB39DCF7; Wed,  4 Nov 2026 17:22:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:22:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4ee05b3dd5c79855f5a23e5a26ab130129de2d3
X-Git-Newrev: aa696984dee031f5d0d3286ba4dea2f2d2108259
X-Patchwork-Hint: ignore
Message-Id: <20261104172210.61FB39DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfribidi: security bump version
 to 1.0.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa696984dee031f5d0d3286ba4dea2f2d2108259
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/fribidi/fribidi/releases/tag/v1.0.18

This release contains "Security and robustness fixes".

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libfribidi/libfribidi.hash | 4 ++--
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 38acd814d0..cca8bb2da5 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,4 +1,4 @@
-# From https://github.com/fribidi/fribidi/releases/tag/v1.0.17
-sha256  6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2  fribidi-1.0.17.tar.xz
+# From https://github.com/fribidi/fribidi/releases/tag/v1.0.18
+sha256  1de5e8073d035388b71d0b2d452b1da1f8caeea8a7702997b401fe1b6250727f  fribidi-1.0.18.tar.xz
 # Locally computed
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 1a275c5fcf..7a64b2ffd7 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.17
+LIBFRIBIDI_VERSION = 1.0.18
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
