Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96725606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 18:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zd5nhJCd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51F67811A6;
	Wed,  4 Nov 2026 18:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYEPsE-JJWEu; Wed,  4 Nov 2026 18:03:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93B7381EEF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793815417;
	b=c2kufy/rSh8hk63V8Wsuc2PVE3iIBCdbhpl3ETckdoABedlFSyJxiswM9RAhjVijTiGH
	 IYZfIOWEjamOagy8fTSuq92h3DrJybJdFVR6/4I6hMWUIHRg3Cznnv1bTpGjfonHyclUw
	 vpSuia7JtuJfkOCSG/7eETfDiNDUniTkGuQ8WKjUPMPe1ObFpsVckWKv+z29kohjtArVH
	 0OElVz15oPJDFVmij5WZ2uuTe2j++k+hNOgFe+IGZfe/gT49sW5pfUyvcCxZlQn/v+n2a
	 o1WT7QzkfH2+2N66TkT6vDonojcRior+ImTVyu7d8nbbPprGSQfErT0rCDQsgdP6LxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nURvfBBDx0VKqgFngkUT1e68+1KQ3sEoqz+O9T5B7hg=;
	b=m4ZNlVYFyYA6fEewuKmiWAi7njiVDZSXqF9oWkHg3ZBvi/MjRfOjA+ZukUhuKLux/oj9
	 MHUUvskwV4FxdZv3trVHp/FCC5EX6tgkCi+ZkpxOS+mN3bbi+vmz0TuoVwXnr1FRo0497
	 jESAudNs/uaiXHqxjWtQXbbLqJNCdN/rqpE0BB75NqeMq32rXg2fyzW3DIrHx4JavraHs
	 gC3tN3pG9W4BsGVVFbqvO7fDtEYHZ/0LMfbYutFMOrKSws0j4cttivMUho69YjY2Ajzwv
	 oK/TxZvDmll49lTlr5mV2nNc9jeac8RlcSyoSKFvMTzgzO1gkHz7RfP6BW3q16+lDZg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793815417;
	bh=nURvfBBDx0VKqgFngkUT1e68+1KQ3sEoqz+O9T5B7hg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zd5nhJCdWSbhIDztbVUaD9RnHOdnpa9vVHG/Edje0v99LR09ZXmj1j/q/9Eirn2KR
	 zP4rxTkJu6BDlVu0j6I01k/SLMBiWes76H1LsgQ32n43tT+5hFmWRJ1B75gtUQKomT
	 w4kYxQiLpJ6axzsgUTkgA8aFbEFd3N7b66cQI05JuKhk0lYwJsdDqLnczAd+NfvRyM
	 EvFPQmX/VTyZm/im7WLHQY2IwYiv6Jyz8imPSrUqZ3UTm/jh8PrlNtEeat/zBQMg1q
	 aFOBatN5thJXOiXrOGhfx6+v7s+8NsDdj4Hl5SEoc0qggpAXNtPksBZIjoTCekCfbb
	 efR8FN2aYH7/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B7381EEF;
	Wed,  4 Nov 2026 18:03:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8F75177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 993BC416FB
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMthsWEHbWqT for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 18:03:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8D64040E28
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D64040E28
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 662049DCEE; Wed,  4 Nov 2026 18:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 19:01:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78f0de27ff99d1fe65aada26e3b3de18641f11c2
X-Git-Newrev: 62fd1257ea99a36c43426b7a441db84164e8650c
X-Patchwork-Hint: ignore
Message-Id: <20261104180139.662049DCEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: sort {,
 HOST_}SYSTEMD_CONF_OPTS
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/62fd1257ea99a36c43426b7a441db84164e8650c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The same was done before in 15b4d396b9431634d339dde61cb1d52dcf9e0746
("systemd: sort SYSTEMD_CONF_OPTS"), but ordering was partially lost
since.

Also assign ("=") instead of append ("+=") for unconditional options.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/systemd.mk | 198 ++++++++++++++++++++++-----------------------
 1 file changed, 99 insertions(+), 99 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7a73a06bb4..4476b92886 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -64,30 +64,34 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
 SYSTEMD_PROVIDES = libudev udev
 
-SYSTEMD_CONF_OPTS += \
+SYSTEMD_CONF_OPTS = \
+	-Dbpf-framework=disabled \
 	-Dcreate-log-dirs=false \
