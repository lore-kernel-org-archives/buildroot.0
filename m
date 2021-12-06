Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E4DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B972D41C13;
	Mon,  6 Dec 2021 21:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qv-NGyN20ofA; Mon,  6 Dec 2021 21:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AEAE41C31;
	Mon,  6 Dec 2021 21:21:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0390F1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFF5860D9D
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuTCMYhX1B7M for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:21:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD24360791
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:21:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t5so48455069edd.0
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 13:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=39Zr3WJtAmGkCkKOz0bfpK1MnR5ZKtN03/kNDGk3X1Q=;
 b=QqwYWNDfFnbNz4k1EGQoOLjK5DFRXzappR0MbHYzyNP85KEp1ZKwnRAN/7ZTdbtlKw
 546+6qkl5n/dJREUkyNq3NMhTMeoPY0v+71XjaG9Bx3VD9rZhyv5I1vw1vh4cMFD7UnL
 Pf3fMRcBxcwOcmXCHSPfF6kZNoNdWv7iZ5QOIU5b8MFecKJH8qC3hUTaXB+PpTf2b/jn
 eT0mgD/BubGfCw5JZpuRwcIxvRo5r4JxYPRw2WTf/OQ8MYfV1oOTr2Lli0xixmTYbkGa
 OAk/hsev0EMJOtaKIp3MES3Fj4xNZ7gWofb0iO6Co9uwYPhwEx3Izys6AnKKcciEoN4A
 PPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=39Zr3WJtAmGkCkKOz0bfpK1MnR5ZKtN03/kNDGk3X1Q=;
 b=sYRhZ0a6wqE3dU4N9dEAyndc5YFi6aVb5hOMj0hHIYMALN4h/zUiv6CVB34JEYPOSJ
 Wj2YK0QbD2oJx1W/pCy3yAUct43FU+EcPP6OQH47y+5Wwmzhv4eUrpFjZ6+sjB0Wa2Za
 bDjBi04Machp8AJjWPRPz8E5+RHT1+ztGmeC+rzigecRT6DgMVAM2cUSYuXb9i6whBpu
 jxYrqkiA7tfbRrRk4yfrihX4TOQlI/39Vd/hriNLtwRgzdoHSSeLc+hWmbLa9fOoRR+C
 mWOzcxYf0d4Dd+ReirnBHGJVTxexOJu1vV8M4pqtcdxxZEcGNApSwztuXxMQ9fmdntq2
 BfIA==
X-Gm-Message-State: AOAM531t+jgbiWX83O2yNN+XuFxboBHfZ+zufMPZITkfdQi8FqcMz6yF
 mjfTzPUjukBEYUKWRQX/qWiM2A==
X-Google-Smtp-Source: ABdhPJxmZOBwCwD2ZMPHhz2sTA1lj8KPV7Yn+1ZelTuLI3/0zCGvjQtwH+oXilUPdy3avSKPIi+Y1A==
X-Received: by 2002:a05:6402:34d1:: with SMTP id
 w17mr2382216edc.229.1638825662904; 
 Mon, 06 Dec 2021 13:21:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r11sm9034193edd.70.2021.12.06.13.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:21:02 -0800 (PST)
