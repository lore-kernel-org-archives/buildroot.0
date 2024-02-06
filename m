Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF947C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A66841E11;
	Tue,  6 Feb 2024 15:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A66841E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dtd0qtB1tDKK; Tue,  6 Feb 2024 15:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD1441E12;
	Tue,  6 Feb 2024 15:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CD1441E12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 029511BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E45128275A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sctmJ61NYLDl for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70DB68272C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DB68272C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70DB68272C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:11:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 335914000C;
 Tue,  6 Feb 2024 15:11:53 +0000 (UTC)
Date: Tue, 6 Feb 2024 16:11:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240206161152.0e178414@windsurf>
In-Reply-To: <20240116065831.9471-2-fontaine.fabrice@gmail.com>
References: <20240116065831.9471-1-fontaine.fabrice@gmail.com>
 <20240116065831.9471-2-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/7cI/drGvcdP./fFC8FKpS5S"
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707232313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cWfNInfiKoR+nt4C2JB6w/3j8mro9snqSTnI+c5nVg8=;
 b=ppIIgGH9QF1IyGci/g2mIOe/DSuLPYYkRBZQPYIKnp9RhewSyhkxJMugskNCkJ224IEdQA
 G7hHiPI6BfqMDfkvBufL19LnTjo22mwx0HXydlDKyqIdHcrJsxs+sE28Vwo2yX0tLwqaEA
 fCWC/S6IXVO8v0BwF0b0fZ8NE6LsRH0WoUrgMFajWKevhBxbAHpjWfAyM2HjSmHwZczvKC
 vbM7HcL8g6GgT9iKPmGsVj7U4fc47iTx0oJmLC+ZtRM4iN+mmK+dLgfwbmZLILRS0P34co
 aU0rOTNhFbO21m0oF7C6zn2IE1ZlAQlH8Xg/JOW1aQbcoOCNpdJ2jhnebEVcsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ppIIgGH9
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/attr: affected by gcc bug 101766
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Norbert Lange <nolange79@gmail.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--MP_/7cI/drGvcdP./fFC8FKpS5S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Fabrice,

On Tue, 16 Jan 2024 07:58:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> attr is affected by gcc bug 101766 since version 1.5.2 and
> https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=11b9069098b4d4c23efb06c9457a085b784354d4
> resulting in the following build failure on microblaze since commit
> b31b91296e7f985b909f104f06a098adddef1fea:
> 
> libattr/syscalls.c:133:10: error: symver is only supported on ELF platforms
>   133 | # pragma GCC visibility pop
>       |          ^~~
> 
> So let's disable package attr and packages depending on it.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a
> 
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I don't like this very much. It's annoying to propagate this dependency
to all reverse dependencies of attr, and make it unavailable on
Microblaze for this silly reason. So I came up with the attached patch
for attr, which rather detects if __attribute__(__symver__) works or
not, and fall backs to another mechanism if not (this fallback already
exists in the attr code).

Could you have a look at my proposal, and if it suits you, submit it
upstream and as a patch to Buildroot ? :-)

(Yeah, I know I'm pushing some of the work for you, my goal is to be
able to continue review/merge other patches)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

--MP_/7cI/drGvcdP./fFC8FKpS5S
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-configure.ac-add-detection-of-symver-gcc-attribute.patch

From 1be7c2251040f1152de9ceb5263e6e96fa5c3d75 Mon Sep 17 00:00:00 2001
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2024 15:33:15 +0100
Subject: [PATCH] configure.ac: add detection of symver gcc attribute

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configure.ac       | 15 +++++++++++++++
 libattr/syscalls.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 7e362e9..98477b5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -57,6 +57,21 @@ AS_CASE([$host_os],
 	[linux*], [os_linux=yes])
 AM_CONDITIONAL([OS_LINUX], [test "x$os_linux" = "xyes"])
 
+AC_CACHE_CHECK(whether __attribute__((__symver__())) is supported,
+	gcc_cv_symver_attribute,
+	[cat > conftest.c <<EOF
+void foo (void) {}
+__typeof(foo) foo __attribute__ ((__symver__("foo@foo")));
+EOF
+	gcc_cv_symver_attribute=no
+	if ${CC-cc} -Werror -S conftest.c -o conftest.s >/dev/null 2>&1; then \
+	    gcc_cv_symver_attribute=yes
+	fi
+	rm -f conftest.[cs]
+])
+AS_IF([test $gcc_cv_symver_attribute = yes],
+      [AC_DEFINE(HAVE_SYMVER_ATTRIBUTE, [], [GCC supports symver attribute])])
+
 AC_CONFIG_COMMANDS([include/attr],
 	[dnl
 	rm -rf include/attr
diff --git a/libattr/syscalls.c b/libattr/syscalls.c
index 907560a..caa70bc 100644
--- a/libattr/syscalls.c
+++ b/libattr/syscalls.c
@@ -32,7 +32,7 @@
  * fall back to traditional .symver asm directive otherwise.
  */
 #ifdef __has_attribute
-# if __has_attribute(__symver__)
+# if defined(HAVE_SYMVER_ATTRIBUTE)
 #  define SYMVER(cn, vn) __typeof(cn) cn __attribute__((__symver__(vn)))
 # elif __has_attribute(__no_reorder__)
    /*
-- 
2.43.0


--MP_/7cI/drGvcdP./fFC8FKpS5S
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--MP_/7cI/drGvcdP./fFC8FKpS5S--
