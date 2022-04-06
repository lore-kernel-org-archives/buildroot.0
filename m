Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A2DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 20:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E12F541866;
	Wed,  6 Apr 2022 20:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sr2n6WHrG1wN; Wed,  6 Apr 2022 20:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE6CF410A7;
	Wed,  6 Apr 2022 20:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 995F91BF5A1
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87F9E60E4D
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=laposte.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mQ-aO43Kgum for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 20:00:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net
 [160.92.124.107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25DAA60E2D
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 20:00:53 +0000 (UTC)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KYb3d6SRRzdZLl",
 "contextId":"5f569175-6e85-4aa9-80c5-b8fdb071c2c8"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4KYb3d6SRRzdZLl;
 Wed,  6 Apr 2022 22:00:45 +0200 (CEST)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KYb3d53B7zdZLM",
 "contextId":"bf4174ff-d6a4-49ed-b2ab-5fa1a06a6545"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 46
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgudeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfntefrqffuvffgpdggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepgghinhgtvghnthcuufhtvghhlhoruceovhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtqeenucggtffrrghtthgvrhhnpeefhffhjeehjeevhfetjedvleefheeuheegtdevgfekveeigfejieettdeugfelteenucffohhmrghinhepvghthhdtrdhpihgupdgsuhhshigsohigrdhnvghtnecukfhppeekkedrudeiledruddvledrvddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeiledruddvledrvddvhedphhgvlhhopehrohhmuhgrlhgurdgsvghrghgvrhhivgdpmhgrihhlfhhrohhmpehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhhouhhtsehmihhnugdrsggvpdhrtghpthhtohepghgvrhhomhgvrdgsuhhrl
 hgrthhssehsmhhilhgvrdhfrhdpmhhouggvpehsmhhtphhouhht
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4KYb3d53B7zdZLM;
 Wed,  6 Apr 2022 22:00:45 +0200 (CEST)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id 5E1F248C5623; Wed,  6 Apr 2022 22:00:45 +0200 (CEST)
Date: Wed, 6 Apr 2022 22:00:45 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Yk3xbfOrlY4N86C3@romuald.bergerie>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 buildroot@buildroot.org, Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20220329205136.32435-1-vincent.stehle@laposte.net>
 <40cedffc-e46e-e4d5-e2f3-c0dd398906cd@mind.be>
 <YktJLL+SywDe7TYm@romuald.bergerie>
 <2646beec-15db-f2e9-5490-0f7fd551857f@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2646beec-15db-f2e9-5490-0f7fd551857f@mind.be>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1649275251; bh=r2zJuCnzIDEzgj3ChluBigZZ4dOy8HDk1DnwyMQQhIU=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
 b=fbMlMKWUk0yvvmciCDKR9J091aB8DeBnv9+Ruw1sj83ZYZrOtKzm4FRMvyYcqbAM/pauot1yw3r+Zc2n5hAcWymOJMJ6X/PKZ6pXiV4HwJuy14RulUbnOsYw2oIDckTHU+CXryVURwyX/s9fxbxQDMtooSnZV8RfrTxwZJpZdeOhDhZrMVYsG3E+8jPEH8kOiytJDVpr6IGl84ZBYexpYINxgLlbF4XQFX6GaFLh3YYNHEWpm+CrMjZqd0CHDQFgYjJUd+LWfAHIBwcdEnV+QweRPhmkXSIooK9wDsUeMtv5CZJsRRqfsyifp310gkGbsXbrkhrP/GyFtpEeiUoDMA==;
Subject: Re: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
 minimal config
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Apr 04, 2022 at 10:28:12PM +0200, Arnout Vandecappelle wrote:
..
>  But that actually causes a problem: if udhcpc doesn't keep running the
> background any more, it's not going to refresh its lease, but will keep on
> using its IP address indefinitely. Although this seems to work at first
> hand, it's going to cause some problem somewhere down the line...

Hi Arnout,

After your comment at first I thought all the no-MMU buildroot defconfigs were
subtly broken :-S

I did some investigations and now my understanding is that udhcpc does indeed
daemonize by default in the no-MMU case. See [1]:

  #if !BB_MMU
  	/* on NOMMU reexec (i.e., background) early */
  	if (!(opt & OPT_f)) {
  		bb_daemonize_or_rexec(0 /* flags */, argv);
  		logmode = LOGMODE_NONE;
  	}
  #endif

That behaviour was added in busybox udhcpc while removing the -b option (in
commit [2]).

Also, this is confirmed on qemu where we can see the udhcpc process running in
the background:

  ~ # ps
    PID USER       VSZ STAT COMMAND
      1 root       616 S    init
  ...
     62 root       612 S    udhcpc -R -p /var/run/udhcpc.eth0.pid -i eth0 -x hos

>  So we should find a different solution, and we should probably use that in
> the MMU case as well (just to keep things consistent.

Now I think that we are safe. What is your opinion on this, please?

Best regards,
Vincent.

[1]: https://git.busybox.net/busybox/tree/networking/udhcp/dhcpc.c#n1352
[2]: https://git.busybox.net/busybox/commit/?id=21765fa063830923d13426ec6989c16da9210e49
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
