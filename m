Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B634EC77B71
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4E361366;
	Mon, 10 Apr 2023 19:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C4E361366
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4w1Y4PgbgNJ; Mon, 10 Apr 2023 19:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACEEE607F0;
	Mon, 10 Apr 2023 19:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACEEE607F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 281A11C3B9B
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E8BA408C0
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E8BA408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcU1TBL4_QJQ for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:31:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D104440376
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D104440376
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:31:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 375C2240002;
 Mon, 10 Apr 2023 19:31:05 +0000 (UTC)
Received: from peko by be.duckdns.org with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1plxEH-003A4Z-3Y; Mon, 10 Apr 2023 21:31:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20230329181722.242619-1-christian@paral.in>
 <87jzytmjnm.fsf@dell.be.48ers.dk>
Date: Mon, 10 Apr 2023 21:31:04 +0200
In-Reply-To: <87jzytmjnm.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 03 Apr 2023 10:53:17 +0200")
Message-ID: <87y1mzttzb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/runc: security bump to
 version v1.1.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> This is the fifth patch release in the 1.1.z series of runc, which fixes
 >> three CVEs found in runc.

 >> CVE-2023-25809 is a vulnerability involving rootless containers where
 >> (under specific configurations), the container would have write access to the
 >> /sys/fs/cgroup/user.slice/... cgroup hierarchy. No other hierarchies on the host
 >> were affected. This vulnerability was discovered by Akihiro Suda.
 >> GHSA-m8cg-xc2p-r3fc

 >> CVE-2023-27561 was a regression which effectively re-introduced CVE-2019-19921.
 >> This bug was present from v1.0.0-rc95 to v1.1.4. This regression was discovered
 >> by Beuc. GHSA-vpvm-3wq2-2wvm

 >> CVE-2023-28642 is a variant of CVE-2023-27561 and was fixed by the same patch.
 >> This variant of the above vulnerability was reported by Lei Wang.
 >> GHSA-g2j6-57v7-gm8c

 >> In addition, the following other fixes are included in this release:

 >> - Fix the inability to use /dev/null when inside a container
 >> - Fix changing the ownership of host's /dev/null caused by fd redirection
 >> - Fix rare runc exec/enter unshare error on older kernels, including CentOS < 7.7
 >> - nsexec: Check for errors in write_log()

 >> https://github.com/opencontainers/runc/releases/tag/v1.1.5

 >> Signed-off-by: Christian Stewart <christian@paral.in>

 > Committed, thanks.

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
