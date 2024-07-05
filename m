Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEA7C38150
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 154224059F;
	Fri,  5 Jul 2024 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0d56tiILHpw; Fri,  5 Jul 2024 17:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5EC2405B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5EC2405B1;
	Fri,  5 Jul 2024 17:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DED31BF281
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 17:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 774214059F
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 17:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQCgjB6jwigR for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 17:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A564B40507
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A564B40507
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A564B40507
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 17:00:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7D3420005;
 Fri,  5 Jul 2024 17:00:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sPmI7-000PiS-2R;
 Fri, 05 Jul 2024 19:00:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
 <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
 <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
Date: Fri, 05 Jul 2024 19:00:11 +0200
In-Reply-To: <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
 (Joachim Wiberg's message of "Fri, 05 Jul 2024 06:54:50 +0200")
Message-ID: <87v81jvko4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > On Thu, 2024-07-04 at 22:10 +0200, Arnout Vandecappelle wrote:
 >> On 04/07/2024 14:59, Peter Korsgaard wrote:
 >> > Yes, I will get to it this weekend. I'll have a look if cherry-
 >> > picking the fix on 9.7 is better than bumping given that DSA keys
 >> > are no longer supported.

 > Peter, I had a look at the https://www.openssh.com/releasenotes.html
 > and apparently:

 >    "DSA support may be re-enabled in OpenBSD by setting 'DSAKEY=yes'
 >     in Makefile.inc. To enable DSA support in portable OpenSSH, pass
 >     the '--enable-dsa-keys' option to configure."

 > So I guess with that 9.8p1 could still be a candidate for 2024.02.x?

Yes, if old keys work with 9.8p1, then that is IMHO preferable to use
for 2024.02.x as it makes it easier to update in the future if other
issues are found. We could even add a default-no option on master to
support those legacy keys there as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
