Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754B0C44508
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383D980C75;
	Wed, 21 Jan 2026 20:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFy_H7geGXQX; Wed, 21 Jan 2026 20:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E88812FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028293;
	bh=kbw7nbU9hZoZsZyJmqLtMYQNDv4SZ3MKVFS16bdMrNg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iQR3SuoehrJAWQfygTGzHhAIQ3b/Ujqr0KwNGOpb8rH11yabZtRf9hvqaBimrR48g
	 bHizkWDJTlnxj9ICJSZ+KftKEDeuJxiCdPE346Obsc5kQ4ner7akkAhWc87jSbTeL7
	 HBGfYf7bzrqFUk5PaBhCVO7dBvKCDGz/P0rOBtO3m6moEbq65mGXxf8ApzHWXmsgPf
	 jTOD19uHZkf1sDpOtUSuKtu8XPdP+dtmrOC2x/Z9UFnckMGbfIbgQXRBFsz0BDEyqX
	 5hcJX/5/Rkl3E9p/fbCFApxuq1h+tZXZaWRRh/csYPtK7ZGUJwVpSUK/JDI7HYe1Nl
	 w5FqQrWeic7sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E88812FB;
	Wed, 21 Jan 2026 20:44:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9C11122
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A5640C6A
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYCWYZ0SGngI for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7EB740C6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7EB740C6E
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A80F4874AF; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 21:05:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62648d98926cc96c680ce4698bb631188b2f72d9
X-Git-Newrev: 56db14b886f4a673e6a94136238b9d648c883e54
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.A80F4874AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: bump version to
 1.16.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=56db14b886f4a673e6a94136238b9d648c883e54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depends on python-numpy >= 2.0.0:
https://github.com/scipy/scipy/blob/v1.16.3/pyproject.toml#L41
https://github.com/scipy/scipy/commit/a3e2bb639b156b01964cda1edca971521c6f39ff

Updated license hash due to copyright year bumps:
https://github.com/scipy/scipy/commits/v1.16.3/LICENSE.txt

qhull license file was moved upstream:
https://github.com/scipy/scipy/commit/6d699dded4423e4ff9ac97eff9f4912ed24964fa
https://github.com/scipy/scipy/commit/96423e5279a4cdf698eedea6f0795ab57cf5a860

Updated numpy path in PYTHON_SCIPY_MESON_EXTRA_PROPERTIES following
upstream commit:
https://github.com/numpy/numpy/commit/923f219077c8aa3ad7d3792d8c06cba010b70252

Test was successful:

$ utils/docker-run support/testing/run-tests -j33    -k -d dl -o output_folder tests.package.test_python_scipy.TestPythonPy3SciPy
09:59:22 TestPythonPy3SciPy                       Starting
09:59:23 TestPythonPy3SciPy                       Building
10:10:09 TestPythonPy3SciPy                       Building done
Downloading to /home/bernd/buildroot/dl/tmpw1frnmf9
Renaming from /home/bernd/buildroot/dl/tmpw1frnmf9 to /home/bernd/buildroot/dl/kernel-versatile-5.10.202
Downloading to /home/bernd/buildroot/dl/tmpiip1lach
Renaming from /home/bernd/buildroot/dl/tmpiip1lach to /home/bernd/buildroot/dl/versatile-pb-5.10.202.dtb
10:10:24 TestPythonPy3SciPy                       Cleaning up
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
