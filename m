Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC10C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE2C283E1A;
	Sat,  2 Apr 2022 17:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N2fb-zhUafhu; Sat,  2 Apr 2022 17:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AE583E15;
	Sat,  2 Apr 2022 17:20:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4ED71BF968
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCBA41853
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49L6xiksC8TM for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:20:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA929417D6
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:20:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bcfa:8d59:a850:4621])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B1A52780350;
 Sat,  2 Apr 2022 19:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648920014;
 bh=DKdNlRJusTnKRsQO5QPwAyVHFupIuzHPScpoKpTASfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vGaCc3Ohwl2187vs96W4DFVyWETeVsVxYw+lO4yDOMDx383IqB6+rLtkiURVhb6Pt
 +4VE0q2U+/zppjTzv3MS5Q/NmSnuvnN/0GLDAjtAyQnGHCwVbRJI2rdQ91creLomKd
 o1Oi/HWJdwJKqXBYjCjjlh69xwwgAJ2rc3Vtfo6VLyWA5QmDWQwKkKdZj1cbXoZQBO
 IdgXD4qZHKCsKn1VGnBj0lI3G9pSfFdvv4PgFzKwLtR2OLREb6grgJ8V8xXAwXgdnH
 gVkjTer3OnqXt6r8gWEsHoMPa0QpreQQY9ZkjkBn25LLLkpsuVvoeUI4I2L2rscE1y
 Z2lMONPTATm4A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Apr 2022 19:20:12 +0200
Date: Sat, 2 Apr 2022 19:20:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220402172012.GB1811301@scaer>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
 <20220402141531.1320584-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402141531.1320584-4-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 4/4] support/scripts/pkg-stats: reimplement
 CPE parsing in pkg-stats
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-04-02 16:15 +0200, Thomas Petazzoni via buildroot spake thusly:
> pkg-stats currently uses the services from support/scripts/cpedb.py to
> match the CPE identifiers of packages with the official CPE database.
> 
> Unfortunately, the cpedb.py code uses regular ElementTree parsing,
> which involves loading the full XML tree into memory. This causes the
> pkg-stats process to consume a huge amount of memory:
> 
> thomas   1310458 85.2 21.4 3708952 3450164 pts/5 R+   16:04   0:33  |   |   \_ python3 ./support/scripts/pkg-stats
> 
> So, 3.7 GB of VSZ and 3.4 GB of RSS are used by the pkg-stats
> process. This is causing the OOM killer to kick-in on machines with
> relatively low memory.
> 
> This commit reimplements the XML parsing needed to do the CPE matching
> directly in pkg-stats, using the XmlParser functionality of
> ElementTree, also called "streaming parsing". Thanks to this, we never
> load the entire XML tree in RAM, but only stream it through the
> parser, and construct a very simple list of all CPE identifiers. The
> max memory consumption of pkg-stats is now:
> 
> thomas   1317511 74.2  0.9 381104 152224 pts/5   R+   16:08   0:17  |   |   \_ python3 ./support/scripts/pkg-stats
> 
> So, 381 MB of VSZ and 152 MB of RSS, which is obviously much better.
> 
> Now, one will probably wonder why this isn't directly changed in
> cpedb.py. The reason is simple: cpedb.py is also used by
> support/scripts/missing-cpe, which (for now) heavily relies on having
> in memory the ElementTree objects, to re-generate a snippet of XML
> that allows us to submit to NIST new CPE entries.
> 
> So, future work could include one of those two options:
> 
>  (1) Re-integrate cpedb.py into missing-cpe directly, and live with
>      two different ways of processing the CPE database.
> 
>  (2) Rewrite the missing-cpe logic to also be compatible with a
>      streaming parsing, which would allow this logic to be again
>      shared between pkg-stats and missing-cpe.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index ae1a9aa5e4..cc163ebb1a 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -27,12 +27,14 @@ import re
>  import subprocess
>  import json
>  import sys
> +import time
> +import gzip
> +import xml.etree.ElementTree

You for to import requests, which is used later on.

I also fixed a bunch of flake8 issues:

    support/scripts/pkg-stats:49:1: E302 expected 2 blank lines, found 1
    support/scripts/pkg-stats:632:9: E306 expected 1 blank line before a nested definition, found 0
    support/scripts/pkg-stats:635:9: E306 expected 1 blank line before a nested definition, found 0
    support/scripts/pkg-stats:639:5: E303 too many blank lines (2)
    1     E302 expected 2 blank lines, found 1
    1     E303 too many blank lines (2)
    2     E306 expected 1 blank line before a nested definition, found 0

>  brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
>  
>  sys.path.append(os.path.join(brpath, "utils"))
>  from getdeveloperlib import parse_developers  # noqa: E402
> -from cpedb import CPEDB  # noqa: E402
>  
>  INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
>  URL_RE = re.compile(r"\s*https?://\S*\s*$")
> @@ -42,6 +44,7 @@ RM_API_STATUS_FOUND_BY_DISTRO = 2
>  RM_API_STATUS_FOUND_BY_PATTERN = 3
>  RM_API_STATUS_NOT_FOUND = 4
>  
> +CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"

Instead of duplicating it here, I changed that to import it from cpedb.

Applied to master with all the aboved fixed, thanks.

Regards,
Yann E. MORIN.

>  class Defconfig:
>      def __init__(self, name, path):
> @@ -624,12 +627,40 @@ def check_package_cves(nvd_path, packages):
>  
>  
>  def check_package_cpes(nvd_path, packages):
> -    cpedb = CPEDB(nvd_path)
> -    cpedb.get_xml_dict()
> +    class CpeXmlParser:
> +        cpes = []
> +        def start(self, tag, attrib):
> +            if tag == "{http://scap.nist.gov/schema/cpe-extension/2.3}cpe23-item":
> +                self.cpes.append(attrib['name'])
> +        def close(self):
> +            return self.cpes
> +
> +
> +    print("CPE: Setting up NIST dictionary")
> +    if not os.path.exists(os.path.join(nvd_path, "cpe")):
> +        os.makedirs(os.path.join(nvd_path, "cpe"))
> +
> +    cpe_dict_local = os.path.join(nvd_path, "cpe", os.path.basename(CPEDB_URL))
> +    if not os.path.exists(cpe_dict_local) or os.stat(cpe_dict_local).st_mtime < time.time() - 86400:
> +        print("CPE: Fetching xml manifest from [" + CPEDB_URL + "]")
> +        cpe_dict = requests.get(CPEDB_URL)
> +        open(cpe_dict_local, "wb").write(cpe_dict.content)
> +
> +    print("CPE: Unzipping xml manifest...")
> +    nist_cpe_file = gzip.GzipFile(fileobj=open(cpe_dict_local, 'rb'))
> +
> +    parser = xml.etree.ElementTree.XMLParser(target=CpeXmlParser())
> +    while True:
> +        c = nist_cpe_file.read(1024*1024)
> +        if not c:
> +            break
> +        parser.feed(c)
> +    cpes = parser.close()
> +
>      for p in packages:
>          if not p.cpeid:
>              continue
> -        if cpedb.find(p.cpeid):
> +        if p.cpeid in cpes:
>              p.status['cpe'] = ("ok", "verified CPE identifier")
>          else:
>              p.status['cpe'] = ("error", "CPE version unknown in CPE database")
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
