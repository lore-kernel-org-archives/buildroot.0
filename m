Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09759606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LnSUkW8Y
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161F781670;
	Sat, 24 Oct 2026 15:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuwDA5BSvsxn; Sat, 24 Oct 2026 15:01:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1724381990
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854070;
	b=Sr80b/vIZIq1qnyxfdGLOSLt7bpEzk27t2Degje6ES5MTgw6XeVV0T8g0gKl4kf4Mpi7
	 tnqpMpOzPL/7Wuk2MaAE1DkToT+n2YlGdKlOlIirls3NOQbX6TCXZ3jlOLoOpLaTQU2CS
	 lCco0UhcDlBH47RqdDYCx3jYGAY1z35YgI+4DjiMZ+2sy1MWbjyhymH5OR4t3G5a1BxEW
	 0AlWubdQNHMCrvz7Dbb9LofEBsKzr88L5spTMzvIz3gKDXcWa5fmnYtgtUzKfhhzkGLUI
	 iTRLaLDhYIykWeK8wpQP4vvB6/x1zTn6cK/VVlLu1GdZAppzybOsApbiHH5Cngfjnqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/WdKeAcpDwOMWZikx16cw3evX3xAWgP5VL6aFBidqjQ=;
	b=VxwocvSqof0dfGCmvHMHnRK3szjN4naqEFQ5GpxwWcgT+8ZcA8QubEXIAxdx45yVXvwF
	 C/l5RPkaBYg/c2IKleeYNxeZ4uh8z6DBqrsPh0Sn11SGvhxSvEu1MS0uATwl/+PAhjo8y
	 +PDk3B+hg9mPXBQm1wbxS+uedvzoJNRWaVi4yCHQJZRI0bKSTeXsW/ynySKBEVm6zpYQV
	 jT6HaAkr6+uzK98kQJ5AgifmxLHenelbs+MOiQEFMcNYRIRIx+abDlNXgHrrj3d/JC3dF
	 QJxc9d4lJSWA9XVflISVekXTm6Y7hSaKhJ/VRstNTAwUIyKvAazFcnuq20NFufIR5Bg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854070;
	bh=/WdKeAcpDwOMWZikx16cw3evX3xAWgP5VL6aFBidqjQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LnSUkW8Y147wyxEvaakR7QIhTmK1TcaQp9hziCVWIc+si/GTk4ODPmbAh+VFbxau2
	 l/Fe9p4IBxzm0x+8EdngS4UgjN9rTVq//kxfjO2u2GhkOmLcNOh7XR1AADUTh6z/6G
	 5XdGMpqlp1kVKd8EIbLQGCqGPczwBm1YP6xgPqyAi5rGpAar+I3BZQduY0ao0seCun
	 4k5VuU5uKZayFjxNT4egJllhrNk8a615oFVuF0jYd1OFZM8+w62DUY2UcbH7DG5kJQ
	 d9mLZAgn42VTQcNLUYc+DWs4cvA2iCNbHwsdKBwk9UDgErCwfUoYPZb6wjMhNDRy/Y
	 X6xackNfCX2yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1724381990;
	Sat, 24 Oct 2026 15:01:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D825A3AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9CCF8165F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQr1vH1b14Vx for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9FB108156B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=MrsQkKVSmjctInjPo6dNlCw8rxHEIN7cNc6/5sJalJVPXSTJEjEw/x7Xq19nlabiqCQ1
 ZsDCmhFYs77+pi3ucHQWByV0fxTunBFhDpgG5gfbQvpLMY2bES6AbmJZWxZ0fHJd7QORa
 6O975BcosSVNxLxyrE0uClMauhSpME6Fl8aYYDezK4ydCRB0AWkJn2j0JxAVdc3pOskAD
 QJ2CQUzx4BTXoW25+0QAQNZn8kM6j3ofxYyHM5FP+vAzNeZ4nLIBi1QhHgfXoiEJvo/zn
 eVKX+WEy2mRk1lK9Wkgtq6279zsCfeFBBGbGHxH4FeTFcGLEuG+HSE5qA7NL9Zq2GXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CHdzrShMRd79ZBpMOJk7imuG4rJZ0qweImedQP3R4H0=;
 b=XayselKfRgOHgrlzghRiEqIc8+wZ5ZTIW++I+PtfPCYjplymQMWTq+y4+PdKWhsBDy0A
 HM/tbeT4jyDMeW5c3S7R0BS+MdhrnLD+lL/o5BdT6d4D0OhQJsXfwQio0lhBAcOdZ+Q/k
 uDVjj+pGEd0TKtz9h77UX1SVowdW/hlM6eoDWIOUTS8oLW+ljNGmuWON6D3JdnllCJifF
 UhnvFNWklzZZde+vCkx/7eJn37SY90EvNu5Vt//r2HfOKRqvMnMXIJtzyeyu7Jzc9T9K3
 apoSvgHlAUYfmxj+xuLFdB8BRDkYtE3H4JEHszOzM3fWq7yRlzk/9yqVBg9p+vUTXTQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FB108156B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81DD79C84A; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85554b2b51098d27d13059a862ff13612b0b3e75
X-Git-Newrev: 67e2a548813dfc857413a6c93ea5e4378552f9dc
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.81DD79C84A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-more-itertools: add host
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67e2a548813dfc857413a6c93ea5e4378552f9dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-jaraco-functools and
host-python-jaraco-text, which are needed by the standalone
pkg_resources package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-more-itertools/python-more-itertools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index fa3d859905..6fe90f84ac 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -12,3 +12,4 @@ PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
