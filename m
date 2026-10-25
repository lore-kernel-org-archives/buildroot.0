Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24564606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V0h+b9Ta
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1BD0405E6;
	Sun, 25 Oct 2026 17:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id al0HpwCf8hwP; Sun, 25 Oct 2026 17:04:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 57F6E405D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792947852;
	b=CNxoqlcGEdc/SzIaYdAgpuqaUqTe1HWBXLH7ks4eNIUl3Sj4IZ2SXANAu4Sy/SC8Vcv5
	 ME3hXWKL0oHOy7BTguV5Nw1gzwC9AwMqckESMzBqafx5U7Ohqrk6wLry+p47I1fLNyFkb
	 yvZkTPqi/zS15EdUxTxVXTAQq9NC5tjKWoEE7l+/8CbGtLTKQuxE5vlzxJPpg7JLBHkEj
	 z0ImEggQ8n9uSDhQP3nZ1tjWh2KAseGLt3mRkmLTGDyIB7n41V0Zc5kgiVe53L1Gwc1BE
	 Jv+UKxYr20ezsvMVwC61PnVQ+uVMIm0iNj7ZSXgPHk8oTL7P86dsnr5uWLjtC/Uok8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792947852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=E3mvmgQgXy/hg18kbOrWpJistuQJPG3oJLI/jap5WpA=;
	b=cb3brqn0Qhbx5XFBaXZJf8e73XgDGhBWZmnlbOxRl7/mWhd66nYLGdYM85UHuGTW9B8i
	 kO08pu1BtvkNBlb2QrzkpI5SqOlHI5hKqBFo8GGgMHAGMfUENkk5XdFiPo7u9JzNHibB3
	 QbYTs3M7N/vLaOWgZQmXWieAylC9hxAtFmtAu/KZdmrbydkubPhnnrlKCPm2JvFHtd9sF
	 /vEzuu40p+zAwISxuYaqm/AMZ7e3HdejO+l/ei5bTKefs8IKjq8DvFVUMpj0TG4TqtYvv
	 /zhZgmSgdtt41VpvxV8qGRzJOld4dcxMiND9DUhtR0uEMPh/hR5kC9qYaeXPuQTZ6xg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792947852;
	bh=E3mvmgQgXy/hg18kbOrWpJistuQJPG3oJLI/jap5WpA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V0h+b9TaOYqq0FitZwWzwyx70Hpdgnf8tdiXiVFRFseYsczvN9bSZw/XIrX/5ciBB
	 6MgNHlKad2pdVxshqqep2MZLGVoLSxPtiERdbNZMUcudCtorlY7SuPhJC1JK42ZZ7X
	 nYDQNzTToyaibGeyce31VT0ZxHoCteWzjBeDjlmFwfRj4qmHkZugspsReEhdMNfEHm
	 sDAnNjl2lOAmdJsv8kXotUfOa6JNUjDQuUIld2OF7+Vx6LRQNWvJ7Tg4e8lf7eJHgi
	 0WfNWSFxquvKhLZgerO6xF7wn5qhguJrEYDOmx7bosiqZ0A4Lf0oxeJjTS94SabOgR
	 utxbWNqsIDO4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F6E405D7;
	Sun, 25 Oct 2026 17:04:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C957E380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C710940057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7ElRu1zUb9L for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 51D0340098
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792947845;
 b=X5jIc2dq5RuKFPUbXpjmrJ04AtrGL4+fv9iJHnjWxiMbL7cOmYns8UnBm6eJs4tMNIEd
 vHRB+Xc9jEBR8uOSqKm5nCjgyxyeteFFhNY1AOjCX0/sNqxLFF2SO52jzG8aGeTYPD+kq
 5Or14L0D/NRyb4pCLfjKCQ11qWJ5tg7KyRm0BucxhuUrLp6uhmPdu5fSTnqWecw6D43Ao
 iJqIK/OoWq3hXQ5I0Mb0ME6X3Z7nrAo4tPOyFiBjnXmO5nyacuwP/V27aXRdXq0JAVeHT
 7fOBCP4LQQF+w3zVoxkXAdQXE2EtzC1kCnbALVVC1sbCZRMjyikOA4LpTDBKErHJPeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792947845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z8ceenYlRiMA2MMAZdsAACu6rEW78Fjt7np13Fo5Wx8=;
 b=XzZlfvU+eM4BvbgQGnAxxQk6dO3wzU0nBYgzPS46H5JFONOue7CgRmCfJvD+SiPci+r9
 PFGTkMocIMRFFaD6fqcCt6iKf9I5HNunz6xg74Kh+IZXrmcjOimXIRXI4MWM2oFtItDcb
 O4mi1KtIn/19+j+FvSHYezOEMny8uLs1KBFqqxnEurqvNGdVNWIJhRGCdXaCWGRMkx2DY
 u2J784fGCqASO+tdgk2JW5CoCou2HD+KTX6dvPIbHLwtM7dq3+jBRrXJ/8EM7qmiPeBFk
 kqwuEI/7jZ8jBjRjJ+CleDFhWM71oWU81yKRCxNUDXPqtnmzXDlzErkfbdSabImEZjQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51D0340098
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:04:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8CDB9639F; Sun, 25 Oct 2026 17:02:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:03:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa220dff4d73c5b48948de37eec20bf10b4a8e1f
X-Git-Newrev: 8bb9b448bc97da9040d23a3abeb45cf6eb0fb948
X-Patchwork-Hint: ignore
Message-Id: <20261025170239.B8CDB9639F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x264: bump version to git
 0480cb05fa
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8bb9b448bc97da9040d23a3abeb45cf6eb0fb948
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index dc2d3d7b5b..31657d5ab3 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  adb3f2f780607420134def42d0fac58be9c6de718a451f3f0ec56236a783f937  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-git4.tar.gz
+sha256  dbfac9615e62cc85a638643ae0ba8cdfecff645755fcded389b53507eebb23ec  x264-0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee-git4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index e96d993017..bb5622cdfe 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = baee400fa9ced6f5481a728138fed6e867b0ff7f
+X264_VERSION = 0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee
 X264_SITE = https://code.videolan.org/videolan/x264.git
 X264_SITE_METHOD = git
 X264_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
