Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F41C5AD48
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 22:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0986580B50;
	Sat,  8 Aug 2026 22:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjRhMuVZRFDN; Sat,  8 Aug 2026 22:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 525C080B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786226405;
	bh=vvFqOA7fIiUJsaQze2QGwRjElCdotVNMu2PNjg+EFVk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BJbALhOF3/lH7o15H84NjLGFsGCR2jj+XyJBqco9+9dMmKZVT3J5zcYYjQGkxYw33
	 PGx81k1W/p+DLvBcCTWjpPoIJDmh8YiqbQYVCtGlIOB03474x8VQGhkjpnkpxCS5Pr
	 +NV/XRUOQ6M0m1pRkBTOWf65mFWrCCQB940evJ1c72qg7XM+Ku7sm5gkeWlfjRKikf
	 cDW8aRXRYwoI0CbGb7nPL3gFzAfLcKmOXzhEn3qL6eK292KLZByR137TPmNiJxen70
	 y55Tax1wUrdSXXO9tCr0tdUGD8aQvCFEwUvyF7cSvGRmJMv10mRak46X07QeqvamDk
	 Zb7s8/7hRclwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 525C080B21;
	Sat,  8 Aug 2026 22:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 732FC282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 22:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 595984008D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 22:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cq9SwDrTOawC for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 22:00:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72DDC4005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72DDC4005A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72DDC4005A
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 21:59:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1x8ySH2hTZ-017L5h; Sat, 08
 Aug 2026 23:59:56 +0200
Message-ID: <4bf1b955-2be2-4f8f-9907-930661044308@gmx.de>
Date: Sat, 8 Aug 2026 23:59:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dowan Gullient <dowan.gullient@smile.fr>, buildroot@buildroot.org
References: <20260727144936.3553073-1-dowan.gullient@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260727144936.3553073-1-dowan.gullient@smile.fr>
X-Provags-ID: V03:K1:U1Wl47usO74CfpBILVqrvEPnufJNS/TbcytlokIGp4EXa1gNJWT
 pl7ODlxQmOWRnq/sAul+HJZSkcb67I+5EBN2VpwIfsTvaZirTO7uaixIy2pAa2V0iffBARU
 iNwGiuv+AgDtDYxLS4GnOOLMqy1O0RWIY3sDdx9rtGQgJUbMjf8R6MWIVUPnFdx3V1Px9+n
 NhagiMQPQ6OtRVh0nynpw==
UI-OutboundReport: notjunk:1;M01:P0:goUpEc6qGjs=;SAK4kyX778k01y7/sr7FmsBpTTu
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786226397; x=1786831197; i=fiona.klute@gmx.de;
 bh=8BOjAFUSY773nkvAgoAyZ0jX1LJJ0aypKoau2IEnOx4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MU8ff7JQ67zemocVsE8xC6CV43ORzLBIcj7qC4oOtPZ0qv113QH5IApK6Aw/Pb8z
 ej+9fJTGBCVovZu1EwvohK+85Cz4uybO++dcZ3nQnVzGc3vkL0yq/tNN+4GD0CrSn
 lR6GY8Zc97YcEk4pXCxLyYJySy3X2FB8n9x9g+4K1/HLWyx9MhqPjWF9fig+pZfHN
 pQAx83PawZwMIcMIWqTKpTNFLFhwc4f9BILTK96cfcX+6sBb3B+r4THWDi1PYL4eX
 zLPQo7Ru+gcQW6VAkvww8Ee2dR/P1/PAbrHQ0Z2eRqteug92ku4l4FuKa8btagaJn
 8i1o70TCRi2morbhgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MU8ff7JQ
Subject: Re: [Buildroot] [PATCH] utils/pkg-stats: add GitHub upstream status
 column
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dowan, everyone,

unfortunately I have to start with a SECURITY WARNING: Anyone who tested 
this patch and provided a GITHUB_TOKEN may have leaked it, see below for 
details.

