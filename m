Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ED2CF9C47
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 16:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A349847B0;
	Thu, 20 Nov 2025 16:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdvONGP2aY5j; Thu, 20 Nov 2025 16:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9F8B8458B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F8B8458B;
	Thu, 20 Nov 2025 16:42:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A250158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F099A606BD
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIfwi9IXxLTh for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 16:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9E4D60609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E4D60609
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9E4D60609
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:42:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 105396270; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 16:42:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vM7jw-00000003q49-3EPw;
 Thu, 20 Nov 2025 17:42:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sen Hastings <sen@hastings.org>
In-Reply-To: <20251119213420.7480-3-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Wed, 19 Nov 2025 22:34:18 +0100")
References: <20251119213420.7480-1-thomas.perale@mind.be>
 <20251119213420.7480-3-thomas.perale@mind.be>
Date: Thu, 20 Nov 2025 17:42:36 +0100
Message-ID: <874iqolkoz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=jR/QpQ1Rn5w07WUJaHfsnXVFtZMcu377y1sTYqWveS3rEmw+CPz66OK3SnIGE5Un2U0wDygmRGfKZq9JhGR5HN3DQpgI6bq6YJCOmjHH2lP27w8EWGPw0iYJ0sLqcjm3T6W0MWYV9E9UdOoJQphf1MnA3z4cg1no7MfhSUGPy1smNUMKoNK/NM4LxUpDWwOEcsT/emyriSeItVH0KXERXfeHOnIBcwmsIhQI4WAdrzRbK6lk/x3GvzPtOqnxQyg78kivBkVA9gSZBg4fDskJNmD+hlxub99lRZ0fKMBrg5QsIn99E3uW2haVtW5jzGnNUo/pJjpqdOrgLFzmbNM5nw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=bOW56yRs64xM9zsjqtzsR/XZN1aPALe9Q1BONSc3i+Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=jR/QpQ1R
Subject: Re: [Buildroot] [PATCH v2 2/4] support/scripts/cve-check: add
 cve-check script
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Enriches the input CycloneDX SBOM with vulnerability information and
 > analysis from the NVD database.

 > The NVD database is cloned using a mirror of it and the content is compared
 > locally. By default the path 'dl/buildroot-nvd' is used.

 > Example usage to analyse vulnerabilities of an input CycloneDX SBOM:

 > $ make show-info | utils/generate-cyclonedx | support/script/cve-check

 > The 'cve-check' can also be used to only enrich the vulnerabilities
 > present on the input SBOM with a set metadata (description, cvss,
 > references, ...) without applying an analysis.

 > With the following command the vulnerabilities ignored by Buildroot
 > present in the CycloneDX SBOM are enriched with description, cvss, etc
 > ...

 > $ make show-info | utils/generate-cyclonedx | support/script/cve-check --enrich-only

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

There were a few flake8 warnings about too lines. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
