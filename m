Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A205EC52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E377608B9;
	Tue,  6 Aug 2024 22:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4eBkwjCGIwY; Tue,  6 Aug 2024 22:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1D1D608B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D1D608B4;
	Tue,  6 Aug 2024 22:46:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 667C11BF97F
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53F6D404A3
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbvXzMdekkQM for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080A840343
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 080A840343
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:46:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E946E8438D; Tue,  6 Aug 2024 22:46:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 00:39:49 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c9b07cbdd09e819011e9695fe79e6125a3567072
X-Git-Newrev: 4fa204ab1106f421f436420aaf19b2d80d9b42e4
X-Patchwork-Hint: ignore
Message-Id: <20240806224614.E946E8438D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] docs/manual: normalize
 delimiters of listing blocks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fa204ab1106f421f436420aaf19b2d80d9b42e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Although the asciidoc toolchain accepts any number of ~ to delimit a
listing block (i.e. a code block), it is actually specified to be
exactly four, i.e. ~~~~. Currently, a mix of diffrent numbers of ~ are
being used - sometimes even a different number at the beginning and at
the end of the block.

Normalize this to always use exactly four ~ for the delimiter.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 447fa1fca425e629cc65cd0a8261a4c09ddf67d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-board-support.adoc              |  4 +-
 docs/manual/adding-packages-autotools.adoc         |  4 +-
 docs/manual/adding-packages-cargo.adoc             |  8 +--
 docs/manual/adding-packages-cmake.adoc             |  4 +-
 docs/manual/adding-packages-directory.adoc         | 60 ++++++++--------
 docs/manual/adding-packages-generic.adoc           | 28 ++++----
 docs/manual/adding-packages-golang.adoc            |  4 +-
 docs/manual/adding-packages-hooks.adoc             |  4 +-
 docs/manual/adding-packages-kconfig.adoc           |  4 +-
 .../adding-packages-linux-kernel-spec-infra.adoc   | 16 ++---
 docs/manual/adding-packages-luarocks.adoc          |  4 +-
 docs/manual/adding-packages-meson.adoc             |  4 +-
 docs/manual/adding-packages-perl.adoc              |  4 +-
 docs/manual/adding-packages-python.adoc            | 24 +++----
 docs/manual/adding-packages-qmake.adoc             |  4 +-
 docs/manual/adding-packages-rebar.adoc             |  4 +-
 docs/manual/adding-packages-tips.adoc              | 12 ++--
 docs/manual/adding-packages-virtual.adoc           | 24 +++----
 docs/manual/adding-packages-waf.adoc               |  4 +-
 docs/manual/beyond-buildroot.adoc                  | 16 ++---
 docs/manual/ccache-support.adoc                    |  4 +-
 docs/manual/common-usage.adoc                      | 64 ++++++++---------
 docs/manual/configure.adoc                         |  4 +-
 docs/manual/contribute.adoc                        | 84 +++++++++++-----------
 docs/manual/customize-directory-structure.adoc     | 12 ++--
 docs/manual/customize-outside-br.adoc              | 24 +++----
 docs/manual/customize-packages.adoc                |  8 +--
 docs/manual/download-location.adoc                 |  4 +-
 docs/manual/faq-troubleshooting.adoc               |  4 +-
 docs/manual/getting.adoc                           |  8 +--
 docs/manual/legal-notice.adoc                      |  4 +-
 docs/manual/make-tips.adoc                         | 24 +++----
 docs/manual/package-make-target.adoc               |  4 +-
 docs/manual/patch-policy.adoc                      | 16 ++---
 docs/manual/quickstart.adoc                        | 20 +++---
 docs/manual/rebuilding-packages.adoc               |  4 +-
 docs/manual/using-buildroot-debugger.adoc          | 12 ++--
 docs/manual/using-buildroot-development.adoc       | 24 +++----
 docs/manual/writing-rules.adoc                     | 36 +++++-----
 39 files changed, 298 insertions(+), 298 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
