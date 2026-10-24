Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8F606A324
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j++TuAhp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFEA8156B;
	Sat, 24 Oct 2026 15:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKKru8zEBU-p; Sat, 24 Oct 2026 15:01:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 66E9C817A5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854063;
	b=IcbTDvjSpgUQIdGgUU8+jwKsPIB3xs1C3BDNSXthnOcOQcN7p45U+IK2WboEzpfRnHlq
	 R383dageyScvZeAW1jFzy0Xes5cCWi00dVt7Rct3Ljjz3ATaJSHJFej/ulYoF84RA/1HO
	 oPl6clkDE5Yfgvm8UVyVojmad9a1DGWIOwS8dxaoZTSprtI7PhrCSh/XeE4pa8+9OUS4q
	 v8yt1v+6tHOnyYCdYg6qGfnMeSyHSuNFQ6iusxy2wzSxZPLeq7EOCIrYoXOiJ6h62vcl1
	 G4QPhuTdBvTsVPjNxwTA+aIO4VPK14SBVPwAPltiTHFCcAmCS7ujyWLCF1ESG3rz/cQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CtIrLw03tO2reeMXS8pi4OjQtbkWIdteO2GFcHT9iK0=;
	b=RLIs8gtMmjhQH5VlvZ3OGAomu3oQYmm+i/SD7WGq4P/5KF3w16cprM8NcDSQB1IwcFLX
	 6OqYu8qJoWuK4DKjBeyN5hxf2Ax4Tsb9sIke5ZwwjWruU6FHoprHzCi7hjpI4oQG09qIK
	 neVyWto8NWGoJCGDyQwiJ803C5jMbAzn6g51GoqohvZztuwvA1cg/VZl18D89hCFk2gA2
	 hJpRIwT88xqXoF57rLfUX3HHLtrgEUUgd3LaGkRGQKB7s/zaPjVCFofLMZw45BpL+8bZY
	 ErwOsfJ0fWBTRbMquR6sJBh9bQf1qb2rt1pF1zd9ONhm6bRwBA9G9rBe0mqs/ruK+LQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854063;
	bh=CtIrLw03tO2reeMXS8pi4OjQtbkWIdteO2GFcHT9iK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j++TuAhpq4dNLcwKUKJLW8WrL7LhUfdnnsOXceeA3gl27irx4Pj+MQT4pUhW+asRJ
	 oRvCeniaWClelYWA5iRViLU6CkcwkZnmWY4BhisOwmPBHMXyZGhfRS3G50KwyIfACk
	 uIW50Wp+6lu25J/cwC83PZVnWnxoIl9QAvclRHqRZrRchutAXqyujgleRgErq2dH2i
	 72O0FcNlcXd2HL5LrgTpp/U0TUlCJjVMRPqOMg/ImbA03PRewsSdLj90GLisQIPmDz
	 ZatyfO8yyIhx+HT0z5RylKTkbV3R7ToRYiEkxWFr8+EIEKMpQzd2jblMTiZrHrHJyL
	 RMbbUnHYngM/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E9C817A5;
	Sat, 24 Oct 2026 15:01:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C9CA3AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7333840978
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZgvGKW9GIDl for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9E1A2409E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=nDnrOrUcdt9Tr6dGQny4ZPxIiHz28R+fQERowWvsNf///oyK3YZh0YzhDO45chp4qMwj
 tuVq5HDAmVK5RNf6gVzoytTH8sbZgNlUx87wldqEudFnqHEeZ2ykhZ6gRWr9hxrYNLhDI
 9ycIKIdxFO3KzhktNyronAikvqRz82h+ZA9n92dYuWa8f+pnTwAzcTOjSL4D938tB3Hyv
 XC4OncVgJ4a5CxdOlXlZQwAzRdzQFwg1ufVrt/sLMse1UXvvpD6thbtH+w+iNBkZkFSad
 HRHCou8Bia/EM4AedeQfMJE5P+a5hqGgdZh96oAHXL11JCza7P6fQ2vqiBoX+5nqt4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vV2MY0T4YZP69yDXh3VZmsBZMnJbC+z8TV0IVVXRzHI=;
 b=c51C9Jc2ELZqliPUWb9IFeyGldEvpu4VduhpSqSEMU04nJ13zNrpqF/mNuI3Zs1EH4uc
 Drzpg427l008+kVZEgVE1NNMY7n58HeoKEGQnpQhPSGkEWZA8PyoH7m2BtqTRn0uo3Pmt
 JEuesNfVBhBX05e8G0Un+m05EZbt44ZRZcU4jrc81LWL3UXoF78RPnSINQWIzu7IT4upf
 8DMfn08HxWno0vw2FffhW2KFX9UFhE+hFpBBckgoJdgRWucsDvPEHfpBv3SyxglxtPMKn
 fjPyEFf9oOG9nn6aQTfe5cw6HK6VjKbAXMfuZHnEktTdgMNGim99LbdimJgX2cPBe3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E1A2409E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0BA69C849; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4f9121d62bc2210726bcac56b82cc3da4d9c0ba
X-Git-Newrev: c5212231bb57a096121dd1250fa880e2d8de0247
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.A0BA69C849@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-functools: add host
 variant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5212231bb57a096121dd1250fa880e2d8de0247
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-jaraco-text. Include more-itertools
as a runtime dependency in addition to the build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-jaraco-functools/python-jaraco-functools.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 2e144f0191..62f9e1945e 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -13,5 +13,10 @@ PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
 PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-more-itertools \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
