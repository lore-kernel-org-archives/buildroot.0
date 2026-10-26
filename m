Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78DF606A322
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GjkWfQZR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C9B80BA6;
	Mon, 26 Oct 2026 20:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMazGaBeHl98; Mon, 26 Oct 2026 20:41:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6A2A80C12
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793047268;
	b=oOo2F5+FvVDQvkP0zTf+TC47IZq7JLnGrRrwlLhwChAP4/ETJQZl9rcFufrWJHA+VV4N
	 iwNAJ3Dv5E3PsPvAkXDVxW20kvoWO5+VNghCwBlafdeKZSWzDgap9s1lU2FA74G0XsSkP
	 N0CE/O3lWHYAmTYtBl2a39rrSHker6zaP6d2VqZviiQ1eqJ+iULCtrc+Jp1xAYyg6Vp/A
	 CYSTzDLP6qTzKgYbA3ugbSAoNZqFO+L1XXuA90iChttfYPEHZ8rxqoFSbw6Tl5ldjwW7e
	 adNwjws5iaYrqu/LHGq/EC24MfmorF8CObKChikfKzfgu6BeVbEuoFteSkAuYUVjimQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793047268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fb+HlDpGqh1Y0qnFY/zMRuP5rukVKj5vAfiKEO3AfaE=;
	b=FWf/k+kZ2Lj+pThHyqKTbkclCteOBUFCsp3WMHz7ahH4maEglnQD2D+xZwXnM8E8tSRl
	 yWwFRkxxVkxMJfDfZebW78n+tb9ofrA5l63JJsbDK+rJtTRuwVaEJqzCsvP/h5Wv5R525
	 fV+TWjtRUdZYwY0eqQ0M57zqjHxwpGwB+5tqVkQg8Wfpg6hiUvY6Liila5mY6jNtA/Iui
	 tnltMLcqKmWHKEOgZKhCa5PVdJPy5lUOkdjKpEBuI11SnV0A2ub70knctMb7m/8pCjGVS
	 7r00eHE9zvWrXM5C0b5Lg8+wDbvXMLpIRAv53tckmiaCJIs0wI/aPo6vPsv9G/ertGA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793047268;
	bh=Fb+HlDpGqh1Y0qnFY/zMRuP5rukVKj5vAfiKEO3AfaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GjkWfQZRpQcg//ZSw5FyoHzgaYl5C0jHUYg6Odjp4LABZM6/THzUtGCCu3LCeEffa
	 fog3aqqALOTVuOS5h4myGR/Rv/BCAQwut6ym+S6jMRRP4lxj3u5lRkqc51HmZvqAVs
	 6KfwLNsRo72o1DeJk9Pam2OHiOTriqx3kKH83VON5j8XwHyLuV9MjHHHCTQ7dBXEB7
	 gjNjpWdRWBiScKaMQux95uF1HlJVV+q3PlDgQc1YOJtNDPNw5b9n+3+2nT4QBUkugi
	 9Ecg2cu0NXTvyLdt52weVnJE1Kd5JshU/ndU12cuNKaMLta3Bt35wzdSUKbtVql80j
	 6chlhhVEovXiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A2A80C12;
	Mon, 26 Oct 2026 20:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ADA22F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3089E40112
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQs_WInLHzGh for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:41:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 868EE40062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793047266;
 b=BFDCTH9G4Ry3m+GMBfMKRYjjhvaJZa1vG5nQP4s8qkXHoLcpCqk/nZb9zrTrxkIHjjMC
 oy3gDULXWXEnb9SR4Sr7Lezb2HwlzsmV84OlcBcGdPlSA0cGCbv3P+4Yi1uezB/0T6jty
 vGcbpqvX5omJkux+jtnht0tEWmxDypAbn/k+ZnJ/55wMhES8DvjkLYOyP3upBHV5deW7l
 VAurFoNXiy3YMlxC2lqGxF01qzPnHW02RWvpxTuQfAGUUbkUiGEkS102TUG5wi4Xt6I69
 7sZ0lUqeSfrZoSaWI3US8hXd3BADPwLJiQLgysS2HbgYhKIqxGnHVzHnG1DjD8UTkaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793047266;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gWsfDtLR0VRgk50FxdVgEuwhyiKomW6Kt1f+VhrDwnA=;
 b=F1+/xIJw9NFtueHlsLBmslzAP18Q0PZf1Z3xEKiDV9Svsqh4c8W4bCTgewN88pTzXMOG
 fFwjfsbUD8caGx5D6fBLRWQqVzWtMVy8ieF536k7PNzPwbk7Y58yfkjLRlMfOml81Gn7y
 pjJ37gRVDWgWK3iDA+ebHxiPtEa5VsIdVaX+9heyutl79z6h2stGtTHD2rG04s3rBUset
 IDwxNFh2ZQdo3zaCTIR2g+00osTtF0BzADKXn/ggh2ZzPOAk5zreOvC4JCP+F/HE9khC4
 Ze+89/zMn3r6t+gyc2orKjxUooQWTrWKaLvTLgM7GyP70k7m9o7kBc5afTIktlkgdxw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 868EE40062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:41:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6574D9CFF6; Mon, 26 Oct 2026 20:39:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 21:37:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1612f01df512b3fa7ce4241466968aba78572fb4
X-Git-Newrev: b6a653e5fc31ab9e0e0b105583a693938b59711a
X-Patchwork-Hint: ignore
Message-Id: <20261026203940.6574D9CFF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swtpm: security bump version to
 0.10.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6a653e5fc31ab9e0e0b105583a693938b59711a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

CVE-2026-75900: Fix length check in SWTPM_NVRAM_CheckHeader()
https://github.com/advisories/GHSA-gqrg-h59c-j4wj

Upstream changelog:
https://github.com/stefanberger/swtpm/releases/tag/v0.10.2

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/swtpm/swtpm.hash | 3 ++-
 package/swtpm/swtpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
index ebad1ef4bf..4f6cbfd61d 100644
--- a/package/swtpm/swtpm.hash
+++ b/package/swtpm/swtpm.hash
@@ -1,2 +1,3 @@
-sha256  f8da11cadfed27e26d26c5f58a7b8f2d14d684e691927348906b5891f525c684  swtpm-0.10.1.tar.gz
+# locally calculated
+sha256  f61cf6f1e9bbcb4cefb30b70cafaf1c4df54c6961e65cfa63830e8ad0e220134  swtpm-0.10.2.tar.gz
 sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index de7f2fa05e..d6559c22d6 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWTPM_VERSION = 0.10.1
+SWTPM_VERSION = 0.10.2
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
 SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
