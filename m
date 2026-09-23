Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FE6C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CAFF81232;
	Thu, 24 Sep 2026 18:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6qH0sl_p8cJ; Thu, 24 Sep 2026 18:57:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1754F8125F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276279;
	b=m21UGTLhz1r1Iqspij9RxZLrUJOR9e1Tls9nYrMY0ohJ92YdmbWbe75QfNtQqBmNpjBy
	 jFMl8n/Ev0yZVzwevWVu7b1boB2apI+A7SAj+uWwUHHu8jCG+ixfsuC8iFbRZ/yQQSPUv
	 k9+9RJYyvA7HK3Ig4G+/c6TSYyVYJ4YIDGoUJ6VY2BQuizfPr9RregxlLLhVQMjUhITh8
	 +o2X8jFCX5YfNSpdmkmKwhMlKFiPkgOPe2ovWoAs+UbStPYR0W56dLCeCGm2zOq7JX8Gz
	 7wsjHhOUebaI8/TIyIK+EmXvwdmSAucDG4+ckQ9WPfk+4c7WvSL26Ey1rh0tJ0sRnaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZM6AjIlVg/gGnQdBk2gKdzKj07T/C65iqx/fBS+RRF4=;
	b=AdLKNlZ2s6IJVFl0OoVGDXEheCWfxO4N2cgiTAYBNxChd7mClKnVouz2JMcYwnW6aRKm
	 ij9acW+onETbHDAk2y3oa79uyDnlVGiyhfkLX4qZ2Ehynrebh32ncn5vLd+ymYVz2U3FX
	 xiwaKl8TsiNXtlTflObSp7AwlEml2Tn9UfMe5O+4twj9cPZ8VmpEzkJq6ZBl1YQtvUZc+
	 158zTihDTFCQbvwR5v+JieWGvNtMH8WdALRfW/VAnEpWqfIJgNSeBLkf+hZJXMl/ChBPf
	 1yX1nIVn2OXV7clBpnebPyX9COQQ+Qyrt6U0L1hlxdaTf7399klilO4BbooohqmjQjg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276279;
	bh=ZM6AjIlVg/gGnQdBk2gKdzKj07T/C65iqx/fBS+RRF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JrjGr8Be3vUJBmKEAkm9tl+EUBHj/CgF4wDoF7UG9pmChHI3FfLFufodo50Suu6oR
	 7Vk570psq4euqSyXLA5utYpuSNrpq7FY2JnmbGmKGZjYuCKq2SfqtfaDlLE+uk7ZW9
	 xHQYj0z6q6DK23q6E4pbCBS7lQa0dDlLRSaGh317E8Exag5Kj0pMluf1nGbxQLbQ4Z
	 jSsz2rBjSsV3AyOgpudaHaELLgvhcUgQK6Jw11d35YGzy6iuxQe0BgbYLMqq7s1Mpe
	 D+/3KvDUKG0iOvlGeq7yuAbvUKmvxl5QaDogvmb9Of3JCR4cb4lwChwpFagx4NjHds
	 Losmrvx1mSY4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1754F8125F;
	Thu, 24 Sep 2026 18:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 511F2328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 431EB40ACB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIIb3VlrDPxQ for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D1FE640AD7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=WBpOfwO6FBwWNqCAyRhCA/KpqYSRvUYHj8QFF1ckwZ5zM0ssfNJp3B4Pcm0XiJWzJ20H
 Bl1TvM8oo1bIeqc6ekXf4IlfgVIJYCOghOkt7eoR+JkE7oeApMqOJJX9itkdOtSGIwplm
 T9MyXbqI05EI3t8O5xqHNVSQ66bTrDJu6ctTnnfVgngjzkvY5R8Qj57ESE78sCl2qpOyZ
 KqQ63u3OMNDZwwmxmldnTQWPAOUs7pbnbG3xe8vIdRrznoqrtUu2CGD0/TcoAbif8Epmi
 NpdvCnkR3iv1xla/l9FxFAq+OnEYmV38qI6vNBAPKdzVAIIXuXgFuM+9xBl07fYjvuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+wUOHvqNaX+G1/GI785nKxGnXxNNecypR+WLkDlqgEY=;
 b=Nb2xcV6HRj4wOjcKl4J8ng0q3lei2zFa4UdPCld6WEiWCODDhObRiugTRnW5N+ohJ0+d
 GXfxGhovEyzXqmLi6SkJUM/5UeXgoY6GcmhHsTSsMBsOXqwsJSaEHmw6cNOfo1CSdaCM/
 a/v66uITFDoOq1FneMPjK4UOYrm+hGf9xQDMvAjgTM71ghmtQdVS7L5RSE+MWesg4NmVb
 56KIFOJHDO7o05jZ50Fs+8pRGm9O6KmbfVloyWoFEYOFk2Ew5KyJ3NvCUm0VfXUDnmpyP
 qQ02XgC4xknloTorzM4oIOMG+MIHpmQhdumB0i3XhnFOnf1VNDb9pjeWdApw/hdY88A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1FE640AD7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7638E91122; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:24:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9e5e9a7c5dc5e066c7781698a57f9431696f9ace
X-Git-Newrev: 8671ebb501c29b036ad414321929f72cd25cf34f
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.7638E91122@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tensorflow-lite:
 propagate libabseil-cpp dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6108745969071005683=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6108745969071005683==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8671ebb501c29b036ad414321929f72cd25cf34f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_TENSORFLOW_LITE selects BR2_PACKAGE_LIBABSEIL_CPP without
propagating its depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS,
which this commit fixes.

Note that this doesn't create any functional change: tensorflow-lite
is anyway limited to ARM, ARM64, x86 32-bit and x86 64-bit, all of
which are supported by libabseil-cpp.

Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f5a2b355311dc877b18613856af3b26f401c2c89)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tensorflow-lite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 99d219622d..baaf5b6d86 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	default y if BR2_i386
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 
 config BR2_PACKAGE_TENSORFLOW_LITE
 	bool "tensorflow-lite"

--===============6108745969071005683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6108745969071005683==--
