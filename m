Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D27C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B09421B8;
	Fri, 22 Jul 2022 07:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B09421B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMruL6RrNA8j; Fri, 22 Jul 2022 07:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42DEA41B73;
	Fri, 22 Jul 2022 07:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42DEA41B73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9BC81BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A28D341B73
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A28D341B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7DfGvOLDAEA for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:50:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD4B4089A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DD4B4089A
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:50:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5E3B240006;
 Fri, 22 Jul 2022 07:50:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oEnR0-0033hg-Kt; Fri, 22 Jul 2022 09:50:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220703095347.1318735-1-fontaine.fabrice@gmail.com>
Date: Fri, 22 Jul 2022 09:50:54 +0200
In-Reply-To: <20220703095347.1318735-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Jul 2022 11:53:47 +0200")
Message-ID: <87edydvb4x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 1.1.1p
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The c_rehash script allows command injection (CVE-2022-2068)
 > ============================================================

 > Severity: Moderate

 > In addition to the c_rehash shell command injection identified in
 > CVE-2022-1292, further circumstances where the c_rehash script does not
 > properly sanitise shell metacharacters to prevent command injection were
 > found by code review.

 > When the CVE-2022-1292 was fixed it was not discovered that there
 > are other places in the script where the file names of certificates
 > being hashed were possibly passed to a command executed through the
 > shell.

 > This script is distributed by some operating systems in a manner where
 > it is automatically executed.  On such operating systems, an attacker
 > could execute arbitrary commands with the privileges of the script.

 > Use of the c_rehash script is considered obsolete and should be replaced
 > by the OpenSSL rehash command line tool.

 > https://www.openssl.org/news/secadv/20220621.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
