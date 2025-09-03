Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127F4CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197F8422F4;
	Wed,  3 Sep 2025 16:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlDvPdf-ktTj; Wed,  3 Sep 2025 16:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25500422F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25500422F9;
	Wed,  3 Sep 2025 16:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 546E710E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A85C422AD
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfIrTkxqlwfI for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD8A041F94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8A041F94
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD8A041F94
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:16:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1190119448; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:16:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utq9g-00100u-2D;
 Wed, 03 Sep 2025 18:16:16 +0200
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  James Hilliard
 <james.hilliard1@gmail.com>
References: <20250903132521.13551-1-titouan.christophe@mind.be>
Date: Wed, 03 Sep 2025 18:16:16 +0200
In-Reply-To: <20250903132521.13551-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Wed, 3 Sep 2025 15:25:21
 +0200")
Message-ID: <87plc7mrzj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Vc42Na4uxyvFc7hrsFTMA4KKCcDyvDNxga7voVQe8I8dCAhtmieL9wpHnLiV4dMp5aznyFiuF9oJvOTIoqvgPYO95z8/PVW98qnqboML6rtEyV0p6xUhmyn7zKsK8/omrJ9xssq10Zt9EWLnNYBLzmDyvOFIlFnxsmCfPcY9+aLLIdnGRDUoJCtn7Vt9b/JfJIcdNZVawPdoxOikNk4p8Bz8DH5rv7e2xq7lJRalQf/rHRZFpUTJ5Mu6uIpeJ/WW35W6KgJXrVrT5uA8Wdr7RTJoW3840zNSpnoRCc5diz5426gG3UNcQYI8zpCA3XdtH+oPKHEB984HrjqMltaaZA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=D5AI8+4f+dbSW48AOx2li+uB+76Vmq6nTeFKFHdXh8I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Vc42Na4u
Subject: Re: [Buildroot] [PATCH] package/python-flask-cors: security bump to
 v6.0.1
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
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > This is a major version bump, because it could break user code that depends
 > on the (wrong) previous logic fixed by the new release

 > See the release notes:
 > - https://github.com/corydolphin/flask-cors/releases/tag/6.0.0
 > - https://github.com/corydolphin/flask-cors/releases/tag/6.0.1

 > This fixes the following vulnerabilties:
 > - CVE-2024-6839:
 >     corydolphin/flask-cors version 4.0.1 contains an improper regex path
 >     matching vulnerability. The plugin prioritizes longer regex patterns
 >     over more specific ones when matching paths, which can lead to less
 >     restrictive CORS policies being applied to sensitive endpoints. This
 >     mismatch in regex pattern priority allows unauthorized cross-origin
 >     access to sensitive data or functionality, potentially exposing
 >     confidential information and increasing the risk of unauthorized
 >     actions by malicious actors.
 >     https://www.cve.org/CVERecord?id=CVE-2024-6839

 > - CVE-2024-6844:
 >     A vulnerability in corydolphin/flask-cors version 4.0.1 allows for
 >     inconsistent CORS matching due to the handling of the '+' character in
 >     URL paths. The request.path is passed through the unquote_plus
 >     function, which converts the '+' character to a space ' '. This
 >     behavior leads to incorrect path normalization, causing potential
 >     mismatches in CORS configuration. As a result, endpoints may not be
 >     matched correctly to their CORS settings, leading to unexpected CORS
 >     policy application. This can cause unauthorized cross-origin access or
 >     block valid requests, creating security vulnerabilities and usability
 >     issues.
 >     https://www.cve.org/CVERecord?id=CVE-2024-6844

 > - CVE-2024-6866:
 >     corydolphin/flask-cors version 4.01 contains a vulnerability where the
 >     request path matching is case-insensitive due to the use of the
 >     `try_match` function, which is originally intended for matching hosts.
 >     This results in a mismatch because paths in URLs are case-sensitive,
 >     but the regex matching treats them as case-insensitive. This
 >     misconfiguration can lead to significant security vulnerabilities,
 >     allowing unauthorized origins to access paths meant to be restricted,
 >     resulting in data exposure and potential data leaks.
 >     https://www.cve.org/CVERecord?id=CVE-2024-6866

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
