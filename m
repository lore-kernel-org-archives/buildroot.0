Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7650C79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 12:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E3D66075A;
	Wed,  9 Sep 2026 12:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ql9d4ebN50n9; Wed,  9 Sep 2026 12:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9213260639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788955564;
	b=iDpHJV3z4OQWx1rrcipjmbMJz/AhclvOB5eSyXCC0KCnodTubusAwVQukgVIZuYnWtpO
	 NDEJ6IC+9X1ibwgDAzgDjYg0fjlDeeWfNL4/90DiN6pcx1BjObIz0vOyy2iVzWjcv4jQO
	 JoDq9jao1c2kWbKHkCKaWsK4K6Sn8ROOVKNX8ny+EHjpmum8KSskwqzuHvXsCJbCclfxM
	 izJim9IqDYGfgVfdQmRNvn92BhQcWeODMybFFopLylZyc6YU8f4wuTdrxwUVYFg/eTr7Y
	 Ez4Z4LaMPWer+ortXehsusZr0ueC33SCXs9zEsA0Wbh/5pAcu+IPmq3hldEMaFrpdeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788955564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=G5WMfywIaOk3I5xWMahGv3/e/QZWgC3/777nJjFtIfo=;
	b=hoq0WrAWBlVus11dh6xLTJapcTHlc42Fd7d4riP0ekKhbdzWWAlwiVtLu+XwNPyfrp5q
	 /rJxudEz7VHZJjSDNSOGGNTq3e09wpqLrPkhlvxj/jdZGmWVdW/HncqN8W57BKF2ei5qV
	 gMFwebjmMOC5efbcCs/0bOgQOwhTWXOhp+lvEvN0OeQDwqEWgr1mFUy1Rn/jZIjhwtkki
	 ACkkIGycpcgqTf6Pfep/GHE/kQSAapyTu7gKWQf74akbSvYv8mugn62VFkiZBp7/a7jxg
	 hte1Dh0kQDHw/rM8TI2l0Lagoip9DNvXmBJbwskZXjQKfXMXcFsXmiMmfz4sHTV4d+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788955564;
	bh=G5WMfywIaOk3I5xWMahGv3/e/QZWgC3/777nJjFtIfo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NIgkK0dA/GFUbGPQoVTiFFEh6x55xv6JIT/6OeuAW9X6HE4QjiIqiMnbzy8RSekPD
	 knDpyOgxKyvnNawzX5PXHqKuvnq4v4Q3e5AdySY/Kabu5L/ak2QfIbNmW22YnYqZuz
	 YjPVRi1Eo+eav7yNscmwxlZNTQmGVwvzcn44+fo3jCH51rTxOFnh5xOLVWYL0VjISG
	 FUcP3RFFNduuO6tZV4eFF+/8955yZ6sjNAttF7WAgP5xZm5JsT9X0GZMU9sf9lFh3r
	 bdSowoHkE4rNbAM2d7jZuedzw8DNIq2d0hP/zJuSTHV+lamzAhlKvVmHQOZ+3CfPU+
	 LbXSFdNhppRvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9213260639;
	Wed,  9 Sep 2026 12:06:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 400882E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25DAA400A2
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lxj7_utbxRS3 for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 12:06:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 45B0140026
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788955561;
 b=Krv7xq5yMAQPMm+iDIpbX0vqo+hVvIN4Iwe/8fqyvTCErW073IHbhDicVb5Va++6eAN9
 +Ns/ws8Gw0A8KB4bxRZBm2rBwfJ5rF69Vxmq8P3goXHBl0z3trtE6Vloh7YWA2nssFrJZ
 1qcHhM7UEMevyEIsUQ4jXiHQ3b5mVIfDRWrjRw85x/YxH1G1MVxu4KGtL6lTx3+maskFF
 mwQNQlBL60HGnpdMLp32DwqQqC843S3CyPMNIUEWn3hJevqiKmzVD9eccWT2ggyDqF6TI
 KhwhGauAQ3TOxhdMDRWxSyTbDGPaMJt5fVSuqL0xnJ7BRVdA3fl0lyLrgHx5q1dDSxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788955561;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 bh=0OimkYl4Ev0m/ERg80PzqripPxloScUw6mEissKHZmM=;
 b=pSO+qXeSfMU4py36NqWBexNt7HI1SQf0kNMl9TSY2Ypp3cmQQ3Iw9uU61Yru3oHFe/yX
 fowlYCtEPYvepnOBtl1CCEAtKBTKRRu0jXSChoOIi7MdZ2qri4zX1/oKVlCt05D33+7Es
 PYtGqxWr3jICNpOHZmIT5nb/ttCtaaUnyPfX4xvw3T29hX9osDICOPlEGhXQhCiT6skcM
 Z9l5K7IB3Z0pwJEdDRa9dwbrs2PMQZwSlSF5EVt2wMu+gyUs4vt+WHh3aPYhxqPvvhr9I
 XJN+iJ5LeKmLXms93AsLVmmreguqhQEJOVyULGI/1JCR7HmhTLpuMB/xtH1GEoY9BGg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=thewebers.ws; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JLgKak8N; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::26; helo=mail-oo2-x26.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JLgKak8N
