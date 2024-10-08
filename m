Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EA2CEFC55
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D4360585;
	Tue,  8 Oct 2024 20:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbvcFprODEeG; Tue,  8 Oct 2024 20:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29ECA60706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29ECA60706;
	Tue,  8 Oct 2024 20:16:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B92EC1BF59E
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8F7681186
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mrcae688wetc for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3E0381170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E0381170
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3E0381170
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:16:31 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498Ihh64014965;
 Tue, 8 Oct 2024 20:16:31 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 4259d0hqu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Oct 2024 20:16:31 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 498KGTEE012348
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2024 20:16:30 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 498KGToc027937
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Oct 2024 20:16:29 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 910C2A52F;
 Tue,  8 Oct 2024 15:16:29 -0500 (CDT)
Mime-Version: 1.0
Date: Tue, 08 Oct 2024 20:16:29 +0000
Message-Id: <D4QP96ET827G.WH5BT917OTXA@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
 <20241008-check-package-requirements-v1-1-a137acc133e6@collins.com>
 <ed71303c-2b49-45e9-a580-f04a8f1535d0@mind.be>
In-Reply-To: <ed71303c-2b49-45e9-a580-f04a8f1535d0@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_19,2024-10-08_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_19,2024-10-08_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080130
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080131
X-Proofpoint-GUID: nDV5qR46HI-AD0I9bf-9MPbnvfgFa2RP
X-Proofpoint-ORIG-GUID: nDV5qR46HI-AD0I9bf-9MPbnvfgFa2RP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_19,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410080131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=zc5h5XEi4N4Fg0Pu7icBEGC5oNRbXhNYVloZYnob3Hc=;
 b=JgzXcVZudz9aI0qGLJ8gPlVnaVmuLo/kh+8QM0lSACflv4DUoQyn/8jGuPNtqvHxF2fP
 RNqSJBy8se29zyGW0kjZq63JR3wB9mcVMEWwEivS5mgiiXRHKVsdrsl5FH3G8Q8uA0Wf
 JReIHnIQhtDvZPhtya7fobh9j9A7nsFlDSARFN5ee8hQNUds+84XU7jL+4OChrLBk/3u
 BmW85DmuFPLcE6Y5qQAYVi2Tjtg82HjjhIWCvLHN+U+KspysNF1ivloPl7KYzbHlguik
 48lczk5yBiIyu60fsK14uqPAc+67TT5mloJtAunYPVJF6XfTj0vnbzWMs65BorglhRkd yA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=JgzXcVZu
Subject: Re: [Buildroot] [PATCH 1/3] docs/manual/adding-packages-tips:
 mention check-package requirements
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Tue Oct 8, 2024 at 7:52 PM UTC, Arnout Vandecappelle via buildroot wrote:
>
>
> On 08/10/2024 17:57, Brandon Maier via buildroot wrote:
> > Call out the requirements to run check-package and mention that Docker
> > can be used to run check-package without installing dependencies.
> >
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> >   docs/manual/adding-packages-tips.adoc | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
> > index b04b42b51f92aaa2ba4dc759a3fe9db8b6ec5cfc..182204101413d879eb6aa4777d43abac5f48e8d5 100644
> > --- a/docs/manual/adding-packages-tips.adoc
> > +++ b/docs/manual/adding-packages-tips.adoc
> > @@ -64,6 +64,16 @@ The tool can also be used for packages in a br2-external:
> >   $ check-package -b /path/to/br2-ext-tree/package/my-package/*
> >   ----
> >
> > +The +check-package+ script requires you install +shellcheck+ v0.7.1 and the
> > +Python PyPi packages +flake8+ and +python-magic+. You can use a different
> > +version of ShellCheck, but you may see warnings from unrelated files.
>
>   "warnings from unrelated files" is wildly inaccurate. With a different version
> you can see warnings that Buildroot CI doesn't check, that's all.

I'm not understanding how my statement is inaccurate. When I've run `make
check-package` in the past, I often get warnings from other files in the
repo. This I assume is because the Buildroot CI is the baseline that the
`.checkpackageignore` gets updated.

For example if I run check-package on my system which uses Shellcheck v0.10.0

  $ make check-package
  board/terasic/de10nano_cyclone5/barebox-env/boot/mmc:0: run 'shellcheck' and fix the warnings
  package/kodi/br-kodi:0: run 'shellcheck' and fix the warnings
  package/mdnsd/S50mdnsd:0: run 'shellcheck' and fix the warnings
  support/download/curl:0: run 'shellcheck' and fix the warnings
  support/download/cvs:0: run 'shellcheck' and fix the warnings
  support/download/git:0: run 'shellcheck' and fix the warnings
  support/download/svn:0: run 'shellcheck' and fix the warnings
  support/scripts/mkusers:0: run 'shellcheck' and fix the warnings
  ...

If I instead use the Docker image

  $ ./utils/docker-run make check-package
  418658 lines processed
  0 warnings generated

I added the warning just to make it clear to users those warnings may
not be related to any changes they are testing.

Is it preferred to drop the warning?

Thanks,
Brandon

>
>   Regards,
>   Arnout
>
> > +
> > +If you have Docker or Podman you can run check-package without installing dependencies:
> > +
> > +----
> > +$ ./utils/docker-run ./utils/check-package
> > +----
> > +
> >   [[testing-package]]
> >   ==== How to test your package
> >
> >
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
