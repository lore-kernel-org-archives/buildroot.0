Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2407BC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C7460071;
	Tue,  6 Feb 2024 16:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C7460071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAw0CYf74ARf; Tue,  6 Feb 2024 16:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA1260586;
	Tue,  6 Feb 2024 16:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA1260586
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA8861BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82E5E42037
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E5E42037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4s9nqZpbwJEe for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:57:14 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 040AB42010
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 040AB42010
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40ff802496cso2762175e9.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 08:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707238632; x=1707843432;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kzV7xnVWi+fNDYU2uR8EJYVic0HVo6l65jL9jv9P8fg=;
 b=Ou817DdgJ4FENSZesFg3/lWqkfjonSwtWKhaL1WgLWkBYw7ANYldaNtSWlg0SOzNwC
 f7xlsrynMdTcJiUyae0rdLn1WQDXBa0mR3c8Xmi6d80HNvWbUFTr+rFaePGLq1R8hKcZ
 piPiwdNDwtCf1EfdfsDv8cDqT4LyI3n6lX5yqQM45OQB/CPk4ygAhVx7D1zhcoLqMCoz
 xQfLpigDdLhUXTcpUahx++ewlIGecNMD5xNsDo4dSYZ1rjouW5kKzMeDMW9io8jSbH/i
 OWWNbee3OFnNDWqNQMGCuLFAPtEaSkSzmJyDjD9AU4luiD6Clt/2MvgQfBMRtHonPvwx
 pQLg==
X-Gm-Message-State: AOJu0YycQJCzybU8eDDCsSAKSlpmdhDfuH0SzN+KIlNHkMboVCrfe5Ix
 KtSfpJ3dTVZxIgXIcG4349xR1YBQwK9mjvaKnxxsfrcsw32T2TJ/BOO68AaQItn9zqlw+bSH9lA
 9
X-Google-Smtp-Source: AGHT+IE6OHM4gDjzFo7LX2owkGhyyDcUwMGCxC0TBPno6/fcXwwln9IWrUAR7opRbaImLkbdGtnz1Q==
X-Received: by 2002:a05:600c:3491:b0:40f:f73f:f8a7 with SMTP id
 a17-20020a05600c349100b0040ff73ff8a7mr536238wmq.26.1707238631790; 
 Tue, 06 Feb 2024 08:57:11 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWzZ+7GgYJ1TSXg8nFPfLSJ8sN1gpSzhDn2zxvRr+coNhE/c+WsZMnacziRk2IZeFcdOZdmyv11AEiiJvymQx0WL78i7EQ9fA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c468a00b0040fde7250f4sm2542934wmo.38.2024.02.06.08.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:57:11 -0800 (PST)
Message-ID: <18a19685-2383-4f27-81d5-b4db3a126b53@mind.be>
Date: Tue, 6 Feb 2024 17:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Juan Carrano <juan.carrano@ebee.berlin>, buildroot@buildroot.org
References: <20221102103428.82414-1-juan.carrano@ebee.berlin>
In-Reply-To: <20221102103428.82414-1-juan.carrano@ebee.berlin>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707238632; x=1707843432; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kzV7xnVWi+fNDYU2uR8EJYVic0HVo6l65jL9jv9P8fg=;
 b=Mdqyu7dqUqjYdHtiP13Kp1g/uEp3MNOKdIstZn634ISIIfP2MTOgA8QKBqo3sXtkT2
 0uwjhcWPb0t8bgeZzQ7xfPThUVTqNn5pXVUnLOQeZKawWZEsHN5zw03gSFzcJ7kujYWK
 oDQa9Tuns4paf691zvoh/+6GYpjOWV8KqWpgRiIuff8OR4ie9WuPIK0G6xZDdFGgXYE4
 HTBe9Wxr8A0egpksPV4fsPPQWH1jm/L9omR+zyMFeFCI2//u1m6tgD2IaXtXheEnANFW
 yuDomhF2FDre132Ar3QhYWrxhR/sjj+Xc23y87pQyk7DcQw38xuGZZDXkBg5TlOHa5Ge
 Mnig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mdqyu7dq
Subject: Re: [Buildroot] [PATCH] support/pkg-stats: list packages from
 external trees.
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Juan,
On 02/11/2022 11:34, Juan Carrano wrote:
> Search the external trees for package files and add them to the list.
> The list of directories walked and excluded are the same as for the main
> tree, and should work out of the box if the user sticks to the directory
> structure suggested in the manual.
> 
> Two additional properties were added to the Package class, the tree name and
> the path. For consistency and to simplify the code, packages in the main tree
> are marked as coming from "BR2".
> 
> The HTML output has a new column listing the external name (or "BR2") and the
> json output has a new property "tree".
> 
> Signed-off-by: Juan Carrano <juan.carrano@ebee.berlin>

  After more than a year, finally applied to master. There's really no excuse 
