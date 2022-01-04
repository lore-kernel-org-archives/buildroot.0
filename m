Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829B4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28E3040575;
	Tue,  4 Jan 2022 16:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pg0ERTJBXatA; Tue,  4 Jan 2022 16:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A93B40447;
	Tue,  4 Jan 2022 16:51:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B70251BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5978823E8
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7b6ioEGjx0k for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:51:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 716C9823CF
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:51:05 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id j21so150735752edt.9
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+Gf4Y3dPRsJll4/CPQy9NxuMFEZUFXBn0V+IuLBBfyY=;
 b=cR+5ETUyNktDma/cA3BRhuryrUKvPH6UAttYLhzNaHqEQdlM9EWAWFbqmBXxHfDsW2
 cXd/6Q/ltuhWqi9tVtPdMMBulJj8eZSW9WOFhYP8pvDE4qIwmrwK7Qf3p9rF4Xv5fQVW
 AgUf2qU6HPviShmE7bgVVXcbmkctAI2jzsv8UfmTl/gTxiW7kulsDj5O+4SXmL2mbkIT
 e/s1lnOV0S0jMXuDPxMvBzM420l8J8mhxd+x0GXKgFSP7/Aey85QrfzD8qrrRuvKmU4g
 oO6ODFBUwodBlgrkgPYlA02y/5N4NBqF09Zk7FNTshg7yjltObRBJbw7VaXmysUu4RKA
 a6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+Gf4Y3dPRsJll4/CPQy9NxuMFEZUFXBn0V+IuLBBfyY=;
 b=5JnCUPFH0zh6MpbGasadBU9GqxMQ926aIRRkAODPulowdMtwJ8ZGCJ57JsyB7X9RZL
 e7Ia5vhMCZKxtxrHyLlIuqCsrXLnr2hzTYjEcOTLpQ3K8W3DqFQpexWzhzlU22Zwvk3b
 dMxo0Wn25X0tYyyLpXCUk3b8Nt6U9VLm7yL3iHLgJ05oQpEvAylDiMp2DTpjnqzw2pBB
 rKospM4CrDW2aPWwfGQXYEe+/888jgGH9w5daDqCsH4tcBlzPJyY8M1NPv+ZePGoXMQm
 71MOvCnW2Km+EvYN5NGck1eS9e8x3/ytjDzn9Ii+ABZnVG3aYZtn7DhjYDNvTnai10xV
 N0/w==
X-Gm-Message-State: AOAM531Jocjs7e9BJNzu7scorkapUd2HCHFSsWm6S/JtNeE+a7/xV+wH
 t8XYTSIW/PNxGGCUSx77O3wcAw==
X-Google-Smtp-Source: ABdhPJx5hB+6p0JyRbbS5GjDSHXcSgdXm6ImwiADtE2yBYebyTSJwGWfFTEbiEde9FdOcZdA7OdQ8w==
X-Received: by 2002:a17:907:7282:: with SMTP id
 dt2mr39281151ejc.653.1641315063562; 
 Tue, 04 Jan 2022 08:51:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h13sm9282501edt.61.2022.01.04.08.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 08:51:03 -0800 (PST)
Message-ID: <9b639725-a9f6-6887-f43d-2dd080586df0@mind.be>
Date: Tue, 4 Jan 2022 17:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101145632.1393642-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101145632.1393642-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/fail2ban: fix build with python
 3.10
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 15:56, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of python3 to version
> 3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
> 
> error in fail2ban setup command: use_2to3 is invalid.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6a5e91f9912f869b2b07b10b576457b432066393
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...with-error-in-fail2ban-setup-command.patch | 67 +++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
> 
> diff --git a/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch b/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
> new file mode 100644
> index 0000000000..8cb097dc38
> --- /dev/null
> +++ b/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
> @@ -0,0 +1,67 @@
> +From 5ac303df8a171f748330d4c645ccbf1c2c7f3497 Mon Sep 17 00:00:00 2001
> +From: sebres <info@sebres.de>
> +Date: Sun, 19 Sep 2021 18:49:18 +0200
> +Subject: [PATCH] fix gh-3098: build fails with error in fail2ban setup
> + command: use_2to3 is invalid (setuptools 58+)
> +
> +[Retrieved from:
> +https://github.com/fail2ban/fail2ban/commit/5ac303df8a171f748330d4c645ccbf1c2c7f3497]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + setup.py | 16 +---------------
> + 1 file changed, 1 insertion(+), 15 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index f4c2550f6..98413273c 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -48,7 +48,7 @@
> + from glob import glob
> +
> + from fail2ban.setup import updatePyExec
> +-
> ++from fail2ban.version import version
> +
> + source_dir = os.path.realpath(os.path.dirname(
> + 	# __file__ seems to be overwritten sometimes on some python versions (e.g. bug of 2.6 by running under cProfile, etc.):
> +@@ -112,22 +112,12 @@ def update_scripts(self, dry_run=False):
> + # Wrapper to specify fail2ban own options:
> + class install_command_f2b(install):
> + 	user_options = install.user_options + [
> +-		('disable-2to3', None, 'Specify to deactivate 2to3, e.g. if the install runs from fail2ban test-cases.'),
> + 		('without-tests', None, 'without tests files installation'),
> + 	]
> + 	def initialize_options(self):
> +-		self.disable_2to3 = None
> + 		self.without_tests = not with_tests
> + 		install.initialize_options(self)
> + 	def finalize_options(self):
> +-		global _2to3
> +-		## in the test cases 2to3 should be already done (fail2ban-2to3):
> +-		if self.disable_2to3:
> +-			_2to3 = False
> +-		if _2to3:
> +-			cmdclass = self.distribution.cmdclass
> +-			cmdclass['build_py'] = build_py_2to3
> +-			cmdclass['build_scripts'] = build_scripts_2to3
> + 		if self.without_tests:
> + 			self.distribution.scripts.remove('bin/fail2ban-testcases')
> +
> +@@ -178,7 +168,6 @@ def run(self):
> + if setuptools:
> + 	setup_extra = {
> + 		'test_suite': "fail2ban.tests.utils.gatherTests",
> +-		'use_2to3': True,
> + 	}
> + else:
> + 	setup_extra = {}
> +@@ -202,9 +191,6 @@ def run(self):
> + 		('/usr/share/doc/fail2ban', doc_files)
> + 	)
> +
> +-# Get version number, avoiding importing fail2ban.
> +-# This is due to tests not functioning for python3 as 2to3 takes place later
> +-exec(open(join("fail2ban", "version.py")).read())
> +
> + setup(
> + 	name = "fail2ban",
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
