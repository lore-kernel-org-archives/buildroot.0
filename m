Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8599FECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C42040C18;
	Fri, 16 Sep 2022 21:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C42040C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDXXZxHGlM-e; Fri, 16 Sep 2022 21:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF5540516;
	Fri, 16 Sep 2022 21:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF5540516
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B27951BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E8AA40516
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E8AA40516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibLPpAcsc5es for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:53:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AA5840137
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AA5840137
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:53:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 702FE200002;
 Fri, 16 Sep 2022 21:53:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZJGt-008lpo-JS; Fri, 16 Sep 2022 23:53:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220815191914.568237-1-fontaine.fabrice@gmail.com>
Date: Fri, 16 Sep 2022 23:53:15 +0200
In-Reply-To: <20220815191914.568237-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Aug 2022 21:19:14 +0200")
Message-ID: <87mtaz56lw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.1.0-45
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

 > - Fix CVE-2022-1114: A heap-use-after-free flaw was found in
 >   ImageMagick's RelinquishDCMInfo() function of dcm.c file. This
 >   vulnerability is triggered when an attacker passes a specially crafted
 >   DICOM image file to ImageMagick for conversion, potentially leading to
 >   information disclosure and a denial of service.
 > - Fix CVE-2022-32545: A vulnerability was found in ImageMagick, causing
 >   an outside the range of representable values of type 'unsigned char'
 >   at coders/psd.c, when crafted or untrusted input is processed. This
 >   leads to a negative impact to application availability or other
 >   problems related to undefined behavior.
 > - Fix CVE-2022-32546: A vulnerability was found in ImageMagick, causing
 >   an outside the range of representable values of type 'unsigned long'
 >   at coders/pcl.c, when crafted or untrusted input is processed. This
 >   leads to a negative impact to application availability or other
 >   problems related to undefined behavior.
 > - Fix CVE-2022-32547: In ImageMagick, there is load of misaligned
 >   address for type 'double', which requires 8 byte alignment and for
 >   type 'float', which requires 4 byte alignment at
 >   MagickCore/property.c. Whenever crafted or untrusted input is
 >   processed by ImageMagick, this causes a negative impact to application
 >   availability or other problems related to undefined behavior.
 > - Update hash of LICENSE (year updated with
 >   https://github.com/ImageMagick/ImageMagick/commit/80629dfb3fea55eefa2dd8bdd9ca1be341502e16)

 > https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
