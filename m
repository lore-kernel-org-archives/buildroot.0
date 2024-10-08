Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D7CEFC53
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A69216076D;
	Tue,  8 Oct 2024 20:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1l_rANh7YrVv; Tue,  8 Oct 2024 20:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B9C60663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B9C60663;
	Tue,  8 Oct 2024 20:07:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13CA21BF59E
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 032DC81142
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xcUb8aWOmK4 for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 859D180D1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 859D180D1D
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 859D180D1D
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:07:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cbc22e1c4so48700915e9.2
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728418047; x=1729022847;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m/e0iZ+8ktOsYtL3MGZ9SHDEuCB1JwMEX8LjPxzt7WY=;
 b=wHUkYJNxxnQQ1G5njW1hwqba/2LzWWVRBIyiXlM9ZkRxjb0RlmzAj+zVVQk1JMbimU
 QnX+RGNuCJCqtRo8RZwdAPZ4v5aZVPCQ57fuFBly7c4qN8h41kNJg1RMBuxahpl8adM+
 sS2Ig09orpdFSiPtp03JgKkLEaqmEVUKTkT2rG297JEkfzgL45fUnuXwRnn6wsiuHIO1
 TR8io8gKeyac21QAgCOQXWrJOmJCJIsTI22wbzf0vqNk2bAgfE4NskWDl4wSoIXDcPY0
 lZOOTkTq9ZB15i0n6oIgIzrMCtTtgJcUUDSV8rQsxjYZ9IlPNhDAo+bzbIthwuSiZv4r
 qEkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT6QflTstdTrL7VhucX3KH6jZd9N7OH7tigeFTdqZ8jRIqMM2iVpoz/xQaS0Vfd0+rdAAfNpmhEX8=@buildroot.org
X-Gm-Message-State: AOJu0Yz/H19XkFdAjBscHt8BNqP/QZ35ua64Mlw8iMa9qkIeIrL0GkDh
 x9Xrk+9MomnhQ5hAIlSqhWdv12cy8QRPgpsfbPcmDpAJwUuNdtealmiEa+K3FYhmCrWIuBu29yG
 D
X-Google-Smtp-Source: AGHT+IE599CinhmsjRz56bNm4ywdUSXxueF8agPbyWN24yeHeL/EGYVIZoZYC1tgGMHTQlKrDcSrMQ==
X-Received: by 2002:a5d:4d42:0:b0:374:cd96:f73 with SMTP id
 ffacd0b85a97d-37d3aa23daamr29662f8f.3.1728418046891; 
 Tue, 08 Oct 2024 13:07:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1690f24fsm8790576f8f.1.2024.10.08.13.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 13:07:26 -0700 (PDT)
Message-ID: <5bf017b5-bf61-4b59-bebb-f0a04ab763c1@mind.be>
Date: Tue, 8 Oct 2024 22:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240927203642.355640-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240927203642.355640-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728418047; x=1729022847; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m/e0iZ+8ktOsYtL3MGZ9SHDEuCB1JwMEX8LjPxzt7WY=;
 b=QjGX7qSj87/VBtP/cWJoh/A6ewmW6rVkPJo2BYZpd95GqGMMaeC6z/jT68WhU0DRxW
 iguCGejuHQ6SRCjBWmpqrkPwYizjt86WoCO8WtOTaXlhLTyxrav8ezEqNbYL57zw8sKA
 8WAAA34/XYMcOygZZ3d50PHbnArFLSocxAyHJtrFPpN8g1XHGMoeTJaZmJdRYYdAS44M
 y/oG3k0uc6yo2nol2NK/j2gStt9YEl6TodnwDuiy5kZnAlMf3lOw809Ene3lSEB5x2HR
 kKrT7rF7U1FqYZjmbua6t6TuWc5pJ0h+QGTD/4vH+NmlJuNXUmOalwHu4n+rijG4oL54
 z+TQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QjGX7qSj
Subject: Re: [Buildroot] [PATCH v4 1/1] utils/scanpypi: refactor setuptools
 handling to not use imp
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

  I have a bunch of questions and comments. However, this patch certainly 
doesn't make things worse, so applied to master, thanks.

On 27/09/2024 22:36, James Hilliard wrote:
> The imp module is deprecated as of python verison 3.12.
> 
> Refactor setuptools handling to remove monkeypatching hack and
> instead do pep517 metadata generation and dependency resolution.
> 
> This is effectively done by implementing the minimal neccesary
> pep517 frontend hooks needed for dependency resolution in scanpypi.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[snip]

> +class BackendUnavailable(Exception):

  Since this code is copied from pyproject-hooks, you need to comply to the 
terms of its license (MIT). That license says you have to include the license 
statement.

  So I've added a SPDX-License-Identifier tag here that specifies the MIT 
license, and I also added a reference to the github repo where it comes from. 
I've also added SPDX-License-Identifier: GPL-2.0-or-later AND MIT


