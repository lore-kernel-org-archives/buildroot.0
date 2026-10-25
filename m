Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED72D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=doj9sYnk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BACAB60607;
	Sun, 25 Oct 2026 20:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLs-7Q9-PNDi; Sun, 25 Oct 2026 20:27:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F32C660601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960066;
	b=WMkwynq6Wk6JQzOaaWhJZ702TcxoI4F4UIsIbAi79R2WK0Q68tSHfwApot1ZxKC16BtB
	 +lf/gCAdZxxaMN5klsRxCzkNnb4dLzcjFQRZiK9NTKWxiQOIUKE3x5k4lgtBlwjWQIKE/
	 rFUXMYIEGRJYN97Xa5WhtNGL2HMsakFFk3Ec23Gc4LcKRw4CKVPo7GigoKgHOIzEq6Ibt
	 eDlkRNCqVfrT4YIU2Asn5t4sp5LHzbLNWRrTrah+o6I5k1SUfHosEVoRjgd4pL/UifbOf
	 k+vXyqMqXhKAwJd7zT725a4iNV9J3RuZZm1bpgQO/SF9jUhjZY5XFXJJnkJM1H+5xRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FxPKI7L60CZIGA3g63Cdozj9RjJAjZ9yc+4muuV35Sg=;
	b=Oem+SGEsl2zyA89iahckil4JJ7juNda8ttb/E0JcgxfHTSh4fiJJjC02QWmPEv1w8aLW
	 UyiM2qMWWr4NOMUWsik1HANtvlGfpjmaRKKoir8qYvBS0P/vr+yN+p1a8skgz2E7b/yw3
	 TuHyOykoO2BCZ7ayXf28SEL0kl+zU8OMyJigvnvKUf14h7M/WCF8T+VbMhiQze0ipP77K
	 6A9hPE8InpmlaoRKUXl+4sX7atSTLSnCpxLQo8qO6Pf4tShxA3gUEgCqgjlhj48n8tauN
	 x6UreSCcmV3gdvu7PDW7LDawNQHNYlb6qB1voxVTLgHojpMHGZTXMggC4Amfn3VvVQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960066;
	bh=FxPKI7L60CZIGA3g63Cdozj9RjJAjZ9yc+4muuV35Sg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=doj9sYnk1/BG93Fu6eFSPbNJhkdtGbJ0EDFWKwdQbLl5AyHVLceZsVWLZv1951e+I
	 nIZPttp8QClt/zdLpQ8o3hWuE6neHCLkA41n/zL3fz49dlvqEIVCk8lazuDkuPeTqr
	 wMAuTgeV+30wLiJBqk7Bmz4iumm45FiyVPylrX2fkiAb2dP6SZ0abBUyZF9VPlWSJd
	 gCsOFnc4NlTkRG9rOYd1K16BGsoXhKLm22vATs811HqUPOmgMxWE5DVPiYenXIFZgD
	 EFuWadMZuC2RG5G8lfe+Y/znQ7X3lIsc4Gyva9yvVtBotwkMVeK6sMLU9JP1Y47Vb8
	 AwDtyaJos4A8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32C660601;
	Sun, 25 Oct 2026 20:27:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC834D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 917B54008E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjUy1KshMtLs for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:27:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 01F4540057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960064;
 b=hkW28Ley7o9wmJeg8aixS09B348biUtFBlhNJV2i/G6MaKCgpLR1YroR6KxqrTsLcU2s
 jEZLzQ2+fMOeN6xyJifjbf/MY8TKvjuZtMaNPN8gQcpbLcEE9STHBk7puw+oWhJ7SND7I
 RFnWzThh5Xb/sb/wp8pkE/zcaq6iLwoqD1VsslFTOwFzSQ59SZsrTvJMU2kscC+mzF8Gy
 RoQwG5/3BPOw3TvdeBf404xB6yr7IArioolAlYmrAn4R/GFHYlwHDE2iMSJIV9ziptfzi
 ipKa/aff6gh/0QrjCx3rtXVmeFOGJDBc4d+ZrHx5PKyaXN+fBkyEVMGMaRr5f8tXhsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960064;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=a2ksj4y2DmnypkRhpDnZ4k1/lEtlq7a/Xwtuu4NSohI=;
 b=M3otQEvYXDJUopJCvP6LnYovvXaOULqCGHdUeVFHIMGuQIMVyxULLOAopZMSQiWqommu
 cHwgXtffOIaMz+XhNoRAIDC2uBNWSSCsL39hcp1zcLpXVqKMLqYM1tdZS6tfAoFtvkWXY
 Cxw4pzjwFuXhOWrOntw2wu4Z3rGE2jTfp3WFThVtmwcvftiWpxBDqlekxMxZ/YNiONz97
 jWxyk/UYF7il4mQUayRfrslqIjMPgqSXi1xmzfVlDB15w17qgWi6C50/LSbBLGMfrCD9P
 OFAW57YOXdTW0XxBosaXxH0DytSBx8/vLflqh73GCUPbZ26qw37fbhMsswQgxyXTGAw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01F4540057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:27:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44E419C61E; Sun, 25 Oct 2026 20:26:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:26:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69a2d9084152c5c1f2318c146c0d6b6a183ed38e
X-Git-Newrev: f3b234b21ae5096c7243d0e36590a48dfbddc55d
X-Patchwork-Hint: ignore
Message-Id: <20261025202618.44E419C61E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: allow Lua 5.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3b234b21ae5096c7243d0e36590a48dfbddc55d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 2af63baecf..a12f2322ce 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
@@ -33,14 +33,14 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
+comment "domoticz needs lua >= 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_PACKAGE_LUA_5_3
+		!(BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4)
 
 comment "domoticz needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
