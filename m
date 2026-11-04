Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15284606C466
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dfM4pbLk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E4F4094A;
	Wed,  4 Nov 2026 19:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTnut86M31PY; Wed,  4 Nov 2026 19:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03AAD4093B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821947;
	b=Klw8RnbPR2rZ3SGDx8qBI2h+k5SGfe8SHxzqAv9DmTgpy2ZnUaCqc+GVMrA2/G9dQtRm
	 4ItQlfGiFqGaZAt7o0pt4laohUI9hu4C32ydPEdjCzW9SQyktgKSSXieIuMcCBvjra0PE
	 2RgvcAxDOQrCuJVgobFy4yz42bRs6SFTM/oSM7Lwst/N8AjAxPAh3MLw7PQ69wcNj0e0p
	 p9rh2/tV/T+GwNzzFwI14n2aDVaOv/5Rz397Q2nHctOWeRTWbb0sZimWoiP9fMxXNFvGa
	 o1DwChLMGIJm6NZujJHvRIo+9ULs6JeaiAjdDg/wJltlGTlvWQcQ5GjyxpDPeBdrHog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821947;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UORZsFwxm0M1hlVHzdKVxgIIsctRcPVvh7GPXc3LYsw=;
	b=U18jtnOHC4TTiY4BfCABGsg/sDdlgqSnYvmuNtef4teOvef9LW+HAP+gcL6RhSwHfV8+
	 dNzFyBp32hpYasBNU44ZhRwhwYyxLR2YEio+9kBl8CKC7ykLAlcyu4umvxv88b/NvB8b3
	 jjkmXePjweWMObEV0XsNILSc4DqPm7t0M7CuPsMMONNSE0kPIvalZbelUCCUy8KppkFr8
	 vjHUJj3eWn0mAkdbkBqKBLmaC5WJ18Zka/UgyHabOV7p0fRko+nExXtSMe0aYWXQ+iIuz
	 1etAPxjEsQkNsWOasBQTUw2WFzkWL8hSat/nooGDcB2UDHFx9NPYYEoOhBNQftrTPog==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821947;
	bh=UORZsFwxm0M1hlVHzdKVxgIIsctRcPVvh7GPXc3LYsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dfM4pbLkMLldo20GpJOl0om7IPmO2M38sKxauhkdMirhQhHn6sxjSN4r4sesUkGIA
	 J2HINYjt9czYARz4/8vQFVkimAfwtLMHGT/11N5JPLmAWs7ErcYi81KOm2OBUCYlN5
	 ucd/iitEWhwPEsXmEeDp8iDg7CqAgLXqlpobeEED5wpZcGVa4pSId0mK4l1azKkb1V
	 xNrZQa1K1O43Hm3lQGlo137Kc9zqZ1JaKsseSNsnM/ShvgVh2bYYfNaNB6HOdbWaqI
	 //I9UUX4UYRBF+jNGn3gH0K6GuuaFd3T3h2Qi3zfy6KC/1IlE1XeQcO1Z2dv68cPey
	 JKsQmlRWnHOpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03AAD4093B;
	Wed,  4 Nov 2026 19:52:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D84E9C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83EE940083
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBVV1NW7NbSy for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C527640217
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C527640217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F03939DD9C; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:48:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 442a4f86e80ea0b428e8c0bd3584833c8ca2c612
X-Git-Newrev: 40f85148f29ff1de220a235249f0251cbf15258e
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.F03939DD9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/docs.html: update details
 about training
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40f85148f29ff1de220a235249f0251cbf15258e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- No longer useful to mention "Free Electrons"
- 3-day instead of 3-days
- Fix broken links

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/docs.html | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index 38f1996c4a..f137b6376e 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -78,8 +78,8 @@
   <div class="card mb-4">
     <div class="card-header text-bg-primary rounded-top">Training</div>
     <div class="card-body">
-      <p><a href="http://www.bootlin.com">Bootlin</a> (formerly Free Electrons)
-	offers a complete <a href="http://bootlin.com/training/buildroot/">3-days
+      <p><a href="http://www.bootlin.com">Bootlin</a>
+	offers a complete <a href="http://bootlin.com/training/buildroot/">3-day
 	  training course on Buildroot</a>. They also make the training
 	materials freely available:</p>
 
@@ -101,8 +101,8 @@
 	    <div class="card-body">
 	      <ul class="mb-0">
 		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf">slides (PDF)</a></li>
-		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-labs.pdf">practical labs (PDF)</a></li>
-		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-labs.tar.xz">practical labs data (.tar.xz)</a></li>
+		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-stm32mp1-labs.pdf">practical labs (PDF)</a></li>
+		<li><a href="http://bootlin.com/doc/training/buildroot/buildroot-stm32mp1-labs.tar.xz">practical labs data (.tar.xz)</a></li>
 	      </ul>
 	    </div>
 	  </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
