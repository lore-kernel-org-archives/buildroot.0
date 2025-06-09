Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747F1C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3860A8124F;
	Mon,  9 Jun 2025 14:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xH4czAe9H7Om; Mon,  9 Jun 2025 14:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6854081261
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6854081261;
	Mon,  9 Jun 2025 14:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AD021F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6175B417D8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsbsEqHByI_N for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B39F400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B39F400B9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B39F400B9
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:23:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 422239369; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Jun 2025 14:23:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uOdPK-00EHW6-2Y;
 Mon, 09 Jun 2025 16:23:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>
References: <20250608110317.16552-1-ju.o@free.fr>
Date: Mon, 09 Jun 2025 16:23:26 +0200
In-Reply-To: <20250608110317.16552-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 8 Jun 2025 13:03:17 +0200")
Message-ID: <87a56h9eox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=X/Bd1fvojENn2+jkF218TTjMRlHiNsF+u67H5lB6U/XjwmQXqzI0g8syVRrAE4HWiMMukPMJ9OawdbwUmdazxJn3yB3s4p4tPGbF4k0Cb92PZdYquw+1iK6AAiBTYW48zfzTAkrOTVqBiTYKa3Qolsw0tvUMCH/8mUetAz12VRvG5X40whYZWAKmqMZCO0DRBsjNjDZ6o3vyu03Qb80ffTARXWXN20Vtz2dFwV2EzHgpPRHvnK7jnlMdB41YCo0/XYdXBQHCeFbsCRUh4rY6T/q1K65PRD8l3RZDPeFTZxGnWkVt3MONspU+Duzdk+ivLdL0UxzKYFagzwmStP5fDw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VsWaWHwQBJD4+NZ6cuTx6wnqqeGiKy3RoUVwSiv6+6U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=X/Bd1fvo
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: add missing mariadb
 dependencies for mysql support
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Buildroot commit [1] removed mysql and replaced it by mariadb in all
 > packages, but did not propagated all dependencies.

 > This commit fixes the issue.

 > Fixes:

 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_MARIADB
 >       Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && (BR2_TOOLCHAIN_HAS_ATOMIC [=n] || BR2_TOOLCHAIN_HAS_SYNC_8 [=n]) && BR2_USE_WCHAR [=y]
 >       Selected by [y]:
 >       - BR2_PACKAGE_DOVECOT_MYSQL [=y] && BR2_PACKAGE_DOVECOT [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/8708f3a23a7e28fdb04fc57406e13e6b7ff4a337

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
