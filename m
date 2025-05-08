Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109EEC3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 06:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 889E780E31;
	Thu,  8 May 2025 06:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RekkokKdsq6U; Thu,  8 May 2025 06:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD68580DB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD68580DB7;
	Thu,  8 May 2025 06:27:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91B111A9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 06:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77BE160E90
 for <buildroot@buildroot.org>; Thu,  8 May 2025 06:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvRiGa57ClMX for <buildroot@buildroot.org>;
 Thu,  8 May 2025 06:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7168C60E50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7168C60E50
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7168C60E50
 for <buildroot@buildroot.org>; Thu,  8 May 2025 06:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C85ED1C0FB2; Thu,  8 May 2025 08:27:03 +0200 (CEST)
Message-ID: <b32a049c-0bd0-40e4-971e-c5dc7cdab5ca@rnout.be>
Date: Thu, 8 May 2025 08:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250507231902.14cbc9aa@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507231902.14cbc9aa@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746685624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=srIcbKSVap9BHAi6QclagLZYyLpGuK3/zKD3eU+Ul64=;
 b=SXWp0M1Zny/8F4XZJ5yIpVP12d+6rSzY8o2OTuGaPlpk55Iks90LRBxuE4LYx7j56rbyCD
 kXBFqYnlWDfYDTATIUK+p67AT6okmLrtyNK9y4+bldbUHSZWVb4ktQw9JsynvHgilb72Bh
 fgU25Md9TOBWF+gR1u7x8ZF9HCgXVjjrD7JSnVjm6bXq40RYff2nKbIXP8DGxWXIVnfFVX
 rYaHonOGtl91hgX3ym2P8DgWn8wf/41pHSePCE3TFaJcHnnLURk+aHYi6DH5zAPgCgSL5P
 TOgQyM8iSNZ7cZiIyfJC5XwFtj1AAEADn4KODzFgKv2FC0/QSs7Q6vTfBS0WBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=SXWp0M1Z
Subject: Re: [Buildroot] Grub security situation
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2025 23:19, Thomas Petazzoni wrote:
> Hello,
> 
> The latest pkg-stats scan reported to me a number of grub2 security
> issues:
> 
>                           grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778
>                           grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782
>                           grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779
>                           grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780
>                           grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678
> 
> Looking at that in some details, there are in fact a LOT more CVEs:
> 
>    https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00024.html
> 
> Many of them are not reported by pkg-stats because NVD has not
> annotated those CVEs (meh).
> 
> Now when it becomes a bit tricky is that those CVEs are fixed by 73
> patches. All of them have been applied upstream, but they are
> apparently not trivial to backport on grub 2.12.
> 
> See Arch people complaining here:
> 
>    https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00124.html
>    https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00098.html
> 
> There are currently 284 commits in grub's master on top of the 2.12
> version we're using. Backporting the 73 patches fixing the security
> issues seems complicated,

  Debian trixie also has 2.12, and there are 71 patches there [1]. So perhaps 
tracking Debian is an option? I think we used to do that for grub before:

GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
GRUB_PATCH = grub_$(GRUB_VERSION)-68.diff.gz
GRUB_SITE = 
http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/g/grub


  Regards,
  Arnout

[1] 
https://salsa.debian.org/grub-team/grub/-/tree/master/debian/patches/cve-2025-jan?ref_type=heads



> and having all 284 commits as patches in
> Buildroot also seems not very practical.
> 
> So the only solution that I can see right now is to used grub's master
> branch (of course with a fixed commit). Of course, for 2025.02, this
> means we would bump grub to a newer version that not only has security
> fixes, but also a whole bunch of other random changes. But that's how
> grub is maintained, and I'm not sure what we can do about it.
> 
> Opinions? Thoughts? Suggestions?
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
