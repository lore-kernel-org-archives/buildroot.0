Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BAECE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 22:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2D983437;
	Tue, 19 Sep 2023 22:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C2D983437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3c41Cku09N8G; Tue, 19 Sep 2023 22:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 403A683487;
	Tue, 19 Sep 2023 22:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 403A683487
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD431BF2C4
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 22:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F1E83487
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 22:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F1E83487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFDgmmkuaqJd for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 22:08:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3023383437
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 22:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3023383437
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f63:9bfc:8d71:54af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AFAA213F8BA;
 Wed, 20 Sep 2023 00:08:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 00:08:02 +0200
Date: Wed, 20 Sep 2023 00:08:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230919220802.GA512384@scaer>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
 <20230919204252.2272594-4-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919204252.2272594-4-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695161289;
 bh=yMdEBgCAQq1xtpVJzhoY5BG4VwMbSDl70DBIlxk6fzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQ6upPWvroGaUn+jmFO5q00ebiChz8gFIQdjsaoCdnWe5CsLz41dplSjb3TZoVO1P
 OwyYvvKJGvP5IuG9qNjrK4pSq1lfT6jDO0BHJQr0EqwQOQvQGSJ9WoK9F3zgz29EH6
 vaKx5l1EmsJrfJVVP2PypnrZEtFaG0IBhuKw71en/IRoMn0f3jEyOBNHaCRucX2DfG
 d2KxKaw3SeY6priJMM+p9PJThJgiKmig/fRTtauLDG7g5xdKJ/+MF0uUIZuClIuVl0
 X/fyF2jRC/pEB5c3bztc1aEgRh78vc93pT0wyiLHmhEpDnG3CWJG/+uJQHd33J+Uos
 GkeuRAIWBch/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tQ6upPWv
Subject: Re: [Buildroot] [PATCH v9 4/7] package/flutter-engine: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

This is really a good job you did on such a tough package!

We're entering the realm of the details, so it is a good sign that we're
close to a merge!

On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:
[--SNIP--]
> diff --git a/package/flutter-engine/dot-gclient b/package/flutter-engine/dot-gclient
> new file mode 100644
> index 0000000000..4e5787419b
> --- /dev/null
> +++ b/package/flutter-engine/dot-gclient
> @@ -0,0 +1,12 @@
> +# This file is taken from the output of meta-flutter/lib/gn.py

This comment is a bit misleading: it hints that this file is generated
(it is!) from some metadata. So my question was goign to be: why can't
we carry that metadata, the script, and generate the file ourselves?

But in fact, there is no interesting metadata needed to generate that
file; the only thing that is not hard-coded in the generating script
(besides the name, version and URI) is the set of download dependencies,
all set to False in the bitbake recipe.

So indeed it is not interesting to generate that file. And thus the
comment is indeed a bit misleading. I'll try to tweak it when
applying...

> +solutions = [{
> +    "managed": False,
> +    "name": "src/flutter",
> +    "url": "https://github.com/flutter/engine.git@!FLUTTER_VERSION!",
> +    "custom_vars": {
> +        "download_android_deps": False,
> +        "download_windows_deps": False,
> +        "download_linux_deps": False
> +    },
> +}]
> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> new file mode 100644
> index 0000000000..76c6610fcd
> --- /dev/null
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -0,0 +1,234 @@
> +################################################################################
> +#
> +# flutter-engine
> +#
> +################################################################################
[--SNIP--]
> +# Generate a tarball if one does not already exist.
> +define FLUTTER_ENGINE_GENERATE_TARBALL
> +	PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \

So here, two things:
  - you put $(HOST_DIR)/share/depot_tools in the PATH but .. -> [0]
  - you should probably set it in the front:
        PATH="$(HOST_DIR)/share/depot_tools:$(BR_PATH)"

> +	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
> +	$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
> +		--dot-gclient $(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
> +		--jobs $(PARALLEL_JOBS) \
> +		--scratch-dir $(@D)/dl-tmp \
> +		--tarball-dl-path $(FLUTTER_ENGINE_TARBALL_PATH) \
> +		--version $(FLUTTER_ENGINE_VERSION)
> +endef
> +FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS += FLUTTER_ENGINE_GENERATE_TARBALL
> +
> +define FLUTTER_ENGINE_EXTRACT_CMDS
> +	gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar --strip-components 1 -C $(@D) -xf -

We usually use suitable-extractor to decompress, and use $(TAR) and
$(TAR_OPTIONS) to extract:

    $(call suitable-extractor,$(not dir $(FLUTTER_ENGINE_TARBALL_PATH))) $(FLUTTER_ENGINE_TARBALL_PATH) \
    |$(TAR) --strip-components 1 -C $(@D) $(TAR_OPTIONS) -

[--SNIP--]
> diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
> new file mode 100755
> index 0000000000..e040beac75
> --- /dev/null
> +++ b/package/flutter-engine/gen-tarball
> @@ -0,0 +1,111 @@
[--SNIP--]
> +run_gclient() {
> +  local gclient="${HOST_DIR}"/share/depot_tools/gclient.py

[0] here you don't use PATH to locate gclient.py.

> +  if [[ ! -e "${gclient}" ]]; then
> +    message "${gclient} does not exist. Is host-depot-tools built and installed?"

That should not happen because host-depot-tools is a dependency of
flutter-engine.

> +    exit 1
> +  fi
> +  message "Downloading"
> +  "${gclient}" \

Assuming $(HOST_DIR)/share/depot_tools first int he PATH, can we just
run:

    gclient.py \
        sync \
        [...]

> +    sync \
> +    --delete_unversioned_trees \
> +    --no-history \
> +    --reset \
> +    --shallow \
> +    -j"${JOBS}"
> +}
> +
> +gen_tarball() {
> +  message "Generating tarball"
> +  mkdir -p "${DL_DIR}"
> +  # We would use the mk_tar_gz helper method from the support/download/helpers
> +  # script here. However, due to unknown reasons other than what I can
> +  # articulate as "Google," this is not possible. Even though creating a
> +  # tarball using the mk_tar_gz command results in a tarball that extracts and
> +  # builds flutter-engine without warnings or errors, the gen_snapshot host
> +  # utility, which turns dart applications into usable .so files for the
> +  # flutter engine, results in the error:
> +  # "Can't load kernel binary: Invalid SDK hash." As we are not interested in
> +  # creating a reproducible tarball, we need to use tar -C instead.

As discussed on IRC, I think the real reason was that mk_tar_gz only
archives non-directories, i.e. files, symlinks, etc... so empty
directories are missing, and the flutter-engine buildsystem requires
them.

So, based on your replies, I may be able to ammend the commit when
applying and save you a respin. So, be careful in your replies! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
