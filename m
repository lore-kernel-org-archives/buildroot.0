Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8ACA5FE6
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 104A18135D;
	Fri,  2 Oct 2026 19:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoUzW09Dl2Dv; Fri,  2 Oct 2026 19:59:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F1B88135A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790971176;
	b=LOBJV/1xnnZXYP5kQSjyR6BJSUekFEgjdfAq/gcwjtuit0nNMRe1ivb2TmdtlnZLpYyG
	 KVr8WCfaJngOI3u3qYjTux4597E6ExFSp2vmzs58om7KpyneTrk1W+JPAZcR06XFEfm34
	 jkIeSTuCsSz2DEqSfYURl4gHUTcJ49MEYudCuy+2Ym+6wRswNvt3rZcx0qA5OTMn0Kxnb
	 YGsNaDtuso6eHOnKtJDNXGj+7CcoKgFkJ8pXuvg3QMjZmigvS/wRlXnqgad0fKv2Svomi
	 pES3HbLycLZVurGupQEtcuLcJ57yw75QAByyYloAZxZeyrIWJ4NsUDqdYdCg3Ndvq6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790971176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Dl2fNBcAZnEvx50I5vI4VkrUkIwRr7Z4I0ncoOZXhgE=;
	b=MRKqWJPBhczkjRAZw53aXO7jZ03KfJjQhCzuw6+Uq9zTK/NNAdIt2a5S35iPjQW8P1qu
	 yWqd/I96DrTOKE7fRqgp/7x/Wta9e2TO7+iCzsDTM2ptqyxqUQyGIkUSYBGFFXKYV+ZiN
	 VZ5aUUqZI5UzfNu16hYuvo4aCGA8d+fZf5sNDq+f2Rm8tJm2ZPciAg3NENcpDtQQwPVDX
	 qOi1ajeNKQDJGma6Aa7438KYX9EzDvfJ/vKiuJ57vbYlhIOJyvRPPgFOBdL/umGWvAVzh
	 0jwglzH6IGtXf+aRwG1Yd88oQMIbRbCSAjMWSO8v+uO1qE4W/NTZWcVMHUv0kEbE5gw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790971176;
	bh=Dl2fNBcAZnEvx50I5vI4VkrUkIwRr7Z4I0ncoOZXhgE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U9CvFd7kyLuiiYY5ygwGZ4LKo4LSSLsEzv/CohUNa4WxQw15b+EKsD6LFvag+H0QK
	 9DMGscBvTJ+4ClHHHYRWBR7sjxpGsPHD3DaNS8JNPw5ExEfWiwOP6IEaxxFXrM4r6N
	 Rn2eH+j3wEBeoQC5Gp7DP0wtNH7NIypcioAcJhBNwet7wI2Hv6D4tv9Cooj4JaZN7i
	 Q/GCGXtjKOm08hgnE9FoIggW7D99lRZcZgWsTlvHZlEwGgkYEY4iMJhhLqeb0/57FI
	 tRKzixFszhZ6zzQ2JWr02zYKnQWZBgWp0nTbzR3lkrlAUxY1/TYnYBtv59MpPVI/0e
	 mDC/hEB9Dw3SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1B88135A;
	Fri,  2 Oct 2026 19:59:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD2D435
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 517AD8135A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i11mKF9GMTNb for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3874581348
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790971172;
 b=B9MuKDUJpZ3NCH0XYeNHXHqg3NGkfxvcKLo17HjsunSGAL+D/lR0hgHk3lll+hcCJ3Rs
 yNL3ys71q0fwf3wEgILxYfUnTgUy+0/yE8faoou9IxH5pB6Ltd73J6lkKWCjVNOXn1VQg
 Tf3qAji3bI5O8YhVYtsBHs8hTQ8IJOXn3wIy2DKXD+Ll3jP5P9v/coP042EbE0kYIoEPE
 OREteENuMOee3FmiwRW7RqPPxVfZlnCKeAtcIJGA1a5qY59Y3QIzJFiMKjhaNAZ3j5BId
 bcPrnN1ZZmjXq0AgVXUNaQftBy1vypaQ0WqQZeWHaw/VbxODk5cCte82mk7vATWuIfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790971172;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IZ+y+pOCQdUMJSYUzYIZlSIKrZFN+j8rIYIm6XIvtjk=;
 b=MIUSuNZoFE2OADoGqNoo4riERpY5CtR43u5y9St5hPqFyve8NB4Kud0J7D3ojY+7+GxH
 ywKewGh69XrRvI7iwmnj9oURI45IHSiHo4kv7j+9DsfaSnxGyrt7BVau2We5TEJqwz/lr
 m1NZbCnCwH+z3Qvknlv18ul415thYpxw3/jgsUtf6+x9sd77WXoWoDOJSKiunrHcirh6Y
 +pzD2nBAElBX81feng8t2/kHt61PVrcjvsDRCh90uVW7peq2owJK7h2USGrPnT/2/glcM
 lir21wpDqP4o9ucucdAtV28FKkraSXS2ftr6EH4l8WIU5gDcoGlALb2vKVI/bivCbTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3874581348
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:59:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D77B6886BD; Fri,  2 Oct 2026 19:58:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:55:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2005938aed8798b2ce2df7733dcb75394b2d6b7
X-Git-Newrev: a43f41e10cbad241a6ec693e041446206e8928d9
X-Patchwork-Hint: ignore
Message-Id: <20261002195817.D77B6886BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 21.5.25-Omega
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a43f41e10cbad241a6ec693e041446206e8928d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.25-Omega
https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.24-Omega
https://github.com/xbmc/inputstream.adaptive/releases#release-21.5.23-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 4b4768af82..cfd0b62fe6 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8c9132597fc5d047657f10873c09f9f6837b73f140b7a59b8d72929d37fc79f2  kodi-inputstream-adaptive-21.5.22-Omega.tar.gz
+sha256  c4a458045bf4edfe51a1f9f03ac777c7101c9b00e0e72c76ac51a2b3f530779a  kodi-inputstream-adaptive-21.5.25-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index c03c8e81ff..8aab0c88e8 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.22-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.25-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
