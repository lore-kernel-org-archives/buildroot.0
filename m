Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E67606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PVakJTFy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F02D80CDE;
	Sun, 25 Oct 2026 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijqvN9hyUfQp; Sun, 25 Oct 2026 20:26:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00E8280D74
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792959966;
	b=MgfQaVd/nmge5vPkEjeEEx5xOr3y/3tII0rSupkyh4ahCnXcn3zZomH1SJRAwKbgF1VV
	 l56klXVBKMClXnC3zO2R9o+3VTMdq6MjFRzypqa2fFLj6IvNq9hsfHxsR/INd5mlUGY05
	 CehqSsVm/eLIt61A4/+1RZm+YZf6OOo21bdM/1MQhUqZCWth976KKItNfr/MvOkHSru5s
	 Tl/7kn6tkgNecue1whCrrDwETNng2LvoAhPkZTXubriCPvcVIKLedXM+BZfMrRLis0pVe
	 OGrtvGGgrwk9qCJsqWk6zfM2WWbXPoHAzNCSSpjN6LjzSIG58pXtwXNknIHMWZGO6jA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792959966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZNJrMoOc2WP+PFhQAxwpX9nOuFpsS8wpZLyi0YQY0nE=;
	b=bBIbhJpsyo2T3zBk5RR+pRyYXVDDEzDKk4QQ+/iOpRjpyk8qaf4Pw/xAeHkNjTunpEkg
	 hNxNOhbRmDvLdWaYiW4By2k5zKScq0k3/pp1zKGWbkx1F4ByGK3Qt3J7fLsMrWdJV7W+9
	 j+W21T4pFdj9xYf1TnN/9TnDMGXAbalNEVN8xzq5j6zT2hd+2ByTfZG/M7t5W0MCN5Dr7
	 Frg8dOs4VZHb75oJd4/9IMOKm3FyXTlpzygQ0+/n8lipeuPhIaFhTgo5bt9/7ncfpgbOT
	 E5GYwnzT8p+66g07V59wrWNVdLaZDRtQoTzy3fzXILquiBzM7IV4yzCtxpuz3Z5A0ew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792959966;
	bh=ZNJrMoOc2WP+PFhQAxwpX9nOuFpsS8wpZLyi0YQY0nE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PVakJTFy4IEn16ktfA9IxrD3UOz9nlAkgfufBsH/esZQLkMbpwPH47HWfaLYaG+DO
	 oD5F30X2aaGz4hGUcqpa8kopZFjWgRLGo6mFgtxuDxkEiC5IqKEvMzWozo49/GShgB
	 1BVYQGU3sp/HY/V92fWpvUn1WSESqPN12Q3LKTy+hRfq2GK8fB9JFPWufJjhyoxEdz
	 KJDXC/G4fodc8jPyzMfn02Gh3zydzSn/6FIIBR7vF3DPY+vA2M5zRS5GCMJuYVF6Gj
	 /ItMXt4oQUb1zht2amqjr6zmOYDbcxDOxVzojwTjOIZpMRc2etFIwLRYYEKJ2ybwJU
	 831RVUo/liQFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00E8280D74;
	Sun, 25 Oct 2026 20:26:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1CC4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C98760607
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcCFa02-23OM for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:26:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4727860604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792959963;
 b=VCEmt4I3xlmrs1czb7c+L7cdxy/MjyVWktf63YshMYr8S/Vn8tBr4FteiOf80tmvN9mn
 1+LZdYIOpTWZqmy95UjTJdrZVrzQ56wIMvq5wPFUnDuf0brb7MTszAVC0RISwNiGjah+E
 a2lK+XABBnOIviRrOwtPggdEt6TKu59s1PWGQz/OVn3KmDd+V69xSUtu/gyjgrCLVZW0g
 lh67jVJHv3HYbi7fXjFYrQztdq1mzCtIuNoRDOgPDCQ6IAZhFmOEbNgZiYr7M1Yf/KBZ1
 fXfJlCeaO1nGwSxv5j27cmrJHS8ikKAbduQtMKhuYN5QQUh+Z9fh92l7DaUaZO0i/+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792959963;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=zKk3Vhcst5VyDe12MZLS0bfs0g6RJdHztjUaA3NIcYI=;
 b=PGDvOh2VG7c/NO8z0dDtM/088K/VqXgSWXhnBRQiefG79x+8D5+sJJkviSu6ra2wjPVH
 1gvBhgoZB4iHAH3cDyG16OWbx2OGeOT0IWctt0kQB5vCXUIyAUhWB0GmH8lENWth5jzKn
 DgcXd7syH7Bn044kU1GvIayGZoPlxA+wk7Drm/pI3KQ1K55ewWgJh3eAbPhrDrzOXsXDg
 W0oAXXHi8LulzrPRKc4O2knpdObzHBFN1O+QtCqGp2goa7HxYhAHH0W9KkIv395xxX6ht
 0cZyy5GJSrRQm4Qeu89WtSpPXDRMeBRNbjdYFzBw4aK2c045B7dJ7BQ0eviRgryvyPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sRGsa1YC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4727860604
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:26:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AC511C51477;
 Sun, 25 Oct 2026 20:27:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E0E3660740;
 Sun, 25 Oct 2026 20:26:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 486B110329035; Sun, 25 Oct 2026 21:25:58 +0100 (CET)
