Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F66ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D555A81222;
	Sat,  3 Oct 2026 08:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTolYp7k3UIJ; Sat,  3 Oct 2026 08:45:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0001381231
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017113;
	b=eg6mIG5wdfNzk7MXYpMWDITjF+tKK6rKUVLPNZQFeExsTvjCAo5xPGBlViOd4whhm1t1
	 Mwg7OWolLChk1QBvGdYWNpikmEpjarRkHd77WVWJIYBE22vFzyzbwhyvDrCsg28xtLMuv
	 5sc2wW56MC8KNhXITiCmfQeA/8avYw4XnPgiMDl115QmOdJgmzar9LmM8lYEdDERVBr1p
	 7gMKzpubJSdYTUdfuK8UyWzfI+lVGf+9hjDaaILhkPktKiUKBceOMWM9rcBm3T9nraMpj
	 Orw3PmXfDhTFgtcS0X8fuM26aEttsl6LqLNqw652UvU415yYuX6THRSrXdX4vLubv/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/gyWN+F9Q2sxrzIRvyhrWu7HHDyheH1QZY8tazRdeVs=;
	b=BFIfVPE5lmUkqmTxqnwzDkVMZWJEl/owvu8u5mutJYFt86Cj8i6I6LCZg6jCHjvmBvCL
	 BMTDBhRhgLihspxoY3JHXp6/wjEdQ2D8GlJFpkuuOil+12SASXuzcL3ScO3n/h+UqJplp
	 Jtu6zd8WFBae/UDljsBPF0UztWJpdTu0GZv/23lecnNiujMG+V1GJka86HGlAm9XTFFv5
	 QHRc0tCnZfz4rfY/h2p4Q7VjcdyUZy6pWEVYXaTfo1WfFotGG/iWLAdUYPXXOH+o8oYzJ
	 qocOB4r8S4V13wx7lBrpwUVLUsQdwt5FsTy8fGZBEWc4RYaUVg8DJV9TtOMkHM2aWyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017113;
	bh=/gyWN+F9Q2sxrzIRvyhrWu7HHDyheH1QZY8tazRdeVs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Psi95EsbWYg8uCORrU1f/2kIseJOzSY7EJ0+XEiMqJqPbK6s1jOpgidmYkgl6no+9
	 Y39gD46QVFS/Gv/neV1osZizNdR4gH1fiIn1m+jQEb3WAqHn7VxMmdZfer7E+Rw6UP
	 YGUICbVF7r1L02SBz+Kw1SkaeVGMs4qlqQhKdDAKSUCAeHceZaGvzMYA7GOUYBQkLT
	 3jYP3xjQmGBRL32AmLe9ydhRcXXIyNOCql7w0eZZ+ZeZBVziOHuO7cvLWmnzUS660o
	 3IdGFnGA/v4dD6ZQKm++XgwkGY0pU8xKUc7xUYqIXn+tt+jmfbcTj8x7gIF0eb/jRg
	 dHnoQYA84fCHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0001381231;
	Sat,  3 Oct 2026 08:45:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B437D2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B70400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSNO96Wv495I for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C00E640070
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017110;
 b=AO4qSlfAiSTyRi9Xc9WI/yYd99ZGr3XC7w+HVzxmLrtECSiUFraC8fnRprl59mhJskXw
 /2++2Dx7KvYQbwx4VSmiRWI4KF8PPgEdmskMAzfYG0Xq/HVag4iwJOv/C4jBz3bHIRmqW
 HXozSSissrxCkA00yrhJQBsfBRGHSv0u9MsQtltF3jHdIex3MyWxryneQW0w+b0W4rNbX
 YoThPtWoeOwJ53VkM6BXfQ92vARCItp89RlzXwOKbfdSNDiF173f5LClpReW+dmqGtf0M
 yHAYXi5Ee6zS2LB9Ykwe7PqfowC2+2Mhht3rU7NbU7kO+F25nUEBSyWKYwZs1YdZSWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017110;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tl9au96FHNgsFkKAGrYUSOBTLXayz7XJd5ZyD9YxLTU=;
 b=JJlAxoa684ffbwT2CyshHE3/ACiO7aS+g4BarXOIOY3xGeMlBgfdU4PmCc+zKctUncFY
 T4mDB0qkRtacOwVC7NzawdFfhuBwaRodWvzdqJYuIwsCl8Nhmkk4HfJmxh+V9Y4RBEBmX
 /aTeX148AFGF6y7kf19EE4Tzzv9VX8Y/I6e9AGirDdrgXYSiQfjPRM7+BjOcGU0fOORxX
 4KnHoQrYfRbHlzkVGboo++UCvhaXhbqSL2tHnzeVvI+S21+ZeG+mwNhzNRSz3fmxWsgGC
 tMbSsM8KuyOcSlcHAJoEPIuxibWM3HxBKqtLhuIbLqPHqfNec2pKsEaLUY+Z4cWlRvg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=E3SgLiEN; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::d;
 helo=mail-oo2-x0d.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=E3SgLiEN
