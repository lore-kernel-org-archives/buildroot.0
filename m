Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F282AC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0B58223C;
	Fri, 26 Jun 2026 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nb7hLTOCL9LN; Fri, 26 Jun 2026 14:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E703E82254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485425;
	bh=9oudy+0Ivl8xRiElpKkOflWcMk9CgerPVDPMILN/UnQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VieDqLWm+O7SBEYpwNKJ7r8jv1br+vftP6+PEepuLRXVHIgfSAHjUR2J2moWLx7pn
	 9+FPrmO/JnQTPUy+2dLCPO5JXmuYi8y93oXVzvYA+16i740n3ZdK/z9hzITJNdaEut
	 4fv/wqjJD6jQ5rb6OD9KuMvyX1qcoejCJanYzv4JURhwzDYsDti/ogVeg1qr/J7rLJ
	 uFSPz+T3/NF9tcauyrp6J8FUTGOIjwPEs4AQg098ATdimosl6+6YBJw7LZiY39puoy
	 /HqDmVrLG2p7P1/beZKf3iqL7DtV1KTg+WnikrbjbuyTmW7FMGG2ilp8BrydmtEW8N
	 SlR1pVaezcmQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E703E82254;
	Fri, 26 Jun 2026 14:50:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B0B0231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F98C81FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFDxheSBKdbd for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D908222B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D908222B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 953CD863C5; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:42:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 986148e45b23ef8e5bec8967a1b5cc11c93c6f17
X-Git-Newrev: 82b533e3dbb0622ba05036c5069cf3f7b6bce59b
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.953CD863C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
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
Content-Type: multipart/mixed; boundary="===============8547390516226000420=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8547390516226000420==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82b533e3dbb0622ba05036c5069cf3f7b6bce59b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
 

--===============8547390516226000420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8547390516226000420==--
