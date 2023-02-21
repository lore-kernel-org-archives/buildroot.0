Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03187C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9399340432;
	Tue, 21 Feb 2023 20:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9399340432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddzkFcMsnJXj; Tue, 21 Feb 2023 20:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D20BF40374;
	Tue, 21 Feb 2023 20:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D20BF40374
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C44531BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ECC841824
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ECC841824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLs7K7t7A-4e for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:43:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 881394184C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 881394184C
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:43:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B410BE0008;
 Tue, 21 Feb 2023 20:43:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUZTe-007mpx-Sy; Tue, 21 Feb 2023 21:43:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230205142543.285695-1-fontaine.fabrice@gmail.com>
Date: Tue, 21 Feb 2023 21:43:06 +0100
In-Reply-To: <20230205142543.285695-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 Feb 2023 15:25:43 +0100")
Message-ID: <877cwayckl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 4.0.3
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

 > Fix CVE-2023-0411, CVE-2023-0412, CVE-2023-0413, CVE-2023-0414,
 > CVE-2023-0415, CVE-2023-0416 and CVE-2023-0417

 > https://www.wireshark.org/security/wnpa-sec-2023-01
 > https://www.wireshark.org/security/wnpa-sec-2023-02
 > https://www.wireshark.org/security/wnpa-sec-2023-03
 > https://www.wireshark.org/security/wnpa-sec-2023-04
 > https://www.wireshark.org/security/wnpa-sec-2023-05
 > https://www.wireshark.org/security/wnpa-sec-2023-06
 > https://www.wireshark.org/security/wnpa-sec-2023-07

 > https://www.wireshark.org/docs/relnotes/wireshark-4.0.3.html

It looks like these issues do not affect 3.4.x, so I have NOT backported
this.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
