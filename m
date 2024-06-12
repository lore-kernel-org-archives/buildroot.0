Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC9C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 17:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C390681178;
	Wed, 12 Jun 2024 17:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQkm3PYUm3Kp; Wed, 12 Jun 2024 17:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 983868116D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 983868116D;
	Wed, 12 Jun 2024 17:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1478A1BF379
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 17:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 023DF81169
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 17:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHe-nBEO5P9n for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 17:01:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C309A8113B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C309A8113B
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C309A8113B
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 17:01:41 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CFdn09023179; Wed, 12 Jun 2024 17:01:39 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yq14uf1vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 17:01:38 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CH1b0P016491
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 17:01:38 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CH1bn6032562
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 17:01:37 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id E8DE49A4D;
 Wed, 12 Jun 2024 12:01:36 -0500 (CDT)
Date: Wed, 12 Jun 2024 17:01:36 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZmnUcCidxYgWY0Wt@bspbox.kirk>
Mail-Followup-To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240609075444.747339-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240609075444.747339-1-yann.morin.1998@free.fr>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406120122
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120122
X-Proofpoint-GUID: 3V8WOcekzC4tDA_m1mLxPLw_-LjC4236
X-Proofpoint-ORIG-GUID: 3V8WOcekzC4tDA_m1mLxPLw_-LjC4236
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406120122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=Z69v2jTWYzy3YgAjysmUKwxbzp1vtF6qc1cRhodqBuQ=;
 b=dWZj80JtjuBZCc3Me0gvrkdKyXj9rG0Xuy06ow7mtm0cRrsHaAFSpwD6Kdt/WKdWmQVb
 LODZmQJ1CoNdVwH3AgIZQQo2y9Uj1P7W1sXA7qp6pf2fYeF1vkLaMID7ia4vAUFhavka
 Ih2PJS625EzpvE5R4d9M2cP+u5zsjud1DdqlLnFE+dHuCWtOzfm+JeFsdVItxOMj6X/J
 pCCDuyRim7tpavwdrbxeUxwCRMrSb0OP7zIyb9EI3Q6jqWguwxUojzbeHl4P/3OYbxKi
 zDBoTJOKxs4Q5sNfQkAZuimf9tbKX8immlwJIcJkIm2dm9TIhxt7icDOC5GD3cDh4xo9 Sw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=dWZj80Jt
Subject: Re: [Buildroot] [PATCH] Makefile: run PPD and RPATH fixup in
 host-fialize
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <Brandon.Maier@collins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024.06.09 09:54, Yann E. MORIN wrote:
> Currently, the gdbinit is generated and installed during post install
> hooks, either from the gdb package, or from the external-toolchain
> package. When using per-package directories (PPD), the staging directory
> of the either package is stored in the generated gdbinit, which is not
> going to be valid when all the PPD staging dirs get merged into the
> final staging: it would lack any library installed afterwards, i.e.
> mostly everything would be missing (but the libraries from the C
> toolchain in the case of an external toolchain).
> 
> Similarly, all the RPATH will point to various PPD drectories. This
> does not cause any issue when the final host is aggregated, because the
> PPD directories still exist when we call programs from there (e.g. from
> the fs infra, or from post-image scripts).
> 
> However, we knew that would not always be possible to keep the PPD
> directories: we have the prepare-sdk rule that runs a cleanup pass on
> the RPATH, and also applies the generic PPD fixups.
> 
> When we introduced prepare-sdk in c32ad51cbf2a (core/sdk: generate the
> SDK tarball ourselves), we did not yet have support for PPD for the host
> directory, and especially, we did not have the host-finalize rule, which
> was only introduced in d0f4f95e390b (Makefile: rework main directory
> creation logic) which kick-started the introduction of PPD.
> 
> At that point, we did not realise that the rpath fixups from
> prepare-sdk, would be better moved to the new host-finalize rule,
> because that had no impact unless one would need an SDK.
> 
> Later, in 25e60fbe1cab (Makefile: fix SDK relocation for
> per-package-dirs), we eventually introduced the PPD generic fixups in
> the prepare-sdk rule. Again, we did not realise that those fixups would
> be better placed in the host-finalize rule rather than the prepare-sdk.
> 
> While fixing the RPATH in host-finalize is not critical, fixing up the
> PPD paths actually is, as the gdbinit case demonstrate.
> 
> As such, move the PPD fixups to the host-finalize step, and while at it,
> also move the RPATH fixups.
> 
> This now does not leave much to do in the prepare-sdk step, and that
> could very well be moved to the host-finalize rule as well. However,
> some people may have started to rely on prepare-sdk in its 6 years of
> existence, and the little script it installs is not needed unless one
> really needs an SDK. So leave it as it is for now.
> 
> Reported-by: Casey Reeves <casey@xogium.me>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: Casey Reeves <casey@xogium.me>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Brandon Maier <Brandon.Maier@collins.com>
> ---
>  Makefile | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3bef434466..6c2a2ccddb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -594,14 +594,7 @@ world: target-post-image
>  
>  .PHONY: prepare-sdk
>  prepare-sdk: world
> -	@$(call MESSAGE,"Rendering the SDK relocatable")
> -	PARALLEL_JOBS=$(PARALLEL_JOBS) \
> -		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> -		$(TOPDIR)/support/scripts/fix-rpath host
> -	PARALLEL_JOBS=$(PARALLEL_JOBS) \
> -		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> -		$(TOPDIR)/support/scripts/fix-rpath staging
> -	$(call ppd-fixup-paths,$(BASE_DIR))
> +	@$(call MESSAGE,"Preparing the SDK")
>  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>  	mkdir -p $(HOST_DIR)/share/buildroot
>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> @@ -719,6 +712,13 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
>  host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>  	@$(call MESSAGE,"Finalizing host directory")
>  	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
> +	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
> +		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> +		$(TOPDIR)/support/scripts/fix-rpath host
> +	$(Q)PARALLEL_JOBS=$(PARALLEL_JOBS) \
> +		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
> +		$(TOPDIR)/support/scripts/fix-rpath staging
> +	$(call ppd-fixup-paths,$(BASE_DIR))
>  
>  .PHONY: staging-finalize
>  staging-finalize: $(STAGING_DIR_SYMLINK)
> -- 
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

This change makes sense. I tested by building some internal boards and
the host directory appears correct.

My only concern is about the final make steps taking too long, as with
per-package-directories doing a simple `make <pkg>-rebuild all` can take
a couple extra minutes. In my test build, the added time for a large
build with 200+ packages is about 15 seconds, which isn't too bad. It
might be possible to optimize this later.

Tested-by: Brandon Maier <brandon.maier@collins.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
