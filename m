Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD14EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:46:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2695E61245
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2695E61245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B84F140227;
	Sat, 16 Oct 2021 08:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9lm_yp0K6Te; Sat, 16 Oct 2021 08:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA04401DF;
	Sat, 16 Oct 2021 08:46:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7251BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AD12404BC
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yLciR7SRZUs for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:46:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0100404B7
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:46:12 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 922261BF209;
 Sat, 16 Oct 2021 08:46:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mbfKS-0000hU-Bw; Sat, 16 Oct 2021 10:46:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211016084136.2475297-1-fontaine.fabrice@gmail.com>
Date: Sat, 16 Oct 2021 10:46:08 +0200
In-Reply-To: <20211016084136.2475297-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Oct 2021 10:41:36 +0200")
Message-ID: <87fst1nyr3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: add
 missing comment about kernel dependency
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

 > Add a comment when kernel is not enabled (missing since the addition of
 > the package in commit de591c5c3a93a40d049a32bd79c30cc66daf5fb2)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/wireguard-linux-compat/Config.in | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
 > index 5a323a35e5..4e8e95bdc3 100644
 > --- a/package/wireguard-linux-compat/Config.in
 > +++ b/package/wireguard-linux-compat/Config.in
 > @@ -21,6 +21,9 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 
 >  	  https://www.wireguard.com
 
 > +comment "wireguard-linux-compat needs a Linux kernel to be built"
 > +	depends on !BR2_LINUX_KERNEL

Is this really a sensible comment? I would imagine that needing a Linux
kernel is an obvious requirement for a kernel driver?


 > +
 >  comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
 >  	depends on BR2_LINUX_KERNEL
 >  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 > -- 
 > 2.33.0


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
