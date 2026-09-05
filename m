Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683DCC624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8931560618;
	Sat,  5 Sep 2026 17:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONUS89kG91lS; Sat,  5 Sep 2026 17:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AB4D86062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628029;
	b=n4wsj0RUQ4xgp/CDXrKmrKBFPBboI3XpQxx4koEhzYKzu8/Vsq2ydawb+x94IvD7L6Vk
	 h1ucZiInc3Iu3FngOk3pgnNbMXMzFlXODzRlZjSOGaesZYdiG9z2DC0JqeE3BiRAELMU6
	 FsN2QTXOMnlw+d5YSmxk6dqM/V+f91gh/jsgWGcIgF186oXYdkxGUe0XEQolkfNyCsOlc
	 sI3Z475YsOA58mB6LSC3Vs5bbCC6GtODeNjtvnzpTm0PPbBsFWEAYSx4ya4DVMUSBhMSb
	 N5MdJGF8IK0MSdcCmoEiljjkK1Xz4Xio7n+eIFljbJx5zsEVBS+1eMDmXEO9YZHnnEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628029;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=58MHubw/oJr0Uyt2oEY5BMJ8rDZATF00atL0zUd4aXo=;
	b=e4BcwCO2e9SwyYXyC/yXFE3+PPwnv680ilBtQIf4YwwpwcNr7Az8n0ULfuTl46SSe827
	 sRvayX8/NERlzZwM8Qh3woJQn9TXShV8QrFz/0psdgF/wiWm8fls64IxR3AbDxjo0wEkk
	 y9dWCeWmrhHrt4kAclalX8kSvTH8mcd5nRqgD8v/kLAZ76pBr6jL/UCP4COlXhj5vcPAw
	 jxIA6ocKjOFNTrNw7c4jn9z8izpmTuqcX+Ru6hAR2v1Ghjz8vrCIm91XnmtrC4RPwYF5M
	 j+qrpMrQNBt+s4WbLsnwyu+jWS6YjCFJTGt6Bu+0Q4xEiLkI9qWZdfnCf1tX6hPDyKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628029;
	bh=58MHubw/oJr0Uyt2oEY5BMJ8rDZATF00atL0zUd4aXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zx6eS6+tU7WfGX+EWttKxNmZ0wl7AOTe1sOaJxC7x2ldhY5d9eeCCpG24LZvNQxpS
	 Lj8+nHXrFytLvgfE9CzeplNXnjxMq1R+ONeHiQEklljE+nH82XhyeULVyJXSnxyaeu
	 6Hg7bInC38aAFz92Wgvj7VmuJ2NbF9o1BMosZQD2+rSMXyOS88oYfzL5yQrU4wfZet
	 6TtxgmMjL+aWcY0YCQGPAnRwDiqiKDFcN8GgBGLin0cJo5SA0bnVZtM3Sbx+8RO0/j
	 l5tywRSJhOElaOfYQP/N94N/5TtoQsBviPITq0KnGCt4i0prX1JWIsc8EgIHa0ya/G
	 m71LqIZpYN1vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB4D86062C;
	Sat,  5 Sep 2026 17:07:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 264631F29
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EA23810BE
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFdMphPdbeYK for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 17129810A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=jjvovWoRxYGqp30PfQMfBT/nGC2/nc/lOAjlahUzXdzGFAJICAHHzfEqGLEeuuss49wI
 OyHWPsVAnuAMcyjdodlokXnCdt03vhaT3DkfmNLKOe4O4P1tQsNpVdpRC7Ea/+XhE/1vR
 Po7xCrNFlVqVMU+8VwbMlmFt4zQNF8lTRv0+07nF2KA0v2aSgB8JI8u1iKXhSWiRiVLr9
 EeoGr0Pz9zQ2ibSivWTvWMTwj0iRI48EH/g/R/T1zKcHbMVBYGmee8F+aLI/9VKf8Dz7B
 Lgofhy7sieL2u4F4wgT+esxEQ1icYnfhZt3aK+Y8I00kZJNisAr5aClvWVCmJPVx5Jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uu1hNoOvvxcA8ZyhF8eKkmRSeHEGB/LUufq0D4N3ojI=;
 b=YrOFuoLJ62rxbXrHKctRUdFmxg0W8k9GPZbailgxF203/RsD8hEQC77bVqk/OOw93ZdJ
 7YiZjPZzc4l/X5zojMEyJXo7dT/srjNf5TDCii0V/na6ytz6lNqGOvnYE3LuZ4FJIOC40
 2gZjQKK8sa3TCSXD7ZFTUxtFnYVUBHuj4SI8vhyEnoFyMrwAR0yDnDsarRXxA+3KhSAQR
 cENfw55UtOLL/W4WAvoTF820NS373PQF3hBpdAf2xXv6Vl5C+hPlciAOGHBkXjMVR3lRO
 yLhQ+k3VNBNG/+YBtUrQI8mHDnRwZAKgAl0foFV2gWUWxmOZivBG1FbTmeiknhVo2vg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17129810A2
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0CEE95264; Sat,  5 Sep 2026 17:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0db52966bf06f2ce2d0681a5f76eacfe52ba5ac
X-Git-Newrev: 64c94ae8846a586ac18762084a2a026e7ecd3c5b
X-Patchwork-Hint: ignore
Message-Id: <20260905170603.F0CEE95264@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-utf8: bump to version 0.2.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64c94ae8846a586ac18762084a2a026e7ecd3c5b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-utf8/lua-utf8.hash | 4 ++--
 package/lua-utf8/lua-utf8.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index 8973b4bffb..1e56d8b5cf 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  37901bc127c4afe9f611bba58af7b12eda6599fc270e1706e2f767807dfacd82  luautf8-0.1.6-1.src.rock
-sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.6/LICENSE
+sha256  70c1590a6c2cfca417755b0bc79207bdfd0b469f854bfcc4e2cc5a39b5e3e3b6  luautf8-0.2.1-1.src.rock
+sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.2.1/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 991ebfa2f9..c15967471e 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 0.1.6-1
+LUA_UTF8_VERSION = 0.2.1-1
 LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
 LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
