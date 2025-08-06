Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9775DC87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 14:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516C561B20;
	Wed,  6 Aug 2025 14:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeXCThyojbuh; Wed,  6 Aug 2025 14:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829216072F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 829216072F;
	Wed,  6 Aug 2025 14:06:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA51D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 032976072F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQ0gf7LpjV2w for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 14:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1957F612F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1957F612F2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1957F612F2
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:06:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1758750493; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 14:06:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujemu-00Gn9y-0Q;
 Wed, 06 Aug 2025 16:06:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>, arnout@rnout.be
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>,  Thomas Perale
 <thomas.perale@mind.be>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-5-fabien.lehoussel@smile.fr>
Date: Wed, 06 Aug 2025 16:06:40 +0200
In-Reply-To: <20250716093401.1213358-5-fabien.lehoussel@smile.fr> (Fabien
 Lehoussel via buildroot's message of "Wed, 16 Jul 2025 11:33:48
 +0200")
Message-ID: <87ldnwilxr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aEH0GBy/yfQLOgybxSKl7L2UnZsiuRkMCQNN5mwvd1nLjF8lpg0CnBKL3ilngIim3ZT6B1fKUvwhWonPq3BKfo4eDYNLNhCQTCl+i7ZprHxZ57KtGk6K4tRnXqn7CeksPAq5CJBmT6RNUSr5WRpayFKyff04WlnUorWicdbbLNEl5aIuKyIxTXkad7MNXHJ6JWJrOdOeTRb81PLr2BYLMx5KLBzbbnS7YX1B/CYsf7db/yG+B6yH18A4llH3Jn4wNPxKOIRvwkcQQO4/cyH6yakvv4EUr9EF7LXRN+304I4ABQLdwMbHogKFbbhjFUfvOhbUBbR2heaIgdLNib7cAA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=56liKCVIGt+WlyPVjejn502gIJjPe9mQgHIy1SFfhCI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aEH0GBy/
Subject: Re: [Buildroot] [PATCH v2 5/5] utils/generate-cyclonedx: add source
 field to CVE entries
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

 > Mandatory for DependencyTrack compatibility
 > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Arnout mentioned in
https://lore.kernel.org/buildroot/d85a9587-a1f0-4bdd-876d-939160102746@rnout.be/
that it is marked as optional in the cyclonedx spec. Can you clarify
what is the difference in behaviour in DependencyTrack if this is
included?

> ---
 >  utils/generate-cyclonedx | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
 > index d28750735f..5effa0282c 100755
 > --- a/utils/generate-cyclonedx
 > +++ b/utils/generate-cyclonedx
 > @@ -228,6 +228,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
 
 >      return [{
 >          "id": cve,
 > +        "source": {
 > +            "name": "NVD",
 > +            "url": "https://nvd.nist.gov/vuln/detail/" + cve
 > +        },
 >          "analysis": {
 >              "state": "in_triage",
 >              "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
