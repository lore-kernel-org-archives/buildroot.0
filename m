Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AE8C25B78
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 15:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5052941495;
	Mon, 27 May 2024 15:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTcrbCnJzgbX; Mon, 27 May 2024 15:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 970CE41492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 970CE41492;
	Mon, 27 May 2024 15:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80AEE1D1E62
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D74880E95
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 15:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90oYHWVwn-r3 for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 15:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D007680DAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D007680DAA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D007680DAA
 for <buildroot@buildroot.org>; Mon, 27 May 2024 15:44:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5891D24000B;
 Mon, 27 May 2024 15:44:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBcW8-005Xfh-2Q;
 Mon, 27 May 2024 17:44:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240506213038.418213-1-romain.naour@smile.fr>
Date: Mon, 27 May 2024 17:44:08 +0200
In-Reply-To: <20240506213038.418213-1-romain.naour@smile.fr> (Romain Naour's
 message of "Mon, 6 May 2024 23:30:38 +0200")
Message-ID: <87ikyz9s53.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-rpds-py: bump to version
 0.18.1
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > As reported by Antoine Coutant on the Buildroot mailing list [1]:
 > rpds depends on the crate pyo3. This crate uses

 >   "std::sync::atomic::AtomicI64"

 > which doesn't exist for 32 bits targets.
 > That leads to an error as reported by Buildroot Gitlab-ci.

 > An issue have been opened on pyo3's github [2].
 > A fix have been accepted by pyo3 [3] and merged in pyo3 0.20.3 release
 > [4]. This pyo3 0.20.3 uses crate portable-atomic [5] to provide atomic
 > types and compare and swap operations for all targets that can use std.

 > python-rpds-py 0.18.1 is the first release that use pyo3 0.20.3.

 > Before python-rpds-py 0.18.1 release fixing this issue would require
 > that we be able to patch a package during the Cargo vendoring step [6].

 > [1] http://lists.busybox.net/pipermail/buildroot/2024-February/684867.html
 > [2]: https://github.com/PyO3/pyo3/issues/3614
 > [3]: https://github.com/PyO3/pyo3/pull/3619
 > [4]: https://github.com/PyO3/pyo3/blob/v0.20.3/CHANGELOG.md
 > [5]: https://github.com/taiki-e/portable-atomic
 > [6]: http://lists.busybox.net/pipermail/buildroot/2024-February/684886.html

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811842 (TestPythonPy3Dtschema)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6783811860 (TestPythonPy3FlaskExpectsJson)

 > Reported-by: Antoine Coutant <antoine.coutant@smile.fr>
 > Cc: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
