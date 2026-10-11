Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD2BCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 16:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3752680DBA;
	Sun, 11 Oct 2026 16:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eff0NBsuXk6Z; Sun, 11 Oct 2026 16:45:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D322480D59
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791737128;
	b=QVwtCPWMX3/AL+W5gLXigG1oAH9s5sTAspAu8MsWp/s46Fxco12ycxwcRJwFKlYcceyX
	 xNRCu0w7CRfHmgWGgKqRB/XPQPaSGsfsBPFwt6CK665zo7V6Ln5163oRqTsPMH8M2x0KA
	 GzNYHhmm53BW67XBHH/zjE8VulInIJsj0g9TyUrZiCqBuLMfyk2RIzgqQkBOjjQzHG0EH
	 lBk+Qm3Mx9vYdQS/qUc4qDsdKiSZUiGsRITlh+nxasNHGO7WCsD+PKCoPP/P3FEIznDYL
	 G4q7j9A+EwjvmCXANGhj4rJixzch5CE7SmGqSedFUobYwOpr4yWdPC5GW8N8qRCWkVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791737128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ClA0T94JE2LZLbVCe0gyr2hr8Xg/tc3P7fu5hhl6L2M=;
	b=ecl6H0kv+FKuQ0GPMJvW8+Fxd6vYbnYLSYdjGlM53/Hb/CE0/5mD/0N85bafPGpnjWIf
	 NzbA3eD7n5fQU9ZThXCEBfIxfZoixv6h0Mwb7jok1+5UiMNX0oNMaScMXjDHnp9zkRUBC
	 AhMIyyUPnsrbaCZhZ/rjsusT95YtmdIHljB1CWFdgn3THS5UEl9gXn/lbquH0+gTUKEjT
	 a6e6DkUhlBOUwTALrWeitnZfyfhdz3nLPzvlrQ0VAJF2siC9QLAQDCDbTAW2tZbTejbjb
	 wGqdmszwn6KMollsnhICafCqWguGmYXKGVe1gAGiUbe0oQ052pPNj60moGj3+D5wAkw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791737127;
	bh=ClA0T94JE2LZLbVCe0gyr2hr8Xg/tc3P7fu5hhl6L2M=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lJumcPsnw8n31xcWlsP21O21fmyNkCIJKYoK+klrUkUYKPOuU196ALfOMheLKuOZa
	 Q9dJ9Jj5e2IvngInuESxoKepg0TvKOSYneifAEOqAq+J+b6WFW2D11o5NSBR55RYe3
	 75Y9Tp+249KImXzY0hbL4lVU8cfKa+NOzN4ncgaLIQNVaeYzXpIS8YHoArIOifWr7d
	 v5TlLP4IjR0L4PESrVvGK91YrIkyF8uY2qDgJbCgX8VfqmvQLYeR8N0jFMihJdjlRg
	 eCeY7OAWlnSH/jYNAAFsimZg26+Jj3fu0QteQyqEBOyQlDQn5b3UE0Mn1BUf3XuBzN
	 JPiMep2nyNTSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D322480D59;
	Sun, 11 Oct 2026 16:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E36111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C80AD80D59
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_wRVO1nFPEZ for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 16:45:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 572C180D47
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791737124;
 b=VNyCWrerJbaZhQXWnuJt76EK+41F1me2AbHaf072JI5LPOAUU3HqiP9mYUbRpHhM90yR
 sC5rBe+6Jv8yHRQaC0HlVEhZPXsCfCENDXUBIqAgOSLezina+jQbT3TCZpJXnT60k3Xcr
 1PU3Oz4dE0Bvt4Rcl9OpaSsqnGMcQp6qyIXUAhW4gDueWkBMq9pk5WSW9i80+I8Fd0pDl
 +4c90RxDwqCIX+mFSSx3D5cWG0m/MeMk1v7a58RU4DpLvYKyTcOgOGUUhbSmHmR+PlzFV
 cpPnuqTM0iWpNZa4WPFEMSPiuEN+Nnm8BqpRjGuiMFsZ1Yxfrt3U5Exl/rBJDgnlEXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791737124;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=4scEWgW+QIwVwAj7EP6TBmHtPZNVrMKpvEZf6eBQqUE=;
 b=MYTnQMYx1TmkZQ3aBAJdcD40YpFwkuqINaD4ySbx/JmChtQhG2uEcnn5at1rgKGnRh0g
 LGK1HKEOT1v/aCdUvRRdM7Kn3xf4d6f8Dviryemcy/8kVKbuQ10h4QyCjfxBTxpwKc8jt
 ipOBI+4wc7t3dtOWusV08e1AEMSFTPaI8b2g3pNtlfJIXJeGBvp+yNyI473yafg0rXrZ8
 4h1wAoW0wOw1r2taNHHIEil+i2SNAkciLtNLh4f6m6idixuNx35KVWmowoz2qTUtz3Oyw
 q8tWGJta+7i4PLEjqmOandWszLnTeIhUz95lcOcaf4INHiyg8s2dae39y+QIrnGHc4g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=w1BzFytI; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 572C180D47
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:45:22 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 2B01F44045F;
 Sun, 11 Oct 2026 19:44:10 +0300 (IDT)
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  ju.o@free.fr,
 thomas.petazzoni@bootlin.com,  arnout@rnout.be,  git@jdknight.me,
 thomas.perale@mind.be
In-Reply-To: <20261010201508.963412-4-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Sat, 10 Oct 2026 22:15:08
 +0200")
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Sun, 11 Oct 2026 19:45:17 +0300
Message-ID: <877bjo425e.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

On Sat, Oct 10 2026, Titouan Christophe via buildroot wrote:
> Update all defconfigs that are using a custom Linux version based on a
> longterm supported Linux version so they use the newly introduced symbols.

This is a significant policy change for Buildroot. The configs/
directory is meant to carry configurations that are "known to work",
according to adding-board-support section in Buildroot manual
(docs/manual/adding-board-support.adoc).

Automatic update of the kernel component without actual hardware test
risks introducing regressions that make the system unbootable.

For this reason adding-board-support section also says:

> Always use fixed versions or commit hashes for the different
> components, not the "latest" version.

If we intend to change this policy I think we should discuss the
motivation on the list. In case such discussion did take place, this
comment should reference that discussion. In any case, the manual should
also update to reflect the current policy.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
