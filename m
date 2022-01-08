Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AEFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 449294012A;
	Sat,  8 Jan 2022 17:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SelTfyI9ljb0; Sat,  8 Jan 2022 17:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72D89400E3;
	Sat,  8 Jan 2022 17:49:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FD911BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CB86405A6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMLs_vsP_EWU for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:49:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55150403C5
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:49:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D91AF200003;
 Sat,  8 Jan 2022 17:49:40 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6FqW-0006wA-0g; Sat, 08 Jan 2022 18:49:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220108172441.2819559-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jan 2022 18:49:39 +0100
In-Reply-To: <20220108172441.2819559-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 8 Jan 2022 18:24:41 +0100")
Message-ID: <871r1if77w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/safeclib: bump to version
 02092020
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Update indentation in hash file (two spaces)
 > - This bump will fix the following build failure with libest which was
 >   added with commit f6f0e1e58168dfa9194db2e073efd20a98c15728:

 > In file included from /home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/include/libsafec/safe_lib.h:43:0,
 >                  from est_server_http.c:39:
 > /home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/include/libsafec/safe_types.h:42:9: error: unknown type name 'size_t'
 >  typedef size_t  rsize_t;
 >          ^~~~~~

 > https://github.com/rurban/safeclib/blob/v02092020/ChangeLog

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5a12f1cb4153834078522b6068ff24ac0300d51d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