Received: from mail-oo2-x26.google.com (mail-oo2-x26.google.com
 [IPv6:2607:f8b0:4864:31::26])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45B0140026
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:06:00 +0000 (UTC)
Received: by mail-oo2-x26.google.com with SMTP id
 46e09a7af769-80032c08611so770154a34.3
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788955560; x=1789560360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0OimkYl4Ev0m/ERg80PzqripPxloScUw6mEissKHZmM=;
 b=JLgKak8NCflxQa3zhjBAIlG20dEj6W68EdWURh/WAou+Zth+II7nHSxOXsLzWko+cA
 ftJKv96eWibgYm2Dn/iYF5kxdXCWXfn1crDVRafQ1GhdU3vQWthVpoSh0zPoo+X0sGQJ
 cmWagmNLIQr/mco4gCAMpmTa9VQkzaI9ofn5sIJ0gvoCDUUYnKeNbLm5m0CESAsDVIEF
 3ROTh1fM49zY+f4Xemb5shXtdRjA4+392w63Xm/Vsz0VeGj7AGLccJagp7wvJj8wNwoN
 qUtTKU46t7kT7TYeSqhz5f9hodqhQLL2wVr+K6qX8qq3fWTuWBvXOUOwEirAb7GzEia8
 5DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788955560; x=1789560360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0OimkYl4Ev0m/ERg80PzqripPxloScUw6mEissKHZmM=;
 b=g+vgx2BjKfBrQYMmU0R/PVbVz4z2vMdZNbGmj2182f7Aj9F6ctahleeqMappvPlppz
 XiSe/KU66oKO2Jm4TFYKiSQniYGDUqw6g8sAeFtskLcsWv+5zZhROy0bgMEMRhRtWqjl
 /FdO7zcMrti5LIUfZ3JyEY86LN9H5vbpYPs3f4u9MPItAFTyLzg1ZilGNtYhm/+0WYIE
 cL8bSqQ1Dak4CfExYo0n02ZCp4YqfGatU5NyXJrVcDEyenau1UoXyXHu526LbFp4Auvs
 s+LGv9PCdZdraaEFg7UkjHB8DdoWpYT6aU1XQJM+/JPmtFaf3u425xsTsJClmTxTMhGR
 QvVQ==
X-Gm-Message-State: AFuF++mC7D7VpQkqKKHbzB4z5G6Np+l0IlFhIBqsMgy1ua48suOqXPjG
 tQav8Y1QtaeN0uRPUO0PBnRBRL283McRlagTjBVvHsnQuEWdSBJnyrnzJIp18w==
X-Gm-Gg: AYBFou1Iwi00kap/oPCTSqNgnPq5U2JamwFeh7Dq0S0s+5c+W4KeavZ+JD/FuU7XIH4
 AR6d6il+CzbrgZDPxFBFlZFCbOZ/oN55/zRBXSFe0Py4xKunnMeAYW+xGJLBSTOTgAcman7JePa
 l0BBW3JqpQQ4kGO4/Q9bKLyxRmUQtSxARojGWIX0kTNUsgrlK5K8eIgy4Wh56Ef3lTrT44jMNMh
 Le0dV3N3o3/0zPhNiCn8allx9ZzcVaQENxZc0PA3k3Be7D/pIjYL7HzvFoOUYBPwcj0CMafysI+
 ELkS5y1wNMa0vD9mo6MP9CXrMx+dWWJzGZjty2Fs6e5+qxURRXecrJHeo9JlytlCCv8uWAsP1rv
 s5ikd/ho2wcSXzzRBsafdL2Y9QQY5NqP3O9ueDhnudD3K5epf1D2yTfc5zOfWI78V6h5xDVYhnK
 NkyF+DAbxlGQW+3HrF8Ml+9m2a6aoLwr6xF2mqypFmtu3KbkIVODDrnx9aog37bKY4fN/ncou+8
 GsGaQmoBhvmlyaV8WtM0shh5x/ujB0dR4V9zbfH
X-Received: by 2002:a05:6830:6a8b:b0:7dd:9b19:a875 with SMTP id
 46e09a7af769-800eee8dcc6mr7792439a34.2.1788955559633; 
 Wed, 09 Sep 2026 05:05:59 -0700 (PDT)
