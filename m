Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8FACD98F2
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 10:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36A006FCFA;
	Sun, 21 Jun 2026 10:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVGVnT0Z9xY6; Sun, 21 Jun 2026 10:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 702886FC85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782038239;
	bh=LmIZKCfEuUBUVI9sqKloiXYQLq0KJY4BR+1M4SWs6jI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hXTT7EJ2k2utII7ex3+tVdjwPDG/FvOtG2wCol9bTPq4XQOILywDRflxQQsWqKM/J
	 cv1jmYKPE/63L+62QCT+GSpuaGyc5VMUcgKiRILKkn9n/HXF6lAGoXydQ2/HKnprf5
	 S1tew+3RHrGT5LaPOuJkIUc28bldXND3c3i9zDn1oKgylzRHAVbxftu+1lRjx/p0Cr
	 HgTLS46X2dVAaU3HixSzsip8IchSdbiQjLs57bgzU++ORSfAGGyJSaVzy/axv2dpa5
	 9LWPSpVSGReFgxdbJ5EJ4A70mM8X8Zv5J/uUrH0Xsiq4eDbI4jxNCdzsxAAvPYhAEE
	 82agNpDyuoOEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 702886FC85;
	Sun, 21 Jun 2026 10:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74790118
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71E1142ECE
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e130-ctiUzIF for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 10:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B984742C07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B984742C07
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:37:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34C31832B0; Sun, 21 Jun 2026 10:36:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jun 2026 12:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f72bec788a9206dbfc7079df4dcbdb49817d486
X-Git-Newrev: ebcfdb8b0ae0077525558376ff9199ba6b6a34f5
X-Patchwork-Hint: ignore
Message-Id: <20260621103653.34C31832B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: fixup scp-style
 git sites
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4208443591864924845=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4208443591864924845==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ebcfdb8b0ae0077525558376ff9199ba6b6a34f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
 

--===============4208443591864924845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4208443591864924845==--
