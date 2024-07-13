Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7579EC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9F5040521;
	Sat, 13 Jul 2024 20:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WLTmIOeqzGd; Sat, 13 Jul 2024 20:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5654B404B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5654B404B0;
	Sat, 13 Jul 2024 20:12:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCE331BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5DC781EBA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUPL_AB2LxZp for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEB7D81EB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB7D81EB7
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB7D81EB7
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:12:26 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DBh74L023930; Sat, 13 Jul 2024 20:12:24 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bjyb3cbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 20:12:23 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DKCN8Q031284
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 20:12:23 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DKCMND020106
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 20:12:23 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id CCC52A6F9;
 Sat, 13 Jul 2024 15:12:22 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 20:12:22 +0000
Message-Id: <D2OOOMT0LUX8.1ZCF0M7XCRQ4V@collins.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Brandon Maier via
 buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240528152948.86337-1-brandon.maier@collins.com>
 <20240713191001.34a074a8@windsurf>
In-Reply-To: <20240713191001.34a074a8@windsurf>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130154
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=988
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130154
X-Proofpoint-GUID: p7WSTk7tQxbzlnb39kewB6PdL0tD2WHO
X-Proofpoint-ORIG-GUID: p7WSTk7tQxbzlnb39kewB6PdL0tD2WHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407130154
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=gSVm2xwc+oDwfzkrfpIVR/WARgy7+fZSnvRMLJ7hTJY=;
 b=umrwPiN0iwDkZmnrPfaKekRVsuLmHLOQifixtWWRvARh/2lu/vF6Z9FA4ones5XsvNBG
 MNKoEq3ChEiAHZnQMMfsaFX+qVv6+LuobxUlF1iyhrLxDM6m1mhOteaIKlht06YppBqp
 uKw+s5kYoiHlyPXeeSsiZ+0jn7uNEAh37v43T55H3y+f+Jb1u3RwVZooHgzFhGkwvaVR
 5NLzydGDH/UmgUfJ+rt8Xn5lfZUqXyY/AacBZrSgPg0PxNiETtY+oLYO/+Px+UgE8+QW
 V1PXyJAFjCj3XQKuP/45zL3I+CSMfymOOmYAKFOlIy5CMN+ekeKDy1spluoXSNThu3+B Lw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=umrwPiN0
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: add 'hash_files' to
 show-info
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
Reply-To: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sat Jul 13, 2024 at 5:10 PM UTC, Thomas Petazzoni via buildroot wrote:
> Hello Brandon,
>
> Thanks for your patch! Questions/comments below.
>
> On Tue, 28 May 2024 15:29:48 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
>
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>
> Could you expand a bit the commit log to describe the motivation for
> this change? What are the use-cases?

Sure, I was working on utils/add-custom-hashes and it extracts all the
info it needs using `make show-info` in JSON. Except the TOPDIR, DL_DIR,
BR_NO_CHECK_HASH_FOR, and BR2_GLOBAL_PATCH_DIR. I wanted to expose more
of those values through `make show-info` as the JSON is easier to work
with.

BR2_GLOBAL_PATCH_DIR is only needed to infer where each package stores
its hash files. So by printing the "hash_files" for each package we get
the BR2_GLOBAL_PATCH_DIR and we also detect any other hash files in use
like the $(TOPDIR)/package/<pkg>/<pkg>.hash

>
> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index d1964299af..8970a2a8b9 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -176,6 +176,13 @@ define _json-info-pkg-details
> >  		},
> >  	)
> >  	],
> > +	"hash_files": [
> > +		$(foreach f, $($(1)_HASH_FILES),$(call mk-json-str,$(f))$(comma))
> > +	],
>
> One thing that isn't that "useful" here is that this is going to list
> *all* hash files for that package, not the one hash file that contained
> the appropriate hash used to check the package (if there are multiple
> hash files).

Right, it is more difficult to get that. As the Makefile doesn't
actually do that hash checking, it's handled by
support/download/check-hash.

It may also be desirable to know all the hash lookup directories, for
example to write out a new file in the $BR2_GLOBAL_PATCH_DIR/<pkg>/ that
overrides the one in $TOPDIR/package/<pkg>/

>
> > +	"no_check_hash_for": \
> > +		$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES), \
> > +			false, \
> > +			$(if $(filter $($(1)_SOURCE),$(BR_NO_CHECK_HASH_FOR)),true,false)),
>
> Could we have positive logic instead, such as "hash-checked": true?

I was trying to be consistent with BR_NO_CHECK_HASH_FOR, but it's easier
to understand in positive logic, so I will resend with that.

>
> Also, here you're basing the value of this property solely on whether
> <pkg>_SOURCE was hash-checked. But what about <pkg>_PATCH and
> <pkg>_EXTRA_DOWNLOADS? So basically this should be true only if all
> files in <pkg>_ALL_DOWNLOADS have been hash-checked.

I will need to look at this more. But I believe this 'check-hash' for
logic matches how BR_NO_CHECK_HASH_FOR works. I don't think it's
possible to override NO_CHECK_HASH_FOR for specific items in
_ALL_DOWNLOADS?

I will need to look at the above some more, will send a v2 with the
updated commit message and positive 'check-hash'.

Thanks,
Brandon

>
> Thanks!
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
