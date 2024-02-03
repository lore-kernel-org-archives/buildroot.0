Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BBEC4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EB79400A4;
	Sat,  3 Feb 2024 18:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB79400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4q9VWFu-cVQd; Sat,  3 Feb 2024 18:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CBC4405CB;
	Sat,  3 Feb 2024 18:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CBC4405CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0E641BF990
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D659960A8C
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V59yl6d8rtO2 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4962C6080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4962C6080B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4962C6080B
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:08:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32AC81C0003;
 Sat,  3 Feb 2024 10:08:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWCwo-008jNt-28;
 Sat, 03 Feb 2024 11:08:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240201214304.301544-1-fontaine.fabrice@gmail.com>
Date: Sat, 03 Feb 2024 11:08:30 +0100
In-Reply-To: <20240201214304.301544-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 1 Feb 2024 22:43:04 +0100")
Message-ID: <87zfwhuag1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: fix CPE variable
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit d70da0be78779699a296e21532665ee149a2a3b8 wrongly set
 > LVM2_CPE_ID_PRODUCT instead of LVM2_CPE_ID_VENDOR

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

 > ---
 >  package/lvm2/lvm2.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
 > index ee43cb6c19..02ea748439 100644
 > --- a/package/lvm2/lvm2.mk
 > +++ b/package/lvm2/lvm2.mk
 > @@ -10,7 +10,7 @@ LVM2_SITE = https://sourceware.org/ftp/lvm2
 >  LVM2_INSTALL_STAGING = YES
 >  LVM2_LICENSE = GPL-2.0, LGPL-2.1
 >  LVM2_LICENSE_FILES = COPYING COPYING.LIB
 > -LVM2_CPE_ID_PRODUCT = redhat
 > +LVM2_CPE_ID_VENDOR = redhat
 >  LVM2_SELINUX_MODULES = lvm
 
 >  # Make sure that binaries and libraries are installed with write

FYI, your tree is not in sync with master, so I had to apply this
manually.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
