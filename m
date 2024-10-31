Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB9BD767E9
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 17:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC6E408A9;
	Thu, 31 Oct 2024 17:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypAd2rH-Uwgd; Thu, 31 Oct 2024 17:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7DFC408D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7DFC408D6;
	Thu, 31 Oct 2024 17:26:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F14A5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D0E660C21
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6prDQyOkNaL for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 17:26:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.17;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3313E60C15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3313E60C15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3313E60C15
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:26:02 +0000 (UTC)
X-CSE-ConnectionGUID: Ar5jhwzcRI28A96K02P98Q==
X-CSE-MsgGUID: cdOdzn3fQ6SaZYpnGdkJvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30041721"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="30041721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:26:02 -0700
X-CSE-ConnectionGUID: Hdz/AWRQRRiDh6NM1KTu9Q==
X-CSE-MsgGUID: 8WBQzRcGSUqfZkwHgWttvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87833732"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:26:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t6Yvl-00000009jyV-20FR; Thu, 31 Oct 2024 19:25:57 +0200
Date: Thu, 31 Oct 2024 19:25:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aaron Sierra <aaron@bubbl-tek.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Andy Yan <andyshrk@163.com>,
 buildroot <buildroot@buildroot.org>, Andy Yan <andyshrk@gmail.com>
Message-ID: <ZyO9pdGiQ8Wpvscb@smile.fi.intel.com>
References: <PH1P110MB1603BAEB621A821D82C0A2C19F44A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <Zw_FDy5XWpeQ78sG@smile.fi.intel.com>
 <1929b27b55e.1242e8abc627480.7414881916261699452@bubbl-tek.com>
 <ZxJL9O0KM7WP7b-d@smile.fi.intel.com>
 <192afcdcd6d.1213d420c999874.906482760730917485@bubbl-tek.com>
 <192c0393182.d05ea8bb202213.1651339018002716691@bubbl-tek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <192c0393182.d05ea8bb202213.1651339018002716691@bubbl-tek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730395562; x=1761931562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m48inadZ3QTKgZxyCToE0446cr8Iuhy6f++lUqJsLTs=;
 b=Z/WodXFUgW9liV9jIs/ByVoYn0A1DDV7+JUYJWYkeGbfcIgHB3DK0b/N
 Q+XgFtBJBVrln8KV/mgJM6PsKwcCXEqV/qG/T/MAeghFlPSg4M93dr1b7
 Ihl84LmXBbuHnCHP4ZqyVflPkitPMNqMyftQE4B35L367UTHX4bb4Vgn9
 R+V2Q9mhiX8VtR5pDS5MH6IwofljFZhr/iKsYjzlx5m0BKTvoW3EjiZ+l
 aS3td65KifIBWAa3ZCIEwPJQsKSC0q3nDjchUAl/ljorKgjfePfpotQyX
 E/eVwbsnV/XruNFZqQXjU5CczEd3O4Ufr+gxVSgTW6hv4r4MSjcwbB9pR
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z/WodXFU
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 24, 2024 at 03:30:26PM -0500, Aaron Sierra wrote:
> > On Mon, 21 Oct 2024 10:59:13 -0500 Aaron Sierra  wrote:
> >
>  > Be on the lookout for contributions to your repository that address my remaining concerns. 
> 
> I've posted a pull request to your Github repo, https://github.com/andy-shev/iotools/pull/5,
> that expands the runtime (and project) documentation, while adding support for symlink
> installation in a cross-build environment.

Thank you!
I just reviewed it, in general looks very good. Only few comments to address.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
