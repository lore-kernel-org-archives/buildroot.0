Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F08606A330
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bAqRnwUD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=GV3IRZ0H
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E55C381B14;
	Sat, 14 Nov 2026 09:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtURIs6njqd4; Sat, 14 Nov 2026 09:41:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD24581AF6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794649311;
	b=T1k9uxZ4PRDNBpb2jbVONp6nZUasTypfxIIUlTN0XFjEsgkEr9ZrtuXPRjc+r4d/aTsC
	 5CbO/tZMN2FO0JkhvMBHLEanJEwItjAgYeljSlxgmaDDyZwU99x45Ei6tKb3CjT0UjJEv
	 sKzwwqoVZ+BGnZgxp+IWeHuPXcqVtGU5uFtB6II3ScLphgmCBBom+poDTMuLJejttKIZv
	 Pkk9vtpkzp+TbGwuXlufloS3W8Fvix9IN1Bw6ZPe9nu8CVdS4bvpPejzFU/AVn2SjkqUj
	 v1WK1vK4CMEt3MdlaumseXyIe4UAUeV1yOzyu9xLUn26ilfW1LflvbzMKRHv7qWsxdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794649311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VoxejZO0IrKQwjmo0gHNFi9QTMfKNhgjXQQrAEhbBf4=;
	b=Z4sc9ctr8JJGjZNbR7C3TFx8Wy/8L2TjsG1pTKzC3vzVodMOLzf1lGpKXjGCEDCf4uCt
	 rYASeHSN3O4AxaE89lNtURxD+GVQeztMRlneuCE32foJ4L62QFzJ+X4qrCLzKrYPsypRH
	 o5YezWSNIJy7vxB7fwxx8+bamnM13/2oQKNzbRICi4uYc1YvnMIurDI8HO4lOKXx2ydfp
	 vyBhmj+8a3JMwN4aIT8XIHPBGqsR6eEZemuF/9p14pITYWa4dFEN4hQQ8WLpZhY+ncojM
	 /hhDazQh0yKzVHR5Jpc0iZHqk8p62B4bbAZlwX3KvvKwd0BN6tGGuuAFMKk10alsndw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794649311;
	bh=VoxejZO0IrKQwjmo0gHNFi9QTMfKNhgjXQQrAEhbBf4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAqRnwUD2LwKcKahCrwyrCkyjCn4RTcCiHZF0UzLNyg1hqyENETzxPgM114LboPqi
	 rjK4C0C4CEHIzeXjfyDncZQLCqWfQWt5UtM0Udn9UIqstOGI6+w8TO4cg7mFxW2y4I
	 kmk0OSZFOH0EdyMRHN3YcDT4TeWqRdaJBDAufLOv8ydCelqCWZ8MI0Ks1agMjCd+Au
	 tiNF/tgEOwXNLEknh7yr5hax2lTyJJ5KjIywb300hH40lK8yPWYAhdsse7O8C+NQF6
	 tcYY6AUFwfCIgOGgtIsQXNMJt0veUXXYObjgJz8jmXPu8R++kUBNtwMy9wqyZ7xu45
	 z0sQK05hyyqVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD24581AF6;
	Sat, 14 Nov 2026 09:41:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA24B28C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A04A26069C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bECNNf2wWu4N for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 09:41:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 46BF760679
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=GV3IRZ0H
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46BF760679
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:41:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GV3IRZ0HPFSA2hn4wUaKbrBsniv+FoKabf5O583ttyngBCpNmc6ZeEcw0BYkwsmW0YMx2Mke7fngkvzvbD8gimQPT4311slmdFpOqz/DXgsJJnBA1Bbhr8YMZu+3FwnVAADFWLrIXi5osX6ad6rFNJjLXastSmO9LOc1vW2J96Bw6b2/afjtLALAKa2IN+/SmvzWoJGR+M6Li8189A+0eLiZx75BdkS2jAxNAXEkINCS83voGQcsQKOprspEBrqSQTULPKK8h/bgGb84v1kQclG+X+DJbEuxrdS6e3bm9rNVvA0NEqJ1mqJLCUbmImG+/d42S6rbMoDrQEtQ5hG30g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=crsEv7A8ahA4j6ekG13inRfc2ZDrIrUvtWUDqx+QL0k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1963320242; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Nov 2026 09:41:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSAGW-00000005o7x-0mQ0;
 Sat, 14 Nov 2026 10:41:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Romain Naour <romain.naour@gmail.com>,
 Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261112144541.3663027-1-yegorslists@googlemail.com> (Yegor
 Yefremov's message of "Thu, 12 Nov 2026 15:45:41 +0100")
References: <20261112144541.3663027-1-yegorslists@googlemail.com>
Date: Sat, 14 Nov 2026 10:41:44 +0100
Message-ID: <877bifg36v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cairo: work around gcc bug 125410
 on hppa
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1,WEIRD_PORT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > GCC 16 uses LRA by default on hppa, and crashes while compiling
 > cairo-pattern.c:

 > ../src/cairo-pattern.c: In function 'cairo_mesh_pattern_end_patch':
 > ../src/cairo-pattern.c:1417:1: error: unrecognizable insn:
 > (insn 325 0 0 (set (reg/f:SI 381)
 >         (mem/f/c:SI (plus:SI (reg/f:SI 89 sfp)
 >                 (const_int -184 [0xffffffffffffff48])) [25 p[0][0]+0 S4 A64])) -1
 >      (nil))
 > during RTL pass: reload
 > ../src/cairo-pattern.c:1417:1: internal compiler error: in extract_insn, at recog.cc:2892

 > This is GCC bug 125410 [1], reported upstream with a test case reduced
 > from this very cairo function, and still open. GCC 15 is not affected,
 > and with GCC 16 both the test case and cairo build when passing
 > -mno-lra, as reported in [2].

 > Add BR2_TOOLCHAIN_HAS_GCC_BUG_125410 for hppa with GCC >= 16, and pass
 > -mno-lra to cairo in that case, so that the old reload pass is used.

 > This issue has been present since commit 1b290781cf37 ("package/gcc:
 > add version 16.1.0"), which made GCC 16 available. It therefore
 > affects 2026.08 and later, including the 2026.08.x maintenance
 > branch.

 > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410
 > [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125410#c2

 > Fixes:
 > https://autobuild.buildroot.org/results/f76b8f361d01eef892ad21722b099ba8bacfcc57
 > https://autobuild.buildroot.org/results/a5ee815bd49784cc522e76e49a2a021a151a9e57
 > https://autobuild.buildroot.org/results/54bbea14bef321c193d9b6450b253edf832c6b8d

 > Fixes: 1b290781cf3782576091dbeacdd7d1a30b051856 ("package/gcc: add version 16.1.0")
 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
