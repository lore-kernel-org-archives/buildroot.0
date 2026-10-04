Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC79CA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 18:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E2F760705;
	Sun,  4 Oct 2026 18:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxd3VtuChVOU; Sun,  4 Oct 2026 18:02:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CA2FC606BE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791136966;
	b=VVqjMAuLHjx+y6bIopW8n+IwWWmENp3ORnmYTYx9M/VOB7ztLe+O56lJo4zPIKNaFoX8
	 2T7voSU1QhsQxq8hDvX6XuSEdVFY2hnnuK4doMfRcDgeGi0M79sryhZeQTrdaxfvZNEIN
	 dxDaE92BY4FFuhcVKxmSGgAduku9ZPpxf0Sw0ngeNhMaKn3Jofj72hEfewZQU64lYNuGS
	 hJCdfuSmr6L2j/8IOHuwYZukevBOt3cnxeZHWqoPJCOmFGDyQlHtQ7cR6fT5ggINymced
	 RN1hAamuRhpvSftS26shzRBdD1sMRrtgXhBBUjFTOjBi50XTRqVEr/10QsSKGoQUQgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791136966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2uasF4p6vrVLrpEGOQSZlIoPA3FP9eX2eIrfU8r3g+w=;
	b=QR+QzZJubXWDzZMAcA0rrmYRqfsOJ2LU+AI1n93O7ZEBhZTOcx+bkTqfI1IfCKSs/mlZ
	 41SBqhtHS7yDEgCdGw9dusfvIMqmu+6cUsjJ5GOxMbTUY+eMKNTm7KeRm/rdk8sCgtaJO
	 KlFa/tWlw+jvczykGx4mrntmbnrj+WT120XYBhmK91Uh9XHgxKPnFIB8qn4sETuuWbKdu
	 E0kzfLHHe3SmX87eF5ZQDtLS48NiihsemQSYNowiI90bgTFp0qHM872pAlYhV4gHvc2RA
	 VKrAD0XOi+13OumW+IgXgtQqxmC4/i45k4zZI/UNeY3YJSr8nYTGe3Aw3X5YrVG1NCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791136966;
	bh=2uasF4p6vrVLrpEGOQSZlIoPA3FP9eX2eIrfU8r3g+w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dH4thqhTC0wgK7CK7H2b9dcLT6v6BQ+peJL3N4EQE2ihkrBTSiehGMIr8aJPTugPH
	 B90GVls6lso+ICvjOxzCXMPnrc00rOIRVTIt2krn30IVUKaxwXidMfU7gwHDo7OXKt
	 2wdyDxrzD29SUapm35AsKIoC7deGgUFaHvYF4YBdF+tv6sFmtbqpv/W7Pp7lYBMoRE
	 OVPK/ajlD1Ph0MLrpWFUkl4i0umk4MXmCORG4WnflgfeACtwsbapXUwA3gLxXP+rQG
	 syMko8nOyF8zXeUI9kTrRx0JNzn4dzdpEUxN8CmH4P2haDGY0cHM3oQDQ0s7o8aLl6
	 ki95q7ooYNpyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2FC606BE;
	Sun,  4 Oct 2026 18:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5995234E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B84840049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YU0qccy7E6h for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 18:02:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 465C34002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791136964;
 b=A+iviHRYl+VFDegB5tC41KBDYaEDZk4KeZu7xQlOYl+FJYG/Xp6eLY1GK/pBfphjolHH
 X8jrowKnCJjPvyaOxjJ4eJRlLiM6xhi6j4UebZ4fgaO2Ph21uMQNIFUQbav5TxbWvG/rL
 u9dfUDrLLf1H/btHlxtB4px2B4AYjKLBERoKHDE4ibVNp3L2fEObsQ4XT1oehiS4Ni/fq
 NmGlKaUgg3Q+Bg6UYAUWuwMTV6SAmVRbaXMl/ONGbgENpBeR91naPmbBkDczTJfwicg/Q
 gBduYoNuh5cRifzktzYyqYC0QQxaTr/sl+JJ/2PS7XFut7EtIhOH/lADDXQa5mKAEhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791136964;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=gLSAjgrmLwk5696wPHaXPKedBxZCF2EBFxbnb6FOUMM=;
 b=Ear5Rc+ojZdG4hjkpFPk+ne8NFRK26mnlsM0FfNS80unB2LUJ9xjIBtkBLd6JxTyqBST
 NzPwSRiX46xOueXEIjjfNJx4pvtN/KQr8BMgdwZrlvT/jwbdIo3IOQXjHJc3dGhhYtJEJ
 LtRuMYkb2aWBEtGlV2PZOP6ki0kjxFPA1L6gSIP5kMIzvPZwbRyE+S353oimzyH8HUUB5
 YYveo6nn40kQ8VJuRrEDBEtbsF0pf9vplG1kadUbu1xi+d6XlwKJfPpZdIA3VYTQ+4J1V
 YtqIu5eqYaGj9boVTecRNekgX6JmVtcOFO6JvXMVl3PQB+0uiKpoXgpCVYNdAeTVsqw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kOJ5cmdt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kOJ5cmdt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 465C34002B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791136944;
 bh=gLSAjgrmLwk5696wPHaXPKedBxZCF2EBFxbnb6FOUMM=;
 h=From:To:Cc:Subject:Date:From;
 b=kOJ5cmdt4kX6ooDTkrknIrFJgKVWB0ibzI7ASFRBHue6pl+cQvvzloc+htaB9wFkH
 jCN+ypGwnLWxD7qGkAWXO8UrOoxHct9/LJ6WjtsCv9/+34DTS+Kcai1hdNc/p+lKbr
 sN3U3PKKV/duxDd78x9sCZY3HmqiP6cgBC0j+LxNCxXyMNRUIGZuQWNj/XMgMh4hYg
 8rVMTz8Y+rNIvliVi8PdXN4hy1U8HSgiwYzjedMWwLPz7FoQU6CcftkGxirozxIPxX
 Ck79IxVfqqyFypJcq/1rwTUlfdE6pOMsAtIB6yN7mdlbT97ApVGQCZ0rJ0EahK4ZIy
 y227r670f7Dmw==