that it takes so long, other than that the maintainers are a bit overloaded.

  I made a few minor changes.

      - fix flake8 error "'itertools' imported but unused";
      - use str.split instead of str.partition;
      - use BR2_EXTERNAL_BUILDROOT_PATH instead of BR2_EXTERNAL_BR2_PATH;
      - remove pkgdir variable, instead use self.pkgdir.


  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 90 ++++++++++++++++++++++++++-------------
>   1 file changed, 60 insertions(+), 30 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 3248e3678d..2dfcc54d57 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -23,7 +23,7 @@ import asyncio
>   import datetime
>   import fnmatch
>   import os
> -from collections import defaultdict
> +from collections import defaultdict, namedtuple
>   import re
>   import subprocess
>   import json
> @@ -32,6 +32,7 @@ import time
>   import gzip
>   import xml.etree.ElementTree
>   import requests
> +import itertools
>   
>   brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
>   
> @@ -77,6 +78,19 @@ def get_defconfig_list():
>       ]
>   
>   
> +Br2Tree = namedtuple("Br2Tree", ["name", "path"])
> +
> +
> +def get_trees():
> +    raw_variables = subprocess.check_output(["make", "--no-print-directory", "-s",
> +                                             "BR2_HAVE_DOT_CONFIG=y", "printvars",
> +                                             "VARS=BR2_EXTERNAL_NAMES BR2_EXTERNAL_%_PATH"])
> +    variables = dict(line.partition("=")[0::2] for line in raw_variables.decode().split("\n") if line)
> +    variables["BR2_EXTERNAL_BR2_PATH"] = brpath
> +    externals = ["BR2", *variables["BR2_EXTERNAL_NAMES"].split()]
> +    return [Br2Tree(name, os.path.normpath(variables[f"BR2_EXTERNAL_{name}_PATH"])) for name in externals]
> +
> +
>   class Package:
>       all_licenses = dict()
>       all_license_files = list()
> @@ -89,7 +103,9 @@ class Package:
>       status_checks = ['cve', 'developers', 'hash', 'license',
>                        'license-files', 'patches', 'pkg-check', 'url', 'version']
>   
> -    def __init__(self, name, path):
> +    def __init__(self, tree, name, path):
> +        self.tree = tree.name
> +        self.tree_path = tree.path
>           self.name = name
>           self.path = path
>           self.pkg_path = os.path.dirname(path)
> @@ -118,12 +134,24 @@ class Package:
>       def pkgvar(self):
>           return self.name.upper().replace("-", "_")
>   
> +    @property
> +    def pkgdir(self):
> +        return os.path.join(self.tree_path, self.pkg_path)
> +
> +    @property
> +    def pkgfile(self):
> +        return os.path.join(self.tree_path, self.path)
> +
> +    @property
> +    def hashpath(self):
> +        return self.pkgfile.replace(".mk", ".hash")
> +
>       def set_url(self):
>           """
>           Fills in the .url field
>           """
>           self.status['url'] = ("warning", "no Config.in")
> -        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
> +        pkgdir = self.pkgdir
>           for filename in os.listdir(pkgdir):
>               if fnmatch.fnmatch(filename, 'Config.*'):
>                   fp = open(os.path.join(pkgdir, filename), "r")
> @@ -172,7 +200,7 @@ class Package:
>               keep_target = True
>   
>           self.infras = list()
> -        with open(os.path.join(brpath, self.path), 'r') as f:
> +        with open(self.pkgfile, 'r') as f:
>               lines = f.readlines()
>               for line in lines:
>                   match = INFRA_RE.match(line)
> @@ -211,8 +239,7 @@ class Package:
>               self.status['hash-license'] = ("na", "no valid package infra")
>               return
>   
> -        hashpath = self.path.replace(".mk", ".hash")
> -        if os.path.exists(os.path.join(brpath, hashpath)):
> +        if os.path.exists(self.hashpath):
>               self.status['hash'] = ("ok", "found")
>           else:
>               self.status['hash'] = ("error", "missing")
> @@ -225,8 +252,7 @@ class Package:
>               self.status['patches'] = ("na", "no valid package infra")
>               return
>   
> -        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
> -        for subdir, _, _ in os.walk(pkgdir):
> +        for subdir, _, _ in os.walk(self.pkgdir):
>               self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
>   
>           if self.patch_count == 0:
> @@ -268,9 +294,8 @@ class Package:
>           Fills in the .warnings and .status['pkg-check'] fields
>           """
>           cmd = [os.path.join(brpath, "utils/check-package")]
> -        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
>           self.status['pkg-check'] = ("error", "Missing")
> -        for root, dirs, files in os.walk(pkgdir):
> +        for root, dirs, files in os.walk(self.pkgdir):
>               for f in files:
>                   if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
>                       cmd.append(os.path.join(root, f))
> @@ -328,7 +353,7 @@ class Package:
>                self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
>   
>   
> -def get_pkglist(npackages, package_list):
> +def get_pkglist(trees, npackages, package_list):
>       """
>       Builds the list of Buildroot packages, returning a list of Package
>       objects. Only the .name and .path fields of the Package object are
> @@ -358,8 +383,8 @@ def get_pkglist(npackages, package_list):
>                        "toolchain/toolchain-wrapper.mk"]
>       packages = list()
>       count = 0
> -    for root, dirs, files in os.walk(brpath):
> -        root = os.path.relpath(root, brpath)
> +    for br_tree, root, dirs, files in ((tree, *rdf) for tree in trees for rdf in os.walk(tree.path)):
> +        root = os.path.relpath(root, br_tree.path)
>           rootdir = root.split("/")
>           if len(rootdir) < 1:
>               continue
> @@ -380,7 +405,7 @@ def get_pkglist(npackages, package_list):
>                       continue
>               if skip:
>                   continue
> -            p = Package(pkgname, pkgpath)
> +            p = Package(br_tree, pkgname, pkgpath)
>               packages.append(p)
>               count += 1
>               if npackages and count == npackages:
> @@ -854,7 +879,7 @@ function expandField(fieldId){
>   #package-grid, #results-grid {
>     display: grid;
>     grid-gap: 2px;
> -  grid-template-columns: 1fr repeat(12, min-content);
> +  grid-template-columns: min-content 1fr repeat(12, min-content);
>   }
>   #results-grid {
>     grid-template-columns: 3fr 1fr;
> @@ -920,6 +945,8 @@ def boolean_str(b):
>   
>   def dump_html_pkg(f, pkg):
>       pkg_css_class = pkg.path.replace("/", "_")[:-3]
> +    f.write(f'<div id="tree__{pkg_css_class}" \
> +        class="tree data _{pkg_css_class}">{pkg.tree}</div>\n')
>       f.write(f'<div id="package__{pkg_css_class}" \
>           class="package data _{pkg_css_class}">{pkg.path}</div>\n')
>       # Patch count
> @@ -1122,31 +1149,33 @@ def dump_html_pkg(f, pkg):
>   def dump_html_all_pkgs(f, packages):
>       f.write("""
>   <div id="package-grid">
> -<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="package"
> +<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="tree"
> +     class="tree data label"><span>Tree</span><span></span></div>
> +<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="package"
>        class="package data label"><span>Package</span><span></span></div>
> -<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="patch_count"
> +<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="patch_count"
>        class="centered patch_count data label"><span>Patch count</span><span></span></div>
> -<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="infrastructure"
> +<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="infrastructure"
>        class="centered infrastructure data label">Infrastructure<span></span></div>
> -<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="license"
> +<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license"
>        class="centered license data label"><span>License</span><span></span></div>
> -<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license_files"
> +<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="license_files"
>        class="centered license_files data label"><span>License files</span><span></span></div>
> -<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="hash_file"
> +<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="hash_file"
>        class="centered hash_file data label"><span>Hash file</span><span></span></div>
> -<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="current_version"
> +<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="current_version"
>        class="centered current_version data label"><span>Current version</span><span></span></div>
> -<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="latest_version"
> +<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="latest_version"
>        class="centered latest_version data label"><span>Latest version</span><span></span></div>
> -<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="warnings"
> +<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="warnings"
>        class="centered warnings data label"><span>Warnings</span><span></span></div>
> -<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="upstream_url"
> +<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="upstream_url"
>        class="centered upstream_url data label"><span>Upstream URL</span><span></span></div>
> -<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="cves"
> +<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="cves"
>        class="centered cves data label"><span>CVEs</span><span></span></div>
> -<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="ignored_cves"
> +<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="ignored_cves"
>        class="centered ignored_cves data label"><span>CVEs Ignored</span><span></span></div>
> -<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cpe_id"
> +<div style="grid-column: 14;" onclick="sortGrid(this.id)" id="cpe_id"
>        class="centered cpe_id data label"><span>CPE ID</span><span></span></div>
>   """)
>       for pkg in sorted(packages):
> @@ -1217,7 +1246,7 @@ def dump_html(packages, stats, date, commit, output):
>   def dump_json(packages, defconfigs, stats, date, commit, output):
>       # Format packages as a dictionnary instead of a list
>       # Exclude local field that does not contains real date
> -    excluded_fields = ['url_worker', 'name']
> +    excluded_fields = ['url_worker', 'name', 'tree_path']
>       pkgs = {
>           pkg.name: {
>               k: v
> @@ -1305,7 +1334,8 @@ def __main__():
>                                         'rev-parse',
>                                         'HEAD']).splitlines()[0].decode()
>       print("Build package list ...")
> -    packages = get_pkglist(args.npackages, package_list)
> +    all_trees = get_trees()
> +    packages = get_pkglist(all_trees, args.npackages, package_list)
>       print("Getting developers ...")
>       developers = parse_developers()
>       print("Build defconfig list ...")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
