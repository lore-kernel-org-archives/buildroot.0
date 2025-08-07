Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FACC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 13:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A544D84E72;
	Thu,  7 Aug 2025 13:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLVr4hqsVXx6; Thu,  7 Aug 2025 13:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD7A384971
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD7A384971;
	Thu,  7 Aug 2025 13:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1BBA10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 13:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A209D84948
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 13:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWX6yO4lgh7C for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 13:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40E2D84E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E2D84E6B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40E2D84E6B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 13:56:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 281443329; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 07 Aug 2025 13:56:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uk16J-002pWq-17;
 Thu, 07 Aug 2025 15:56:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>,  Thomas Perale
 <thomas.perale@mind.be>
References: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
Date: Thu, 07 Aug 2025 15:56:11 +0200
In-Reply-To: <20250807062327.1637333-1-fabien.lehoussel@smile.fr> (Fabien
 Lehoussel via buildroot's message of "Thu, 7 Aug 2025 08:23:23 +0200")
Message-ID: <87qzxngrr8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aoc9jJO4W2rdIrSxSpGNhupesGzBeOI6uBQ2t+UgJbq8nbdRdE3g28D3Q3AlK5C1KuWIpIllfRK32uf16QJl/zPPGVqb5eXBZmVSd7a75mU5lQid88Qixoi4HuP7RGhU8cmQniSxWdOlQxEmGrU2zxFZkTqScFn10uztgdt5UetYSL3XthwpEBVCYN4iUcXeeNyvnh8LVL1bNw7/gEhW8Q/mVf8+EfR9/btgecOZcLjSyOfYYmrwmkf5tb0VN0qZWQRhl54LEkS5GyR6H4xy4BCckM2igfy2SLf5jXNLfiAsrHTT4qVHpIfzZXxAFcUkHy0bxa4215IyuaEigEpqFw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=JYGA7jVoZvD+X2n8OM3/IdHsXsVoIsJzm98/UaSoAvA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aoc9jJO4
Subject: Re: [Buildroot] [PATCH v3 1/5] utils/generate-cyclonedx: update
 package filtering
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

>>>>> "Fabien" == Fabien Lehoussel via buildroot <buildroot@buildroot.org> writes:

 > Keep only "real" packages, i.e., those for which XX_SITE is set
 > v1: https://lists.buildroot.org/pipermail/buildroot/2025-June/781118.html
 > v2: https://lists.buildroot.org/pipermail/buildroot/2025-July/782803.html

 > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
 > ---
 >  utils/generate-cyclonedx | 37 +++++++++++++++++++------------------
 >  1 file changed, 19 insertions(+), 18 deletions(-)

 > @@ -259,10 +255,11 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
 >          list: A list of dependencies of the 'ref' package.
 >      """
 >      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
 > -        if dep not in deps:
 > -            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
 > +        # Only add "real" package dependency
 > +        if show_info_dict.get(dep, {}).get("real", True):

In what case would a dependency not be listed in show_info_dict and why
would we in that case consider it a "real" dependency?

If it is something filtered away then we should presumably not list it
in the dependencies?


 > +    # add flag for "real" packages E.G. packages not bundled inside Buildroot.
 > +    # non-real package examples:  skeletons, rootfs-xx, virtual-packages...
 > +    for k, v in show_info_dict.items():
 > +        if v.get("downloads") and len(v["downloads"]) > 0:
 > +            v["real"] = True
 > +        else:
 > +            v["real"] = False


NIT: You could simplify this as:

for v in show_info_dict.values():
   v["real"] = len(v.get("downloads", [])) > 0

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