-	-Ddbus=disabled \
 	-Ddbus-interfaces-dir=no \
+	-Ddbus=disabled \
 	-Ddefault-compression='auto' \
 	-Ddefault-locale='C.UTF-8' \
 	-Ddefault-user-shell=/bin/sh \
 	-Dfirst-boot-full-preset=false \
+	-Dfuzz-tests=false \
 	-Didn=true \
 	-Dima=false \
+	-Dinstall-tests=false \
 	-Dipe=false \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
+	-Dlibfido2=disabled \
+	-Dlibmount=enabled \
 	-Dlink-boot-shared=true \
 	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dlog-message-verification=disabled \
 	-Dman=disabled \
-	-Dmount-path=/usr/bin/mount \
-	-Dvcs-tag=false \
 	-Dmode=release \
+	-Dmount-path=/usr/bin/mount \
 	-Dnspawn-locale='C.UTF-8' \
 	-Dnss-systemd=true \
 	-Dpasswdqc=disabled \
-	-Dlibfido2=disabled \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Dsetfont-path=/usr/bin/setfont \
@@ -95,20 +99,16 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
+	-Dsysupdated=disabled \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dtests=false \
-	-Dfuzz-tests=false \
-	-Dinstall-tests=false \
-	-Dlog-message-verification=disabled \
-	-Dsysupdated=disabled \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
-	-Dbpf-framework=disabled \
-	-Dvmlinux-h=disabled \
 	-Dumount-path=/usr/bin/umount \
-	-Dxenctrl=disabled \
-	-Dlibmount=enabled
+	-Dvcs-tag=false \
+	-Dvmlinux-h=disabled \
+	-Dxenctrl=disabled
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
@@ -892,118 +892,118 @@ endef
 
 # We need a very minimal host variant, so we disable as much as possible.
 HOST_SYSTEMD_CONF_OPTS = \
-	-Dsplit-bin=true \
 	--prefix=/usr \
 	--libdir=lib \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
-	-Dcreate-log-dirs=false \
-	-Dvcs-tag=false \
-	-Dmode=release \
-	-Dutmp=false \
-	-Dhibernate=false \
-	-Dldconfig=false \
-	-Dresolve=false \
-	-Dbootloader=disabled \
-	-Defi=false \
-	-Dtpm=false \
-	-Denvironment-d=false \
+	-Dacl=disabled \
+	-Dadm-group=false \
+	-Danalyze=false \
+	-Dapparmor=disabled \
+	-Daudit=disabled \
+	-Dbacklight=false \
 	-Dbinfmt=false \
-	-Drepart=disabled \
+	-Dbootloader=disabled \
+	-Dbpf-framework=disabled \
+	-Dbzip2=disabled \
 	-Dcoredump=false \
-	-Ddbus=disabled \
+	-Dcreate-log-dirs=false \
+	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
-	-Dpstore=false \
-	-Doomd=false \
-	-Dlogind=false \
+	-Ddbus=disabled \
+	-Defi=false \
+	-Delfutils=disabled \
+	-Denvironment-d=false \
+	-Dfdisk=disabled \
+	-Dfirstboot=false \
+	-Dfuzz-tests=false \
+	-Dgcrypt=disabled \
+	-Dglib=disabled \
+	-Dgnutls=disabled \
+	-Dgshadow=false \
+	-Dhibernate=false \
+	-Dhomed=disabled \
 	-Dhostnamed=false \
+	-Dhtml=disabled \
+	-Dhwdb=true \
+	-Didn=false \
+	-Dima=false \
+	-Dimportd=disabled \
+	-Dinitrd=false \
+	-Dinstall-tests=false \
+	-Dkernel-install=false \
+	-Dkmod=disabled \
+	-Dldconfig=false \
+	-Dlibarchive=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcurl=disabled \
+	-Dlibfido2=disabled \
+	-Dlibidn2=disabled \
+	-Dlibidn=disabled \
+	-Dlibiptc=disabled \
+	-Dlibmount=enabled \
 	-Dlocaled=false \
+	-Dlog-message-verification=disabled \
+	-Dlogind=false \
+	-Dlz4=disabled \
 	-Dmachined=false \
