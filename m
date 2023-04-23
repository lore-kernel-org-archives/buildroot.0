Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C702C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4A38408D1;
	Sun, 23 Apr 2023 09:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A38408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6AI2kULECDU; Sun, 23 Apr 2023 09:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C98F417F7;
	Sun, 23 Apr 2023 09:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C98F417F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC6091BF263
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9432F417F7
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9432F417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rptR1Y3V-ZJj for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:59:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E6F408D1
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38E6F408D1
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:59:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 03583100002;
 Sun, 23 Apr 2023 09:59:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqWVB-002a0J-Sj; Sun, 23 Apr 2023 11:59:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20230415213029.6DDA684216@busybox.osuosl.org>
Date: Sun, 23 Apr 2023 11:59:25 +0200
In-Reply-To: <20230415213029.6DDA684216@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 15 Apr 2023 22:13:40 +0200")
Message-ID: <87y1mi6hs2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/poppler: fix introspection
 build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=4466c206212226da3d68374299989cada8d4542d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fix the following build failure raised since commit
 > 9d1d4818c39d97ad7a1cdf6e075b9acae6dfff71:

 > [ 98%] Generating Poppler-0.18.typelib
 > Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
 > error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
 > If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
 > Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > [yann.morin.1998@free.fr:
 >   - drop patch adding INTROSPECTION_COMPILER_ARGS as it's now upstream
 >     as of 22.02.0, and we use 22.10.0
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
