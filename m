Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D647C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 08:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D275040071;
	Tue, 19 Mar 2024 08:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjddPLEqjspV; Tue, 19 Mar 2024 08:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC7C40082
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DC7C40082;
	Tue, 19 Mar 2024 08:03:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E45CC1BF310
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 08:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE1C281D72
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 08:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSPnN5enRClv for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 08:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20B5681432
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20B5681432
 for <buildroot@uclibc.org>; Tue, 19 Mar 2024 08:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 184CE822F1; Tue, 19 Mar 2024 08:03:18 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 19 Mar 2024 08:03:17 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.11.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ian_ormshaw@waters.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15916-163-PQRzntqHZS@https.bugs.busybox.net/>
In-Reply-To: <bug-15916-163@https.bugs.busybox.net/>
References: <bug-15916-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15916] mesa3d fails to build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15916

--- Comment #2 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
Adding spirv tools on my build system

$ dnf5 list --installed *spirv*
Installed packages
spirv-headers-devel.noarch   1.5.5-20.fc39 updates
spirv-llvm-translator.x86_64 17.0.0-1.fc39 fedora
spirv-tools.x86_64           2023.3-3.fc39 updates
spirv-tools-devel.x86_64     2023.3-3.fc39 updates
spirv-tools-libs.x86_64      2023.3-3.fc39 updates

And setting

Symbol: BR2_PACKAGE_SPIRV_HEADERS [=y]
Symbol: BR2_PACKAGE_SPIRV_TOOLS [=y]

gives the followinf error:

Found CMake: /usr/bin/cmake (3.27.7)
Run-time dependency spirv-tools found: NO (tried pkgconfig and cmake)

../../../../../build/x86_64-WatersAMST-linux-gnu_24-support-mesa3d-gallium-amdgpu-opencl-e791e9b4/build/mesa3d-24.0.0/meson.build:1843:20:
ERROR: Dependency "SPIRV-Tools" not found, tried pkgconfig and cmake

A full log can be found at
/home/ian/build/x86_64-WatersAMST-linux-gnu_24-support-mesa3d-gallium-amdgpu-opencl-e791e9b4/build/mesa3d-24.0.0/build/meson-logs/meson-log.txt


forcing the spirv tools to be build by removing mesa3d from the config,
re-building then addinf mesa3d bac into the config again gives the error:

Found CMake: /usr/bin/cmake (3.27.7)
Run-time dependency llvmspirvlib found: NO (tried pkgconfig and cmake)

../../../../../build/x86_64-WatersAMST-linux-gnu_24-support-mesa3d-gallium-amdgpu-opencl-e791e9b4/build/mesa3d-24.0.0/meson.build:1845:21:
ERROR: Dependency "LLVMSPIRVLib" not found, tried pkgconfig and cmake

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
