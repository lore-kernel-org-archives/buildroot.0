Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56242C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:13:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 187DE600D4
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 187DE600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D260080E62;
	Sun,  5 Sep 2021 14:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-y8k23Kh8XK; Sun,  5 Sep 2021 14:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1393C80E85;
	Sun,  5 Sep 2021 14:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9914E1BF392
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 953CA6066A
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5yPk8rf9LMR for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 14:13:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3ED3360658
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 14:13:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 554DB1C0002;
 Sun,  5 Sep 2021 14:13:18 +0000 (UTC)
Date: Sun, 5 Sep 2021 16:13:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: David GOUARIN <dgouarin@gmail.com>
Message-ID: <20210905161317.064e7d03@windsurf>
In-Reply-To: <20210903153746.19425-1-david.gouarin@thalesgroup.com>
References: <20210903153746.19425-1-david.gouarin@thalesgroup.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtalloc: bump to version 2.3.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Fri,  3 Sep 2021 17:37:45 +0200
David GOUARIN <dgouarin@gmail.com> wrote:

> -sha256  ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
> -sha256  15c2767545d1e43dc35832736253bde5be956f8ffec0474a6d0f70349b646ed3  talloc.h
> -sha256  8742f2dad3aaf885c7b4b699c20bfa0e9edeab380689f91a88aa90af03e6947b  pytalloc.h
> +sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
> +sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
> +sha256  cca17b31b2f00d7a737764b70e2be3a32f3b047ac8535c3b53759eb2946e5053  pytalloc.h

You did not explain the changes of the hashes for the license files.
And in fact, it seems like there are some important changes in
pytalloc.h:

--- output/build/libtalloc-2.3.1/pytalloc.h     2019-12-16 10:14:22.000000000 +0100
+++ output/build/libtalloc-2.3.3/pytalloc.h     2021-03-24 12:48:55.000000000 +0100
@@ -3,18 +3,22 @@
    Samba utility functions
    Copyright (C) Jelmer Vernooij <jelmer@samba.org> 2008
    
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 3 of the License, or
-   (at your option) any later version.
-   
-   This program is distributed in the hope that it will be useful,
+     ** NOTE! The following LGPL license applies to the talloc
+     ** library. This does NOT imply that all of Samba is released
+     ** under the LGPL
+
+   This library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 3 of the License, or (at your option) any later version.
+
+   This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-   
-   You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with this library; if not, see <http://www.gnu.org/licenses/>.

So it seems like this part was under GPL-3.0+ before, and it is now
under LGPL-3.0+. Could you look into this, and assess whether
LIBTALLOC_LICENSE needs to be changed in libtalloc.mk ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
