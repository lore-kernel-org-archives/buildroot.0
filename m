Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB6ACAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D317983906;
	Thu, 11 Sep 2025 18:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4erNJyUprpn; Thu, 11 Sep 2025 18:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C9183E73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C9183E73;
	Thu, 11 Sep 2025 18:55:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1622735
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B3EF82209
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bB-ExlK4o1_4 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2514B8161D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2514B8161D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 123DB840FF; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:14:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 25ff8de748f4f09abbed41b0e6aeb16d06768b0d
X-Git-Newrev: 5a5259c6404987fb31285fff2ef5498c26a739f3
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.123DB840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-flask-cors: security bump to v6.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a5259c6404987fb31285fff2ef5498c26a739f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This is a major version bump, because it could break user code that depends
on the (wrong) previous logic fixed by the new release

See the release notes:
- https://github.com/corydolphin/flask-cors/releases/tag/6.0.0
- https://github.com/corydolphin/flask-cors/releases/tag/6.0.1

This fixes the following vulnerabilities:
- CVE-2024-6839:
    corydolphin/flask-cors version 4.0.1 contains an improper regex path
    matching vulnerability. The plugin prioritizes longer regex patterns
    over more specific ones when matching paths, which can lead to less
    restrictive CORS policies being applied to sensitive endpoints. This
    mismatch in regex pattern priority allows unauthorized cross-origin
    access to sensitive data or functionality, potentially exposing
    confidential information and increasing the risk of unauthorized
    actions by malicious actors.
    https://www.cve.org/CVERecord?id=CVE-2024-6839

- CVE-2024-6844:
    A vulnerability in corydolphin/flask-cors version 4.0.1 allows for
    inconsistent CORS matching due to the handling of the '+' character in
    URL paths. The request.path is passed through the unquote_plus
    function, which converts the '+' character to a space ' '. This
    behavior leads to incorrect path normalization, causing potential
    mismatches in CORS configuration. As a result, endpoints may not be
    matched correctly to their CORS settings, leading to unexpected CORS
    policy application. This can cause unauthorized cross-origin access or
    block valid requests, creating security vulnerabilities and usability
    issues.
    https://www.cve.org/CVERecord?id=CVE-2024-6844

- CVE-2024-6866:
    corydolphin/flask-cors version 4.01 contains a vulnerability where the
    request path matching is case-insensitive due to the use of the
    `try_match` function, which is originally intended for matching hosts.
    This results in a mismatch because paths in URLs are case-sensitive,
    but the regex matching treats them as case-insensitive. This
    misconfiguration can lead to significant security vulnerabilities,
    allowing unauthorized origins to access paths meant to be restricted,
    resulting in data exposure and potential data leaks.
    https://www.cve.org/CVERecord?id=CVE-2024-6866

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 04cd135b26406dcc31cb66af1480d53fffe81e59)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 41c232df36..7070b5462e 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  a6e8202cc008ef6f70ce75a7ae7f8d9d  flask_cors-5.0.0.tar.gz
-sha256  5aadb4b950c4e93745034594d9f3ea6591f734bb3662e16e255ffbf5e89c88ef  flask_cors-5.0.0.tar.gz
+md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
+sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 1119648370..d0923d665b 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 5.0.0
+PYTHON_FLASK_CORS_VERSION = 6.0.1
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
 PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
