Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7BB606A32C
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B1w/viBi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6479A606BE;
	Mon,  2 Nov 2026 21:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhSbJlFTr6XB; Mon,  2 Nov 2026 21:03:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 55F8C605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793653435;
	b=pWCaH3dqcl4qb+l444JQepwa5NxU+zq/lIo7SLXSXkoLOBYTco0y0/XIBEywH+D/l/1Z
	 4DDPecSxu3IW+jQ8ETltgwbDl5LfmpfShYTxyeHsiUMoyTZp3I4yvF1th1H/8dKNXR3hf
	 gT5beCNEvHlV8NE9ElV345Uehsz1dRzJFYrBURWq5JgpS9M+pRVC9OdW49z1C0Ym+qW26
	 RJK7V0sG0XqgRCLnzmyn7Tn+ZVK7ID9cPq1T7LPquTFDoV65FTNVskiwUCSlRVB3PIl9q
	 PiZeef4X625AQ8OwFxAglzDP5iY5plJKyJcEMbzZ2oiX0pZF6vmPvpzvt4tGEV1fN7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793653435;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Rz/RFb/boJilF6+xGYZwH7ujWVN3y6QkgDWbPnxhCAg=;
	b=hlF6NkduI/RiPYY/8cZrfiq3cHV37V8C20qlNidKZ9gj4VstGcnAZ1BfN+c0vSWP0+6R
	 ycdKcHai+NCq6fZt1jpbFXkhDtlPkQ0JxbQHMiuJ5QlpT9ORONtDwQo/FYfk+t3pjyhsh
	 cgTCGzC2McGgYGTBS/v8ZKOGPK4bMpOkqT63tJuERM3ymGDcvQEb1BTn9RHOzr9yRy3va
	 b9eCnmZLqjRP3ESIJyYlvH1AJ0vaxKHe9LI33ZTBk3ncfTBTx9A/XiioebP/CWO1ddf9Y
	 AiYK/NH10ZKwa6Ip6gRpDAtHqc51T0tI7unz5BTTMrKfuj+94IKPy0yUnXEI6e3qisA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793653435;
	bh=Rz/RFb/boJilF6+xGYZwH7ujWVN3y6QkgDWbPnxhCAg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B1w/viBi9fGZPyJZmJa2W8EdvT4w2UFeWRpDbZN7qA9rsU5lLKOxMLfBlgZCqbp3d
	 PlKKf9ewKI4an8wbsFyozwJx63ORlar3CeLCNW13gX+zFkDP913rzXT7rZejDlvGMe
	 CIdwpw9BIT2yGKOAtEueSmfbaRevsaFYIzihigSlYlz/iozAhPCmCqAp0rvoyuOBJ/
	 To7T0C8xnuXs/BVR/xsprtwOvg8VPxT8/iZnmHvOxKrkd7z7oKjOu4ZeDYjSkCsWPD
	 mjkcbRF66lOWjII70OU8p/opapWemQ3wsd1LeUKAsdCMzgqozAoGslXmrImjZJ7fBf
	 tDwr/foaqLxrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F8C605FF;
	Mon,  2 Nov 2026 21:03:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1D1B4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3172405B6
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zl5DxPRXbvYv for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 21:03:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E0DAD405B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793653432;
 b=O/Bgy8ds4PtkUA+APVqmPmbakskD+XPebaxmKBkhzc3o69Qdop7bkQbjkpFL2MGO7Bgs
 gAB/CbY+m3uJcR88wUT8tXoWgIkPec6AS6WmlrgoKSqopWY84oVYnY79MaAjsHRojJiyE
 EMt3kHLGbboKKvwnYgk6MuHjZvBlVdfAxxBS2ps5rBgO6VKLy4trEYywDKgqRiabLcbEA
 P6nvJgvAOKAo8AzCv9AV1M4yRbzOBbTCCyxlRzCtrZ/v4Jy7fU4+cz4wgP2NjtcRAQaPz
 oAocIDibmLq5AP3/0FE4KekFeAUfA39fpPY+HueZw+75kitIu9CGO30Ilr4WS8MetIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793653432;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pfgmv+Vif+1DFZEsC2LGmTqDHk1LujvRE9uy3TBjZP0=;
 b=JXJLfUwMUGEZfxbTiqGDVUQCX85o/wvc8cps8NejrttwZHP5ioKROdrsXGqa5BQcDwfn
 BeycNHqyubuJsjsAC9pNRxbV1hPct0x3jFLfp4woh5pHorfPgl23R9ThBXknLDprjNYRs
 1BmpIUijgnpToRHqDEM7vP0XtIgyYOtAXwyOqKfKGl8HXlxSEA7hXmoIJgazzm5/RJB8O
 eJlOfkridg4QwbHegQnsozHcLf7FHHYrlGsXATzDCn6bMVBSPW4B5lGokDIQqIfxVkKi+
 LwAz8I4Pm36UpKpKauOgfSBBuetpBp1QV0aaa4f/MWldUQobqQQWpBffsch3dJUBRfA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0DAD405B1
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:03:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15BE49D9AB; Mon,  2 Nov 2026 21:02:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Nov 2026 21:07:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c17458af094891cc6e20444a9636dad1795a05dd
X-Git-Newrev: 0ef33a635f58a0c3c4d6f222fc5f52f3983816cd
X-Patchwork-Hint: ignore
Message-Id: <20261102210223.15BE49D9AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6126247856499818997=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6126247856499818997==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0ef33a635f58a0c3c4d6f222fc5f52f3983816cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_10_0/expat/Changes
https://blog.hartwork.org/posts/expat-2-10-0-released/

The four fixed security issues are:

CVE-2026-113351 — Denial of service with XML_ParserReset
CVE-2026-115506 — Denial of service from variations of billion laughs
                  attacks and parameter laughs attacks
CVE-2026-117610 — Denial of service or more from issues with initial
                  non-final empty subparser parse calls
CVE-2026-118370 — Signed integer overflow in function storeAtts

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 41778fc536..e8939fd38a 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_9_0
-sha256  1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051  expat-2.9.0.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_10_0
+sha256  c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86bee0fb01b1bc7f  expat-2.10.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index be5d8ae0b8..23a635e5d4 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.9.0
+EXPAT_VERSION = 2.10.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============6126247856499818997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6126247856499818997==--
