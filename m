Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DB4C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 18:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9AA823C0;
	Sun, 10 Aug 2025 18:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFvtOoqemB4P; Sun, 10 Aug 2025 18:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FAC6823A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FAC6823A0;
	Sun, 10 Aug 2025 18:21:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A82E2154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 995108239A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6abZBLTkWXsP for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 18:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79230823C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79230823C0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79230823C0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:21:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1056213965; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 10 Aug 2025 18:21:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulAfm-006ZEK-29;
 Sun, 10 Aug 2025 20:21:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Angelo Compagnucci
 <angelo.compagnucci@gmail.com>
References: <20250809175417.315091-1-thomas.perale@mind.be>
Date: Sun, 10 Aug 2025 20:21:34 +0200
In-Reply-To: <20250809175417.315091-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Sat, 9 Aug 2025 19:54:17 +0200")
Message-ID: <87cy93ox5d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iyu5bVv2YjJYzwVJwi8ziZXCn7xg8iHkIhUMTccR1x2esBf/BmFt0oslX8T52KRjkv1N1sh9zoy5cW0KGLNp0dhFuOm6FHTXljfV8dVeR7AK6dBz2n28u3p8CI2GyLrh+yr/Y0iYTuXpZK4QIr1KmSlCCt/vyF8eUX0xD0sLiNK2xPeyQPOejbaLLJhFANBB0QqbE28TuCG83cDFBcPzHbge3rqNCAc1NqkpidkCwtljKRTro44Hl0ERz0dgx928opuka98dCTa9BznYsDQBrYM//AFkZ0JW21SSog73V14GRR0ySf/9Ym/WqAjI73qoKVNy9Y1hbWq+SrIDzaGxGA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=OyyoNwU959+7Hf08t0GqQvcOgR0Sqyz4B2nc6ta9KAA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=iyu5bVv2
Subject: Re: [Buildroot] [PATCH] package/libapparmor: remove stale reference
 to patch 0001
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The AUTORECONF variable was introduced in commit [1] with reference to
 > the patches that modified the m4 and Makefile.am files.

 > The commit [2] removed the last such patch but left the reference to the
 > patch and the AUTORECONF variable.

 > Later, commit [3] updated the mirror to the gitlab URL that no longer
 > bundle a pre-generated `configure` file, making the execution of
 > AUTORECONF necessary anyway.

 > This patch removes the obsolete reference to the patch 0001 removed in
 > [2] to avoid ambiguity with the new patch 0001 introduced in commit [4].

 > [1] 01a82c1401 package/libapparmor: enable python bindings
 > [2] 27cd0b5033 package/apparmor: bump to version 3.0.4
 > [3] 5649202ddc package/libapparmor: bump to version 3.1.7
 > [4] 2640f5dcd0 package/libapparmor: fix build w/ musl

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  package/libapparmor/libapparmor.mk | 1 -
 >  1 file changed, 1 deletion(-)

 > diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
 > index fa59ff2924..b1c9a952f0 100644
 > --- a/package/libapparmor/libapparmor.mk
 > +++ b/package/libapparmor/libapparmor.mk
 > @@ -16,7 +16,6 @@ LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
 >  LIBAPPARMOR_SUBDIR = libraries/libapparmor
 >  LIBAPPARMOR_INSTALL_STAGING = YES
 
 > -# Patch 0001 touches Makefile.am and m4 files
 >  LIBAPPARMOR_AUTORECONF = YES

I replaced the comment with another one saying:

# no configure in tarball

To make it clear why this is needed and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
