Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D8CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C54441490;
	Thu, 19 Sep 2024 19:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTJn3pwMAopU; Thu, 19 Sep 2024 19:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1030C41495
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1030C41495;
	Thu, 19 Sep 2024 19:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E94F1BF292
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CD3A40E0C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9gPrvt2W8-n for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6541A41490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6541A41490
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6541A41490
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:56:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 424A91C0004;
 Thu, 19 Sep 2024 19:56:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srNGa-00GcNZ-1P;
 Thu, 19 Sep 2024 21:56:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <CAEpB38MKaFVyTLAwjsT6uGEU+w7L9MpUg31Oftqb9oaP2DNPiA@mail.gmail.com>
 <20240914110036.13d08b21@windsurf>
Date: Thu, 19 Sep 2024 21:56:40 +0200
In-Reply-To: <20240914110036.13d08b21@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 14 Sep 2024 11:00:36 +0200")
Message-ID: <87msk3ju2v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 go1.22.7
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Christian,
 > On Wed, 11 Sep 2024 21:18:58 +0000
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> Fixes the following CVEs:
 >> 
 >> CVE-2024-34155: go/parser: stack exhaustion in all Parse* functions
 >> CVE-2024-34156: encoding/gob: stack exhaustion in Decoder.Decode
 >> CVE-2024-34158: go/build/constraint: stack exhaustion in Parse
 >> 
 >> https://go.dev/doc/devel/release#go1.22.7
 >> 
 >> Signed-off-by: Christian Stewart <christian@aperture.us>
 >> ---
 >> package/go/go-src/go-src.hash | 2 +-
 >> package/go/go.mk              | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > I've applied, but your patch was badly line-wrapped. Could you make
 > sure to use "git send-email", or adjust your tooling?

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
