Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F445606A326
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HXgCDNVz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A606074C;
	Mon, 19 Oct 2026 18:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv6p81eCRbQX; Mon, 19 Oct 2026 18:08:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3F94060730
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792433288;
	b=ZU+VXsnLSPIW12lREWvzkeU6P67F0tu7QbJnhyJAea+7LbTSmRaoqvlATjIyRHozrnHD
	 AlGF7QrQHxlK/q9yHW1wK8RS4cX14gnZ57cdWsFlmpISWqCXtvIsv9JOo1lcMjBLniiPq
	 7TRw8pJdgsLlAEFM7euTjbNBcvkx4nZDVmJZHZoCa/rHQr9MByHrzfB3HvheKLOcM7EkM
	 Pv7f6Qk1/gaAniXhHBSdcWb661KUv0ypy3zu4708YknYYj4F8UoBowE4qowBbUC1aQYMZ
	 I1NUSY3ERqh8KVweNIBTGLvLWDSM+YeIbEAioZr7Zrm64zw82aBzw2Ao1Zz+4Ecf7Fg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792433288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:To:Cc:Date:Message-Id:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cs+xnVHaXMMAzE3n8LaWWVJpn6EH6h5EBswglrmKLRc=;
	b=VPWZgBUlJOZ281d5wILJC6+vqPpeczVHGjtDKMKez+/asWEe3e3y0SU4mJVdjo5NYU08
	 jsZI7wAYN9PcYq5bNZeSDX1Z7zjtdEa1p4aSRzivT8BFtEd0/TCmGJJBZ/ZM0mMw6UbDp
	 2UXVE+/y8ono7L1ucoBqy+5HpQ6daycottwAysLwjuqQg4DKuh+yuNCVORZ0Z3eC6H6pe
	 pWOomabgJTpZ7yccJIwCuvq54i60F4GQoB/Nhkv+0VEftM1VKslUS5aMK836C00aVV5He
	 UMFKAmWa34cTJfGZMYqoHwScxqoYyezo9UR15p5pHo+/PbI5YnWYnxTzIj2C/jIYTfA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792433288;
	bh=Cs+xnVHaXMMAzE3n8LaWWVJpn6EH6h5EBswglrmKLRc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HXgCDNVz2amae/7kkZrAm7eNevJLmOS+w/x57pYlHcb53UaxhUCeGDxrP7ZEAE5Bg
	 kRWGAObxBJMgU2c8SaOrIU1ep4KKkPRmqY4BERaYgVtqAIjIsGTxh7Qs0kOdnufLHH
	 ZAyUPbMbJRUzdELfabIzFVCCthjP1AXcMcV5pcoY4+2AKY6Im/RSkgIy5NN8nhhrRw
	 k5h+h3kc3bUkVvL6KhEEvyoMeLRNhtQHJaquIshmOTkl8mD/2BhqN689mGYgwQj0Zi
	 55U2vKYhbnIjdjQ13dJ2tYV+yTH75hT8DeF3MMg56cnOPzFNU56xWBqagVgkMtFAu7
	 +u9y5mGZJFxTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F94060730;
	Mon, 19 Oct 2026 18:08:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3AA1DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ABEB4053E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnpqnFMKlhv1 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 18:08:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2144B4064F
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792433286;
 b=jXRx5fmvGLi/Yt49l4dDQwIDInT53naCm8MFpsITkCL9gikIbWA1l/xkvte/eo7Bf+Ui
 0YYZrUsIVy9NOg7PI3HnobaOEwvg2Lf3a1dTAP9vG3rzwpKu0LJVOCAQakaktJj12u83B
 vq/5MSX2vs//F9KJH6J8JTZ5lsZvIC+/+3CD+WeTQeXbU8vsIbjfcMzASCfLIZ3PCgZPS
 UyyJ3sIRPeQ8h+lzEhoK5hc9g3uBKvXcWXFCMa3NSdJ46wjyy8YEa5udGuLvI/1ZMoQ5k
 YtZx8DgXBMFNPUsmnx1/J/hpBVheh5xspU1kdnkvrxEer+Rf6Dd+taVlvpx780lW7BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792433286;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-Id:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MapRnyxb2LecRmTvs6qndB/Jo/Lf4BS0wRPaVVCMKiQ=;
 b=J4vD2ZDFEYjiq3LG3TB05esPr+69bmIGftVYSgcMUcPyDCkO1feEzklV+Dg+O3kA+Y3q
 imgopoftdiiCmorLmhK1Ynwj1hQULvND6juL1SOiSNM9lZZEh4i1/Y5LVnklCrpWa8Dw3
 wmKZ0lH+nnGxLOvyogvbKCAGUhKtUj8w+QDsaoIiHaBSUzqlLXWkINDHzzww4KHTngurP
 gvDg/cfW9kO7vPAQwS/SjnbfZW0/xK/Y/dS2NDk3Ot7CubPxtCJ00LP469LyYG8+ej2qc
 G5GvJk8q/f251XqktTbxyYB3czelLernC2ul44e9qC29A5bAuZwcvPgExQ+z8ztQpkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=murena.io;
 dkim=pass header.d=murena.io header.i=@murena.io header.a=rsa-sha256
 header.s=mail2 header.b=KjwFTtpT; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=135.181.6.248
