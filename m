Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9D606A31C
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jc4xZwHy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477A181045;
	Mon, 19 Oct 2026 21:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jy4LB3JhnRr7; Mon, 19 Oct 2026 21:47:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A55481029
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446438;
	b=DtBTUK8LVSnsA9Mo2FERbqSlHukahSjUCQyyk3IKWMwjd+iBzKyhh1hDBorx652rHZho
	 16/zwzLYHlsbkwuVD3I5BM94YGDauEIPjlYN9WVT9cIvKurgmNo7/g8JKyb12Pd3At4jq
	 ud5vEx88uW+SehNBxbFF2PHj1/lT8OUP4aUFYecMjscmIwegywULPiFtft4Y+Ivwt1ddh
	 9oYNW3b4XZfb+yzgh/fNq8Gd8WjDDuC7eYhuFh2n/E33stw9wZdzbL/qebJKq+pkx+Oen
	 wj33j/Op0KZkdMlPIxV/qQ/Io4CbewsHbPCOch3sbOQSb/tkLndnXBpj4gUzIkICc6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446438;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RpkzpUEQhVCuPsO3MgXBNdcwqkVYwd+4ji3zMUOy8Zc=;
	b=N1hecvi180WQwtgLzMcBbHD5CP04+eCr0Tb2YeI/SAgsZ04/3jhh/QzdZX1X459hFlWC
	 poK5cMlG4nFWXWwhGbJsZysGiW0VQfWqIjuZuNgq4hidq+z5bt89zgzFhFlrx1WZQ+NGT
	 1+4SR1vSTOxTLxwl/WAj0zS8KGJKGTz41Z/MvC7NgmcSUMO/ArJFpcvseulscwa9DZ7G1
	 q8TFpXMMZ8EfB4GYDhg4wjyx4y4+TXYfD/AMEmOdARCnQoUKzkdfQi3w7R7SxGND9CeYl
	 gK9GLw+gxTtywsynDF/DNfxb4w+r5umjosKHgpkQW3zM49KedfmQuHXbXs3nTtXWwAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446438;
	bh=RpkzpUEQhVCuPsO3MgXBNdcwqkVYwd+4ji3zMUOy8Zc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jc4xZwHytTmBojRUdJNHszQO4rOMWQE8vGadKabBhTX6N31dhl6ekLbUr1Z2IcQbY
	 2+T4BVX4qRXM9xyA6Z/dDxOcsR1J10wdAAlxwKvbsVT1TNdGXf5v7rPRetsDkUBvRA
	 qVlDAsxBPuBjEYxjwYgtJZC1jrwnKJ/2LcwGscyr+pqHGkOGiuvWk55xrPX1sM7bLJ
	 NaXFsRBuy1mdsPI7eBbS6eeuJxUh47PDkgtJ8b+lj+llqBrxa/MOhcMSYhs9Lj3au9
	 fS/SCO5jME4ppZv/Zxm6riQzWY3woxHkxUMgPMg/+xt9sD3UZ4RM20eTl5W9yPB44l
	 1CB9qo/Ev8Xag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A55481029;
	Mon, 19 Oct 2026 21:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0940811CB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF6B6402B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyAF3OaCZP4G for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 492C9402BF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=bbWn4Ulh4TR014uYPdxQlR7NlHt7eM7QwQVDHTJwPAO5NkcvOjtQAVzUo+Lt7N2c5JKT
 kGvE3GHfRqfF4SsWeCN/PA2MtyvExVMmliUYT83VD+hBcz9cHENyUe7iOaBbcmh4VyzQB
 6GvUU6WOg1IKQvueL5sRxUESumuocUp5QMBZtQcLamV5uPNbqhwlVQ8CIRa5qt+NBdLi4
 qnwI6tjW4zZCa3mAMdAmcV5a/Qyd3ViYkv4W7hhUczVLAvYSnvwwoFL7DcTRFy+rPEnhv
 3FRBAH0mxmGbggwTLJexkXgPm0ErIyCLXJz6xji+OuXvz1J4TK3eRshSQzXrQe41e/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oZbEJfJgLcDfnTnM8VhRSrLr31jZoyvfzxiLxpel8QI=;
 b=OzChC6AMXuqNhRv6nXa1nTAPbEP0OBU9IbCXQwUxe7M83eTE2+FYZ1L+TSqulcXKZvMV
 AMJ/PX6JmAnwIz+Io4HMYvPh4/vxu64HIhSXStADynSwJvvcZuSLFyR4dSEdUammpxxBC
 7QL62/96gXqOeNZG20vcPsT7nkoasbFRPeRfH2iA87y8aereP0bndy494lykDYKlnw6lB
 z+ER6OZwbqQ5TkpR71ucTYjULe6jhbw0lgjnaPtZL72KH6kJjJ60G1PZCNfelE7IBOAEn
 ylw12uM4bp79hRZhBsNO/+Stifdy5iSiuSc1RxzPbhk9b+dgWx36kRbwVlN1mlREz9g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 492C9402BF
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91B0199626; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:43:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b636e15bce8e3795c117d2dd57d43b25e2023733
X-Git-Newrev: 1db985afe7988e1170b817a43740c0dbb3998777
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.91B0199626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_ttf: explicitly disable
 plutosvg support
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1db985afe7988e1170b817a43740c0dbb3998777
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since we don't have the corresponding package in Buildroot yet.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_ttf/sdl3_ttf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index 04a5a9a098..6bcaccfaa1 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -16,7 +16,8 @@ SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
 SDL3_TTF_CONF_OPTS = \
 	-DSDLTTF_VENDORED=OFF \
 	-DSDLTTF_SAMPLES=OFF \
-	-DSDLTTF_INSTALL_MAN=OFF
+	-DSDLTTF_INSTALL_MAN=OFF \
+	-DSDLTTF_PLUTOSVG=OFF
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
