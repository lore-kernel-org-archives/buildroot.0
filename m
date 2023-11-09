Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990D7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 12:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45A1F60F1E;
	Thu,  9 Nov 2023 12:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45A1F60F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kq26dSVKg7vL; Thu,  9 Nov 2023 12:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CD4C60A66;
	Thu,  9 Nov 2023 12:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CD4C60A66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C79021BF40F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A193A41E69
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A193A41E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtYghoUORNQQ for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 12:48:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D140541E5A
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 12:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D140541E5A
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC83460009;
 Thu,  9 Nov 2023 12:48:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r14SC-0024R8-0R;
 Thu, 09 Nov 2023 13:48:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231003234734.525050-1-ajd@linux.ibm.com>
 <20231104214234.136b0e66@windsurf>
Date: Thu, 09 Nov 2023 13:48:12 +0100
In-Reply-To: <20231104214234.136b0e66@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 4 Nov 2023 21:42:34 +0100")
Message-ID: <87msvnnldf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libzlib: Switch to using HTTPS
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed,  4 Oct 2023 10:47:34 +1100
 > Andrew Donnellan <ajd@linux.ibm.com> wrote:

 >> Switch to using HTTPS for downloading libzlib from zlib.net.
 >> 
 >> (zlib.net doesn't default to HTTPS but does suggest HTTPS in the permalink
 >> for the latest zlib release. Also works better with some corporate firewalls
 >> that get suspicious about zlib for some reason.)
 >> 
 >> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
 >> ---
 >> package/libzlib/libzlib.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
