Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8647C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C803830FB;
	Fri,  1 Mar 2024 10:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5C_hOMKMVMJL; Fri,  1 Mar 2024 10:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92734830C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92734830C0;
	Fri,  1 Mar 2024 10:52:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 220DE1BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16C4241D9F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xy4osymTiXNL for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE2D141D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE2D141D9D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE2D141D9D
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:52:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E08C60005;
 Fri,  1 Mar 2024 10:52:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rg0VS-006igO-2f;
 Fri, 01 Mar 2024 11:52:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <CACXRmJj_RLgX7yHPCc6cv7tn4mHkcJvrhY9kzJ9fbdH6Y-pa8Q@mail.gmail.com>
 <20240114184111.454187-1-thomas@devoogdt.com>
 <20240207171034.535dd392@windsurf>
Date: Fri, 01 Mar 2024 11:52:46 +0100
In-Reply-To: <20240207171034.535dd392@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 7 Feb 2024 17:10:34 +0100")
Message-ID: <871q8u9qbl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/libglib2: fix libiconv (intl)
 support
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 14 Jan 2024 19:41:11 +0100
 > Thomas Devoogdt <thomas@devoogdt.com> wrote:

 >> Libglib2 can compile without localization support,
 >> but still depends on libiconv, which is selected in Config.in.
 >> 
 >> This fallback support was broken, and is fixed in this upstream commit:
 >> https://gitlab.gnome.org/GNOME/glib/-/commit/a497d5be122f193dcf8679334308333bbbc14a71
 >> 
 >> The other patch is purely added to avoid merge conflicts while cherry-picking.
 >> 
 >> Fixes: http://autobuild.buildroot.org/results/04d/04d9a17e64503e0bece7bad33549ef3ad4b237c9/build-end.log.
 >> 
 >> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 >> ---
 >> v2: dropped meson libintl wrap, problem was the libiconv detection
 >> ---
 >> ...ion-of-a-system-provided-proxy-libin.patch | 53 +++++++++++++++++++
 >> ...05-meson-try-iconv-in-libintl-lookup.patch | 53 +++++++++++++++++++
 >> 2 files changed, 106 insertions(+)
 >> create mode 100644 package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
 >> create mode 100644 package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch

 > Applied to master after doing some research to explain when the problem
 > was introduced, so that Peter can more easily decide if this should be
 > backported, and to which branches.

Thanks for that, so from that description I take it that only 2023.11.x
is affected?

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
