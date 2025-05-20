Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B5C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 14:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED71A60738;
	Tue, 20 May 2025 14:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IU_WGppm2e8y; Tue, 20 May 2025 14:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0834B61030
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0834B61030;
	Tue, 20 May 2025 14:39:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 774E5DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 14:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D75F40118
 for <buildroot@buildroot.org>; Tue, 20 May 2025 14:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XN9lpt6bKRj for <buildroot@buildroot.org>;
 Tue, 20 May 2025 14:39:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4724C403BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4724C403BB
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4724C403BB
 for <buildroot@buildroot.org>; Tue, 20 May 2025 14:39:51 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id E56D4E0022C; Tue, 20 May 2025 16:39:47 +0200 (CEST)
Date: Tue, 20 May 2025 16:39:47 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Lionel Flandrin <lionel@svkt.org>, arnout@mind.be
Message-ID: <20250520143947.h3j5i3nblgu4ielq@n621.de>
References: <20250514150446.968758-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514150446.968758-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1747751987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0/j3GD6f+ZoSyD/9JbdtjILzkLIkc35B7KFfdGnjhGw=;
 b=YJQZI2QMighSwnxQ5Y8uf68/lss5pbomcKP4ykRvM/ERJkFKcFHoabj4j3HHdvTTEVbf4a
 bRyuXCJDCpsjqGvugj7Yaxh9guQZvADtBzFpVGHubmthRjCjyIxwHWCD2naaGLq7fWV5mP
 x3HM9Zipot/eB9PBFvzjTqa2NH6ahLU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=YJQZI2QM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: security bump to
 version 3.1.1
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

Hi Thomas,

alas, this release changed more than just fixing that security issue. In
particular, the changes in [1] are breaking the build of 2025.02.x for
me:

  * Getting build dependencies for wheel...
  Unexpected names under [project]: license-files
  Traceback (most recent call last):
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
      main()
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
      json_out["return_val"] = hook(**hook_input["kwargs"])
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
      return hook(config_settings)
             ^^^^^^^^^^^^^^^^^^^^^
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/flit_core/buildapi.py", line 23, in get_requires_for_build_wheel
      info = read_flit_config(pyproj_toml)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/flit_core/config.py", line 81, in read_flit_config
      return prep_toml_config(d, path)
             ^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/flit_core/config.py", line 108, in prep_toml_config
      loaded_cfg = read_pep621_metadata(d['project'], path)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/flit_core/config.py", line 529, in read_pep621_metadata
      _check_type(proj, 'license', dict)
    File "/home/flarysch/br-test-pkg/bootlin-armv5-uclibc/host/lib/python3.12/site-packages/flit_core/config.py", line 444, in _check_type
      raise ConfigError(
  flit_core.config.ConfigError: license field should be <class 'dict'>, not <class 'str'>
  
  ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
  make: *** [package/pkg-generic.mk:273: /home/flarysch/br-test-pkg/bootlin-armv5-uclibc/build/python-flask-3.1.1/.stamp_built] Error 1

This can be reproduced with test-pkg using

  BR2_PACKAGE_PYTHON3=y
  BR2_PACKAGE_PYTHON_FLASK=y

As I understand it, this is happening because flask moved its
pyproject.toml to PEP 639 license expressions but flit only introduced
support for those in [2], which is part of 3.11.0, which wasn't included
in 2025.02.2/.3, while the flask bump was.

The flit 3.10.1..3.11.0 diff doesn't look to bad, so maybe 2025.02.x
could pick up the flip bump too? Alternatively, we could revert the
flask bump and just import the security patch (just [3], if I'm not
mistaken).

Florian

[1] https://github.com/pallets/flask/commit/0109e496f6ca68de29480fe6413e81b1d3f86aa9
[2] https://github.com/pypa/flit/commit/640b6ad973e406b352649d36eb35dc208ecbb0ca
[3] https://github.com/pallets/flask/commit/fb54159861708558b5f5658ebdc14709d984361c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