-	-Dpasswdqc=disabled \
-	-Dportabled=false \
-	-Dsysext=false \
-	-Dsysupdate=disabled \
+	-Dman=disabled \
+	-Dmicrohttpd=disabled \
+	-Dmode=release \
 	-Dmountfsd=false \
-	-Duserdb=false \
-	-Dhomed=disabled \
 	-Dnetworkd=false \
-	-Dtimedated=false \
-	-Dtimesyncd=false \
-	-Dremote=disabled \
-	-Dcreate-log-dirs=false \
+	-Dnspawn=disabled \
 	-Dnsresourced=false \
 	-Dnss-myhostname=false \
 	-Dnss-mymachines=disabled \
 	-Dnss-resolve=disabled \
 	-Dnss-systemd=false \
-	-Dfirstboot=false \
-	-Drandomseed=false \
-	-Dbacklight=false \
-	-Dvconsole=false \
-	-Dvmspawn=disabled \
+	-Doomd=false \
+	-Dp11kit=disabled \
+	-Dpam=disabled \
+	-Dpasswdqc=disabled \
+	-Dpcre2=disabled \
+	-Dpolkit=disabled \
+	-Dportabled=false \
+	-Dpstore=false \
+	-Dpwquality=disabled \
+	-Dqrencode=disabled \
 	-Dquotacheck=false \
-	-Dsysusers=false \
-	-Dstoragetm=false \
-	-Dtmpfiles=true \
-	-Dimportd=disabled \
-	-Dhwdb=true \
+	-Drandomseed=false \
+	-Dremote=disabled \
+	-Drepart=disabled \
+	-Dresolve=false \
 	-Drfkill=false \
-	-Dman=disabled \
-	-Dhtml=disabled \
+	-Dseccomp=disabled \
+	-Dselinux=disabled \
 	-Dsmack=false \
-	-Dpolkit=disabled \
-	-Didn=false \
-	-Dadm-group=false \
-	-Dwheel-group=false \
-	-Dzlib=disabled \
-	-Dgshadow=false \
-	-Dima=false \
-	-Dtests=false \
-	-Dfuzz-tests=false \
-	-Dinstall-tests=false \
-	-Dlog-message-verification=disabled \
-	-Dglib=disabled \
-	-Dlibarchive=disabled \
-	-Dacl=disabled \
+	-Dsplit-bin=true \
+	-Dstoragetm=false \
+	-Dsysext=false \
+	-Dsysupdate=disabled \
+	-Dsysupdated=disabled \
+	-Dsysusers=false \
 	-Dsysvinit-path='' \
-	-Dinitrd=false \
-	-Dxdg-autostart=false \
-	-Dkernel-install=false \
+	-Dtests=false \
+	-Dtimedated=false \
+	-Dtimesyncd=false \
+	-Dtmpfiles=true \
+	-Dtpm=false \
 	-Dukify=enabled \
-	-Danalyze=false \
-	-Dbpf-framework=disabled \
+	-Duserdb=false \
+	-Dutmp=false \
+	-Dvconsole=false \
+	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
-	-Dpwquality=disabled \
-	-Dmicrohttpd=disabled \
-	-Dqrencode=disabled \
-	-Dselinux=disabled \
-	-Dlibcryptsetup=disabled \
-	-Dlibcryptsetup-plugins=disabled \
-	-Delfutils=disabled \
-	-Dlibiptc=disabled \
-	-Dapparmor=disabled \
-	-Daudit=disabled \
+	-Dvmspawn=disabled \
+	-Dwheel-group=false \
+	-Dxdg-autostart=false \
 	-Dxenctrl=disabled \
-	-Dlibidn2=disabled \
-	-Dlibidn=disabled \
-	-Dseccomp=disabled \
 	-Dxkbcommon=disabled \
-	-Dbzip2=disabled \
-	-Dzstd=disabled \
-	-Dlz4=disabled \
-	-Dpam=disabled \
-	-Dfdisk=disabled \
-	-Dkmod=disabled \
 	-Dxz=disabled \
-	-Dlibcurl=disabled \
-	-Dgcrypt=disabled \
-	-Dgnutls=disabled \
-	-Dp11kit=disabled \
-	-Dlibfido2=disabled \
-	-Dpcre2=disabled \
-	-Dsysupdated=disabled \
-	-Dnspawn=disabled \
-	-Dlibmount=enabled
+	-Dzlib=disabled \
+	-Dzstd=disabled
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
