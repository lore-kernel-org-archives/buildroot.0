Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C67606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TqWKW10z
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4A640CF5;
	Fri, 30 Oct 2026 14:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWRjswiwCXQW; Fri, 30 Oct 2026 14:18:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31F9F40C08
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369905;
	b=qvx3sKeQriVyMEn7rf74EoSWAuBlE2DlsEzpaVX5wsI5cfFMrO0GouPRrpOQNfv0SAuz
	 T8NwaEdjzzuYWFawH9lZRrfr7/R/wlF7M2FjPq0TKuHjBMHXzKp+eqC70vgJDUjIRuJwp
	 dsUZJBhVle2eD8DvS7DATJ2T7ZXcgEymePI3xKbaM51VY3NhXGv3LgTf+D5eJtx0O4zaJ
	 A9dgBkUnMHdOxkXtgjzzz3GsCAcrGeY3Ta/6u8zeDNsr7RECHqw2wrUloXQSprtOevks2
	 brjD6f9wmrB1/LIuQOqyoy5UwXy8vjM/Mu689ZRydrwjr1AD7VD0xyI2JzQCsYkkPPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zGT18q9MyM4lGZey68VY8tlQotC+59dF4U9rffVe2gI=;
	b=lo8lmS6Au9Cng4+u3iNTvgP1Tkzc8ezT3wkWyfzWGYZr7QiU6i/rZ5HXmGmzsKyMXPSk
	 zj8olye/cgYviLQc4GGdwsseFgzjE86C2iSyNcuvJ5eKn3zXk72KbHYohlnKF+iBrvc3u
	 2ktnQF00Y0/URqdMnqKkM1/JrCwKx1rPY8MkodkGNvFuVB+078VPEo3DOjmAAwCQuxxQW
	 WADOTLk6TVEMWTuX3QSt4tiRdOwuqJ5ARdmZJuRT5k8K8pXBXHpJgjOm0dT+O1TiuMm3+
	 vwoAdQ6Jm+msV5zfGhKFgUQx5HmXongp5fMCaIMqF/a5oRAe00wji6anyez8UG7P4EQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369905;
	bh=zGT18q9MyM4lGZey68VY8tlQotC+59dF4U9rffVe2gI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TqWKW10zgCHJMN1uf5R7wv9ulHuopVXAbtF49QBwdADuBKQJOveRQ+trjrA8vonig
	 BgjueY+neBD9m4sVy3qSKOt8Tztm3oq0883FK7QhHdIpdABTBXoRZ6iwqEqbdBfSb5
	 vplHpDf/DkTq2gdZiWY4pCsYCx+20JuLpdPL6767cUqmqqTPRsZkKm1kJp9Jdx/hqO
	 LuhQZplHrs8xrFh6XkztIHHyimQfb12PWA26VREbBAMUCj49KVGAIqc2cvG3m6fS4A
	 fsXoFDKa1FI7l1JRZmBpKwt+4TdjMmVPVigzC4pcw/yHBEhf3fPiVXNFTDU/2Q9S1r
	 geGqXw/xzbQXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31F9F40C08;
	Fri, 30 Oct 2026 14:18:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D638D46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E078812C1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2xZlNCOHLkW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E371F812BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=VRHIvVJQozCy1CR6IYh+DBDxviHNybXFRH5Y9C1IalInJDKkdFeO/m3HjurZDG+K5XPY
 6nhVSvH7LSQGawPTWj0xnMqaS7jF0trc9qFQfK+j9q0jyIVqw4rRRxakee/R6mA0ZoPpi
 T0PrrEdC3koOKd54DzhTjsczArEQgADJaMU+oohEtjE0NlAYCKneIOENCWR7yA5rcrRVD
 kfUYm12BEw1yscO6Egkoq1ASLYP/pD3dees7mVV8QCKoF7GRbaGdIKeIDDuflxD76Dur0
 oG01rvK1umoeYNxIEt9+dFo++0invP0EahFPF/HWtTXibP6ZLUOrQozFkCiEMKfw8ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3wqH8+9q/uSP047NEXw9eCVwF3A68jfNNUCKC5kSFog=;
 b=RcFXhEAiqbPewH2jnRcSZysqxL9owwCrxi8xpgGXibKg3bgCytHz9ln/NduqGHPRsCE9
 RzCA/+xHyAlhpP615FArtzpSO7E5xSso0zjlw2NQugDDTqGNpBFMBJmiQq0xIZYp6clKZ
 Vs/zWD+Ke6LNjwHMHt6PJuFQOpRJQ3bN96Qg5rHOLRXXaSfc0Y0UHchEuatlXLGvEsxYL
 OZSiR4quTdpfOQLicx6lkO8h0c/aazgtpjyYkvTKIul0tS5rQ4hptWmR8SWJaRPKNc4QK
 trsPUy42/fRzNULNce1U89fUtX3P5bBOQN7AHZWLW5evtauGpGeDkdSHfAZE83EwyrQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E371F812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E81E9D38A; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c5b485cf2491d3324818aee65495bedc257a53f1
X-Git-Newrev: d221b13de08928b175a77610a7942abb0572f132
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.0E81E9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/genrandconfig: do
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
Content-Type: multipart/mixed; boundary="===============2089970194899561295=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2089970194899561295==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d221b13de08928b175a77610a7942abb0572f132
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 597602f257..5cea529354 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -502,6 +502,12 @@ async def fixup_config(sysinfo, configfile):
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
 

--===============2089970194899561295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2089970194899561295==--