Received: from penguin.lxd (138-28-90-168.fttx.imoncommunications.net.
 [138.28.90.168]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7fcef193dc2sm11004447a34.19.2026.09.09.05.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 05:05:57 -0700 (PDT)
From: Matthew Weber <matt@thewebers.ws>
To: buildroot@buildroot.org
Cc: Matthew Weber <matt@thewebers.ws>
Date: Wed,  9 Sep 2026 07:05:50 -0500
Message-Id: <20260909120551.9921-1-matt@thewebers.ws>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] docs: add agent guidance
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

Document Buildroot structure, documentation, build and validation
workflows, mailing-list submission, Patchwork usage, and AI-assisted
contribution requirements.

This specific file was added as most AI will look for it.

Assisted-by: GitHub Copilot
Signed-off-by: Matthew Weber <matt@thewebers.ws>

---

This is modeled after similar work I did on another project. I
tried to keep this simple to start and there are more refs in the
pull request. https://github.com/elisa-tech/wg-aerospace/pull/234/changes

---
 AGENTS.md | 257 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 AGENTS.md

diff --git a/AGENTS.md b/AGENTS.md
new file mode 100644
index 0000000000..e05c87f4fc
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1,257 @@
+# AGENTS.md - Buildroot
+
+## Repository purpose
+
+Buildroot is a simple, efficient tool for generating embedded Linux systems
+through cross-compilation.
+
+The repository contains:
+
+- `package/`: target and host package definitions
+- `board/`: board-specific support files
+- `configs/`: predefined board configurations
+- `boot/`: bootloader and firmware support
+- `linux/`: Linux kernel integration
+- `system/`: target system configuration
+- `toolchain/`: toolchain support
+- `fs/`: root filesystem image generation
+- `support/`: infrastructure, scripts, tests, and tooling
+- `docs/`: the Buildroot user manual and website
+- `DEVELOPERS`: file ownership and maintainer notification rules
+
+Read the relevant package, board, or infrastructure documentation before
+changing its implementation.
+
+## Documentation
+
+The primary documentation is in `docs/manual/`.
+
+Useful entry points:
+
+- `docs/manual/manual.adoc`: manual index and build definition
+- `docs/manual/quickstart.adoc`: first Buildroot build
+- `docs/manual/common-usage.adoc`: common make targets and workflows
+- `docs/manual/contribute.adoc`: contribution and patch-submission process
+- `docs/manual/adding-packages.adoc`: adding packages
+- `docs/manual/adding-board-support.adoc`: adding board support
+- `docs/manual/developers.adoc`: `DEVELOPERS` and `get-developers`
+- `docs/manual/resources.adoc`: community resources and Patchwork
+- `docs/manual/prerequisite.adoc`: host requirements
+
+Generate the text manual with:
+
+```sh
+make manual-text
+```
+
+The generated text manual is written to `output/docs/manual/manual.text`.
+Online documentation is available at <https://buildroot.org/docs.html>.
+
+## Building Buildroot
+
+Build as a normal user. From the repository root:
+
+```sh
+make menuconfig
+make
+```
+
+The resulting kernel, bootloader, and root filesystem images are placed in
+`output/images/`.
+
+Useful commands include:
+
+```sh
+make list-defconfigs
+make <boardname>_defconfig
+make savedefconfig BR2_DEFCONFIG=<path>
+make source
+make legal-info
+```
+
+Use `O=<output-directory>` for an out-of-tree output directory:
+
+```sh
+make O=/path/to/output menuconfig
+make O=/path/to/output
+```
+
+Check `docs/manual/prerequisite.adoc` before diagnosing host dependency
+problems. Buildroot requires GNU make 3.81 or newer and a Linux host.
+
+## Testing and validation
+
+Choose validation appropriate to the change:
+
+- Run `utils/check-package` on new or modified package files.
+- Prefer the containerized check for patch preparation:
+
+  ```sh
+  utils/docker-run make check-package
+  ```
+
+- Validate `DEVELOPERS` changes with:
+
+  ```sh
+  ./utils/get-developers -v
+  ```
+
+- Build the affected defconfig, package, board, or test target.
+- Use the test infrastructure under `support/testing/` when the change
+  affects runtime behavior.
+- Generate documentation with `make manual-text` when changing the manual.
+
+Do not claim a change is tested unless the relevant command or build was run.
+
+## Finding responsible developers
+
+`DEVELOPERS` lists developers associated with architectures, packages, boards,
+and infrastructure. Use `utils/get-developers` to identify notification
+recipients:
+
+```sh
+./utils/get-developers <patch-files>
+./utils/get-developers -e
+./utils/get-developers -c
+```
+
+When adding a new package, board, or significant functionality, update
+`DEVELOPERS` in the same patch as described in `docs/manual/developers.adoc`.
+
+## Contribution workflow
+
+Buildroot uses the mailing list for discussion, review, and patch submission.
+Patches are not submitted through the issue tracker.
+
+- Mailing list: `buildroot@buildroot.org`
+- Subscription: <https://lists.buildroot.org/mailman/listinfo/buildroot>
+- Archives: <https://lists.buildroot.org/pipermail/buildroot/>
+- Searchable archives: <https://lore.kernel.org/buildroot/>
+- Bug tracker: <https://gitlab.com/buildroot.org/buildroot/-/issues>
+- IRC: `#buildroot` on OFTC
+- Patchwork: <https://patchwork.buildroot.org/project/buildroot/list/>
+
+Read `docs/manual/contribute.adoc` before preparing a patch series.
+
+Keep patches focused and complete. Use the affected area as the commit-title
+prefix, start the description with a lowercase word, explain why the change is
+needed, and include a `Signed-off-by` line from the human contributor.
+
+Typical patch preparation:
+
+```sh
+git fetch --all --tags
+git rebase upstream/master
+utils/docker-run make check-package
+git format-patch -M -n -s -o outgoing upstream/master
+./utils/get-developers outgoing/*
+git send-email --to buildroot@buildroot.org --cc-cmd \
+  './utils/get-developers -e' upstream/master
+```
+
+Use `Tested-by`, `Reviewed-by`, and `Acked-by` only according to the meanings
+documented in `docs/manual/contribute.adoc`.
+
+## Working with Patchwork
+
+Use Patchwork to inspect, test, and apply patches submitted to the mailing
+list. Patchwork is not the submission mechanism.
+
+For an individual patch, download its mbox representation and apply it with
+`git am`:
+
+```sh
+git checkout -b test-patch
+curl --fail --location \
+  'https://patchwork.ozlabs.org/project/buildroot/patch/<patch-id>/mbox/' |
+  git am
+```
+
+For a patch series, open the series listing in Patchwork and use the series
+mbox link when available. Apply the complete series in one operation:
+
+```sh
+git checkout -b test-series
+curl --fail --location '<series-mbox-url>' | git am
+```
+
+A series can also be applied by downloading each patch mbox in order, but the
+series mbox or a Patchwork bundle is preferred because it preserves ordering
+and commit metadata.
+
+Example series listing:
+
+<https://patchwork.ozlabs.org/project/buildroot/list/?series=<series-id>>
+
+Example individual-patch mbox:
+
+<https://patchwork.ozlabs.org/project/buildroot/patch/<patch-id>/mbox/>
+
+After applying a series, inspect the resulting commits and run validation for
+the affected area:
+
+```sh
+git log --oneline --decorate -n <number-of-patches>
+make <affected-target>
+utils/docker-run make check-package
+```
+
+Patchwork's REST API may be used for searching or inspecting patch metadata,
+but do not assume that API URLs provide an mbox download. Use the mbox link
+provided by the Patchwork interface for applying patches, and verify the
+downloaded content before running `git am`.
+
+## AI-assisted contributions
+
+AI tools may assist with code, documentation, analysis, and other meaningful
+content.
+
+When AI-assisted work is committed or prepared for submission, follow the
+commit-message and patch-formatting requirements in
+[`docs/manual/contribute.adoc`](docs/manual/contribute.adoc#submitting-patches),
+including the subject and body wrapping rules, required trailers, and human
+sign-off.
+
+Meaningful AI-generated content must be attributed with an `Assisted-by` trailer
+in the commit message:
+
+    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
+
+Trivial completions, spelling corrections, and common boilerplate do not require
+attribution. For substantial AI-generated content, summarize the relevant
+prompts or session context in the commit message or patch description.
+
+AI tools must not add `Signed-off-by` trailers. The human contributor must:
+
+- review and understand all AI-assisted changes;
+- run and assess appropriate validation;
+- verify licensing and provenance;
+- add their own `Signed-off-by` trailer;
+- take responsibility for the submitted contribution.
+
+AI-assisted changes must not introduce license-incompatible material. Generated
+content must be checked for factual correctness, appropriate attribution, and
+compatibility with Buildroot and any affected package's license.
+
+AI-generated content should receive review proportional to its significance and
+the degree of AI involvement. Do not submit generated output without human
+understanding and validation.
+
+AI tools must not invoke `git send-email`, upload patches, or otherwise submit
+patches on the contributor's behalf. When a patch is ready to submit, present
+the proposed command sequence, including `git format-patch`,
+`utils/get-developers`, and `git send-email`, for the contributor to review and
+run themselves. Do not execute the sending or submission command.
+
+AI tools must not autonomously commit or push changes without explicit human
+review and direction.
+
+### Local agent behavior
+
+Keep changes narrowly scoped to the requested behavior. Follow existing
+Buildroot conventions and documentation. Preserve unrelated user changes.
+Do not create commits or branches unless explicitly requested.
+
+### Further reading
+
+- [Linux Foundation Generative AI Policy](https://www.linuxfoundation.org/legal/generative-ai)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
