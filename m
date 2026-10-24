Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CqCwF63P
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AD0E80EF1;
	Sat, 24 Oct 2026 14:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmiSVAsibZEv; Sat, 24 Oct 2026 14:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 98F578154F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792850764;
	b=sM31PZ9emtp5gTkRBWq+pKXwn3uqHUxzm0ecZ5tXX8i5qy4RzDQk74JiTlI39BCOeFX+
	 4lBAmfn6E18AkXU2aAIgfDN7x05BuEZ8WuHI9ZQ6dAB5fGc1te6tria1G+PEEZnm8ZsRm
	 LFd3wt/F2e+ysCWBXKnozo4ve5zf0tZknvj1Xc+M5p6Y9DS5sOM0aYMmgF4Da70OzZWoz
	 9vokBC0sjDuauNyUJdr7d9PvZaPFpU3HpqAqNZEk6QnXs9Wwx0DFUhWlHPpNdZU1phNnm
	 jdXaU7xKJw4mNoIVHHkP2F8OpqhtBHAa1BEe0jfkVG7NGfrl0SG9nMeI56++25RlUuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792850764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R7OQ+jmamkinBNcE2O7QN+Baj24Jx9aEwR+izXw4z3o=;
	b=ivyhUYK9lNqkp0R4PVKLukZRnnfakd+8sT4FRq9Om5z96jlE3mDyikq5cZkLKxby0PsN
	 r2BJXTn2G8O19dFfHIz90j0wa5JD/exv21eS2UKvXJ5cSj92ouSTqODputfMnS4K2wggP
	 gqhj8H9tke0KTQ/rjtIQ8vJ9QS5D3HeiOjUd6PsBLDyKs1/AuXjB1D6c2n9iejsxX51Na
	 4DpQ0RTep8TKmJ7fIQEFHexXF3cDc0sBk6CC28JfCyWEnNNeIpOAP6Ufbk+Su7aI/5KHO
	 EQuasKL+MHhjGGvu5z7UgCTBZg6OWd+pf9JuoeEkoIUdZ1A3trgsHrS/rHaDor4d8mA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792850764;
	bh=R7OQ+jmamkinBNcE2O7QN+Baj24Jx9aEwR+izXw4z3o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CqCwF63PDA2lhVJQKrUFbIBA4mkkWs8BKZmOuh74DgmxTytzgMITM0Tde0xpDVSGC
	 /0BctvagVW5Jl+RPJJV/N2q1kRevJnMlBsKJ5ueb1SpfpAF5dYSxK63w9ZEzerMn7o
	 90zTKWYn9bcQDRVwGejKsnrGfWZ1DmF8zPc2MB6+gndHTdpaxm4qJnwgrvp8OUePZT
	 aQuNPApeeebwcbiKlw8NBvvriZImxSpqVd+psAUK6iWdoCl9KFEhfeNEUxMOizQsiL
	 9xfIoGbuIG3Nz7sayvuIc5Zw/HMeUO0+YRulAKlsr2P83mabjSybuGaXuqiaoxfKaN
	 w69kfbB9vOQgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F578154F;
	Sat, 24 Oct 2026 14:06:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA1E380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6533B400EF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tdYb0-hxrwp for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A9B374006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792850762;
 b=YU6nT31GCWk+PML+PvZ+JB2p0dcWbwb1kD/mxhV+nEeYxub2g2/DzsSBjpaVnBwe/4Mg
 /fqEkdLfbxK+DHAjbbsz3euMghMsAIqkiRHx1ExRH98pVQ3iCjzjKw7yrzXamSQFbeecE
 NWmt8VIsymJrYF/BkNI2O74CyGMf9BEyFgFDz3ORPRhcUa61ioTpU66AWzojZZk7jqNTP
 50fZGymoN6ac1CKD/YxhzG0TESnkKT5oZ/pIO1k4pKL9s1u5JI9lu8jrMWI+P7Egpom0Z
 NmiDOzwnEXFUoieo6igbgELdVPd+RdZ+iB2N0KLvSkhzgiavEVQICmB3gfaRzTQVpsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792850762;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kgE38fw573GSPGqvfNdF38Wff7ORW2zIFspKLtAplz0=;
 b=O+Jp4bLRfF5eOXoZuojCRICtFFS8u6hI3pmwY6YSG/4IMmvndtEw5N22fKu7AUc8puae
 GB8AR0Ab9thr8BKgeqoQ8mMGsxy8/7mnwB7Iqd1A9n0OCQ9qgS2uDE/H6vCIwgLb/WJ43
 YzW4infUZwZ3TckHp3sc598AoveCTsItBRl6Xoie6orhck9DzkKyiQOQOCQki6SWG/BTC
 b6YrlBlDo1az+x3Sb/Qx9xur9yIB5VIq1u358SXIVAfLvPLymDBJZ3vX34Xtav7m/yPgv
 lvML6Wk7yvwkx4utaLjCG3zR44kXr08wE1givlbX9J6LRltxfra226HI0KNjB8wcBpQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9B374006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E7A69C7D5; Sat, 24 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 15:51:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 400fa09486b5181bdc7bc292f88bdfe3b41b4e68
X-Git-Newrev: 04eb6870f66f00152e23d22d12024dbf7d3230d8
X-Patchwork-Hint: ignore
Message-Id: <20261024140437.9E7A69C7D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpcore2: bump to version
 2.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/04eb6870f66f00152e23d22d12024dbf7d3230d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-httpcore2/python-httpcore2.hash | 4 ++--
 package/python-httpcore2/python-httpcore2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore2/python-httpcore2.hash b/package/python-httpcore2/python-httpcore2.hash
index c783f884c3..1c202dc6c5 100644
--- a/package/python-httpcore2/python-httpcore2.hash
+++ b/package/python-httpcore2/python-httpcore2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore2/json
-md5  a540e0f456af9e4abf944965a361ba1a  httpcore2-2.14.0.tar.gz
-sha256  4f57a1a8249fe6af589d935cfd456f1d13bbdcb0f0fc72af9142368fc94811d7  httpcore2-2.14.0.tar.gz
+md5  118785ac17d5a4d0b9122f998ee2f705  httpcore2-2.16.0.tar.gz
+sha256  c72cd0413563b17e1cd8354677dff887466f8ec2551679759e93126534428643  httpcore2-2.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4df125c807b0613501e943a5c92496dd11d2c16604ce396097a8dde396304d9  LICENSE.md
diff --git a/package/python-httpcore2/python-httpcore2.mk b/package/python-httpcore2/python-httpcore2.mk
index 048d582bdf..1f292424c0 100644
--- a/package/python-httpcore2/python-httpcore2.mk
+++ b/package/python-httpcore2/python-httpcore2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE2_VERSION = 2.14.0
+PYTHON_HTTPCORE2_VERSION = 2.16.0
 PYTHON_HTTPCORE2_SOURCE = httpcore2-$(PYTHON_HTTPCORE2_VERSION).tar.gz
-PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/30/ff/b53af1b49bb2cb5fa97c92215614b173ca5c1a99ded80e2d52f15a94fa6d
+PYTHON_HTTPCORE2_SITE = https://files.pythonhosted.org/packages/c0/61/afa9d6b7452f9eca73f73d45324eb0bb52f098fd5e6049bf6b8263be9b4e
 PYTHON_HTTPCORE2_SETUP_TYPE = hatch
 PYTHON_HTTPCORE2_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE2_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
