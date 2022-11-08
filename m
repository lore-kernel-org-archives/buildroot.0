Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89631C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227B881E17;
	Tue,  8 Nov 2022 19:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 227B881E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 280DCrese0F5; Tue,  8 Nov 2022 19:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5074481E0B;
	Tue,  8 Nov 2022 19:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5074481E0B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8F61BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7667E416E3
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7667E416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rcxv42YFIDjj for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:36:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1263A416E2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1263A416E2
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:36:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6F9B40008;
 Tue,  8 Nov 2022 19:36:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1osUOT-000R6W-SA; Tue, 08 Nov 2022 20:36:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221026201736.327835-1-fontaine.fabrice@gmail.com>
Date: Tue, 08 Nov 2022 20:36:21 +0100
In-Reply-To: <20221026201736.327835-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 26 Oct 2022 22:17:36 +0200")
Message-ID: <87zgd1i6h6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: fix build without
 asciidoc
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set ac_cv_prog_A2X to disable build of documentation and avoid the
 > following build failure without a working a2x raised since at least bump
 > to version 1.1.1 in commit ad21d84a589458fd4542993912891daa503d72dd:

 > a2x -v -f manpage doc/man/usbguard.1.adoc -D ./$(dirname doc/man/usbguard.1.roff)
 > a2x -v -f manpage doc/man/usbguard-dbus.8.adoc -D ./$(dirname doc/man/usbguard-dbus.8.roff)
 > /nvmedata/autobuild/instance-5/output-1/host/bin/python3: Error while
 > finding module specification for 'asciidoc.a2x' (ModuleNotFoundError:
 > No module named 'asciidoc')

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e41950f3cd4bd83d9b067af498757cb9d2f207ef

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
