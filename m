Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687C4C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4010F61092;
	Fri, 26 Jun 2026 14:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoIGdXgV10kL; Fri, 26 Jun 2026 14:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A69361085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485538;
	bh=KWz0QOGHKy2wEpNOeX/UgjQctnzMY2SHMID5ap/QOCI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QGR2fA6Sf8ZO5lBK5OYAYnAsfpYa5PdaYzrdQ+Lov/mLjxL5d1o9B/r+gJDUb+RBm
	 Ec6JLjJaKe/WYpzgIjhdmIZF8kc3M6zHQv7PxgK+EgXMBSsnms+vIC4DBVSXOrP8x7
	 VGcLGGrZVAEq7dJGcSHYtWwwgG7s4IL/d5cg9uebV6teijylT5OG9dSU/yK1GSo+yO
	 MG2kVK8v50nzufehp9qlJK4Gus5UfVot1w6xVa+EoYie+fPpfeZ3UE6uAQFydDMkem
	 8bbJpGwoUOfgWeFZisAZ8WLOum1G8v3q2cEGoX4ROMOVJtJbmUMIAZ4PdLMF52xGZA
	 etARuK6ub7K4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A69361085;
	Fri, 26 Jun 2026 14:52:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA60A3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC30E60FCD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hynTY31g85xS for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59CE60F72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E59CE60F72
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6F27847A3; Fri, 26 Jun 2026 14:51:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:42:53 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c9b6846a214f95aacdc74af86c4e0f7dbbfd1063
X-Git-Newrev: 4aeeffe1666f361a0abfc34264040a32699e5780
X-Patchwork-Hint: ignore
Message-Id: <20260626145122.E6F27847A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] utils/generate-cyclonedx:
 fixup scp-style git sites
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
Content-Type: multipart/mixed; boundary="===============8691154137396748240=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8691154137396748240==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4aeeffe1666f361a0abfc34264040a32699e5780
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Commit e8c54ffb3d ("utils/generate-cyclonedx: generate vcs
externalReferences for source repos") added externalReferences to the source
code of packages.

This unfortunately causes issues with packages (in br2-external) fetching
from git using the scp-like syntax, E.G.:

 FOO_SITE_METHOD = git
 FOO_SITE = git@github.com:<project>/<repo>.git

Which ends up in the SBOM as:

[
  {
    "type": "vcs",
    "url": "git@github.com:<project>/<repo>.git",
    "comment": "git repository"
  }
]

This (correctly) causes Dependency track to reject the SBOM import with:

{
  "status": 400,
  "title": "The uploaded BOM is invalid",
  "detail": "Schema validation failed",
  "errors": [
    "$.components[2].externalReferences[0].url: does not match the iri-reference pattern must be a valid RFC 3987 IRI-reference",
    "$.components[2].externalReferences[0].url: does not match the iri-reference pattern must be a valid RFC 3987 IRI-reference",
    "$.components[2].externalReferences[0].url: does not match the regex pattern ^urn:cdx:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/[1-9][0-9]*$",
   ]
}

The CycloneDX spec indeed requires a URI:

The URI (URL or URN) to the external reference.  External references are
URIs and therefore can accept any URL scheme including https (RFC-7230),
mailto (RFC-2368), tel (RFC-3966), and dns (RFC-4501)

https://cyclonedx.org/docs/1.6/json/#metadata_tools_oneOf_i0_components_items_externalReferences_items_url

The user@host:project/repo.git is a git-specific shorthand for a git-over-ssh URL. From man git-clone:

 Git supports ssh, git, http, and https protocols (in addition, ftp and ftps
 can be used for fetching, but this is inefficient and deprecated; do not use
 them).

 The native transport (i.e.  git:// URL) does no authentication and should
 be used with caution on unsecured networks.

 The following syntaxes may be used with them:

 •   ssh://[user@]host.xz[:port]/path/to/repo.git/
 •   git://host.xz[:port]/path/to/repo.git/
 •   http[s]://host.xz[:port]/path/to/repo.git/
 •   ftp[s]://host.xz[:port]/path/to/repo.git/

 An alternative scp-like syntax may also be used with the ssh protocol:

 •   [user@]host.xz:path/to/repo.git/

So convert the scp-like syntax to ssh:// URLs in parse_uris() for spec
compliance.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ebcfdb8b0ae0077525558376ff9199ba6b6a34f5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index bade018cd4..df12ee84c0 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -280,6 +280,12 @@ def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
         scheme, _, stripped_uri = uri.partition("+")
         if stripped_uri:
             parsed = urllib.parse.urlparse(stripped_uri)
+
+            # convert scp-style host:path site to ssh:// uri
+            if scheme == "git" and not parsed.scheme:
+                host, _, path = stripped_uri.partition(":")
+                stripped_uri = "ssh://" + host + "/" + path
+
             if parsed.hostname != "sources.buildroot.net":
                 yield scheme.split("|"), stripped_uri
 

--===============8691154137396748240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8691154137396748240==--
