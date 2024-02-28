Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76445C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6784052E;
	Wed, 28 Feb 2024 16:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtSeNiL20TVT; Wed, 28 Feb 2024 16:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8D2409FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8D2409FB;
	Wed, 28 Feb 2024 16:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32D6D1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20AE64052E
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feEbnEG5EP6g for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81B2C409FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B2C409FB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81B2C409FB
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:14:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B91FF809;
 Wed, 28 Feb 2024 16:14:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfMZj-001ivD-2T;
 Wed, 28 Feb 2024 17:14:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20240123085419.1761894-1-aperez@igalia.com>
Date: Wed, 28 Feb 2024 17:14:31 +0100
In-Reply-To: <20240123085419.1761894-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 23 Jan 2024 10:54:17 +0200")
Message-ID: <87sf1cpnvc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.42.4
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > The minimum GCC version is changed to 10.x, conditionals added for
 > USE_JPEGXL and USE_GBM. Both are optional and will be automatically
 > enabled if the relevent packages have been enabled. GBM is recommended
 > for performance, is it avoids a buffer copy on each frame rendered by
 > WebKit.

 > Release notes:

 >  - https://wpewebkit.org/release/wpewebkit-2.40.4.html
 >  - https://wpewebkit.org/release/wpewebkit-2.40.5.html
 >  - https://wpewebkit.org/release/wpewebkit-2.42.0.html
 >  - https://wpewebkit.org/release/wpewebkit-2.42.1.html
 >  - https://wpewebkit.org/release/wpewebkit-2.42.2.html
 >  - https://wpewebkit.org/release/wpewebkit-2.42.3.html
 >  - https://wpewebkit.org/release/wpewebkit-2.42.4.html

 > This update covers fixes for CVE-2023-37450, CVE-2023-38133,
 > CVE-2023-38572, CVE-2023-38592, CVE-2023-38594, CVE-2023-38595,
 > CVE-2023-38597, CVE-2023-38599, CVE-2023-38600, CVE-2023-38611,
 > CVE-2023-40397, CVE-2023-39928, CVE-2023-39434, CVE-2023-40451,
 > CVE-2023-41074, CVE-2023-41993, CVE-2023-32359, CVE-2023-41983,
 > CVE-2023-42852, CVE-2023-42916, CVE-2023-42917, CVE-2023-42883,
 > and CVE-2023-42890.

 > Relevant security advisories:

 >  - https://wpewebkit.org/security/WSA-2023-0006.html
 >  - https://wpewebkit.org/security/WSA-2023-0007.html
 >  - https://wpewebkit.org/security/WSA-2023-0008.html
 >  - https://wpewebkit.org/security/WSA-2023-0009.html
 >  - https://wpewebkit.org/security/WSA-2023-0010.html
 >  - https://wpewebkit.org/security/WSA-2023-0011.html
 >  - https://wpewebkit.org/security/WSA-2023-0012.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
