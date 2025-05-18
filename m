Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F1C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1602E81EB3;
	Sun, 18 May 2025 14:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Si3rHqqSc_w; Sun, 18 May 2025 14:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3066D81EB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3066D81EB6;
	Sun, 18 May 2025 14:39:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6411BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E079404F0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLDiZWe7G0w8 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D0D640142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D0D640142
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D0D640142
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E36A1C0FC0; Sun, 18 May 2025 16:39:44 +0200 (CEST)
Message-ID: <d56457df-c002-4c48-a3a4-322a33550f32@rnout.be>
Date: Sun, 18 May 2025 16:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250513195417.2730273-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250513195417.2730273-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579184; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OnBoui6cgBzBTXrSczI4vfaZII2lC/u65CbE4nxb/Ds=;
 b=ll4hracFf7F7k4oBLtu6nHQDEh5N49R2Oqho6Ai7+QQwAHp7U8owhTbE/CJhvtuxdII38L
 ZQNcdLhoazEn7s9gO/lid8SUbX3VHyhPAh2dh0s/s7TMf1G2QYTO34kBqbsiKbwVq/ceLx
 CjhjZlsV2nInsnoYBOQt5udx/l8VP0NZ5bLw0a4SKNdw5VirlTfk65WitMOA80MSPQ/0Dx
 GXDqdkr5Gky9KWhmi7DSohPmBSdzYQ+o2k2KbbNgHylPyk98C0nS/TG75gmEnzP86zzx7N
 INWMokHBAzPL9vE9298kWWME5QFWfC8rmRlLoi8FHKEwLOHvzO89/HI8LsQ+Gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ll4hracF
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250512
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/05/2025 21:54, Bernd Kuhls wrote:
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250512
> 
> CVE-2025-24495:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01322.html
> 
> CVE-2024-28956:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01153.html
> 
> CVE-2024-43420:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01247.html
> 
> CVE-2025-20103:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01244.html
> 
> "Note: INTEL-SA-01244 and INTEL-SA-01247 will be published on May 13th 2025"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/intel-microcode/intel-microcode.hash | 2 +-
>   package/intel-microcode/intel-microcode.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index 9721a15976..9504f7a786 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  1da88b51953c9da2e20b5c94b3d7270cf87ea5babcaa56e3d6a5c9eaf11694b3  intel-microcode-20250211.tar.gz
> +sha256  041af7d2f5791a47c1e914abd7d6255de4d4fc61b0f8e49ada6ee7014bcc3614  intel-microcode-20250512.tar.gz
>   sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index db3e690ec7..1fd09e6a6d 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INTEL_MICROCODE_VERSION = 20250211
> +INTEL_MICROCODE_VERSION = 20250512
>   INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>   INTEL_MICROCODE_LICENSE = PROPRIETARY
>   INTEL_MICROCODE_LICENSE_FILES = license

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