Am 27.07.26 um 16:49 schrieb Dowan Gullient via buildroot:
> There is currently a lot of packages that were added to Buildroot a long
> time ago but are no longer maintained upstream. This can cause build
> failures due to compatiblity issues, or security problems.
> This patch thus adds a new "Upstream Status" column to the HTML output,
> located between "Upstream URL" and "CVEs", to track the activity of
> GitHub-hosted packages and help maintainers identify packages that may
> need to be removed.
> 
> The status is determined by querying the GitHub API for the repository's
> last push or update date ('pushed_at' or 'updated_at'):
> - "active" (green background): last activity <= 3 months
> - "lagging" (yellow background): last activity >= 6 months
> - "inactive" (red background): last activity >= 1 year
> - "API Limit" (white background): rate limit reached
> - "N/A" (white background): missing URL, invalid URL, or non-GitHub

The code in this patch queries not only Github, but also other 
package-related URLs matching

r"https?://(gitlab[^/]*\.[^/]+|code\.videolan\.org)/(.+)"

with the assumption they provide Gitlab API. This is where the security 
problem comes from: The Authorization header is set on the 
aiohttp.ClientSession object, so the token is sent in every request the 
session makes (unless explicitly overwritten, which does not happen 
here). This means a GITHUB_TOKEN, if any, will end up with the operators 
of those other sites, and (for plaintext HTTP URLs, including Github 
ones) may be recorded anywhere along the way.

So: Any GITHUB_TOKEN used with this patch should be revoked immediately.

I don't think "when was the last commit/release done" is a very useful 
metric in general, because it can't distinguish projects that have been 
abandoned and ones that are simply mature and didn't need fixing 
recently. Adding spurious warnings is a problem because it distracts 
from relevant ones, and encourages people to ignore warnings in general.

Whether a package has had unfixed security issues for a while is much 
more relevant. And build failures reveal themselves. ;-)

But if you or anyone else consider "recent activity" useful anyway: 
Anitya already records when the latest release (not commit) was 
published, and you can query that via API v2 [1]. Annoyingly that field 
is not returned when querying by distro & name, but the project ID 
needed for the request is part of the response to the request we already 
do (using the v1 API) in check_package_get_latest_version_by_distro(), 
so it'd be easy to add the query there (and add a "published_at" or 
similar field to pkg.latest_version). That would work for any package 
correctly configured in Anitya, not just those hosted on certain Git forges.

Simply adding the date of the latest release to the version info (not a 
warning, maybe grey if really old) may be a nice and neutral option.

> Note on API Rate Limits:
> To prevent hitting GitHub's unauthenticated API rate limits (60 req/hr)
> when scanning the whole package tree, users should export a GitHub
> personal access token [1] via the `GITHUB_TOKEN` environment variable
> with the command `export GITHUB_TOKEN=your_token` before running the
> script. If the rate limit is reached, the status gracefully falls back
> to displaying "API Limit".
> 
> [1] You can create one at https://github.com/settings/tokens

Not relevant if you use Anitya, but otherwise you should mention the 
exact required scopes (and the reason they are needed, if not obvious). 
And of course you'd need to ensure the token is only sent to the right 
host and only with HTTPS. Also, I think queries like this should be 
skipped without a token if it's practically certain users will hit rate 
limits otherwise.

I've marked this and the follow-up patch as "rejected" in Patchwork.

Best regards,
Fiona


[1] 
https://release-monitoring.org/static/docs/api.html#get--api-v2-versions-

> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
> ---
>   support/scripts/pkg-stats | 177 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 167 insertions(+), 10 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 2b2194b9a5..29376b9e78 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -91,6 +91,7 @@ class Package:
>       all_licenses = dict()
>       all_license_files = list()
>       all_versions = dict()
> +    all_sites = dict()
>       all_ignored_cves = dict()
>       all_cpeids = dict()
>       # This is the list of all possible checks. Add new checks to this list so
> @@ -125,8 +126,10 @@ class Package:
>           self.ignored_cves = list()
>           self.unsure_cves = list()
>           self.stale_cve_ignores = list()
> -        self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
> +        self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None, 'backend': None, 'version_url': None}
>           self.status = {}
> +        self.upstream_status = ("na", "N/A")
> +        self.site = None
>   
>       def pkgvar(self):
>           return self.name.upper().replace("-", "_")
> @@ -265,6 +268,14 @@ class Package:
>           if var in self.all_versions:
>               self.current_version = self.all_versions[var]
>   
> +    def set_site(self):
> +        """
> +        Fills in the .site field from _SITE make variable
> +        """
> +        var = self.pkgvar()
> +        if var in self.all_sites:
> +            self.site = self.all_sites[var]
> +
>       def set_cpeid(self):
>           """
>           Fills in the .cpeid field
> @@ -421,7 +432,7 @@ def package_init_make_info():
>       # Fetch all variables at once
>       variables = subprocess.check_output(["make", "--no-print-directory", "-s",
>                                            "BR2_HAVE_DOT_CONFIG=y", "printvars",
> -                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
> +                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID %_SITE"])
>       variable_list = variables.decode().splitlines()
>   
>       # We process first the host package VERSION, and then the target
> @@ -454,6 +465,10 @@ def package_init_make_info():
>                   continue
>               pkgvar = pkgvar[:-8]
>               Package.all_versions[pkgvar] = value
> +
> +        elif pkgvar.endswith("_SITE"):
> +            pkgvar = pkgvar[:-5]
> +            Package.all_sites[pkgvar] = value
>   
>           elif pkgvar.endswith("_IGNORE_CVES"):
>               pkgvar = pkgvar[:-12]
> @@ -504,8 +519,124 @@ async def check_package_urls(packages, verbose=False):
>               tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages), verbose=verbose)))
>           await asyncio.wait(tasks)
>   
> +async def check_git_status(session, pkg, npkgs, verbose=False):
> +    urls_to_try = []
> +
> +    if hasattr(pkg, 'site') and pkg.site:
> +       urls_to_try.append(pkg.site)
> +
> +    if pkg.latest_version and 'rmo_data' in pkg.latest_version:
> +            rmo = pkg.latest_version['rmo_data']
> +            if rmo:
> +                backend = str(rmo.get('backend') or '').lower()
> +
> +                for key in ['version_url', 'check_url', 'homepage', 'repository']:
> +                    val = rmo.get(key)
> +                    if val and isinstance(val, str):
> +                        # If Anitya only gives "owner/repo" for a known backend
> +                        if not val.startswith('http') and '/' in val:
> +                            if 'github' in backend:
> +                                urls_to_try.append(f"https://github.com/{val}")
> +                            elif 'gitlab' in backend:
> +                                urls_to_try.append(f"https://gitlab.com/{val}")
> +                            else:
> +                                urls_to_try.append(val)
> +                        else:
> +                            urls_to_try.append(val)
> +
> +    if pkg.url:
> +        urls_to_try.append(pkg.url)
> +
> +    api_url = None
> +    is_github = False
> +
> +    for url in urls_to_try:
> +        if not isinstance(url, str):
> +            continue
> +
> +        # Nettoyage de l'URL
> +        url = url.split('?')[0].split('#')[0]
> +
> +        match_github = re.search(r"https?://github\.com/(.+)", url)
> +        match_gitlab = re.search(r"https?://(gitlab[^/]*\.[^/]+|code\.videolan\.org)/(.+)", url)
> +
> +        if match_github:
> +            path = match_github.group(1)
> +            path = re.sub(r'\.git$', '', path)
> +            path = re.sub(r'/(?:tags|releases|tree|blob|commits).*$', '', path)
> +            path = path.strip('/')
> +            parts = path.split('/')
> +            if len(parts) >= 2:
> +                owner, repo = parts[0], parts[1]
> +                api_url = f"https://api.github.com/repos/{owner}/{repo}"
> +                is_github = True
> +                break
> +
> +        elif match_gitlab:
> +            import urllib.parse
> +            domain = match_gitlab.group(1)
> +            path = match_gitlab.group(2)
> +            path = re.sub(r'\.git$', '', path)
> +            path = re.sub(r'/(?:tags|releases|tree|blob|commits|-).*$', '', path)
> +            path = path.strip('/')
> +            project_path = urllib.parse.quote(path, safe='')
> +            api_url = f"https://{domain}/api/v4/projects/{project_path}"
> +            is_github = False
> +            break
> +
> +    if not api_url:
> +        pkg.upstream_status = ("na", "N/A")
> +        return
> +
> +    try:
> +        async with session.get(api_url) as resp:
> +            if resp.status in (403, 429) and is_github:
> +                if verbose:
> +                    print(f"[{pkg.name}] API Limit reached for {api_url}")
> +                pkg.upstream_status = ("na", "API Limit")
> +                return
> +            if resp.status == 200:
> +                data = await resp.json()
> +                # pushed_at is the last time a commit was pushed to the default branch on github or gitlab
> +                published_at = data.get('pushed_at') or data.get('updated_at') or data.get('last_activity_at')
> +                if published_at:
> +                    published_at = published_at.replace('Z', '+00:00')
> +                    pub_date = datetime.datetime.fromisoformat(published_at)
> +                    now = datetime.datetime.now(datetime.timezone.utc)
> +                    delta = now - pub_date
> +
> +                    if delta.days >= 365:
> +                        pkg.upstream_status = ("inactive", "inactive")
> +                    elif delta.days >= 180:
> +                        pkg.upstream_status = ("lagging", "lagging")
> +                    else:
> +                        pkg.upstream_status = ("active", "active")
> +                    return
> +            else:
> +                if verbose:
> +                    print(f"[{pkg.name}] HTTP {resp.status} - {api_url}")
> +
> +    except Exception as e:
> +        if verbose:
> +            print(f"[{pkg.name}] Network error at {api_url} : {e}")
> +
> +    pkg.upstream_status = ("na", "N/A")
> +
>   
> -def check_package_latest_version_set_status(pkg, status, version, identifier):
> +async def check_packages_upstream_status(packages, verbose=False):
> +    tasks = []
> +    connector = aiohttp.TCPConnector(limit_per_host=5)
> +    headers = HTTP_HEADERS.copy()
> +    if 'GITHUB_TOKEN' in os.environ:
> +        headers['Authorization'] = f"token {os.environ['GITHUB_TOKEN']}"
> +
> +    async with aiohttp.ClientSession(connector=connector, trust_env=True, headers=headers) as sess:
> +        for pkg in packages:
> +            tasks.append(asyncio.ensure_future(check_git_status(sess, pkg, len(packages), verbose=verbose)))
> +        if tasks:
> +            await asyncio.wait(tasks)
> +
> +def check_package_latest_version_set_status(pkg, status, version, identifier, backend=None, version_url=None):
>       pkg.latest_version = {
>           "status": status,
>           "version": version,
> @@ -542,7 +673,10 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
>               check_package_latest_version_set_status(pkg,
>                                                       RM_API_STATUS_FOUND_BY_DISTRO,
>                                                       version,
> -                                                    data['id'])
> +                                                    data['id'],
> +                                                    data.get('backend'),
> +                                                    data.get('version_url'))
> +            pkg.latest_version['rmo_data'] = data
>               return True
>   
>       except (aiohttp.ClientError, asyncio.TimeoutError):
> @@ -573,7 +707,10 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
>               check_package_latest_version_set_status(pkg,
>                                                       RM_API_STATUS_FOUND_BY_PATTERN,
>                                                       projects[0]['stable_versions'][0],
> -                                                    projects[0]['id'])
> +                                                    projects[0]['id'],
> +                                                    projects[0].get('backend'),
> +                                                    projects[0].get('version_url'))
> +            pkg.latest_version['rmo_data'] = projects[0]
>               return True
>   
>       except (aiohttp.ClientError, asyncio.TimeoutError):
> @@ -862,10 +999,10 @@ function expandField(fieldId){
>     background: white;
>     padding: 10px 2px 10px 2px;
>   }
> -#package-grid, #results-grid {
> +#package-grid {
>     display: grid;
>     grid-gap: 2px;
> -  grid-template-columns: min-content 1fr repeat(12, min-content);
> +  grid-template-columns: min-content 1fr repeat(13, min-content);
>   }
>   #results-grid {
>     grid-template-columns: 3fr 1fr;
> @@ -895,6 +1032,10 @@ function expandField(fieldId){
>    .cve_ignored, .version-error {
>     background: #ccc;
>    }
> + .status-inactive { background: #ff9a69; }
> + .status-lagging { background: #ffd870; }
> + .status-active { background: #d2ffc4; }
> + .status-na { background: #ffffff; }
>   
>   </style>
>   
> @@ -1072,6 +1213,14 @@ def dump_html_pkg(f, pkg):
>               url_str = pkg.status['url'][1]
>       f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
>   
> +    # Upstream Status (New GitHub Check)
> +    data_field_id = f'upstream_status__{pkg_css_class}'
> +    div_class = ["centered upstream_status data"]
> +    div_class.append(f'_{pkg_css_class}')
> +    status_val, status_text = pkg.upstream_status
> +    div_class.append(f"status-{status_val}")
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{status_text}</div>\n')
> +
>       # CVEs
>       data_field_id = f'cves__{pkg_css_class}'
>       div_class = ["centered cves data"]
> @@ -1176,11 +1325,13 @@ def dump_html_all_pkgs(f, packages):
>        class="centered warnings data label"><span>Warnings</span><span></span></div>
>   <div style="grid-column: 11;" onclick="sortGrid(this.id)" id="upstream_url"
>        class="centered upstream_url data label"><span>Upstream URL</span><span></span></div>
> -<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="cves"
> +<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="upstream_status"
> +     class="centered upstream_status data label"><span>Upstream Status</span><span></span></div>
> +<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cves"
>        class="centered cves data label"><span>CVEs</span><span></span></div>
> -<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="ignored_cves"
> +<div style="grid-column: 14;" onclick="sortGrid(this.id)" id="ignored_cves"
>        class="centered ignored_cves data label"><span>CVEs Ignored</span><span></span></div>
> -<div style="grid-column: 14;" onclick="sortGrid(this.id)" id="cpe_id"
> +<div style="grid-column: 15;" onclick="sortGrid(this.id)" id="cpe_id"
>        class="centered cpe_id data label"><span>CPE ID</span><span></span></div>
>   """)
>       for pkg in sorted(packages):
> @@ -1374,6 +1525,7 @@ def main():
>           if "warnings" not in args.disable:
>               pkg.set_check_package_warnings()
>           pkg.set_current_version()
> +        pkg.set_site()
>           pkg.set_cpeid()
>           pkg.set_url()
>           pkg.set_ignored_cves()
> @@ -1388,6 +1540,11 @@ def main():
>           loop = asyncio.new_event_loop()
>           asyncio.set_event_loop(loop)
>           loop.run_until_complete(check_package_latest_version(packages, verbose=args.verbose))
> +    if "upstream_status" not in args.disable:
> +        print("Checking GitHub upstream status")
> +        loop = asyncio.new_event_loop()
> +        asyncio.set_event_loop(loop)
> +        loop.run_until_complete(check_packages_upstream_status(packages, verbose=args.verbose))
>       if "cve" not in args.disable and args.nvd_path:
>           print("Checking packages CVEs")
>           check_package_cves(args.nvd_path, packages)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
