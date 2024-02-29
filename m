Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2278BC54E49
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E786D41909;
	Thu, 29 Feb 2024 15:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6BbuycXv9at; Thu, 29 Feb 2024 15:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E7841B41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E7841B41;
	Thu, 29 Feb 2024 15:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7171BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A1D041919
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3dcNqkah78j for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:41:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBD1941915
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBD1941915
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBD1941915
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:41:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9D1220003;
 Thu, 29 Feb 2024 15:41:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiXP-004o5j-0w;
 Thu, 29 Feb 2024 16:41:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240126172920.1628617-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Feb 2024 16:41:35 +0100
In-Reply-To: <20240126172920.1628617-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 26 Jan 2024 18:29:20 +0100")
Message-ID: <87h6hrffbk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/brltty: disable emacs and lua
 bindings
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
Cc: Mario Lang <mlang@blind.guru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable lua bindings to avoid the following build failure if host-lua
 > and lua are built before brltty raised since bump to version 6.5 in
 > commit 82c6e87d5eaaf5b32aa340ab384f88539238cbe1 and
 > https://github.com/brltty/brltty/commit/42bf48ca010d9163652cb0a014662fa243132736:

 > configure: lua package: lua
 > configure: lua includes:
 > configure: lua libs:
 > -L/home/autobuild/autobuild/instance-0/output-1/host/bin/../sparc64-buildroot-linux-gnu/sysroot/usr/lib
 > -llua -lm -ldl
 > checking for lua5.4... no
 > checking for lua... /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
 > configure: Lua shell: /home/autobuild/autobuild/instance-0/output-1/host/bin/lua
 > configure: Lua library directory: /home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3

 > [...]

 > /usr/bin/install -c -d
 > /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
 > /usr/bin/install -c -s --strip-program /bin/true brlapi.so
 > /home/autobuild/autobuild/instance-0/output-1/target/home/autobuild/autobuild/instance-0/output-1/host/lib/lua/5.3
 > make[3]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/brltty-6.6/Bindings/Lua'

 > [...]

 > brltty: installs files in /home/autobuild/autobuild/instance-0/output-1/target//home/autobuild/autobuild/instance-0/output-1

 > While at it, disable emacs bindings which have also been added in
 > version 6.5 with
 > https://github.com/brltty/brltty/commit/64a487e29941df54796645229a872ecbe2a06bfe

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f424e6727bbe61ea4b7703e93aae6fcab7506898
 >  - http://autobuild.buildroot.org/results/bf4a161fc66fb99a24f08bea3436b13738f2e383

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
