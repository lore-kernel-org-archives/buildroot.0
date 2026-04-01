Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F22D35164
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 09:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C8C61077;
	Wed,  1 Apr 2026 09:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSLjUV8MvQDp; Wed,  1 Apr 2026 09:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F44A606F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775036381;
	bh=ccRdsInDPRFY9cl4gAqBgHrb7+w300C5fFyWZ1RebbI=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P9vZ94tDRNSzqKRFUaE+FDeFinVZLRToCMRQCHlP3APzdXi40Loy0XineDeV+5w+E
	 eTix0ndovy60dvISCfdNo4f6RfaM+LAluGv46Tiaugxrq6v1Ooj2XKJwwfL2cYl2b0
	 zdrFVvlT+CBpkqkIyrXbROaKWb6yb9yvnX+Yy/E2RrRUzUqDRekCmDQ5mOSnfPjzew
	 VY87qJVA4Ej3zp67mZ9qumhSJM4+McgscCgyTjicKu5QQRymsJA5FGLi/5C9bXKoDh
	 NPV7UwkLC1D0Z/IDamheJSRO+PayUpjGaoRmnEz05CB4ZJp0RpoIsUjS1h/eSUFzIl
	 TQ/mO30hFTZ7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F44A606F4;
	Wed,  1 Apr 2026 09:39:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0620E2A2
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03E80407FA
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYYEz9-0SWAJ for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 09:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6D83401CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6D83401CB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6D83401CB
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:39:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -367325293; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Apr 2026 09:39:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w7s2w-00000005mte-0ZYr;
 Wed, 01 Apr 2026 11:39:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
In-Reply-To: <20260331083702.86930-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Tue, 31 Mar 2026 10:37:01 +0200")
References: <20260331083702.86930-1-francois.perrad@gadz.org>
Date: Wed, 01 Apr 2026 11:39:34 +0200
Message-ID: <87o6k358a1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qTzp8d4+zimWQwqgd4RhP5Psd2yzLZiun11eDoSmbAAHvnwsfi3V3kmJKSQRCBHVljPGjoni1TIIg+iWeEX9bK2bfdXQLwXaYSHCLWdBSVbCL/2j2Hto5VGqoXTVCzlkfXp2iourmMwID0fKG1pY3YkfViD9bjQsgrJs8RjnFCL54M6ag61E3AhSCNbqfCMbSc8J2b+fy9wZGlYJHtJhvU9qXlbmgb4T19eP91caJcgk/VQY9/VN91MaNJPkE3sZekjFH4EjLgRwk0AyYxOROubE26lP9/C4lAraxhHf2WCumv4JUD14KS3KeSIKCRc+wQE+7Vfx89+Q+eaFSOj0zg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=W43gcTThRmYUcV7eHN/yRtHYhUefelPTO4flb9aV3F0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qTzp8d4+
Subject: Re: [Buildroot] [PATCH] package/perl: security bump to version
 5.42.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > fix CVE 2026-4176 : contains a vulnerable version of Compress::Raw::Zlib
 > For release notes, see:
 > https://perldoc.perl.org/5.42.2/perl5422delta

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
