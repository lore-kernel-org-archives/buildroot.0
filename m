Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67EAC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 14:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537BB6085A;
	Thu,  7 Aug 2025 14:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A78vyQbv3Eg0; Thu,  7 Aug 2025 14:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D260607EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D260607EC;
	Thu,  7 Aug 2025 14:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01FED233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D466684DDD
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3v5mbJHgHlqj for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 14:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB82084DB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB82084DB1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB82084DB1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:00:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1937853551; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 07 Aug 2025 14:00:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uk1Aj-002q3m-3B;
 Thu, 07 Aug 2025 16:00:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>,  Thomas Perale
 <thomas.perale@mind.be>
References: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
 <20250807062327.1637333-2-fabien.lehoussel@smile.fr>
Date: Thu, 07 Aug 2025 16:00:45 +0200
In-Reply-To: <20250807062327.1637333-2-fabien.lehoussel@smile.fr> (Fabien
 Lehoussel via buildroot's message of "Thu, 7 Aug 2025 08:23:24 +0200")
Message-ID: <87ms8bgrjm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mztVvTufz2xRI5RKpjs83vDfZBxSihO1WCS+nj4RDho+XvCIKKZsNpGvzgURdoHG+EUKK2DHowJcmu0BQbnzbhYx7H+xQMa4PWdkT0cGet6sOl11hI79QdaUOCg0yIo1087SJKDnlaLwnjNkuJieIkt0evD9wdfQjxN2ySJBNpPD8nmpQDHh4j24Dna4sWGNCA5oVqIq9M4ghROI0KDp48H/MJw5zD1Ru83csE6T/IRyjbnJy66pIAH9JnZCMhlyGkOVYFaVIYgrr063u7Uym5RErUrbkkhYPbtFBMqNKAo81qJJwKmGdUV/Cs0974qjWkmqqtYdEV1WFJ+2dvSJrw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZSQUos8PgdWBQgfmSIXOIXDtS2E/GAeZd7/DG9gwp+c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mztVvTuf
Subject: Re: [Buildroot] [PATCH 2/5] utils/generate-cyclonedx: sort
 dependencies
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

 > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
 > ---
 >  utils/generate-cyclonedx | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
 > index 3ff318f11a..7fa369d7c7 100755
 > --- a/utils/generate-cyclonedx
 > +++ b/utils/generate-cyclonedx
 > @@ -203,7 +203,7 @@ def cyclonedx_dependency(ref, depends):
 >      """
 >      return {
 >          "ref": ref,
 > -        "dependsOn": depends,
 > +        "dependsOn": sorted(depends),

Committed after extending the commit description with a description of
why we do this:

The SBOM is easier to read if the dependencies are sorted
alphabetically.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
