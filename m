Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F4FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 21:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF8740926;
	Sun, 13 Mar 2022 21:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Zm1SIqd8eSm; Sun, 13 Mar 2022 21:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBB1408F4;
	Sun, 13 Mar 2022 21:25:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5EA1BF309
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4342481D70
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pp71VVzR9VLu for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 21:25:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00A4D81D02
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 21:25:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DFB8E100004
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 21:25:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nTViR-005KFv-4c
 for buildroot@buildroot.org; Sun, 13 Mar 2022 22:25:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220213202407.1205912-1-fontaine.fabrice@gmail.com>
 <b8b9f7d9-1648-a7ca-ed64-42f7d0850d70@korsgaard.com>
Date: Sun, 13 Mar 2022 22:25:27 +0100
In-Reply-To: <b8b9f7d9-1648-a7ca-ed64-42f7d0850d70@korsgaard.com> (Peter
 Korsgaard's message of "Mon, 28 Feb 2022 19:51:25 +0100")
Message-ID: <877d8xwnnc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.3.34
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Hi,
 > On 13/02/2022 21.24, Fabrice Fontaine wrote:
 >> Fix CVE-2021-46665, CVE-2021-46664, CVE-2021-46661, CVE-2021-46668,
 >> CVE-2021-46663, CVE-2022-24052, CVE-2022-24051, CVE-2022-24050,
 >> CVE-2022-24048, CVE-2021-46659, CVE-2021-35604, CVE-2021-46667,
 >> CVE-2021-46662, CVE-2021-2372, CVE-2021-2389 and CVE-2021-46658
 >> Update hash of README.md (changes not related to license:
 >> https://github.com/MariaDB/server/commit/773a07b65517327add6348c045cee14bdf489fe0)
 >> https://mariadb.com/kb/en/mariadb-10334-release-notes/
 >> https://mariadb.com/kb/en/mariadb-10333-release-notes/
 >> https://mariadb.com/kb/en/mariadb-10332-release-notes/
 >> https://mariadb.com/kb/en/mariadb-10331-release-notes/
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
