Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841FFC3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B67561416;
	Fri, 12 Jul 2024 18:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzRLIYDomfuK; Fri, 12 Jul 2024 18:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71BF26141B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71BF26141B;
	Fri, 12 Jul 2024 18:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CFE31BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC2140003
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7if4e9XjRnC for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A0FC400FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A0FC400FF
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:31:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 544A286140; Fri, 12 Jul 2024 18:31:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 20:30:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4286c89f9d987f5f3bcbb14dfd58ba440944f4c2
X-Git-Newrev: 447fa1fca425e629cc65cd0a8261a4c09ddf67d2
X-Patchwork-Hint: ignore
Message-Id: <20240712183131.544A286140@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: normalize delimiters of
 listing blocks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=447fa1fca425e629cc65cd0a8261a4c09ddf67d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the asciidoc toolchain accepts any number of ~ to delimit a
listing block (i.e. a code block), it is actually specified to be
exactly four, i.e. ~~~~. Currently, a mix of diffrent numbers of ~ are
being used - sometimes even a different number at the beginning and at
the end of the block.

Normalize this to always use exactly four ~ for the delimiter.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