X-KAS-Sym: v3:f51bdf72230551df:Tfke6Kq/acD75bqIhHJKold3T4nAmaQjisR0eJNXGMOl6
 q3m2m1jGknByZdySAoc0VRGwVlOCg4rdVV5fVOLCyoAQk49lPMsMW9TssWCOuEDF/v92hcgiZFA
 +REAhO2D43A3M9NRDR3ULg9inj3PTHOxDRLPnG+DllTxEdd3tIEawnrwO7mtBHa1XwKZEmeyqS5
 72HTfvDx+HtlxCI7yg8uWsJdldoJ0La+5aSWeCgHC5G272NQmflzsJ1PLLf9KhYqIxTIbg1XCpS
 If26LQtz7YPWZp2X+0w+KjciYHTaZx7Tcmlk0KlGXQP/jU9g80F8dIGo7jyKtLbYD7/33DpA==:
 MO2RIpxkIB2ggbZ0U8ytLGnjGALHTXD6bVMN+zEPvuIqPAAQx260DpgvMNptv38L2ZW2rcKN4TA
 MAkGxZplsWqt076/59z6nJ3b7RaAbd1dIBkqm+Ie90DIy7wETW6sBrisLhuoh70JotBhf9KP/w/
 WSSMKP+pWvytuuvX9MxBon15D2hGzs6/zIULWCQ1kT595EY/DtKdfwHcNMnrzpYiYJflM72J27y
 mwtabBPGsmSK+ccWHIHO/l9wes+JO2YYpmGp/0jsrEAc4+TkySX2sZOCd4iyyZkweq9IYmBMrqP
 aH5gUtwNR+FtPG301Uy/qP3oxojWWxXe3SX0LhJGl4YLggEcZfH6qsPhm9BV0i8NfhPBIXlb0Ok
 17NSIeTKxPgFtIRyKVf+U9qiLv+1KG/MT8jKRHnrIMlTc/osI5LsikXIwkZhOjbqJR0IFw+m6pS
 WR5Fhf9UHh4bVbWLJAsB8Zw1QZrtZjFi++zjXs7v83Lx9wBcLB7x1OCuhMX331hgm/ZvWTM3wS8
 IBiz42ffc9cIMCQuDrg1V6WyaiU8KLtjt3M/DDWFABsKQuglYZTttZP4MU6UpbSQDb0gne8cuvI
 TlROZwkemCUcBEBL6g4Tf8D2VJM13YYs7UL1R82v9iG9iFxqvWc1PcxVLv61qNZykofPm9trXvp
 AxdoKzdES6ljuHiVI
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D52AA4C1432;
 Sun,  4 Oct 2026 20:02:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52896)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDQXY-000000000CC-1N1s;
 Sun, 04 Oct 2026 18:02:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 20:02:23 +0200
Message-ID: <20261004180224.1782750-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/2] package/python3: remove configure option
 --without-cxx-main
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream release 3.12.0 first included commit
https://github.com/python/cpython/commit/398ed84dc40abc58e16f5014d44c08f20cb4b5f6
which removed the configure option --with-cxx-main.

Buildroot commit 36e635d2d5c0166476858aa239ccbe78e8f2af14 bumped the
package from 3.11.6 to 3.12.1 but forgot to remove that configure
option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0a7bb05992..a75af82ce4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -18,7 +18,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
@@ -202,7 +201,6 @@ endif
 
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
 	--disable-pydoc \
 	--disable-test-modules \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
