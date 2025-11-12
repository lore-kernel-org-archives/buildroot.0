Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A12CCF9F8
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 08:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9657D40797;
	Wed, 12 Nov 2025 08:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 157dm5o5baHh; Wed, 12 Nov 2025 08:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB1CF408F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1CF408F6;
	Wed, 12 Nov 2025 08:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B91B31C3
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 08:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F8DD40474
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 08:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRPwncwbwjl0 for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 08:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86F574031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86F574031C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86F574031C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 08:07:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 725606605; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 08:07:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJ5sv-00Gp6C-1E;
 Wed, 12 Nov 2025 09:07:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>
References: <20251110094007.434279-1-nemaakhilesh@gmail.com>
Date: Wed, 12 Nov 2025 09:07:21 +0100
In-Reply-To: <20251110094007.434279-1-nemaakhilesh@gmail.com> (Akhilesh Nema's
 message of "Mon, 10 Nov 2025 01:40:07 -0800")
Message-ID: <87tsyzu11i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pt1t/IyjKDKy8JgjI51bxveHtoPdhRrpNCC2tnn7H+Fl4UnwDCerqO0btCkmWg+n9yN+nxSmSo1VqKSabbbanmRb0aPDG0MKlTDh1RUPebT3KDMckqnURpS3dHEdUxDlve4fBY8ChHC23Lbf5fZEQPdXcx7SzuCGVGvW6xapZeTYSeQhWPLY7ygRE9LhRSz/YEIXKkXB5d+EHP+MebJcfSjDY7N9Hv5CLGVDJMB9K7i0tKuJRfxy9WK0zxra+krLVHq7muyh1vgTUb0B7gbIrad3oDL5i8KPghwYgIT0lPS2ZzAIeJiK38MyAmu2/y37ImjF66wIqGDl38zqWMMJQg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=m868Bfw4QnqvuXKBswkqJOwhMpgxB/5j7Tvjuq7nLRo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=pt1t/Iyj
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: Add an option to
 enable/disable CBCP support.
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

>>>>> "Akhilesh" == Akhilesh Nema <nemaakhilesh@gmail.com> writes:

 > Adds BR2_PACKAGE_PPPD_CBCP option.
 > https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.

 > Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
 > ---
 >  package/pppd/Config.in | 7 +++++++
 >  package/pppd/pppd.mk   | 6 ++++++
 >  2 files changed, 13 insertions(+)

 > diff --git a/package/pppd/Config.in b/package/pppd/Config.in
 > index 88c2180a9b..8c12557549 100644
 > --- a/package/pppd/Config.in
 > +++ b/package/pppd/Config.in
 > @@ -19,6 +19,13 @@ config BR2_PACKAGE_PPPD_FILTER
 >  	  the pppd active-filter and pass-filter options
 >  	  are available.
 
 > +config BR2_PACKAGE_PPPD_CBCP
 > +	bool "CBCP (Callback Control Protocol)"
 > +	default n

NIT: 'n' is the default, so we normally do not add such lines.


 > +	help
 > +	  Enable Callback Control Protocol (CBCP) support in pppd.
 > +	  https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.
 > +

How big is the cbcp support compared to the rest of ppp? If it is small,
maybe we should just unconditionally enable it? I see that is what
Debian does:

https://salsa.debian.org/debian/ppp/-/blob/master/debian/rules?ref_type=heads#L35

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
