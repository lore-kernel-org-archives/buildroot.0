Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B357606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FlRdKdBO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5DAD606DB;
	Mon, 19 Oct 2026 19:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdIev1BTIXQX; Mon, 19 Oct 2026 19:30:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BBB73606DC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438243;
	b=SaDydmgTRBwTs59tT9u4CwgF3bN6gY6KxaQ0Y0MKQkYdhOseHtiSK1LbMcim4mb4Zl2/
	 bfWppoRi8dR1hkg1FHKge8i5Hy6HeiOJ7LvH33Ye+Y/IAts+MTQsXySR1La07a1tbIpWf
	 YWCRdLJdKWPkJFbarR27S5W7ALuEXQJhDUk/g20x0js+uiXOIxOIFxZGiDd/6gNXvyZGa
	 pe+QPIrX2SzDjWQzoVxI+xLmY8PxO8df5rGnpNz8fk3xBGU/3gaOygFXWt5R9bDduXiqw
	 E/twodLX9n0mYb0zSRa9podwd1bfySo/BN1qmPBl6Y9NUb1fBYV2Hms/MwVi9CI7wGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kubeXDN5H21DFkYZAQqag0ZwY0YX59Ao1Qpcq0uwfNQ=;
	b=Qv7ymnvLLmFgcL49pVHBaxPn//zOFcnBWk6lpDrFXNJpOjOq3MSS0B7YJG3ZD8EA80Kk
	 zrcmg4Ga5sKxZ8rmMr6tVZ6JPmNzc7DrS/QGYrLkfx/wIvYOF/8O1EUf5/hvLzcVQFZG5
	 dCyjCqhgKDYvDTHFAakjx4m9aw/Q9hqQ77BAA1hnaPoKNZssU7CrTuZnnRCQB6SrQiqT4
	 1grtd7KvMyQZ+2Rn6Uo4715cQ0mOfIgstkpQ7Bxb/qx/DEJs/vNZdQzVaCx8R7pGHbSjt
	 FzZs9TcUviVaTa5xbKNZ60ojOWfFF124m9Lh7wnFH4fn7PQlL0CCekYmqxGIMakvK9Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438243;
	bh=kubeXDN5H21DFkYZAQqag0ZwY0YX59Ao1Qpcq0uwfNQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FlRdKdBO6EVuTlyLjz0br+3tiFCzv82gkCcMbDxVMNF9/7gGISnxsDRzwVfeOUIuT
	 tWgx1ZP7Rc7N3inuWXbZAYmjMH2pYWF+7FXcBEz/WPL2UghhQZXXRNfK0Y64kiXvsu
	 Xh2UHiONJn/FupacadogJLTXf5sjSKEXigah3IxXCESGi8J2j31WNHfDEM20ku4faS
	 vxRzY0n7CfRXpi/1xmW2BM66XU5luQn8tNlnyzV05ieocQq0cs6C1fxhuLLDJzTfz+
	 bqBGmXqosBN0i9JkOXGVGrleRDDyH+NbCqskLDbgjQsmRGnO476GVRfJDclMWg+1B/
	 x9XNnD0ZP7eVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB73606DC;
	Mon, 19 Oct 2026 19:30:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA8021E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BD0380E3E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvcuEWqVZxmo for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:30:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5128480D2D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438240;
 b=bBGTFd1iIW/RUetTx41KODfir4f8/vqeCkXfbIT9eiW1TEAciM+yCH8RAgMFACcY9r3A
 dWGcK7O6k+gFt4qy0ZWBHk9JX6/jYnN8ngUzXeCRubA1i3s2WHC1/a4l+d6Ak8nPD79FD
 wMQjKqBlScfMuAWe46swl/jlANEzN0mMiuz+oK4l03jyo5lHgtoOhFRlGDNO+m4v+Ck2Z
 LxJ5ESzg+x1cLjwAvGXUiLRLIBqNCa+VGOuFdhV5CTyEZgwhPdBWnTl/oydYoORZmqLVa
 0JjhYutQwMQqkkeYibAhk77F0YZza2gL1yZht2lLO2FTX494wZ+Fc5sfYkJT0RjMi9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438240;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sPWXmV5jgFjfK2eoT9+c86s5PO7b7CDQHVY8/TNmkpU=;
 b=AYRBmVJIYpcBUHN98cjtQu7/xIbE+sRhk9e+cD60IKhYR8NeiWNIjngtgUZhPLxf5Y4R
 XT/3Jvb3eOmqLrnQL/A0IRRfaAFo2M5C02bg+0ZdVgGaE0w2QpiCp277onvzFzVNGZumP
 DhkoudUdSDLeaKR8J3m4we/YCryVvT/Hk2RLJ9JoAey+ozsqr5+IKkqCNmTZkd+auqdVC
 5PoLs82tCo/2J1hnUYZHXTMMGe6XiWp6jCZA2sLLXYz3qGSQBGUQf/IU4mwOCtkfH2aS2
 7RgZTelfsYeyGwESTZted01Vcx/7uAtFvuoF/F9q0Et+IuV4sfldoTiPdNHV8zDY3dQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5128480D2D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 973709876D; Mon, 19 Oct 2026 19:29:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 21:25:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24590006a64e09a52ea6ed254c706877b9706e61
X-Git-Newrev: 3e1ac8ad16a8d0d54cf0757faa414ff663174ae1
X-Patchwork-Hint: ignore
Message-Id: <20261019192917.973709876D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: propagate missing
 dependency inherited from runc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e1ac8ad16a8d0d54cf0757faa414ff663174ae1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_PODMAN has:

	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN

but forgot to propagate the
BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS dependency from
BR2_PACKAGE_RUNC.

Propagating this dependency requires a bit more care than usual, due
to the ability to use crun as an alternative to runc.

We also propagate it to the only reverse dependency of podman, which
is mender-update-modules.

Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-update-modules/Config.in | 2 ++
 package/podman/Config.in                | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index dac83c47ec..53ffd13dbf 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -129,6 +129,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # podman
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # podman
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
@@ -153,6 +154,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
diff --git a/package/podman/Config.in b/package/podman/Config.in
index bbcb15691d..a8c625c5b1 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # fork()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # runc
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
@@ -91,6 +92,7 @@ endif
 comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
