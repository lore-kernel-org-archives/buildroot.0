From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 12 Oct 2018 09:45:03 +0200
Subject: [Buildroot] [PATCH 4/6] core/download: do not hard-code the
 path to hte package hash file
In-Reply-To: <a3bc31d31ce5fd69e68d41d0e725c910d998a45f.1538913431.git.yann.morin.1998@free.fr>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
 <a3bc31d31ce5fd69e68d41d0e725c910d998a45f.1538913431.git.yann.morin.1998@free.fr>
Message-ID: <ed7b2903-3d49-6303-dd0b-149ec17474ed@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/10/2018 13:57, Yann E. MORIN wrote:
> Now that packges may have hashes for their downloaded files in a
> versioned subdir or in the unversioned hash file, we can no longer
> hard-code the path to the package hash file anymore.
> 
> Instead, we now make use of the per-package variable, that points to the
> package hash file.
> 
> Note: of the packages for which we offer a version choice, almost none,
> but some of the qt5 ones, have a per-version hash file, so we still use
> the unversioned hash file for them. As for the few qt5 packages that do
> have a per-version hash file for their licensing terms, they've already
> been updated to duplicate their download hashes in both the unversioned
> and per-version hash files. So, one way or the other, no hash check
> would go missing with this change.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Baruch Siach <baruch@tkos.co.il>

Minor nit: "hte" -> "the" in the subject line.

Anyway,
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
