Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC1606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qkqZ/3h3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6E6407BC;
	Tue, 20 Oct 2026 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtkxTcwWGMei; Tue, 20 Oct 2026 21:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 22ED1407C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792531094;
	b=L7hBCsOSTSReI7lZJvH0XuBF/IQr+gTuuvQeHQD2LbsRJCph/ek0a2BD/nBKR1s0S620
	 Gi6wxKSV4rCBGwxXKtOXfWidaFqkhEOzQA6RMikyAkcfk7zhGwKYK3Jlgw1PE/6ENAEk1
	 v1XadpCxHz3++dZXrhImStabDZ/kZO7C9MqTZgozm44MwBjq6ZU2P8PJt9cb0p+PFgekw
	 SCiT2/cFl9V7AbQa7iz3+eYDy4pG4Ru+aL/js5n18pKr5c4MzB+GyiD/pM5GKYQZGF5q2
	 oXXNir/qYNDUlKoTmzX8vqTjXnriE/zOh4rMHm0+KAiaUJjOYATxZqZ/jNb/hOzVwPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792531094;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kBX47ED6fjQKdUzQeYs/kXNVXmnLBOWSKAQKd8zPmCI=;
	b=LO52ILAs2+eWSmmyPBcDtVxFB56TRGoJ+83m7GiIn2rp32wjca4hZBVnJtgDhCEygX34
	 OuYVyIZPZfoxbZ9pPKsS0Ln/eFWGjBe1cN8Yo9KYjHNjESfWuz0myiAqu6x2g9vKdyq8d
	 HJm/bZ4jiAD3qTXOCSM8XB5x/W6QzVNCQ53FjcFABMbEorOd1rVDjMF7GKJWhe0gv2TUs
	 dwNPCQOScOHaBgDEuCsoGEDvQyMpu0IKXwcqfEMRjf4E7l+xdN/ezdrS7NRibLv1rvE/9
	 FOqBA4H+21WfRkQOkgZPWo7yxxgUkicChZnNrBpM5BlAn4r/FefaabfiZSJHiDSKYUA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792531094;
	bh=kBX47ED6fjQKdUzQeYs/kXNVXmnLBOWSKAQKd8zPmCI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qkqZ/3h3hWf5BO3+aUB5a3X3ElD5TyU+jqQ1rRAcd443ukzb8LhYn8CC3arfVS+El
	 muqJfT+0as9HXdnBSZB++9LaCMluGxOjUVdRQdzuGJ+TxusF0mQi+4GlW7M00bpWxY
	 YcVKSp1CLu5bzQNuYXTdB1pkAkEkuMhMR3mV3M7lUiYexiFxFclh9oKkkcytAKbVlo
	 6LiGMRzo1bNBDLbbP//qDtEMp85FJwZ3vEP5G6dB+abqKGF9/c82pVK4LbrT1hjWPI
	 1qKjUhWkLJCI4EAh7fmGraPqlmzvcV2Tx/Y/D/BFNtocJnnCR93+fQ4uAe9JhL3yZe
	 zOOqdCYHboXDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22ED1407C1;
	Tue, 20 Oct 2026 21:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 699EC930
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6701380DE3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnE9z7Z0hqmR for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D92280CE8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792531090;
 b=c1EXx+nFi/hFKKK1ob1da24o84G1ggZU4qvqtZNJ6snVTWlZv2AifSTKGtgyKad7chg6
 RkChUhUcNhN6hHs3L5sMzjloMBo7HWATlU9sQIrn+jdzefy3V8IxCCxtwqhtSDkd3UKA4
 f7ZinFdMBNGUY1vHpDM+aRknU3Puq0BWiOnQFEEUoG8MfByopnZnch+ZDGakZ3zABTp+P
 p7YdhFibI5dR5HLQg4FtFHuwpUUvtQX719yHQFr0aVkhtuMLQ3FievJK7ruPbtFxBSWEL
 4kYPQv0ybRnrKwfEq2KifcAk50bwmvDY1QDk0yKSx/dOXa86/l5rRsoYSYqZ6SnQ85Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792531090;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=s12knASwir0vCvvGJZz9dssdm7oLAjoPQKsH0Ll374Y=;
 b=WIoiKDclRUmD9AhA13syfF49tvTnSfDYDfEJTmF3w7HhmUzKyhgk9zimQkAl3Iv4Piby
 ab1JFHGyhOgr2Q7cBb9+4Vg6f4JCRx5g43rUDiqaSIt3LAcGULasv4DwiWaKdIHMCGGh/
 3ZeYVeszropE9eBymYiS0bnwf8SN05p6ZqsZp+m2p6aZsTzg1/3Q60JIcncV7V/YG0KX8
 MXUbvr2s0mpBYSTAxL9FrHelah+u6T8aIMgtCgEJhkB756rdpo+dVXCuWFFhh24b0a0Gq
 dQ8ifOvQBNjuzmG0QLJ3IYUgSJAoRhRK8HL6MVWXLqAskbttpPmjRVpX2Jl+hU6rexg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D92280CE8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 509AF99992; Tue, 20 Oct 2026 21:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 23:03:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84a940ebe1cca7c6df49062a8e9c250fe9221867
X-Git-Newrev: f14e138f6f643d208455c500ca3ba7cfa9de30b4
X-Patchwork-Hint: ignore
Message-Id: <20261020211647.509AF99992@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang.mk: make GOPROXY
 configurable
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f14e138f6f643d208455c500ca3ba7cfa9de30b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

The default value from the toolchain can be read with "go env GOPROXY"

We rely on package developers to audit their dependencies in go.mod and go.sum.

The value can be configured to:
- A comma-separated list of proxy URLs
- "off" to disable all downloads
- "direct" to download directly from source repositories

For more details on Go module proxies:
https://go.dev/ref/mod#module-proxy

Discussion:
https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index ac58c685d1..34e9ec6705 100644
--- a/Config.in
+++ b/Config.in
@@ -334,6 +334,22 @@ config BR2_LUAROCKS_MIRROR
 
 	  See http://luarocks.org
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By
+	  default, it uses the official Go module mirror, falling back
+	  to direct downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "https://cpan.metacpan.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 26da7be71b..3e388cb257 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY="https://proxy.golang.org,direct" \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
