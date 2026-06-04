Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F2CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1313540EBE;
	Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kv0IROdSiDr; Fri,  5 Jun 2026 12:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2810740ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663058;
	bh=ZYzRZayvyNNlQh2ipYSYol1JrP1a8rWluOk4II7KsJA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h7Qs8c9zm+w43YwwDUH3Qu282//g+Mm8RVdiaf8iLcjUyvc/MNXHXWWysAwcjDLS8
	 E4bJmVYn05XylnCh+AepTHEqP7c/QZX0A3VwyLI8R5hC1jjH90uSQ8JeihcwTufNit
	 qJWVYVTNaSiQQ9iNuS6Bhd27HvjYIV9sXfG1vVH9+X4xlWg52iWbrrV+c7IZ1qH746
	 BhkD1isc7Ob/F6n8gEF164XiuDGkAyywMe7THrw9/OilXGWwiYz8CXHCyILHiBH+C4
	 3yhTfC88IBhrXVPyf6N/5iVpw7fUlA5V0l/r5bXrLzp/fMAYyCWQc3+eV+zXyR2DFO
	 j6ObvK0e6xAgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2810740ECB;
	Fri,  5 Jun 2026 12:37:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE17388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13F4381E4E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnR0JKeAAB9l for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91F0781E4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91F0781E4F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC83387B40; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:53:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7dc7490ee02f326ce7d8fc0cc6ccccf1fddc083
X-Git-Newrev: 060b931954076783e32f99aaccec9a259b3ba512
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.BC83387B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/unzip: import
 patches from Debian
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/060b931954076783e32f99aaccec9a259b3ba512
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

In Buildroot there are multiple way to apply patches on a package [1]

- Adding `.patch` file in the package directory.
- Define `<pkg>_PATCH` variable with the location of the patch tar.gz.
  It used to download Debian patches tarball.
- Implement custom patching logic with `PRE`/`POST` patches hooks.

To make the CycloneDX SBOM generation not dependant on downloading the
packages, the two last options have the downside of not appearing on the
generated SBOM.

The unzip package is downloading a tarball from the Debian mirror with
the `<pkg>_PATCH` method [2].

To improve the tracking of the patched vulnerabilities for the unzip
package this commit import the patches previously downloaded with the
`_PATCH` variable in the Buildroot tree.
This allows to add the `CVE:` trailer [3] on the patches that fix
vulnerabilities to better track which patch is fixing the vulnerability.

[1] https://buildroot.org/downloads/manual/manual.html#patch-policy
[2] https://snapshot.debian.org/archive/debian/20250311T215724Z/pool/main/u/unzip/unzip_6.0-29.debian.tar.xz
[3] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fb8958e3dcb3800a772e743ae12f12c95dbcd4e7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |   1 -
 ...1-manpages-in-section-1-not-in-section-1l.patch | 297 ++++++++++++++++++
 package/unzip/0002-this-is-debian-unzip.patch      |  18 ++
 .../unzip/0003-include-unistd-for-kfreebsd.patch   |  17 ++
 .../0004-handle-pkware-verification-bit.patch      |  23 ++
 package/unzip/0005-fix-uid-gid-handling.patch      |  31 ++
 .../unzip/0006-initialize-the-symlink-flag.patch   |  22 ++
 .../unzip/0007-increase-size-of-cfactorstr.patch   |  19 ++
 .../unzip/0008-allow-greater-hostver-values.patch  |  16 +
 .../unzip/0009-cve-2014-8139-crc-overflow.patch    |  56 ++++
 .../unzip/0010-cve-2014-8140-test-compr-eb.patch   |  30 ++
 .../unzip/0011-cve-2014-8141-getzip64data.patch    | 140 +++++++++
 .../unzip/0012-cve-2014-9636-test-compr-eb.patch   |  44 +++
 package/unzip/0013-remove-build-date.patch         |  20 ++
 package/unzip/0014-cve-2015-7696.patch             |  35 +++
 package/unzip/0015-cve-2015-7697.patch             |  29 ++
 ...0016-fix-integer-underflow-csiz-decrypted.patch |  34 +++
 .../0017-restore-unix-timestamps-accurately.patch  |  43 +++
 .../0018-cve-2014-9913-unzip-buffer-overflow.patch |  32 ++
 ...019-cve-2016-9844-zipinfo-buffer-overflow.patch |  31 ++
 ...20-cve-2018-1000035-unzip-buffer-overflow.patch |  39 +++
 .../0021-fix-warning-messages-on-big-files.patch   |  16 +
 ...2-cve-2019-13232-fix-bug-in-undefer-input.patch |  25 ++
 ...19-13232-zip-bomb-with-overlapped-entries.patch | 338 +++++++++++++++++++++
 ...ise-alert-for-misplaced-central-directory.patch | 106 +++++++
 .../0025-cve-2019-13232-fix-bug-in-uzbunzip2.patch |  26 ++
 .../0026-cve-2019-13232-fix-bug-in-uzinflate.patch |  26 ++
 package/unzip/0027-zipgrep-avoid-test-errors.patch |  17 ++
 .../0028-cve-2022-0529-and-cve-2022-0530.patch     | 177 +++++++++++
 .../unzip/0029-handle-windows-zip64-files.patch    |  21 ++
 .../unzip/0030-drop-conflicting-declarations.patch |  18 ++
 package/unzip/0031-fix-zipgrep.patch               |  20 ++
 ...-CMakeFile.txt-to-ease-cross-compilation.patch} |   1 +
 package/unzip/unzip.mk                             |  55 +++-
 34 files changed, 1806 insertions(+), 17 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