X-Greylist: delayed 415 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 19 Oct 2026 18:08:06 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=135.181.6.248;
 helo=mail2.ecloud.global; envelope-from=martin.contamin@murena.io;
 receiver=<UNKNOWN> 
Received: from mail2.ecloud.global (mail2.ecloud.global [135.181.6.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2144B4064F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:08:05 +0000 (UTC)
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail2.ecloud.global (Postfix) with ESMTPSA id 1119D7212B5;
 Mon, 19 Oct 2026 18:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=murena.io; s=mail2; cv=none; t=1792432866;
 b=djovwgPt1F2fTOtnJoMiJvrQm0CjL6xvKiJqslJxRRibX5oEK1QpxXnSuqaCahNb9Ws2aq
 cmTFKQeJ8Oz/lslUjPYSOwprWrIhxVC/bmPZgrOsOXKnm4yqeBuZZ3GzHqeWF0CjY2frUg
 HHsYMz8NPhDJR1m6fsm6SIUV6aYYG3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
 s=mail2; t=1792432866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MapRnyxb2LecRmTvs6qndB/Jo/Lf4BS0wRPaVVCMKiQ=;
 b=gjO3QxBAs/Uma6iN2HrLq9EJgSIIuqoqvE8YSij1SzmgMtq5bbvgM3m+4a6wXapCr1d/Zg
 GYFwAAlpqu5zjRO9y7tY8k1I9ZnsYV7mUHkldASE4zi3WFxnT2qVPp+YNU9DPm+iqmkanH
 DMpHIL2fTiecoSkCYX7yBUVZZDajARQ=
ARC-Authentication-Results: i=1; mail2.ecloud.global;
 auth=pass smtp.mailfrom=martin.contamin@murena.io
To: buildroot@buildroot.org
Cc: Martin Contamin <martin.contamin@murena.io>
Date: Mon, 19 Oct 2026 20:00:50 +0200
Message-Id: <20261019180050.1175211-2-martin.contamin@murena.io>
In-Reply-To: <20261019180050.1175211-1-martin.contamin@murena.io>
References: <20261019180050.1175211-1-martin.contamin@murena.io>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/libtool: make v2.6 patch apply to
 libtool 2.6.0 ltmain.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Martin Contamin via buildroot <buildroot@buildroot.org>
Reply-To: Martin Contamin <martin.contamin@murena.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 5dbba2616f ("package/pkg-autotools.mk: also handle libtool 2.6.x")
enabled the libtool 2.6 patch for packages shipping an ltmain.sh
generated with libtool 2.6.0, such as libmodbus 3.1.12. But this patch
was written against libtool 2.6.2, where the -static-libtool-libs
pattern was merged with --static and -Bstatic. In libtool 2.6.0 the
corresponding context line only reads "-static-libtool-libs)", so
hunk #4 failed to apply and the build stopped at the "Patching libtool"
step.

Remove the context lines around this deletion so the hunk only relies
on the deleted lines themselves, which are identical in both versions;
the patch now applies to ltmain.sh from both libtool 2.6.0 and 2.6.2.

Fixes: https://autobuild.buildroot.org/results/11f3c460407c816d9829f101f0ee55e4b03965cd/

Signed-off-by: Martin Contamin <martin.contamin@murena.io>
---
 support/libtool/buildroot-libtool-v2.6.patch | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.patch
index b3968b1289..060acaad5d 100644
--- a/support/libtool/buildroot-libtool-v2.6.patch
+++ b/support/libtool/buildroot-libtool-v2.6.patch
@@ -42,19 +42,13 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
  	    func_warning "complete static linking is impossible in this configuration"
  	  fi
-@@ -7072,12 +7076,6 @@
- 	  fi
- 	  prefer_static_libs=yes
- 	  ;;
+@@ -7072,6 +7076,0 @@
 -	-static)
 -	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
 -	    dlopen_self=$dlopen_self_static
 -	  fi
 -	  prefer_static_libs=built
 -	  ;;
- 	-static-libtool-libs | --static | -Bstatic)
- 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
- 	    dlopen_self=$dlopen_self_static
 @@ -7393,7 +7391,8 @@
        prevarg=$arg
  
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
