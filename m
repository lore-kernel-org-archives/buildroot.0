Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072F606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qve3m7Kf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=Jq3mwL+q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CD3409E2;
	Wed, 21 Oct 2026 22:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRi0biAWmXbA; Wed, 21 Oct 2026 22:30:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 297B14098C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792621809;
	b=eNjqzOmVQbkK7y/XTwXgexuaz4uIB8bnKd0RUAeVaeW/XlNekaQEa2t+cN38EVFao5Da
	 W3dboaP/Bj0VRfKEKOprYVdckzLLQvTE4aKOWRrl4Jkzgm/BoRqRVNjcf46BtEpknO1VY
	 BQjQrc0BAa+oogu8cRnn4KNQ+aOIlH968a6f61mEp6pe7yCOg1K49wJwnLvwnbz2Dzd9v
	 DfTI9Vp4UCYT90k8O86AQ750L/vM4U6+Qj7gS71WhHbZINARG0891Gld8kLP6AyYotb/h
	 WHI6b3shL2LOsTNys0+uKfWA8SFzEwjhXIl5cTGHZKO/QAEOMlu9O42fsySQQEVX91w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792621809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LHv9t/2gQKYqDNo2o+nrmJ/a8T8Yd9TV1J4idvofdQ8=;
	b=c3Kh2EOznHI7q04oryqA6Ds7k6yauDqQexBIN06/S42MkIumtGHa5fn85C+0HReeM8w7
	 AgsfkiNnDws9yOZpat5EM9+XNz7PINwc+QnFfRJ95UD5V0RQsH9J6C067feU74bAh+vSt
	 9bVuAujp+hq2NmET1Q6vOq/47SbKXsH80Uv+2DqN5C5sIw/5Zb6kIckrEoaHTV2Xn/HEv
	 Qz/8ujLaIV9ZS517mMXc3znldDSwrf2dmhgRy2jGFRqEKNTN/ekm2EvQzqOtstBZgwtId
	 R80V7nyO6f6fgqqeO2WjgNGqMMwq21n1/kELGqBbMwBCmFuI4c8nts6iSKjh6Gn6PbA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792621809;
	bh=LHv9t/2gQKYqDNo2o+nrmJ/a8T8Yd9TV1J4idvofdQ8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qve3m7Kf9ttZVpJKAMz9K8Jn3QC4eiex/evo5XduF3jO14y5Q0j0nBigg+PH+gyME
	 o1fo0NulIMwN6zHg1ucJZXDNNEThRr3f+DHUl20FIHit3fs0Q6VgQrHMgbT3qKRBiz
	 T51PUtTIzusYcI5inTygDMlIyycCu3HI7ROI/FdBLO6SzqMlR09XfOHmKjAMRy3YI9
	 6qa2EgpZkbicEAHn3IpWGuQUhaKcCDM20WGYFZB57cBjcxwOjKKWw8llDofvdQUnlf
	 +UHqVMHzh0BRXOCekWsV2s2N6MJrWEf/UhHwnmhBYpvWF1vxHdP1gWctc7sTIe78Uf
	 TSv1UOImKwxyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 297B14098C;
	Wed, 21 Oct 2026 22:30:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8140995C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 676FD40050
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhO079v1TcPg for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 22:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 084A440042
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792621806;
 b=Obb31LONQow4El+flnS6QfL1UsFvfjleqGYkjy6YnYNEdGsAUOAy0vuuLipPNrCxFwjA
 2VuD/eptZqsJ2gRtuBl9U/mwebNi7T1l8Gqj6MBM+ehwUvl8MoDo2fSCTqCmYjao0X6XH
 q9BA8lFBLlR+BHwieJROvkseqVOFfV+/DMw10bAycpo9U2fwP/kDoSZFK7VvFURH3nmM3
 YJ5UncHrh2Mwfb1svEBXyfvWCElmKmvTcay3oeOazdTTppyvhhfnmbpxVpkKbnaJnn9Fo
 7wLUrIXXJwmlYmAFOKFjgyVzc1TkeqS9Tbp0+62jtg/9x4wb2GiBPkUxqaK8BB1Oe9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792621806;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=fHKRe9HIs3/JMCwAI8AcPH3VAgJ6WCcCnxGyZEf2PWU=;
 b=dqAhMcgpTOHWk5UYPCrGgw4D8C8UKkLFPTVuwAm9PhCOdgwnoW4b/01Rbo1lKjOw2O7z
 Yr5kZumDAjQ6160FK0SXfQe5M7MaBC7EIzNWUc/lLHabswuWqeFHosyG5FU1+uaPEOAtI
 ogA8p0j5qpp5qbJ0qMUrNFawJ1ONumD7yoD5Z0UTCatTglHZ42tstbcNssSPqhwiu1pMp
 0cG9QilF+tpa8muLIC7Si3nlz7C3mMzitCwKSTP0yA/yxjSSxsgg9T03n3DG4tVE9fNQg
 0aFX4EXuq1bUIcNh/1MWy4QyCq5GtfIfFTY+GSu+QfCbuYKXGR2EVyClt8isH781JFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=Jq3mwL+q; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Jq3mwL+q
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 084A440042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:30:05 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 491CCE004A4;
 Thu, 22 Oct 2026 00:30:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792621802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fHKRe9HIs3/JMCwAI8AcPH3VAgJ6WCcCnxGyZEf2PWU=;
 b=Jq3mwL+qR9yTbMlVk+fUnOcau5/u+ohQH0dFhDZ7WAD/nLCmrPb8n2jCJHcnagnVh+tQMn
 AKOlPNICq59x5pkgRJtchJ+zo923gjtjyb4FF/0ZRVIDYrzC74UvBfEaGpNYey7HczTXJt
 ELCKNPAdUeoEqdqfQxliMJPyJyWRz9s=
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
	Florian Larysch <fl@n621.de>
Date: Thu, 22 Oct 2026 00:29:58 +0200
Message-ID: <20261021223000.26513-1-fl@n621.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: security bump to
 20260816+nmu1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This invalidates the compromised eMudhra intermediates by blacklisting
the roots that signed them[1][2].

Changelog: https://salsa.debian.org/debian/ca-certificates/-/blob/5bee010adca85eb867534f6445735ad5cc0dc6f3/debian/changelog

[1] https://emudhra.we-have-a-problem.com/
[2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE

Signed-off-by: Florian Larysch <fl@n621.de>
---
This is an alternative to the v2 of "ca-certificates: remove roots
chaining to eMudhra intermediates" which manually adds the patch that is
part of the nmu.

Note that this does also include some other changes since we're bumping
across multiple versions of this package (which might be a good thing
though).
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 0f88df3eec..cccac113e4 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20260223
+CA_CERTIFICATES_VERSION = 20260816+nmu1
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
