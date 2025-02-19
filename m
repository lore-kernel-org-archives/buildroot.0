Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A39AC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 05:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B3E40576;
	Wed, 19 Feb 2025 05:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snQxMSX_KCto; Wed, 19 Feb 2025 05:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E140240556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E140240556;
	Wed, 19 Feb 2025 05:45:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5AC3968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 05:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8229680F43
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 05:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyojcAgph_vX for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 05:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43A4080F17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43A4080F17
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43A4080F17
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 05:45:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 37E7B352081C; Wed, 19 Feb 2025 06:45:02 +0100 (CET)
Date: Wed, 19 Feb 2025 06:45:02 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <Z7Vv3vYTfVThyBXU@waldemar-brodkorb.de>
References: <Z7HdD63RHkaM8X8t@waldemar-brodkorb.de>
 <20250216151408.710943bf@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250216151408.710943bf@gmx.net>
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739943902; bh=S1GT7BqSJGCsgnoG1lY5UxYdJfpdMm0dt8uGAJcsUhQ=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=cPWnPHofBOeKrtY0vsl6AJIwZr1sJk0P9EVphgeD++H/gtiPxVNfhXpZhoG0/PEjA
 NkASePDFHEVv6edcxq9TMQ4tDX0/9NjSPgjaywkEMOzW6VRFJVjZf+t4ReMxXZHK1j
 2dENROd0B5bQu6DpWAJSsHmRqcq3QasGtJq2wCAlItwNGlflePwmR+48gWmMvLpEoz
 3ZPDxqSy0J6TyL4/aCB1T20/rn9P6kTG3L32AEto3TgU4yHNXmbKXm4A21d+JfvNLQ
 cUrFIyL2PNs3y0JTZhYfRBuwffcwpSECueaLQaTHIig17toeGfOsSNabQAEfHoDBUw
 esV1yVn91JgoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=cPWnPHof
Subject: Re: [Buildroot] postgresql issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
Peter Seiderer wrote,

> Hello Waldemar,
> 
> On Sun, 16 Feb 2025 13:41:51 +0100, Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Hi,
> >
> > I am using Buildroot master. I try to use Postgresql Server.
> > I have locales enabled and building for a raspberry pi5.
> >
> > wbx@neon:~/buildroot$ grep LOCALE .config
> > BR2_NEEDS_HOST_UTF8_LOCALE=y
> > BR2_ENABLE_LOCALE=y
> > # BR2_ENABLE_LOCALE_PURGE is not set
> > BR2_GENERATE_LOCALE="en_US"
> > # BR2_PACKAGE_SYSTEMD_LOCALED is not set
> >
> > Journalctl reports:
> > Oct 08 15:42:34 buildroot systemd[1]: Starting PostgreSQL database server...
> > Oct 08 15:42:35 buildroot postgres[268]: The files belonging to this database system will be owned by user "postgres".
> > Oct 08 15:42:35 buildroot postgres[268]: This user must also own the server process.
> > Oct 08 15:42:35 buildroot postgres[268]: initdb: error: invalid locale settings; check LANG and LC_* environment variables
> > Oct 08 15:42:35 buildroot postgres[261]: pg_ctl: database system initialization failed
> > Oct 08 15:42:35 buildroot systemd[1]: postgresql.service: Control process exited, code=exited, status=1/FAILURE
> > Oct 08 15:42:35 buildroot systemd[1]: :5:185m:5:185mpostgresql.service: Failed with result 'exit-code'.
> > Oct 08 15:42:35 buildroot systemd[1]: Failed to start PostgreSQL database server.
> >
> > Any idea? I have set the environment variable LANG to en_US.UTF-8.
> 
> Reminds me of an aged patch set
> 
>   [v1,1/3] package/glibc: install locale cmd independent of NLS (see [1])
>   [v1,2/3] package/postgresql: needs locale command (see [2])
>   [v1,3/3] package/postgresql: set locale for initdb to C (see [3])
> 
> ...not sure if still appropriate...

Patch 3 worked for me! I get an error about missing locale command,
but the database is starting. Let's see if zabbix works, too.

@Maintainers, what you think about adding this patch?

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