[snip]
> @@ -339,32 +354,46 @@ class BuildrootPackage():
>               folder=tmp_pkg,
>               name=pkg_filename)
>   
> -    def load_setup(self):
> +    def load_metadata(self):
>           """
>           Loads the corresponding setup and store its metadata
>           """
>           current_dir = os.getcwd()
>           os.chdir(self.tmp_extract)
> -        sys.path.insert(0, self.tmp_extract)
>           try:
> -            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> -            imp.load_module('__main__', s_file, s_path, s_desc)
> -            if self.metadata_name in self.setup_args:
> -                pass
> -            elif self.metadata_name.replace('_', '-') in self.setup_args:
> -                self.metadata_name = self.metadata_name.replace('_', '-')
> -            elif self.metadata_name.replace('-', '_') in self.setup_args:
> -                self.metadata_name = self.metadata_name.replace('-', '_')
> +            mod_path, _, obj_path = self.build_backend.partition(":")
> +
> +            path_finder = None
> +            if self.backend_path:
> +                path_finder = BackendPathFinder(self.backend_path, mod_path)
> +                sys.meta_path.insert(0, path_finder)
> +
> +            try:
> +                build_backend = importlib.import_module(self.build_backend)
> +            except ImportError:
> +                msg = f"Cannot import {mod_path!r}"
> +                raise BackendUnavailable(msg, traceback.format_exc())
> +
> +            if obj_path:
> +                for path_part in obj_path.split("."):
> +                    build_backend = getattr(build_backend, path_part)
> +
> +            if path_finder:
> +                sys.meta_path.remove(path_finder)
> +
> +            prepare_metadata_for_build_wheel = getattr(
> +                build_backend, 'prepare_metadata_for_build_wheel'
> +            )
> +            metadata = prepare_metadata_for_build_wheel(self.tmp_extract)
>               try:
> -                self.setup_metadata = self.setup_args[self.metadata_name]
> -            except KeyError:
> -                # This means setup was not called
> -                print('ERROR: Could not determine package metadata for {pkg}.\n'
> -                      .format(pkg=self.real_name))
> -                raise
> +                dist = importlib.metadata.Distribution.at(metadata)
> +                self.metadata_name = dist.name
> +                if dist.requires:
> +                    self.setup_metadata['install_requires'] = dist.requires

  Since the only reason to add all this code is to (accurately) get the 
'requires', isn't it easier to call pyproject_hooks.get_requires_for_build_wheel 
[1] ? I have no idea if it gives the same results, but it would make our 
scanpypi a lot more maintainable if we can rely on something like that.

> +            finally:
> +                shutil.rmtree(metadata)
>           finally:
>               os.chdir(current_dir)
> -            sys.path.remove(self.tmp_extract)
>   
>       def load_pyproject(self):
>           """
> @@ -372,28 +401,29 @@ class BuildrootPackage():
>           """
>           current_dir = os.getcwd()
>           os.chdir(self.tmp_extract)
> -        sys.path.insert(0, self.tmp_extract)
>           try:
>               pyproject_data = toml_load('pyproject.toml')
> -            try:
> -                self.setup_metadata = pyproject_data.get('project', {})
> -                self.metadata_name = self.setup_metadata.get('name', self.real_name)
> -                build_system = pyproject_data.get('build-system', {})
> -                build_backend = build_system.get('build-backend', None)
> -                if build_backend and build_backend == 'flit_core.buildapi':
> +            self.setup_metadata = pyproject_data.get('project', {})
> +            self.metadata_name = self.setup_metadata.get('name', self.real_name)
> +            build_system = pyproject_data.get('build-system', {})
> +            build_backend = build_system.get('build-backend', None)
> +            self.backend_path = build_system.get('backend-path', None)
> +            if build_backend:
> +                self.build_backend = build_backend
> +                if build_backend == 'flit_core.buildapi':
>                       self.setup_metadata['method'] = 'flit'
> -                elif build_system.get('backend-path', None):
> -                    self.setup_metadata['method'] = 'pep517'
> +                elif build_backend == 'setuptools.build_meta':
> +                    self.setup_metadata['method'] = 'setuptools'
>                   else:
> -                    self.setup_metadata['method'] = 'unknown'
> -            except KeyError:
> -                print('ERROR: Could not determine package metadata for {pkg}.\n'
> -                      .format(pkg=self.real_name))
> -                raise
> +                    if self.backend_path:
> +                        self.setup_metadata['method'] = 'pep517'

  I've checked a bunch of pyproject.toml files and none of them have 
backend_path set. I think we can safely assume pep517 in all cases where we 
don't have a "better" setup type.

  It would also be nice to add checks for maturin and setuptools-rust.

  Oh, and one more thing: I tried a few packages, and they typically have 
something like this in their pyproject.toml:

build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

  That 'requires' should be converted in a dependency on host-python-hatchling.

[snip]


  Regards,
  Arnout

[1] 
https://pyproject-hooks.readthedocs.io/en/latest/pyproject_hooks.html#pyproject_hooks.BuildBackendHookCaller.get_requires_for_build_wheel


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