Received: from mail-oo2-x0d.google.com (mail-oo2-x0d.google.com
 [IPv6:2607:f8b0:4864:31::d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C00E640070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:10 +0000 (UTC)
Received: by mail-oo2-x0d.google.com with SMTP id
 006d021491bc7-6d33d80855eso446719eaf.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017109; x=1791621909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tl9au96FHNgsFkKAGrYUSOBTLXayz7XJd5ZyD9YxLTU=;
 b=E3SgLiENoL5KmLNaxWwOCAYpVbQ0u0Oa0HxPOEo0PxP4Gu0pIBFKviMTRJdL8xUgjy
 4xImWHuSvs+8OdEYcSSLY1g7XVaBvoBbAkSg/VIoYThjZJgGQspWoMDg/KLJFMJFlbE7
 zbTJQ5b43+ZKGH5+XHZK4mWKWngFiYUd/rsbNUkghQNf54WJvnRSiobfO+4jcqD8SHiz
 a+KTsJyXzGTsommDCQrLUrl+4TdZhTsQlZKFVESvxQaRlPVX7/nMbNPeXG3OrQudOdM/
 2BGJkq/LZhwgLuEubQWLdJf/V/1wBFdQ2UcBv5WQXXrSOwais3mNRE0AcSxAMjeuFli3
 04oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017109; x=1791621909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tl9au96FHNgsFkKAGrYUSOBTLXayz7XJd5ZyD9YxLTU=;
 b=fRM85IWI2vJtBWdfFIOEYzjqU1VlEwJHl/C5c2QI5KqmPEMVoC5M1EVduBZ4/yuRgd
 8OEEWJZJwST3X+16CVvhCi9jKowM8xInPptlhAGQHxnuGkUydASfsMQNp2qlHMykK8zU
 oYdLxcp5QaORHxR/kEqavLhjKdBCMofOfqaVTBhQIrrUAEOBRYiaQCmB1dmsY40cinHc
 X7khQMcnEZYkc9IXGLHNnCtGBhTaIuVksViltcFlnaGQ6rC2dc507WKQ87lNDMARyjLd
 4+dN6nyydxyvsSiwIVAW5qvZbubMOL7y4FH9m9tGqDGaLJwTCZWUmLMkEIurmtxb9t/p
 hTmA==
X-Gm-Message-State: AFuF++naN9pe8V2jFSZoq9heE+SKIAbfFNsBN6uNlnxa/gT0Dac5w0io
 1rxMhYwe2tiXpDydlQ+1Hman+yF83TBC0B5ub0zXa2eZ9XrX4EPOLxf3yqsvOg==
X-Gm-Gg: AYBFou3sTtG/iDCtQvc3F5ulo1FW7gj+84C9TJw438I3zdVZKDdhCIFlc/VCwexX9uH
 fBXv6CYF4s1dswGwZSwaefQUickUujsRKvTckF3pVxQqEjs4YlUza/Koac71c7XjXYACLRz/qZm
 iKiDayPL7rJD7ph6Bl2E0Q1+OcJIR36YuWav6fZgJECqEHcfN+CjV8rErOq6Z6DXluBCjKXodQm
 EpJN/0kFYX8lluXMxVlF+9ocnHdDaQkHfMgukvwl4WdHI2UGHiYTYNqUxHfTL+pH1JjPVAY6mwN
 QwLZr2Q5HGMPgfO6R38mz5ckgUeUMe1IhZfA27gzCWK0LdSX9gC0vdAJvxrQ37j6RcG/x4rmjUu
 55+hvAJHXQg1YMaHVh4OlftC/SnjBwoQwwBt9Zf1f6HlDzPUzg1TsjJB9+FvCe6YlwrdK9776Q+
 uNLTCx/ZoQDPVT3PJmkeufbIaJSfk5x6znr6UaHcPJk/9z6EZf3qWOSZedPvBQcUWuJELv4srxV
 0KS1rTJ/pWAHvvW7VzSJ/HjNRdke1Zl6QPAxUhaBEhmNlIBdWdlS5k6lYSzOUkcejbk6PpH7ASL
 RJCM9eVH/vun4TcuWLHBMsfdxW6TE/H0ALwdzVl/rwXemRkvoWROGUk4zkJY0zNj24NoUibzFci
 LYUk57a3yvZJb9HqULGHODmSveZldz7/duCQXX0vk5A==
X-Received: by 2002:a05:6820:1387:b0:6d8:171b:58ae with SMTP id
 006d021491bc7-6df2c3f835emr4977891eaf.0.1791017109160; 
 Sat, 03 Oct 2026 01:45:09 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:53 -0600
Message-ID: <20261003084453.545653-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to version
 6.0.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 399cfb707b..f9508c7826 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  3900828750db0cd4aa93fd9964d533a0  flask_cors-6.0.2.tar.gz
-sha256  6e118f3698249ae33e429760db98ce032a8bf9913638d085ca0f4c5534ad2423  flask_cors-6.0.2.tar.gz
+md5  2dad2b346839f6a55e92c7fe4c24aba3  flask_cors-6.0.5.tar.gz
+sha256  30c5031552cd59f620ac0c8211dac45b345d3b2df310e7721879e4f46ef9c601  flask_cors-6.0.5.tar.gz
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 5049371956..4f16ed0dfa 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 6.0.2
+PYTHON_FLASK_CORS_VERSION = 6.0.5
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/70/74/0fc0fa68d62f21daef41017dafab19ef4b36551521260987eb3a5394c7ba
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/47/03/4e464a50860f9adf08b5c1d3479cb8ea1f12af2aa69535c7042c6e628135
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
 PYTHON_FLASK_CORS_CPE_ID_PRODUCT = flask-cors
+PYTHON_FLASK_CORS_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
