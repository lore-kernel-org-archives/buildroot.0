Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BC3609528C
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pU2mbOWQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC00813C5;
	Wed,  4 Nov 2026 19:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSRo_OQXioTn; Wed,  4 Nov 2026 19:52:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 332D2813C9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793821939;
	b=UfK6XN5Tvya2KfobrDKQ4BITnslXPeqFcXnBM15o+rQnxteeXXITe2IYsP6Sh58J3+Nt
	 XaXnoYNVruQ3lViz2BVI7lDTCDRRxa0Klr/kYWqD1y6oogg/0x3gzVPHo9sGa9R50C3Jt
	 OlBsUVVgEEcpfOmhzh45avzdTR5VMWeDOnuMKQhBvcTiyFAVFviBNPYOe/bcnoovNwx9k
	 SJTvyn/S/eAdAHo+ATy7nXCI9mITvacMOUqMs7zVcrL1WAYQ82z/R9BmqmVKvAFD7tzOY
	 43zTowYoLFseNuQFcjCz/LljmTnaoCI7waQ9GBVrHdppBoWJ6ErQ8vWgIglofk82GdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821939;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=awLYtanAoIZzv9v/Pc77hgWnXkok5+fMMNagt2nwnhE=;
	b=bU3rjJdXbLttohRhOQ2kfxnHQN+vKgKeU8Uu+6wkC8easnNZh6ywZbnYtfTgYBO3S4n7
	 hnFkBkJdyooyUuGrwCnMDK7QJeSSTFH1J309hlt25YAbTMBj7XylPMoIeh1Q7Ado2mGTN
	 5bPllQ4eqO3ZUi5i/mzR1TzJTqO5f9sjI/dgp894kbd1D1JPC/C7dL74K+s65vXg+5FDo
	 2uCk1AbeHGdmdBsQyLB/Rt9LyElbrfvhS7qufg3PftTtiokG9W45K1fnd9JqTo4oHKjBE
	 EOHR10GtYhcRUGkJHUfxUlec+gYOTFtOss6fulNxJ3Qz+pTRsROOovial6NsAq/EVng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793821939;
	bh=awLYtanAoIZzv9v/Pc77hgWnXkok5+fMMNagt2nwnhE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pU2mbOWQlFD+5615BV7sDSPv919jCHgOOWGCRGOhrHllfjHrbwJlXYZVhPPCc7nSd
	 /1lvsyZc+d1bIiAezDPOYjgYa7fLQypQ+MOtYyCks8kNyNEl+SGKAj/sppQmCg5T+R
	 pMVziubZLySOJ4L8ooa5D1nAGIDp1e95Hu5hMc2gbpVrzeuhLf9O94wlYDBJzzRXBG
	 JReZwNGt31+lpFpCCDWNTuKkj1BoY+pcIhPPf6sGUFq0gBnBoPgDUOuyp9or4wkLU+
	 jXBX1h3xGtROXsYpW//DLMN+cteAu9M9QNYYkUfZR08K27yfIx3KVYjvj5dR6RAvN8
	 Qq7snUqQC9RRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332D2813C9;
	Wed,  4 Nov 2026 19:52:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45FB89C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C138402DC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0X3wb1iPgRSL for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8696E40083
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8696E40083
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B40849DD96; Wed,  4 Nov 2026 19:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 20:45:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7b9193b480483cb8a0bd42bc0c011461ab5f540
X-Git-Newrev: 7e4e0086b2656fdc899a05ed3eb396a594042a14
X-Patchwork-Hint: ignore
Message-Id: <20261104195044.B40849DD96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website: bump jQuery to version 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e4e0086b2656fdc899a05ed3eb396a594042a14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

jQuery 3.1.1 is affected by several known vulnerabilities, bump it to
the latest version.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/footer.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 44ef5db17e..d9f4f75196 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,4 +1,4 @@
-	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
