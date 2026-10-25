Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98133606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R1hOzwNY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=gIVGzze3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7261760693;
	Sun, 25 Oct 2026 22:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uZfb-NvPbnh; Sun, 25 Oct 2026 22:13:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A1FBC60626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966436;
	b=TEmzdN8aSk76w25NK5zDX15pVuKdp5IYbkflU35fhWptGpvh4L7vhcnzQIzsF6f5m9s6
	 5gASd7lwF7BaxvXyNJp2w9eEYgVqHXUiPMqPTTR0+oHbhH9tsyGhDFEaMXjryKuYddA9Y
	 gBm6xWe+OAy8hjGaVU3OiZiPeK0qsyRsTUENlmVgua+k6NNsC6M7YUv6W3epEorUvB3ms
	 R4vkHQkLQREQh4Xi5I8hs3ohj3qttoFpiYtL8Lq/vxoDUF6kRvzMfZXsejW2dhnHEHBGE
	 TDXOAp+SeByqr97CQahhO8qHPYZm8lth77O9ZvZBv4+R948ohChb/W/yEu/SydIuI5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eiUS9bggJdt3fEPJtIOtC71Y4376ZVHfnT0oqxJwq0I=;
	b=kW8ECJyAYvOdxsTazvX7GCP1YBr99pazFfEkSGdRPbD+gGjBI7T+1B5ApmQqbu0TcrBF
	 OCk0HY13KAvSa1DJX7mQD02ifcIVCuunPd3ZZTLkUo0LV3pYn/zznNCzpU266jeWJDZo6
	 NUF/VmTeERwgH1V8ve34cgma2uiTr4p+4CX7ohqJXtM7MiVxH2LTM3xZ0UIYoTgFJh5ZP
	 L+gDAifZIe6/WBA9wUfvgb+sUOhX1jzxDGJoqubUS2LXZd18yOXEqeUSMAArS3sYJlsNL
	 UWSTCWk+osoLVmp/Bwoi8wV1Rv9XSUJ/+d4UWPImTyGOunaJHJyOa3hzeemLYpt66zQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966436;
	bh=eiUS9bggJdt3fEPJtIOtC71Y4376ZVHfnT0oqxJwq0I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1hOzwNYw6C4kZ6RG7vdXHj41rAUfRA7A74Wr3IW/7Iln00XNudLnzTXyYTpw+1CB
	 t1GoiePJBPVwlU3INA4N+csC21Q3rSNGVckmWjXobBd3iOVhttf7EwYCBUVNuINOxE
	 hxTu5hY6DPpIJd7xQ9XekxlNEMuQHjbrDopck7fiYFjMlNqUwOC6SSBEPDgg/OToyH
	 LQhEOBV1HB8KIfOIj5usHUpSeve91kZQl2mlWAusHixat7HGfIm4HPtFj708x3HiQl
	 fmhl04eBJJgOsyJ380lYLPoIajP2nwJg8Abux38avT2mBX71GyNLv69OoQNXvrTL6Z
	 2XTW6QCCrnoow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FBC60626;
	Sun, 25 Oct 2026 22:13:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59966279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FDE240057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU20-hv5Ld71 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:13:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 66F7D40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966434;
 b=MEiTTGmLHil/EAb7Fna8vG5pi0j6K7b+lkiY8nB9IkusivN+FWDPmdIeMF98jYu4O2qy
 TasQ0vM4DdsuEUU8mFuoFsPMruD/QhUwkboZMDCDL/bgxbt38eab7v4NiIBxo1jbCZyne
 k2U/kx1FiGLp4m6my8yu3oxQgCh5FoAYIfSwlSRrLhzK6Gh6pVUj6WVPsfd+GABDd1ea6
 wrfAyCAlpjmfELSZrWrz1z+eTgVRp23C1uRHsgS+TZOxR03GC/FLs9r/0Rw9eXMGWfUb0
 fG87b6KusoY8m1m+Zfdt+OksCxMBpKP4oCjZzQB8fH95LOrTqcp9pInSsd60Rc5Aqfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966434;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Y/5SUBtZEDiZrLYO2/+j1zqUg2aN2EE7AyyzbXpELQs=;
 b=iRaFYy4uRWq3Bd5n1xOCbxkFLgiwK+KjpH7d3eamFju6gQgViLVInHVyqvrrguasYHZy
 wcRU4RexpgqEhsD53CyL5S08S/nQ1yKO+hR3E72gDl6Q2OH5sPPhRhkCiB1fWuhuZvd6X
 aC0xEdB5rMAOXutVTYXJxi8livvKIw1qyR5omcYlBrm3Y4XYmXdT/1XMgy4RnGEhHWr1A
 cNkrqSOke4XsAIZXnAVzNtt2skzi1mlDzoFVo1vGZz1BjSWdCfZI75peI3g9+Wzpk4an2
 Ve0Ea/6iqskrVd8YxOGBoov2ytCUORfiJksRQR7FF95BCgddAilT51z9l0I0R5IKC7g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gIVGzze3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gIVGzze3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66F7D40050
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966087;
 bh=Y/5SUBtZEDiZrLYO2/+j1zqUg2aN2EE7AyyzbXpELQs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gIVGzze3u8Bnx2+Ru1T8Xf29n5E++snSMkdct0F7Fs4LpFUx2HRHc5lLSuZQ7OMfj
 0M875Or7BWhGvS27lDH0svvAy0ZrzI46g4oQLEv2BzfFW16JVMPTq3jcp7C/3uy2H5
 buFRxahiP/UX4/zyAshY9fMNjTd84Xymrdgv+YxTfqWooEII0pivnxEhoefh5+MhWC
 XYEUuAzaT6Y5VDgRaED1GJ1TdPMkCw3/TZlz5sy2Idrt5bF9eKptmENI/Scu/J60C0
 /XA93hEDUtdYjHLUI+KwnxECbjHW2YbPoeOyXjOT2I+GHEovT/KfZ10woL5RE0gL8n
 a6ptUrkOazfFw==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 NbJBs+jRM2//i+Tchj2hoSlPpKXIysxQ+8b7lfJ3+ymbQH13CefRot0seN+NSLPUSfbaoNCrGHn
 nkbmCyW/D+iBulIOj83SzxEJjpMQCjrd1QMQeM5vP1HifTgKdu1WJGdxB3QhzAQJn83ZHcH1NML
 MYD5GDwCEH/S7FNh5y1Hwq2Oe1SOzzVYPo2x3OxC9y6V1edWQ0oHLNk4pjXwm0pAHr3ZhvTO88i
 5fEEUUTMtXlV8lmWRzrhxqqlCTr9N6Ex/W83bYJRbz7DeVAHV0cn5Dngtn0PmIUaGrsGqvllJYN
 +REocrVDrPFfgap2vwPeVeHof7tH/Gu1Jdy9jxLefIGspWPvLLLkX7oa/hgAzcTtcloXSgnh3OU
 jSRvS2sHWwJd7h9fouEEn5qDW8eb8LOlyiRUn067zmCk5KAOMWNdMWYSFVYJiD7BD+cFNTuUaiz
 oYBf0KdvQIQc6/rTfGaBdI+eIZO1wqBreTdY4KUmtA3hb2NCJ3pwOdQejgl9mNoFztXrAp5CHDd
 UhUjmiLvPM2+PFxBLqvI1kpmxvUBKmlqTwyO0gDuhOyqOq6pqKJqXFf56tmew80oXAMK+g6s2uT
 XbEydauxT4FbGF1/+CvUUBvMhBpBew==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2A301A4C6AB8;
 Sun, 25 Oct 2026 23:08:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NF-000000001fP-0PH4;
 Sun, 25 Oct 2026 22:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Sun, 25 Oct 2026 23:07:20 +0100
Message-ID: <20261025220723.1332924-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 31/34] package/docker-cli: bump version to 29.9.2
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://docs.docker.com/engine/release-notes/29/#2982
https://docs.docker.com/engine/release-notes/29/#2990
https://docs.docker.com/engine/release-notes/29/#2991
https://docs.docker.com/engine/release-notes/29/#2992

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 8a69b05335..67f4c1195c 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  55bcae5053f0914118d229658e2ac3a877dbdead6cb2c322e525d0c1e8bf78d2  docker-cli-29.8.1-go2.tar.gz
+sha256  e3b1fab5e2ee2d6b63b8ce0e8bbd08d6f54c0537c470332f2c345ab997233409  docker-cli-29.9.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 36cd046769..563f4c851b 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 29.8.1
+DOCKER_CLI_VERSION = 29.9.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
