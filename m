Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162EFECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 09:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADDEC40CE5;
	Fri,  9 Sep 2022 09:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDEC40CE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hovhUXvhCqql; Fri,  9 Sep 2022 09:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCBFC40CD8;
	Fri,  9 Sep 2022 09:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCBFC40CD8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4407B1BF3A6
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F40582C5E
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F40582C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkGEjPy0EmvJ for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 09:39:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 938CE82C3C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 938CE82C3C
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 09:39:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D788AC0006;
 Fri,  9 Sep 2022 09:39:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oWaTr-00FuQb-7b; Fri, 09 Sep 2022 11:39:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
References: <VI1P190MB0493802F19F29DD225F55FDF9F439@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Date: Fri, 09 Sep 2022 11:39:23 +0200
In-Reply-To: <VI1P190MB0493802F19F29DD225F55FDF9F439@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 (Lang Daniel via buildroot's message of "Fri, 9 Sep 2022 09:17:23
 +0000")
Message-ID: <87tu5gx4xg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] package/polkit: test
 /usr/share/polkit-1/rules.d
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lang" == Lang Daniel via buildroot <buildroot@buildroot.org> writes:

 > Polkit has two directories that are used to store rules.
 > Add the second directory to the existing tests, to ensure
 > that both work in the future.

 > Signed-off-by: Daniel Lang <d.lang@abatec.at>
 > ---
 >  support/testing/tests/package/test_polkit.py | 17 +++++++++++++++++
 >  1 file changed, 17 insertions(+)

 > diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
 > index 502d38d13e..dbba42042b 100644
 > --- a/support/testing/tests/package/test_polkit.py
 > +++ b/support/testing/tests/package/test_polkit.py
 > @@ -48,6 +48,14 @@ class TestPolkitSystemd(TestPolkitInfra):
 >          _, exit_code = self.emulator.run(cmd, 10)
 >          self.assertEqual(exit_code, 0)
 
 > +        cmd = "mv /etc/polkit-1/rules.d/systemd-timesyncd-restart.rules /usr/share/polkit-1/rules.d"
 > +        _, exit_code = self.emulator.run(cmd, 10)
 > +        self.assertEqual(exit_code, 0)
 > +
 > +        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
 > +        _, exit_code = self.emulator.run(cmd, 10)
 > +        self.assertEqual(exit_code, 0)

How about rewriting this as a loop over the two directories instead of
repeating the code?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
