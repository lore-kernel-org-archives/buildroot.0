Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022D6C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F54E605A0;
	Fri, 26 Jul 2024 16:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iI3cJoPGI9gN; Fri, 26 Jul 2024 16:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E2E560621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2E560621;
	Fri, 26 Jul 2024 16:02:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAE241BF330
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A320A60621
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V98H7-JkrqD7 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C9CA605A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C9CA605A0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C9CA605A0
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:02:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdebB-1rxleu18pF-00iYhu; Fri, 26
 Jul 2024 18:02:05 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:01:52 +0200
Message-ID: <20240726160152.2182074-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:IKKSaZnd+/uFN4RJNE4C2TRl4GoF+AAwOpzU3TOFp5JIyp8jPKD
 WJ9tETSpvtSJfLlcVSObSmUoQhi9ffOrKGg9NOHZYz7JZV8od/WXJii1hh1tN2H/XCq54fT
 +X7KrFkL4tcAusBVnwWUAHwExIYIgOcc767PMgxmM6dZ/kQOXRKxMMgTQ6b7nk/zVxIFw+T
 CzSn9AGwweV7L6QatMWIA==
UI-OutboundReport: notjunk:1;M01:P0:AdTYymbFLwE=;wJJGSJQ1K0ujlTI3Kw+/vvwW9TW
 l20dkjYyWfrSZfbsASmlX65naZS4LQ1FlcU37Gi2Y4EoMkepjtuC7NhRdBDwU5ZNcHfERoWDY
 v+DrYPwJkAOeFZttNX4ZDWo+bbGGUjVehYZLeh4tP+8t5iH3EaSrTlwGEbEjva+0hGNnY9Ibs
 5H8HQJIt8712pDWYDdKWsA4O0G1i0k0iZqccuGWb88Qut83MpGIzPz0Luxwpbnhd3s9ofq6ez
 1PmvFBaafIpM1hbNH3ZCgmDOFZfiY6c3oWHMX8jaDlxEtunEcxkGzbBsveDAAKF61ufJslgDM
 mz5hZg1z50kuI2jU99xSBiSuTePOXah3Fnlo/CvO6NkSDMK5w25eyrq87I1dT9WtbQqXFro6e
 b43CUQD+XLL26MSHhfZCcxzbdtud4U+k2+/aC2uLfF6QvTEqxDe16DeGdRAiNHA1fLcbnN8fa
 2pNNn9DvbdQzmM8fHEuVCpamI58RX0ttc+jOwAfiKpkP2GRCLcNQMVRGldECQVkYZirpOKejb
 PzM09P66q7vNZIrRatWMdy1JykRNuzVrxAC4pMVjEXNjBQ5Su+UzbIxRAoq9wsZXSCCXdSq3Y
 DtWwx6H9IK+bsxhp7VPxgvfFhU/On7BwvWi3q9/iR5ZxG9nOmykZLZqUSbatwZA1gSRKkAtkR
 +Odh5hLCTqNH1Pu9tz2xmRvUFTvvr6p7r4evUsvl7J3eApUbGSC7I8GX2Qx/mRvKWRaPa/f62
 1heHr5P3VwxVoaA6kto+xkvIa1CDHMECFMFbpiskFfVwbYVo2QGVeDCf04OlY6tJ1G7xE5jYK
 ik8Ui4flcBbl6oIYGEj+j5hw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722009725; x=1722614525; i=fiona.klute@gmx.de;
 bh=9fI1SaZjNQpl4KZVKNAl1sh9tgo1JB7Wwhd/3eQ0Y5Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hcGn99yG6zoe7LUFxEsb++meeCZREAQeR/tZ9eekSImmGUVmW2baem4kBhVmBey1
 m6ypL+4lSOmEh/pl0F120SuKFqZgHuqCvRlh3ROTsDkdEX6xMdGhxKF21/5hxp0i9
 t6rLb8dgP8RWP3K2QW7u3lJ2FzDoIavNG2851i3s9v34u1gzzKGfNOFtqY+SEQugm
 SJhb7ve3XJ7s3VipYe+fVhqu7Kh9l1O2eStYABq/XnQZptKzk/DOfbnpHGIAq2Squ
 C80S3fvWbrTPj/IqDax5p6WFIinHRuSJ/+fcsLWCzma/6AkDNCfS3vF/guxKn8jcU
 BzhkmhXBRVwZ8Wiz1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hcGn99yG
Subject: [Buildroot] [PATCH 1/1] package/busybox: fix menuconfig with GCC 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

GCC 14 errors out on the implicit return type of "main() {}". The
patch also removes the /dev/null redirection of GCC stderr that hid
the actual problem.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 ...-failing-saying-ncurses-is-not-found.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch

diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
new file mode 100644
index 0000000000..7b78c01984
--- /dev/null
+++ b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
@@ -0,0 +1,38 @@
+From ctxnop@gmail.com  Sun Jul 21 12:10:52 2024
+From: ctxnop@gmail.com (Nop)
+Date: Sun, 21 Jul 2024 14:10:52 +0200
+Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
+
+Newer GCC increased diagnostics levels resulting in considering the
+test code to be invalid. The resulting message was misleading, saying
+that ncurses was not found, while the check failed for an unrelated
+reason which was hidden because GCC stderr was redirected to
+/dev/null.
+
+Signed-off-by: ctxnop <ctxnop@gmail.com>
+Upstream: http://lists.busybox.net/pipermail/busybox/2024-July/090840.html
+[Fiona: rephrased commit message for clarity]
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
+b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..c644d1d48 100755
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
+
+ # Check if we can link to ncurses
+ check() {
+-        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
++	$cc -x c - -o $tmp <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main() { return 0; }
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+--
+2.45.2
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
