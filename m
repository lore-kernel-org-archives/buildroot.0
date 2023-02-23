Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC9DC64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8566405CB;
	Thu, 23 Feb 2023 22:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8566405CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFSpK4zfmQy0; Thu, 23 Feb 2023 22:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10AA6405D8;
	Thu, 23 Feb 2023 22:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10AA6405D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B98CC1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A1A260BBB
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1A260BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRCpaShFIkos for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:58:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2967660BC5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2967660BC5
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:58:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D255100004;
 Thu, 23 Feb 2023 22:58:02 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:58:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223235801.6b4a2c05@windsurf>
In-Reply-To: <20230223160714.1210026-1-fontaine.fabrice@gmail.com>
References: <20230223160714.1210026-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677193082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJdrKjjEMjVFSz/yr8KAiW117yaCQ+LzJu5PizyceKo=;
 b=LA6pWWS8PGJHmyVxyhIOYvKVUQaCPLkBQ1meFY4a2OFtyYtRRyFdyJ47RUpWdRP5t4KDkV
 Ku7tDEC6qJhYZh5K/vlgRXu+V4kcGSpr7PMnbH7GPgXcf7x5oStfAnqUKVabWsbrnV0K7W
 VVnUIhHd6BtrDw7MrDIN2UNw/sEZienPWI6xsEC9VFsamyuimsddTVzM+27780YKj/am+a
 vTxXA4eTeZ0AicckzDrH/VQ6Juujz10dSQXVnpkTsBtO9gd6QHUmpzn0feMZzpmiyzNDpB
 MZrPjLwLWEXyjGdyOl6dgERRwJ45HbQIlCPiW86IzgAiUOd0I6NDkOYU/nqTuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LA6pWWS8
Subject: Re: [Buildroot] [PATCH 1/1] package/xtables-addons: drop
 XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu, 23 Feb 2023 17:07:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop XTABLES_ADDONS_DISABLE_GEOIP_HELPERS which raises the following
> build failure (probably since the addition of the package):

No, it is not since the addition of the package.

Upstream commit 7ad55ad6210d450521664f64453f854b3ba13d8d looks like this:

commit 7ad55ad6210d450521664f64453f854b3ba13d8d
Author: Jan Engelhardt <jengelh@inai.de>
Date:   Tue Aug 16 10:44:56 2022 +0200

    build: eliminate geoip/ make recursion

diff --git a/Makefile.am b/Makefile.am
index c051d53..0518bb6 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,10 +1,16 @@
 # -*- Makefile -*-
 
 ACLOCAL_AMFLAGS  = -I m4
-SUBDIRS          = extensions extensions/ACCOUNT extensions/pknock geoip
-
-pkglibexec_SCRIPTS = asn/xt_asn_build asn/xt_asn_dl asn/xt_asn_fetch
-man_MANS = xtables-addons.8 asn/xt_asn_build.1 asn/xt_asn_dl.1
+SUBDIRS          = extensions extensions/ACCOUNT extensions/pknock
+
+bin_SCRIPTS = geoip/xt_geoip_query
+pkglibexec_SCRIPTS = asn/xt_asn_build asn/xt_asn_dl asn/xt_asn_fetch \
+       geoip/xt_geoip_build geoip/xt_geoip_build_maxmind \
+       geoip/xt_geoip_dl geoip/xt_geoip_dl_maxmind
+man_MANS = xtables-addons.8 asn/xt_asn_build.1 asn/xt_asn_dl.1 \
+       geoip/xt_geoip_build.1 geoip/xt_geoip_dl.1 \
+       geoip/xt_geoip_build_maxmind.1 geoip/xt_geoip_dl_maxmind.1 \
+       geoip/xt_geoip_query.1
 
 .PHONY: FORCE
 FORCE:

So up to this commit (which was part of the xtables-addons v3.22
release), the $(SED) invocation was working fine to drop geoip from the
SUBDIRS variable.

Now that they have removed the recursive make, replace " geoip" with
nothing causes:

bin_SCRIPTS = geoip/xt_geoip_query

to become:

bin_SCRIPTS = xt_geoip_query

causing the build breakage. So it's actually Buildroot commit
53f2999edfa5e67923d4d8a102c15fa3200e089c (from you!) that broke this :-)

> make[3]: *** No rule to make target '/xt_geoip_query', needed by 'all-am'.  Stop.
> 
> unzip and perl don't seem to be needed

They are, but not at build time. The comment was referring to the fact
that they are needed at runtime: the scripts in the geoip/ subdir are
written in Perl, and one of them uses unzip. So practically speaking,
installing them on the target is useless because xtables-addons does
not force installing Perl on the target.

However, the package anyway also installs asn/xt_asn_fetch and
asn/xt_asn_build which are also written in Perl.

So perhaps what needs to be done is simply to remove these scripts in a
POST_INSTALL_TARGET_HOOKS ? (And indeed drop the SED expression as you
did).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