Date: Sun, 25 Oct 2026 21:25:58 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Message-ID: <at5lzoH_V0x5qS14@windsurf>
References: <20261025174835.190885-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025174835.190885-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: security bump to v2.4.20
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 06:48:35PM +0100, Thomas Perale via buildroot wrote:
> See the release note:
> 
> - https://github.com/OpenPrinting/cups/releases/tag/v2.4.20
> 
> The additional patch is required to fix the build with the option
> `--with-dnssd=no`. This build error can be triggered by not enabling the
> package `BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT` [1].
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-55453:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, the backend/ipp.c
>     quote_string() function preserves carriage-return and line-feed
>     characters in a remote printer-controlled marker-message before
>     report_attr() writes the value to the scheduler status stream. The
>     scheduler can parse an injected newline as a separate PPD: control
>     line and persist an attacker-selected PPD keyword. The reporter
>     demonstrated that a later print job on a Foomatic-backed queue could
>     consume an injected FoomaticRIPCommandLine value and execute in the
>     filter context as lp.
>     https://www.cve.org/CVERecord?id=CVE-2026-55453
> 
> - CVE-2026-55467:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, the cupsdCreateJob
>     option-string builder in scheduler/job.c maps attacker-controlled
>     destination-uri and pre-dial-string values from a configured fax queue
>     to the phone and faxPrefix options. Unlike ordinary IPP job
>     attributes, these mapped fax values bypass the control-character
>     sanitizer and are copied directly into the filter options argument. A
>     user permitted to submit a job can therefore inject control characters
>     into the downstream option stream. The reporter states that a
>     downstream fax filter passing these values to a shell or modem command
>     could execute code as lp, while the maintainer states that CUPS has no
>     confidentiality or integrity impact because the only known code-
>     executing filter is optional Foomatic and addressed separately,
>     leaving possible disruption of the affected queue.
>     https://www.cve.org/CVERecord?id=CVE-2026-55467
> 
> - CVE-2026-55480:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, copy_model() in
>     scheduler/ipp.c creates a predictable TempDir/<connection-number>.ppd
>     path in an lp-group-writable directory and opens it as root without
>     O_EXCL or O_NOFOLLOW. Exploitation requires an lp-group process able
>     to write that directory to predict the connection-derived name and
>     plant a symlink before the root open, while a privileged add-printer
>     or modify-printer operation using a model PPD triggers copy_model().
>     The reporter treats an existing lp foothold and the privileged
>     operation as distinct prerequisites, while the maintainer assesses
>     high privileges because installing the relevant filter or
>     administering the printer requires root or print-administrator access.
>     If the race succeeds, the root scheduler follows the symlink and
>     truncates or overwrites a root-writable target with generated PPD
>     data, compromising file integrity or availability.
>     https://www.cve.org/CVERecord?id=CVE-2026-55480
> 
> - CVE-2026-61702:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. Prior to 2.4.20, copy_banner() in
>     scheduler/ipp.c uses the attacker-controlled IPP attributes-natural-
>     language value as a directory component beneath DataDir/banners when
>     processing a job-sheets banner. The job-sheets value must first match
>     a registered banner basename, and the traversed path must contain a
>     matching reachable basename; selecting an arbitrary target as
>     demonstrated additionally requires pre-positioned path state such as a
>     symlink with that basename. Subject to the scheduler's filesystem and
>     sandbox access, path separators in the language value can escape the
>     intended banner directory, make the root scheduler open the reachable
>     file, and copy its bytes into a job-sheet spool object that a
>     configured backend can deliver to an attacker-observable endpoint.
>     https://www.cve.org/CVERecord?id=CVE-2026-61702
> 
> - CVE-2026-87875:
>     The cupsUTF32ToUTF8() function in CUPS's cups/transcode.c lacks a
>     source-length bound and can read past the end of the source buffer,
>     resulting in a heap out-of-bounds read. This is reachable via SNMP
>     supply-description parsing in backend/snmp-supplies.c with attacker-
>     controlled content.
>     https://www.cve.org/CVERecord?id=CVE-2026-87875
> 
> - CVE-2026-87876:
>     Two case-insensitive comparisons on request-derived usernames outside
>     the main authorization path in CUPS's scheduler (printer ACL
>     validation and private-attribute filtering) could allow bypass of
>     username-based access controls in certain configurations.
>     https://www.cve.org/CVERecord?id=CVE-2026-87876
> 
> - CVE-2026-105326:
>     An argument injection flaw was found in CUPS. When email notification
>     is configured, the CUPS scheduler accepts printer subscription
>     requests that supply a mailto notify-recipient-uri. The mailto
>     notifier passes the recipient address to the configured sendmail
>     program without ensuring it cannot be interpreted as command-line
>     options. A remote attacker who can reach the CUPS service could supply
>     a crafted recipient value starting with "-" to influence sendmail
>     behavior. Successful exploitation depends on the installed mail
>     transfer agent and CUPS network exposure, and may lead to execution of
>     attacker-controlled commands with the privileges of the CUPS service
>     user.
>     https://www.cve.org/CVERecord?id=CVE-2026-105326
> 
> [1] https://github.com/OpenPrinting/cups/pull/1740
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