Message-ID: <8449fb74-084e-9ac2-1223-a63a55435a11@mind.be>
Date: Mon, 6 Dec 2021 22:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20211128151703.260928-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211128151703.260928-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add github download
 helper testing
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/11/2021 16:17, Romain Naour wrote:
> Back in 2013, a github download helper has been introduced to cope with
> changes in github download-URL's [1][2].
> 
> Since then a testing infrastructure has been introduced in Buildroot
> but no tests has been added to check if the github download helper is
> still working.
> 
> It was reported recently [3] that the github helper doesn't work anymore
> using tags. Buildroot is not the only project having the issue, see
> Github feedback discussions [4].
> 
> Add tests for direct archive download (archives uploaded by maintainers),
> download from a git tag and git hash using the github helper.
> Make sure that Buildroot doesn't use BR2_BACKUP_SITE
> (http://sources.buildroot.net).
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=6302
> [2] c7c7d0697c00e45bcfad15b027f5c66005f4c005
> [3] https://bugs.busybox.net/show_bug.cgi?id=14396
> [4] https://github.com/github/feedback/discussions/8149
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

  Series applied to master, thanks.

> ---
> Currently the github-helper-tag test is failing due to [1].
> ---
>   .../download/br2-external/github/Config.in    |  0
>   .../br2-external/github/external.desc         |  1 +
>   .../download/br2-external/github/external.mk  |  1 +
>   .../github-helper-hash.hash                   |  3 ++
>   .../github-helper-hash/github-helper-hash.mk  | 11 +++++
>   .../github-helper-tag/github-helper-tag.hash  |  3 ++
>   .../github-helper-tag/github-helper-tag.mk    | 11 +++++
>   .../github-release/github-release.hash        |  3 ++
>   .../package/github-release/github-release.mk  | 12 ++++++
>   .../testing/tests/download/test_gitforge.py   | 41 +++++++++++++++++++
>   10 files changed, 86 insertions(+)
>   create mode 100644 support/testing/tests/download/br2-external/github/Config.in
>   create mode 100644 support/testing/tests/download/br2-external/github/external.desc
>   create mode 100644 support/testing/tests/download/br2-external/github/external.mk
>   create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
>   create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
>   create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
>   create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
>   create mode 100644 support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
>   create mode 100644 support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
>   create mode 100644 support/testing/tests/download/test_gitforge.py
> 
> diff --git a/support/testing/tests/download/br2-external/github/Config.in b/support/testing/tests/download/br2-external/github/Config.in
> new file mode 100644
> index 0000000000..e69de29bb2

  Personally, I would have added Config.in options here, but since they're not 
actually used in the test, I guess they're redundant.

> diff --git a/support/testing/tests/download/br2-external/github/external.desc b/support/testing/tests/download/br2-external/github/external.desc
> new file mode 100644
> index 0000000000..b8beea8839
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/external.desc
> @@ -0,0 +1 @@
> +name: GITHUB
> diff --git a/support/testing/tests/download/br2-external/github/external.mk b/support/testing/tests/download/br2-external/github/external.mk
> new file mode 100644
> index 0000000000..e4e5524ceb
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/external.mk
> @@ -0,0 +1 @@
> +include $(sort $(wildcard $(BR2_EXTERNAL_GITHUB_PATH)/package/*/*.mk))
> diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
> new file mode 100644
> index 0000000000..a941060b31
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  4064739881453831bceeae81af8947cbd6c1fe03e052ac17b82ae5b3360d83f8  github-helper-hash-e2fba6457bd9d9c720540332eaf0c1f8c29eab00.tar.gz
> +sha256  9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
> diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
> new file mode 100644
> index 0000000000..e1fa5aabc2
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
> @@ -0,0 +1,11 @@
> +################################################################################
> +#
> +# github-helper-hash
> +#
> +################################################################################
> +
> +GITHUB_HELPER_HASH_VERSION = e2fba6457bd9d9c720540332eaf0c1f8c29eab00
> +GITHUB_HELPER_HASH_SITE = $(call github,buildroot,buildroot,$(GITHUB_HELPER_HASH_VERSION))

  Might be a good idea to use something with a smaller tarball, but OTOH it's 
nice that it's something we control.

  We could actually create a repo just for this.

  Regards,
  Arnout

> +GITHUB_HELPER_HASH_LICENSE_FILES = COPYING
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
> new file mode 100644
> index 0000000000..466d2ac401
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  959a953bbd91e6ed6db8d63a45a986400878b6bb486455231b2976218301c3d2  github-helper-tag-2021.02.tar.gz
> +sha256  9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
> diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
> new file mode 100644
> index 0000000000..b1ff66d817
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
> @@ -0,0 +1,11 @@
> +################################################################################
> +#
> +# github-helper-tag
> +#
> +################################################################################
> +
> +GITHUB_HELPER_TAG_VERSION = 2021.02
> +GITHUB_HELPER_TAG_SITE = $(call github,buildroot,buildroot,$(GITHUB_HELPER_TAG_VERSION))
> +GITHUB_HELPER_TAG_LICENSE_FILES = COPYING
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash b/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
> new file mode 100644
> index 0000000000..78a25dd271
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  f4cb17b21928e36ec27de5c5294dea6ec1de4acd7ee6c56d6ecc75319cbcaefa  systemd-bootchart-233.tar.xz
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> diff --git a/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk b/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
> new file mode 100644
> index 0000000000..34409e1cad
> --- /dev/null
> +++ b/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# github-release
> +#
> +################################################################################
> +
> +GITHUB_RELEASE_VERSION = 233
> +GITHUB_RELEASE_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(GITHUB_RELEASE_VERSION)
> +GITHUB_RELEASE_SOURCE = systemd-bootchart-$(GITHUB_RELEASE_VERSION).tar.xz
> +GITHUB_RELEASE_LICENSE_FILES = LICENSE.LGPL2.1
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
> new file mode 100644
> index 0000000000..c2d98d0853
> --- /dev/null
> +++ b/support/testing/tests/download/test_gitforge.py
> @@ -0,0 +1,41 @@
> +import os
> +import shutil
> +
> +import infra
> +
> +
> +class GitforgeTestBase(infra.basetest.BRConfigTest):
> +    config = \
> +        """
> +        BR2_BACKUP_SITE=""
> +        """
> +
> +    def setUp(self):
> +        super(GitforgeTestBase, self).setUp()
> +
> +    def tearDown(self):
> +        self.show_msg("Cleaning up")
> +        if self.b and not self.keepbuilds:
> +            self.b.delete()
> +
> +    def check_download(self, package):
> +        # store downloaded tarball inside the output dir so the test infra
> +        # cleans it up at the end
> +        dl_dir = os.path.join(self.builddir, "dl")
> +        # enforce we test the download
> +        if os.path.exists(dl_dir):
> +            shutil.rmtree(dl_dir)
> +        env = {"BR2_DL_DIR": dl_dir}
> +        self.b.build(["{}-dirclean".format(package),
> +                      "{}-legal-info".format(package)],
> +                     env)
> +
> +
> +class TestGitHub(GitforgeTestBase):
> +    br2_external = [infra.filepath("tests/download/br2-external/github")]
> +
> +    def test_run(self):
> +        self.check_download("github-helper-tag")
> +        self.check_download("github-helper-hash")
> +        self.check_download("github-release")
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
