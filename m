Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21217606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tBYOSjBv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E38BE81585;
	Fri, 23 Oct 2026 12:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5pfCRB_Cjfr; Fri, 23 Oct 2026 12:32:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBE8881495
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758761;
	b=jG7d8KzaMKVLGBVgGq+YbWHetRdoJK7nMZ2aRsWZiPLjf7Q91mYEgrytuPqKd/nvPjLA
	 tPcX5Yuc9RHEu3YUC6e72b25AsPQYojUcVR4zWtaH5SWefVySLe3apsWT3PJIs9ycgQrx
	 SZw1wlQr4coCGpFHkyHd5n6naRXuD0bvFhbBqJTEhs9vhouOjqnY0KcDoH/qMVa6UHRj5
	 Q0AkVZ9X1UODIyqutwhC2+89oD67N3WdfF1QXbNNEUhdKgsci3UeJeK9ALepmdqKgR77z
	 EQqKbsIzVvCgFDhlYT0XFpV3d7iKAsMLpT+DGPyZB6nbZ3dsR5DOLHeL0pLv+aZ3NRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=O7ijWjicCU8BIwKZoje+K0Z+70b0w01Im2MxOVmbR0U=;
	b=JIiQtyeqbm2QpthshLtIVn894JzNuaT+FhKMun/n1De2ANUDPAKw3KWjxP06Z6JGv6eK
	 JxMj6VrHGJ+sTepxSf9svZ6tv5bTyu3xc3hly4jmDVK8dQSjtBbqK5oucIg2b57hgcDEw
	 PyNz5I+X3e3KOe3Xyi4dIGxVLSONW2UqHKvFshNh+XE2gn8Tq0x5xRzCTVCQAyZIUCAec
	 H0lqx0xzifeuqb72Dshnq8VwDyTQxWW9YSD5ui2klkcON8aYnVCEpj0wyYMU+l1UJ7umE
	 q2/20YlHSWzKgiTVJmjOcbps7OTeCavHPk98iApGE+YeHG/dyjFkWmNb0SFyhkgMJUw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758761;
	bh=O7ijWjicCU8BIwKZoje+K0Z+70b0w01Im2MxOVmbR0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tBYOSjBv6M2u1OGQ8A3QOQPIMbEEAxsPlcquD2ndosjAatBz2uhonWQ75k1ggrRLw
	 Xdg/PoR2XqF0cqZhnQ1PRAoS1JdbRkmFltCBALf+34jRYkw3z6CINu+dQUI0RcCWyv
	 qt4dy9bLbYPZBAOFOBRVOxvsl7Ylt/xTL/tnLn0KON2d9OJiS8zo0ylhSKnVAgHJFo
	 8CyloLRpXxo6okpJk80gcPmLsgIZTilfqdKuODJqmoaIFi61n2BmTr+0FqiOtM+h4o
	 VXvzBG36N4KCyJ6v46jtOo7wbGJNmbge35Xz2G7L+K8IbVn6iTZJu98eXuecRJRoD+
	 jvQRrEfq+GBKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE8881495;
	Fri, 23 Oct 2026 12:32:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FD1F12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 454C5401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ys8zzcqDWWpT for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8B15C40119
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758727;
 b=dzN/UlIhs4M7dRK8NjMlYZ/dGSA6C8z7eAZaUAFv9LsLYlxNi0PCjZtj9r0Srr+PovP8
 ghQeXrqpYbNvMvxo86gJS8Uwhv8IOn4dvZxKFIWZNUrHJ8a+SXdAkT5iOzMTnY9Tux7vH
 5ht+YDBqMcu4MPSrazvrPME3HOQllFWm1+HeWZfhpDJNqQ2O6oi06XxjB1wIjwAGeDUXC
 Q9VUBECaTL4pjd+Siqr5BHIk2TSJl6XIAA+dIEBZRJZNwGWVWvhplUTDfS3tqqjfmA+Wl
 ZQmfZG7He2LVQQoKHlNvMju0cI9E84Lufb8HDHxxis6k7D3Dnpd7Q6E4c0k+o1z4r4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UUqFU7bt6PZZqASGl6jKpFecennBxbrpBGKa3qWvGYc=;
 b=mQpJB53/LNt5pLn8Hms4L0Yzk6YsVfzdLU+tpZzlDAGGwjsUjEuVK8BermKIQiK0bZUo
 dz9+DyXfUp39An/VPcaSBW4RfUkAPV7OCDh7H8Z3VjEVcez8JllbBJxVjWgP1a+n2T7T8
 2TBkuBYP+qRnbj2XMeUPFrRY7aaxeQiVhtKbbJ5j8IZlHaalkXikUYIR/vfFQ8wkGzhS8
 AVpsSqYaJbkGFX/2sJcBiAVZUaNdGQJ7nWZHnEAlwPR5xe1r5GVzJy2s1TCi/a/zG0Ty4
 snsadKiqlT90nDk4IOzOtRc68x4HbpoEpbalw4ZMrJZ8reL/hsYCmP4WAcYQ+VjbsaQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B15C40119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E44C9C669; Fri, 23 Oct 2026 12:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:28 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6c40b598849e8879b7fea47be1c79a2aa7a0ff3a
X-Git-Newrev: 8d1527892c2022c0bf340029059f63f8aee5766b
X-Patchwork-Hint: ignore
Message-Id: <20261023123043.1E44C9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/p11-kit: security
 bump to version 0.26.5
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
Content-Type: multipart/mixed; boundary="===============1987896914570920579=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1987896914570920579==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d1527892c2022c0bf340029059f63f8aee5766b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Security fixes by versions:

0.26.5
* CVE-2026-18938: rpc: guard against overflow when decoding nested
  attributes
  https://github.com/advisories/GHSA-6x8p-h5fj-5ppr

0.26.3
* CVE-2026-13757: server: fixed stack exhaustion via unbounded
  recursion in RPC attribute parsing by enforcing a recursion depth
  limit
  https://github.com/advisories/GHSA-p2wm-69qx-x25w
* various memory management fixes (including memory leaks) without
  CVE or details on possible security impact

Full upstream changelog:
https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f432a9e625cd1dabc7722e894909d7ae23e5e488)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/p11-kit/p11-kit.hash | 2 +-
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 943ad9c22f..ca76eddae6 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
-sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
+sha256  f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7  p11-kit-0.26.5.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 60133223ce..b3bb3e1263 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.26.2
+P11_KIT_VERSION = 0.26.5
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES

--===============1987896914570920579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1987896914570920579==--
