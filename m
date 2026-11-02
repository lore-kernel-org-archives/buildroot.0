Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0F6072146
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F6qG6nyB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503A140580;
	Mon,  2 Nov 2026 14:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6F5CDX-RFyE; Mon,  2 Nov 2026 14:24:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 866BE405D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793629497;
	b=BOutLggL4mQ2c8UGa5yVr8k81b4NvJxqACDlsTkKOR/nQn8kmQ1jN2CF5O/ceJyY/ZNb
	 Zi/0HD7edlP51lMDAqJrABizWvjA2w95kuW8oglbBKk3Z8nDD/n1xKjOPHSkW0Dkz1qH8
	 nYiRLWQ3PdRRoRa+uZblFzr/dslmkGc/Ub8wbvpM6IsvE7NRPKWGoP6vXNSmCEkH1C+uc
	 PVrUdYp/7QpewTdv2iuwzFCHBkRpo3pUGlQxBv6j7sUJkEZr9Z0a4Kf0xCQ/nhkswCHJW
	 UMnlnJcZczGLcrHyq6GvZArd9ZZaBk7vpzhoCeedWsYuka+2VQHqCTCaI4LYq58a7cA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793629497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DRlLtbx4ah7ZrYH7UmVUqzQA0KsJwH4/FAJHy9C3264=;
	b=iTDPXRXbXjnoZk7PDs/uLlUvK6cces+t4vbBawNcxRjQ2AdOiMRJJKIJ/E8+CODqD9/c
	 yEmQbqoeOH2KUTPSXt7y+stme2tLfSk4Ta3cjabtriRCkClHW7tRmJZfBuhHQxiVBIfYB
	 oUEAMIl6UaO+Fxb7NlQzOTwyETkX+S3lyWvHnKn0AFwpGYr88F/Q6Mbcrz9TdL4eoMZCH
	 EWpf8VZsvj4SQ8rAlIK/Tt6ZxIsWsr5S2lyMl+0SUMrq4xzImdWRhJX+FepwN0ESDZ4OZ
	 jn9V6XeQH+ICvX68VY09fWXYgeeFPJwC09CpX+fOeFKXmLDTFo/RCZs3zncv82HdweA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793629497;
	bh=DRlLtbx4ah7ZrYH7UmVUqzQA0KsJwH4/FAJHy9C3264=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F6qG6nyB7HRhY2j8bYbgK/RVXyiGMZIM+YX5PbK1mHIUhBTsvDjIsbe9kt3cBAIwY
	 CQUT1xqvYzGH59PwhYSsQ0Jrwd77pNkTIA9nQHx3QL8XZ1O7T7bLfkTvx4qqQOnGdi
	 ecdYoKOKJduUsq2So9LHZgEzTi6TdF0+SsBceD42bI5JC++ZW5pjNiwMUk5ih3VMQr
	 pF1cHI/U+Vs/VAJVFvMpANqe4VsvT625560a/W/vg+uMKUjG3YPN340NoGku6Wx50t
	 ZZRoQUvb2RpBf5nAdcYciejDw2c0AfZ73ywekAT38RZPYfMAENVYTceO2RqT+Dtp5y
	 KDWxsmlaRbf7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866BE405D1;
	Mon,  2 Nov 2026 14:24:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 611CAD3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E18380F28
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul_wgROGr3fg for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DC4D280F4F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793629494;
 b=nyvCKS5U0OrNTfznY3w8m3Gid63mLFTgjrF6NCIHmg4wjjTSthIMUB3w/SVjd8LfUzUT
 3gprXmc+r8RWAw2uEgXoXDGn2MXohsbK8b0iui79BpR+sL7heqw7sOyJkZg0Qy0JybZgT
 yTOM59ma35H6zMYoGHXdwJvW9A9I66fN4EPMJgra+2Bb97NKBMnN65KSnbJvQ5V4dXId5
 TBX1Jtwnyko2rTpkVcUmqWmj476VW+icsZtUH4h5pGJHENHIDELClY3owMvC5EJVFLlFa
 XjBnfNRW6YVufcLkCQ9MMhNW/UKUtuYYRyfKcolAOekr+Gheml9JhU5C8oSk2ck2zJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793629494;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=GVIAhIzW6Qm8e7wyO5Et6B2K+E32r35ikOB2T1zI918=;
 b=SMKw1P0csBR0rv+NQU4pdqSgQYFI4J4MDHuq9G/6TeA6SLay0PuKf31assIlEa0pfHn+
 YANYOxnOJvUSOSU0TbD1vS5vOaEjc6IrHl3/PZkoIwoNQ6w8YRSTjAKffMvoQ3Yjir7JN
 sJjul9QfGbcWaIlm6XWkBLTAzcSY2z1NhrtbwMdF5KLSKWFJ6/M7BuyI4/6nzfxHjIkAH
 s97scILzxaFlAZ7Q50yu1VPwYVs6Uyi0nW8zhzKHiMKIDB7skea9/n/tVgpzuvx3MHKjY
 40vtYxVoWf2EyMcN5yO9Lqtata/MvWBK1hK7/gwzxbFTa/QC49zk8Avs+uruiz07QBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="Eq4FdH/j"; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC4D280F4F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mKJ-1wRFva03Sd-010qjK; Mon, 02
 Nov 2026 15:24:45 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon,  2 Nov 2026 15:24:14 +0100
Message-ID: <20261102142418.2544020-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102142418.2544020-1-fiona.klute@gmx.de>
References: <20261102142418.2544020-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VO98++9U81Nvzc5wDf4rCj/WlW8Hcv68X9TCqvEZK8emu+KBEEh
 buALl1KBzYP12XtYDC8Ii/O1/qPncax47UG3LJBArVqSYs17LdWcVqciDEntys//enqhS6u
 KbsRnsX6kTRrAaYOYg3JohL0mqOq/8ec8rgP5AdQWNDKWSgaq5fKaaAeB02N7jG/wVBhBcd
 miK51pysteAieePrYQzkg==
UI-OutboundReport: notjunk:1;M01:P0:Yi2DZi1xHZk=;AHNoz/PHAXvD8RdOtPXAfJX/d55
 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
 JpiA8vcovQ==
Subject: [Buildroot] [PATCH v2 1/5] package/systemd: sort {,
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The same was done before in 15b4d396b9431634d339dde61cb1d52dcf9e0746
("systemd: sort SYSTEMD_CONF_OPTS"), but ordering was partially lost
since.

Also assign ("=") instead of append ("+=") for unconditional options.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/systemd/systemd.mk | 198 ++++++++++++++++++-------------------
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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
