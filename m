Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B3EC77B60
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF4783F68;
	Wed, 22 Mar 2023 22:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF4783F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VztXKcZvUb3r; Wed, 22 Mar 2023 22:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C237983F6B;
	Wed, 22 Mar 2023 22:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C237983F6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9EF41BF909
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C307341BC4
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C307341BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWPf_madVQUU for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:39:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA9841B9E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FA9841B9E
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:39:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69589240003;
 Wed, 22 Mar 2023 22:39:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pf76i-00AhGf-GJ; Wed, 22 Mar 2023 23:39:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230321190501.19240-1-ps.report@gmx.net>
Date: Wed, 22 Mar 2023 23:39:00 +0100
In-Reply-To: <20230321190501.19240-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 21 Mar 2023 20:05:01 +0100")
Message-ID: <87fs9wtnqz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/openssh: security bump to
 version 9.3p1
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > From [1]:
 >  * sshd(8): fix a pre-authentication double-free memory fault
 >    introduced in OpenSSH 9.1. This is not believed to be exploitable,
 >    and it occurs in the unprivileged pre-auth process that is
 >    subject to chroot(2) and is further sandboxed on most major
 >    platforms.

 >  * ssh(8): in OpenSSH releases after 8.7, the PermitRemoteOpen option
 >    would ignore its first argument unless it was one of the special
 >    keywords "any" or "none", causing the permission list to fail open
 >    if only one permission was specified. bz3515

 >  * ssh(1): if the CanonicalizeHostname and CanonicalizePermittedCNAMEs
 >    options were enabled, and the system/libc resolver did not check
 >    that names in DNS responses were valid, then use of these options
 >    could allow an attacker with control of DNS to include invalid
 >    characters (possibly including wildcards) in names added to
 >    known_hosts files when they were updated. These names would still
 >    have to match the CanonicalizePermittedCNAMEs allow-list, so
 >    practical exploitation appears unlikely.

 > From [2]:

 > * ssh-add(1): when adding smartcard keys to ssh-agent(1) with the
 >    per-hop destination constraints (ssh-add -h ...) added in OpenSSH
 >    8.9, a logic error prevented the constraints from being
 >    communicated to the agent. This resulted in the keys being added
 >    without constraints. The common cases of non-smartcard keys and
 >    keys without destination constraints are unaffected. This problem
 >    was reported by Luci Stanescu.

 >  * ssh(1): Portable OpenSSH provides an implementation of the
 >    getrrsetbyname(3) function if the standard library does not
 >    provide it, for use by the VerifyHostKeyDNS feature. A
 >    specifically crafted DNS response could cause this function to
 >    perform an out-of-bounds read of adjacent stack data, but this
 >    condition does not appear to be exploitable beyond denial-of-
 >    service to the ssh(1) client.

 >    The getrrsetbyname(3) replacement is only included if the system's
 >    standard library lacks this function and portable OpenSSH was not
 >    compiled with the ldns library (--with-ldns). getrrsetbyname(3) is
 >    only invoked if using VerifyHostKeyDNS to fetch SSHFP records. This
 >    problem was found by the Coverity static analyzer.

 > [1] https://www.openssh.com/txt/release-9.2
 > [2] https://www.openssh.com/txt/release-9.3

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
