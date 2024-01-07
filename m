Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56D3C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ECD860EB6;
	Sun,  7 Jan 2024 22:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ECD860EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjD9qd67DyQV; Sun,  7 Jan 2024 22:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C1460E91;
	Sun,  7 Jan 2024 22:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C1460E91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D905B1BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF2C260E91
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2C260E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcv3m3EXwUt4 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:26:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90B6C60E50
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90B6C60E50
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CB1840002;
 Sun,  7 Jan 2024 22:26:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMbbA-006m6U-1r;
 Sun, 07 Jan 2024 23:26:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
 <20231220200110.1819507-2-thomas.petazzoni@bootlin.com>
Date: Sun, 07 Jan 2024 23:26:28 +0100
In-Reply-To: <20231220200110.1819507-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 20 Dec 2023 21:01:08
 +0100")
Message-ID: <878r50zsob.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/3] package/glibc: ignore CVEs not
 considered as security issues by upstream
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
Cc: Romain Naour <romain.naour@gmail.com>, peter.verbrugge@technolution.nl,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > 5 CVEs affecting glibc according to the NVD database are considered as
 > not being security issues by upstream glibc developers:

 > * CVE-2010-4756: The glob implementation in the GNU C Library (aka
 >   glibc or libc6) allows remote authenticated users to cause a denial
 >   of service (CPU and memory consumption) via crafted glob expressions
 >   that do not match any pathnames. glibc maintainers position: "That's
 >   standard POSIX behaviour implemented by (e)glibc. Applications using
 >   glob need to impose limits for themselves"

 > * CVE-2019-1010022: GNU Libc current is affected by: Mitigation
 >   bypass. The impact is: Attacker may bypass stack guard
 >   protection. The component is: nptl. The attack vector is: Exploit
 >   stack buffer overflow vulnerability and use this bypass
 >   vulnerability to bypass stack guard. NOTE: Upstream comments
 >   indicate "this is being treated as a non-security bug and no real
 >   threat. glibc maintainers position: "Not treated as a security issue
 >   by upstream https://sourceware.org/bugzilla/show_bug.cgi?id=22850"

 > * CVE-2019-1010023: GNU Libc current is affected by: Re-mapping
 >   current loaded library with malicious ELF file. The impact is: In
 >   worst case attacker may evaluate privileges. The component is:
 >   libld. The attack vector is: Attacker sends 2 ELF files to victim
 >   and asks to run ldd on it. ldd execute code. NOTE: Upstream comments
 >   indicate "this is being treated as a non-security bug and no real
 >   threat. glibc maintainers position: "Not treated as a security issue
 >   by upstream https://sourceware.org/bugzilla/show_bug.cgi?id=22851"

 > * CVE-2019-1010024: GNU Libc current is affected by: Mitigation
 >   bypass. The impact is: Attacker may bypass ASLR using cache of
 >   thread stack and heap. The component is: glibc. NOTE: Upstream
 >   comments indicate "this is being treated as a non-security bug and
 >   no real threat. glibc maintainers position: "Not treated as a
 >   security issue by upstream
 >   https://sourceware.org/bugzilla/show_bug.cgi?id=22852"

 > * CVE-2019-1010025: GNU Libc current is affected by: Mitigation
 >   bypass. The impact is: Attacker may guess the heap addresses of
 >   pthread_created thread. The component is: glibc. NOTE: the vendor's
 >   position is "ASLR bypass itself is not a vulnerability. Glibc
 >   maintainers position: "Not treated as a security issue by upstream
 >   https://sourceware.org/bugzilla/show_bug.cgi?id=22853"

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > I believe those CVEs should be ignored, because they will never be
 > fixed, and therefore they cause additional noise that makes it more
 > difficult to spot the real CVEs that need to be fixed.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
