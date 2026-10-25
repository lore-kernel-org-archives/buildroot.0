Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC8606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mAhkTc2I
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8DA60640;
	Sun, 25 Oct 2026 20:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7YZpmTJQpUE; Sun, 25 Oct 2026 20:59:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0006A60619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961975;
	b=IUlHZrg+AzpAQa3PfLq8BFBu7A8AVmQ24yWqjJo6SHhlctRuE1uEz5Yp1MkugJMaeo5m
	 Q/V+jn6ZjFXfWIRZouXqJML1OOks99Gvr9WAOBCSbfqGqqZXxGS9vwl25MpbcqlfBONQp
	 tH6DTEzY7ndJgm3iLea7bEMSwY+LUeaOqVFKsMZVZQ3FJojYTPWhOCzPVdPaZ13Wkrpdt
	 hqlXklLCftqHcZ53Elt0r3f0+iY7NIOQsmzqzHOfC1eRGN/HjHnYI5jpXpHnRNFjZwVDD
	 /uJnOE/xO1y7UKn05YAn486VX9AbdkV7QwMLfJOmhHg1uEjxHIqB9CGBJymDpO0IjWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961975;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5tto84x5a1OadKjLIqxTOuphokrZKQbFPR53uBZ9D38=;
	b=rCkHs4Dk6SoAFMhqnSDaQly/bSdcwU6cZ1yZTHnVxL5wS1+++u4TzxFHV1lTOZHcHyaT
	 sDg1CdEIpCipadea465A36wHV0SHEd0rYyI8qAWZaEvgnbErV1HL5c2zMJ6AUtwXXByMA
	 xqP/hm4xgkahtxZEJW2tp2mPw7wNaG5FZ9BCdoDNZcfe1Cq6g2CVXi/8EPp64vWCS3rFh
	 t16ok2DQdXADY0/b7K6appTuYiGzRTIVEHfWkvGPY3K2E88dLoK0Vf3SQSOfRzt2epovT
	 3K8iAMZLl+WqZnzmpDdabRMcb4AYB4HaZTRBy6/vf6dUczFTvyFbn/KUlo9Lh/0Q8Iw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961975;
	bh=5tto84x5a1OadKjLIqxTOuphokrZKQbFPR53uBZ9D38=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mAhkTc2Ip3Duek1ZsSD4F5oXp3lhRWUo2dfJIOQIb0lkXrdrlwGZJJDuRtucnvBcO
	 GCtlnqkQ9FGw2+A2MP17ePUsLsSK+Dg2FQ7q5X2fHWd8bc6dGPNLwvNlRh6yHJOJ2A
	 xfClnXxDCR6cOWhpyrAcOnrJt/qj2AdCpKGDxno58p6C+OOHAQPgNN+MD61mSK7qIx
	 VXQED94qTIHsEx6JSLTAP8eZJdngT3oh/jN3S3GlI1C90L4XbYU3epLYQh2OeRXw3y
	 2V/YJhs3ZQaGNZ1PZN81/O5lSH3P0rR2V3BDAB1RnOqyEcWE/8gkx0rijYJBfW7YSf
	 jT8TP2yRTVWAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0006A60619;
	Sun, 25 Oct 2026 20:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14ECCD33
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0713860607
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxOYOb45v-HR for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5DAB060604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961972;
 b=csAteUjzJeWyAVvgVZP7gPojgvIyqkoQPAFhOkciOsj5jf7lV1l5i5zydvQMkDRx5yIJ
 OTZSwH01aYPcUoyjmcjoFxDL6tfsYJv/YGjb4UtzPwX1yuUW+s11Voouvl6FSQIAJ1e/2
 vpcvqNxh1XfFDTF04V69NslQpnf6RO1kvDWhawbEdH68tYBrrYAvZ1TSr2Y1kR34Q3yo1
 2h4AmEpvqXIyWX2bTgSjMLrOjQqSYotWFPjdqbysWz8UcEEGTkmR+pIKHQKRe5IofjWCG
 U7i/bcu0m0JCIw/L0z2hnCCeJ67SI5dR+Yr4xM6KL7D90p2Zk/AcJHk+qld3ayrCufg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961972;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0va1oYM4P8Rq2yIaPeQ8Qpd4/NQaClV1nakM7zflwQY=;
 b=gnUSWF6CMkaqeFitjObTgwxIZw04Tqp8ensMMyfLPpgKeWFZbQK9clahsGtM4axIt9r4
 9A3+V8Lvszw7jDB5Xoi3vWNNygyIffHo5p6S5L6QqlVnyixkGvfx6PMmlISQcaZw2tZqO
 CwiDj6Y6npAhsECmww9Gp82MisAF3jLFh9DNeGIIK/3M90wcAEPBd1D4rviETF6rUqOI7
 Cx00KtbKRZfEux9VvRH33cC/Pg8IrU1tk32sOF8GB1hOCSVbNoeDYErIv1Tw2Nn1gduOq
 R5YSy9UoOGT5YBSE0x2D5wxeoO3XYz1FN1oCsT1FUta/LKiGT8gc4H1yF29yIyMWXYg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DAB060604
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B798C9CEC8; Sun, 25 Oct 2026 20:58:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:59:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5797aeb95f2649af8096e20dab8a0e6e459803f1
X-Git-Newrev: 77fb7aa0c4fb7619a426fd37aae04a0455a51af7
X-Patchwork-Hint: ignore
Message-Id: <20261025205806.B798C9CEC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chawan: add arch mapping for
 BR2_powerpc64le
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/77fb7aa0c4fb7619a426fd37aae04a0455a51af7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

chawan architectures are different to Buildroot ones, so
add another mapping for powerpc64le toolchain.

Fixes:
 - https://autobuild.buildroot.org/results/553aca94416bcafabfe23d34d6907bdb9ebb84c3

Fixes: 9ec34dc363d7db8d5bc460d2607b1facf2103961 ("package/chawan: new package")
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chawan/chawan.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
index cfaad13ac5..bef4816af8 100644
--- a/package/chawan/chawan.mk
+++ b/package/chawan/chawan.mk
@@ -16,6 +16,8 @@ ifeq ($(BR2_aarch64),y)
 CHAWAN_TARGET_ARCH = arm64
 else ifeq ($(BR2_i386),y)
 CHAWAN_TARGET_ARCH = i386
+else ifeq ($(BR2_powerpc64le),y)
+CHAWAN_TARGET_ARCH = powerpc64el
 else ifeq ($(BR2_x86_64),y)
 CHAWAN_TARGET_ARCH = amd64
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
