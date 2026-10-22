Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DB1606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NkVkkeTe
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5AF81491;
	Fri, 23 Oct 2026 12:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzvrMSkTzmxf; Fri, 23 Oct 2026 12:32:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6B7A816F3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758772;
	b=L9CObxwgIMgxzU91GJK/FSNqFlPR5egUcoFoKHsm9IK+7FPx0aU3+M3T+N71Zhn54keX
	 jXWhE24u38gDl9Aawygi9ajXoGaCpdXyY3MtG60sG1/XRmWk4xmM3bZ5jKQJ1viqksbV+
	 V2T2Li7bVN4bK+72KNp8nqXcUb2UTFHlhtSQbc8DTmzcLtJA03lsaQZTs0+eIykuyyOyZ
	 khLzkP5Nez/XgiUdxpkp7h9VvYN6FjGaDXVJNrBbYOZUe16JFF4/opNs2ycseqRQHYM8P
	 jnM8++op7LFzfZXmrFkxxn11bABb6v8kQC1tP0lbzsE2FUPZOmWg+jDV2QhIBq0JHaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jVu/2kr5vYmPgaE3Ja/aq9RjXwLuhH+wwGBQQXbWbXE=;
	b=HABvRmflBRnUNe8RAhuNDso7Jmk37YvGYOypI3rvaC0Hs41GGf31EQU/OBl/RjdU5psH
	 r8z7C0G6zs6rtSxEtfiCsm7SHsKSxpAl9cFiDiH5ZQioAOn8eSnNy9KG/DBa5leYF2Iv0
	 65Ru+Ng6iNI+RBzej7po6HkK7hCcDimdmzQvWWBgXWIauReLaE570q+uHPZJuy7Dh/LvH
	 +M9KcpdHwYX+QaprrefM3Yq45thkzM7+cgj+rmVzkAsyxH/zwyARlRBeHvf8omfDt2tFX
	 5YgRqMKe4OkMAHaR7ERr4Lu/AiScYugI1ekdXVbu2A4UrSQE6zc8VxuDfpWvaS8jWgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758772;
	bh=jVu/2kr5vYmPgaE3Ja/aq9RjXwLuhH+wwGBQQXbWbXE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NkVkkeTeUGDvCT1w7BxVutIvmX5SiH5h442a3JJ0yTH9rQyz3Am9FjQFm2Cl/5PJq
	 fzVAm+NhznZDANhgzqR/K5l4LE7/ptYsi0sRfyw/gPc5RspAfESbJZsxGya/FAKxeL
	 IWozpIxjLtv3vMAanSXNU6hFxxFYvr1oREjdl8gREL3/ZCiKFiYfTmyIUVb84tsdq5
	 HFX9PhuWiZSikUiUvSWXeu2nQZcYwJbYH38k6jzOOSKT1b/mUfcdHlfEMxcVoYb4O3
	 Hiyx73Hd7iilmF8UMsrL4h1tOokBt5komQPgi6lAchD+KX9vhS2TXDEHlekZIzrWWw
	 CVtC10iM5Wl3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6B7A816F3;
	Fri, 23 Oct 2026 12:32:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E67DA12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC76440119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVnSe4t94M27 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 34037400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758730;
 b=jKLDAqNrg8mZHIt9r2INiIx3jrt0s1XmBSDnwxehxEZbu8PK5qyuCe4KqrYuDQdrg1EI
 REL/sDTolWtGu400Sbj/Z/0kSzbNMOl1C1g7/0m3vi8gMrwZhVAapCB47ueyUFe+NuiRn
 /qD6FWaFtbsklC1WU+fbvpiijNrvNICZ6k8rY6zYchxwvsYseDOZYYFvsT3CM4AZO3t6H
 k8aboodr2Ow79ALpsDHGu01qijjVO2RSPNul4gPDF+kFGVr6gTntFmmcq1FAX5CU5Ii9Z
 Qikg26wys7ACBe33Et8tAh+UQW4Rxws2pWerPCCaxH9GopKIvOI9WLcZKjp+v6dS/rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758730;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LzfMdGaUY3LmsBrWHo1Ok8kD5hsbg/+fKz7ZIbZ/n70=;
 b=eyCaT2VC8f9wzz9AZkxJACG8VT/1O9TlrUsV4ITkeX/6wdIOqSlbfeJY+CNlu4SU9tSo
 8Kx2FZqnvXmviqsqiAfivM/ttrNBixUsvj1WQxwjsZToBGbQFGDPVuxgqZb4YzmbSju4/
 XHxTQSjDI8Il8i9Z0i3RqoAzfuqrNTgZEFg/i9jtQugebbju+d/Cbr8TOnlgko82TCdPx
 o2naKtXPJ5nC5NxuxmxclePBYbX4xAQEN6FeAlGwO4i2dwEMni7iy8VcVodHKRygyCLRR
 GPqFO8OZnCVGL9URI7ccTnr7H3Z9J0aAGcw1/kEfTS5WkgXFQ+8EQ/sntF3fu4/BXrA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34037400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACC9E9C669; Fri, 23 Oct 2026 12:30:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7d842ce60dd53f62c03043677a39a18d850fd9e2
X-Git-Newrev: a743e8f6c78fcdc2850fd74ae83e02f71baeef8a
X-Patchwork-Hint: ignore
Message-Id: <20261023123045.ACC9E9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] DEVELOPERS: add Yegor
 Yefremov for libmicrohttpd and libwebsockets
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
Content-Type: multipart/mixed; boundary="===============2490811005251823934=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2490811005251823934==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a743e8f6c78fcdc2850fd74ae83e02f71baeef8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ea4388b3b09ab34513582d01ddd6a524212a971e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e9a391ba7..e6ae510c1e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3577,6 +3577,7 @@ F:	package/kmod/
 F:	package/libftdi1/
 F:	package/libical/
 F:	package/libmbim/
+F:	package/libmicrohttpd/
 F:	package/libndp/
 F:	package/libnftnl/
 F:	package/libqmi/
@@ -3585,6 +3586,7 @@ F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
+F:	package/libwebsockets/
 F:	package/libxmlb/
 F:	package/libxmlrpc/
 F:	package/linux-firmware/

--===============2490811005251823934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2490811005251823934==--
