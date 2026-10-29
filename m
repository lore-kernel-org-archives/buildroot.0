Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8840606A332
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oRPC3+aQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B055240B3F;
	Fri, 30 Oct 2026 14:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTr6csuqTjXe; Fri, 30 Oct 2026 14:06:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D4B3840B29
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369173;
	b=EhbOaKUO+LRQTTKVbSqSykNAUnmbXUcslej2MtvecNDJHhYuhryyTMVsAEAnL1L1sj37
	 v03JUjpEfaCYzMeOh6J9T+Igk/A9Ly60uqx19QrAWQ2P1aO/8kBp3tDDbLqXNfjhvmJJN
	 9wQ1s641hYU8zdlOKUA5WHaaExV6ec22WaKFvsfK2CkB3gseQEmz6afsFawZ6A+JZlgD/
	 stMAwsrGy6Gm4UVHTKBlXurxdNtquwXdL5fDGDsVwP3JufGj+KmgjFUHFQjeVh7mwJOzV
	 R2TX/LkymSHPaVOA+kkcfXhUuQojQTvjqCa6c1Rizg+nNlF37Oh9gpm0S6IUtjOM2Nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qEvwa1xEldZWnKyz0AAFTE9orD+Rf2Cii6RdTvIAcos=;
	b=NRk+cnBk/7B+L+W/F54Cvigkw068Grnye5a6apNfzicjXblwX9pp0HGPCbXKFuWyDIRH
	 KxteWI75tIwTPY540q12FEf2E5/OIOAHPrkabsl9fvVQ/o2zrmrjJ/LlrYJ1iJ1ihsF9N
	 h7ZW56Plw9Y4x9b5gBVeMtNsRycqu5wJX5DGgv4gmZGNsPLjzwYcmcOunFpawob0dyVCW
	 peEhlClvOBG48QSUrO4DlvgEck494/BCJqebRveXd/gXC7whXcvYlPDcKqXFHF4cb4GMk
	 qNelpuLi9kpIRN71WiZqiHSsl3Gqve+5Mk7JN+gM5lmNll6VPj2EnemFK3GkH1F052Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369172;
	bh=qEvwa1xEldZWnKyz0AAFTE9orD+Rf2Cii6RdTvIAcos=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oRPC3+aQZ8v3Hz27qIzivcpms6xz8IeZZ6xUP6y98b1kEsn7zuaHxcVdwIJM567i2
	 p3sf9LPBSx8sdzQfHTQxcDovmfna6Z8tUBv03+WL1GNyAqi9LhYs2aMMbgvvt2GTHU
	 D/sTmdi0fl8iTG1lQbM4E8nyYvHI/BoPQB4CWcyX8aYWwBWu8ugDkA2CXBe9JUQ/9U
	 r8o/A5AqGLayeNSBDnVo0Pzr8kP8inXsJ8a27ukEXVm7hJiEil/amZDTjSJ2x4wkm+
	 xaiEpE5cdgFEp5k8s6ZdErfR83hLy7SOPVIXMK76XUxkO9jmJ3qmKueGkopByKVtVr
	 lmMAY0UA7miWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B3840B29;
	Fri, 30 Oct 2026 14:06:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46637D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D2C40AF5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-A40Z71oABc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 364EB40B1F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=MnkaGu+cUrt/ozBNo7grlFn56BMrq+aoyn4t/eEkWTbaUiXrv/ozB53Ntpm6uYBU/8IK
 JFDgHjRo8jk7+po+vk0tvcm/hQarn4oiZuTyRL4rlk8UavYwmndwvnXNbMrlTAesMdhtX
 89W9eGP/e6A9UTQBaxZqW4u9Dq7CQvSLkNBhG3lB/CPrKWER/emgpLQjMAok8caM/rbOY
 OF6aQ0uckudVgQzA+YZz97KTHgdnypS3feY0EUAP/5nC82s6b1EforSvHiBiOkDCUTCIp
 IH2xhQTeEmW4bk8ziz0Nr1ImAatwDAI9pzTxq3KtE+9rTF8ZBVu4VyDLYpzKVYdSXSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eHlUr7wIulG8zls86MdnA/ee6otpDAVnwynYpToV9mk=;
 b=KLN64IIvpenNN8fU0CtjFb1TlWrbiGeQfpAiPNtF3kpGUx1cRwDKomMbx5nZJQIG+y1h
 CmMrw5QuyvviBSFKzuT3whNc24oe97kSMjoIF3shtp8ptVL30ho4lnRoTPYfQ0bnB4nAx
 xM77LER6Rq8fXVRSCgP/QNZtbiiepy3X9hgxACv5opTEcs9VYn5kc28WgVRLZWsXuHQCs
 p1pjbMth7NnuH8bKlGgTuc6qOYcrMF5IgPgRvASmnS/6hJXdwAUtGwDsSFF5DftK1MI53
 aamMfftrqxx4bEvVmGpKPkseEPxJhIBTAvQ0fp5GZ4CLQPipYXXyWRCLxzb639N07aw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 364EB40B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55ED99D389; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cca7d89e3f2974738018446dae010b27e448a96d
X-Git-Newrev: ba56b3bac54a635ca70ef46f5d7e4261283df789
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.55ED99D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/genrandconfig: do
 not select fmlib or fmc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1504289181445578836=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1504289181445578836==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba56b3bac54a635ca70ef46f5d7e4261283df789
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The fmlib package contains kernel modules that can only build with
NXP-provided kernel sources, as they need the fm_ioctls.h header which
doesn't exist upstream. Therefore, there is absolutely no chance for
fmlib to build in our autobuilders as they will always build upstream
Linux kernel source code.

This commit updates genrandconfig to ensure that we don't generate a
configuration that includes fmlib. This requires also disabling fmc,
which selects fmlib.

Fixes: https://autobuild.buildroot.net/results/7fb2b2808c4f122e08ca217f34c4d56a2b1bfcc0/
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b38468a4713c69bd4c11d19fbac1bff6c7638e83)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 257b1f853a..db03af83d6 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -517,6 +517,12 @@ async def fixup_config(sysinfo, configfile):
         if optstr in configlines:
             configlines.remove(optstr)
 
+    # fmlib and fmc cannot build without NXP-provided kernel sources
+    for opt in ["FMLIB", "FMC"]:
+        optstr = 'BR2_PACKAGE_%s=y\n' % opt
+        if optstr in configlines:
+            configlines.remove(optstr)
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 

--===============1504289181445578836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1504289181445578836==--
