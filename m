From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 12 Oct 2018 09:43:13 +0200
Subject: [Buildroot] [PATCH 1/6] core: add a variable that points to the
 package's hash file
In-Reply-To: <cfde037a6eb1c1fe64bb3c5ad9b6e490ad22be8f.1538913431.git.yann.morin.1998@free.fr>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
 <cfde037a6eb1c1fe64bb3c5ad9b6e490ad22be8f.1538913431.git.yann.morin.1998@free.fr>
Message-ID: <c2b58578-ae88-ff1a-ca60-05eccba7b0a4@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/10/2018 13:57, Yann E. MORIN wrote:
> When a package has a version selection (e.g. Qt5), the licensing terms
> may be different across versions, but lie in similarly named files (e.g.
> 'LICENSE').
> 
> However, when we check a file, all the hashes for it must match. So, we
> can't have the hashes for two different content of the same file. We
> overcame that limitation in the legal-license-file macro, which checks
> whether a package has a .hash file in a versioned subdir.
> 
> For consistency, we would like to also store the source hashes in that
> per-version subdir.
> 
> Rather than reconstruct the path to the hash file everywhere we need it,
> add a variable that points to it.
> 
> Existing users will be converted over in followup patches.
> 
> Note: the check for a missing hash file is done in the check-hash helper
> script, so this variable must always yield a filename, even of a missing
> file, thus we do not use $(wildcard...) to resolve the hash file path;
> we use $(wildcard...) only to check if the versioned .hash file exists.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
