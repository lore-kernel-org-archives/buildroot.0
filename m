Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FEBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A3A640B47;
	Thu, 27 Jan 2022 07:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V52k0n_0zLAV; Thu, 27 Jan 2022 07:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60AB740B41;
	Thu, 27 Jan 2022 07:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C26A1BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3952B84ECB
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWkJTKSdHVOz for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:12:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C8D684EC8
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:12:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0418620002
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:12:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1nCyxK-00026T-6q
 for buildroot@buildroot.org; Thu, 27 Jan 2022 08:12:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220107232022.0E707834E4@busybox.osuosl.org>
Date: Thu, 27 Jan 2022 08:12:30 +0100
In-Reply-To: <20220107232022.0E707834E4@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 8 Jan 2022 00:26:21 +0100")
Message-ID: <878rv1ejoh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/freeswitch: security bump
 version to 1.10.7
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=829777c1c9a0d40c8c5753e6fe86acfc78edfc92
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2021-41105: FreeSWITCH susceptible to Denial of Service via invalid
 >   SRTP packets

 >   When handling SRTP calls, FreeSWITCH is susceptible to a DoS where calls
 >   can be terminated by remote attackers.  This attack can be done
 >   continuously, thus denying encrypted calls during the attack.

 >   https://github.com/signalwire/freeswitch/security/advisories/GHSA-jh42-prph-gp36

 > - CVE-2021-41157: FreeSWITCH does not authenticate SIP SUBSCRIBE requests by default

 >   By default, SIP requests of the type SUBSCRIBE are not authenticated in
 >   the affected versions of FreeSWITCH.

 >   https://github.com/signalwire/freeswitch/security/advisories/GHSA-g7xg-7c54-rmpj

 > - CVE-2021-37624: FreeSWITCH does not authenticate SIP MESSAGE requests,
 >   leading to spam and message spoofing

 >   By default, SIP requests of the type MESSAGE (RFC 3428) are not
 >   authenticated in the affected versions of FreeSWITCH.  MESSAGE requests
 >   are relayed to SIP user agents registered with the FreeSWITCH server
 >   without requiring any authentication.  Although this behaviour can be
 >   changed by setting the auth-messages parameter to true, it is not the
 >   default setting.

 >   https://github.com/signalwire/freeswitch/security/advisories/GHSA-mjcm-q9h8-9xv3

 > - CVE-2021-41145: FreeSWITCH susceptible to Denial of Service via SIP flooding

 >   When flooding FreeSWITCH with SIP messages, it was observed that after a
 >   number of seconds the process was killed by the operating system due to
 >   memory exhaustion

 >   https://github.com/signalwire/freeswitch/security/advisories/GHSA-jvpq-23v4-gp3m

 > - CVE-2021-41158: FreeSWITCH vulnerable to SIP digest leak for configured gateways

 >   An attacker can perform a SIP digest leak attack against FreeSWITCH and
 >   receive the challenge response of a gateway configured on the FreeSWITCH
 >   server.  This is done by challenging FreeSWITCH's SIP requests with the
 >   realm set to that of the gateway, thus forcing FreeSWITCH to respond with
 >   the challenge response which is based on the password of that targeted
 >   gateway.

 >   https://github.com/signalwire/freeswitch/security/advisories/GHSA-3v3f-99mv-qvj4

 > Release notes:
 > https://github.com/signalwire/freeswitch/releases/tag/v1.10.7

 > Removed patch, upstream applied a different fix:
 > https://github.com/signalwire/freeswitch/commit/e9fde845de5b8885282bf5e70f4be3645c5c3e9b

 > Added optional dependency to libks, needed due to upstream commit
 > https://github.com/signalwire/freeswitch/commit/ed9851666615d283effb76edc7028cc08b07eff9

 > Added upstream patches to fix build errors.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > [Peter: mention security fixes]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
