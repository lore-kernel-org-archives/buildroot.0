Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA9BC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 16:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9548156C;
	Sun, 18 May 2025 16:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdqCDMkjs80n; Sun, 18 May 2025 16:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F722813F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F722813F9;
	Sun, 18 May 2025 16:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 190C5DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15C5A813F9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNavNBbcdZjk for <buildroot@buildroot.org>;
 Sun, 18 May 2025 16:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FE3481A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FE3481A92
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FE3481A92
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:48:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87E4343B28;
 Sun, 18 May 2025 16:47:57 +0000 (UTC)
Date: Sun, 18 May 2025 18:47:56 +0200
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org
Message-ID: <20250518184756.4a084524@windsurf>
In-Reply-To: <20250428154055.1402438-1-guillaume.chaye@zeetim.com>
References: <20250428154055.1402438-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeltdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteetueehgfdtfeelfeektdeigfevgffffefhgefhteeuffffledtjeeiudelfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhnuhdrohhrghdpghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehguhhilhhlrghumhgvrdgthhgrhigvseiivggvt
 hhimhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747586877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwnFZSGS6inRQMBZdKVdZzLljhutQqft1eLIz5jtNxk=;
 b=EuCxXWZAXLmQFRfoO8HOncIC94Ng8D+sB1EvG55fWcPakF+m+SclAkz7/76KxvQ1Ca30tA
 1PHgNq9ZP/V57u3MDqJrn5S8J8WrL89Pb3nXfjm0mzpiSiSNJllcUVBRIYOho5r9rRn1aj
 WUs8+mIgJCNfE8fU/P92xcyos87nuFro/B4PLOgTts55+bZU33ReUSspwKvhAE4fYOSHt9
 4R/ZfPoWKjBZvlTS7P21PJHEUSMQ4qJadDvzZu/mhdorEmKjV7NMgfqcFuOZGD0UPxUoS5
 4unI7FDWChuz5iakvLXXkzTide1YVhqhLzyCaiu64DHNmIlZVxE5sUBHEjJxLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EuCxXWZA
Subject: Re: [Buildroot] [PATCHv4 1/1] package/heimdal: upgrade package and
 add target support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Mon, 28 Apr 2025 11:40:55 -0400
Guillaume Chaye <guillaume.chaye@zeetim.com> wrote:

> This patch does several things, so I will try to explain clearly what has been modified.
> 
> First, it bumps Heimdal to the latest commit (16/04/2025).
> The current version was more than 3 years old and had known CVEs (see CVE-2023-36328).
> This upgrade allows the removal of the two patches currently applied:
> - The commit 1b57b62, which fixes the build with autoconf 2.72, is already included upstream.
> - We no longer need to use the JSON-PP module, as it is now optional (commit 13d3bcf).
> 
> Heimdal was previously a host-only package. This patch adds target support.
> This requires cross-compiling the project, which was not possible without additional patches.
> After some research, I found this pull request (https://github.com/heimdal/heimdal/pull/1174)
> created by a well-known Heimdal contributor (Nico Williams).
> This pull request contains 29 commits, which is quite large, so I have tried to keep things simple
> by selecting only the minimal set of changes required for cross-compilation.
> 
> After extensive testing, I have successfully built the target version of Heimdal by applying 3 commits
> picked from the pull request:
> - The first one adds the AX_PROG_CC_FOR_BUILD macro to the project.
>   This macro, from the GNU project (https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html),
>   allows detecting a C compiler that produces native executables.
> - The second commit integrates the AX_PROG_CC_FOR_BUILD macro into Heimdal's autoconf scripts,
>   enabling proper compiler selection during the build.
> - Finally, a patch was needed to fix header errors when cross-compiling libroken.
> 
> Additionally, I have added two patches I wrote and submitted upstream:
> - The first removes a hardcoded path from a script.
> - The second fixes an error generated by the 'ar' utility during the build process.
> 
> Finally, since the latest version of Heimdal no longer depends on e2fsprogs,
> the host-e2fsprogs dependency has been removed.
> 
> Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>

Thanks for this new iteration. There is still too much in there, mixing
the bump and the addition of the target package.

Since the version bump made sense on its own, I extracted just this
aspect from your patch, and merged it:

  https://gitlab.com/buildroot.org/buildroot/-/commit/573ecbd44cd16b2ca4ce71b40459bcecf8c8e98c

For the rest, could you please:

- Provide a new patch with a commit message that's wrapped at 80
  columns and doesn't use first person sentence like "I have..."

- Justify why heimdal for the target is useful, i.e what will use it.

- Double check that the AX_PROG_CC_FOR_BUILD function in
  autoconf-archive really doesn't work? This would allow to avoid
  having another copy of it.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
