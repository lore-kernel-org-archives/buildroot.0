From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 20:48:13 +0200
Subject: [Buildroot] [PATCH 01/13 v7] support/scripts: add helper to
 hardlink-or-copy
In-Reply-To: <7c92d1e222419fef1422295dd3027ec4e205fca5.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <7c92d1e222419fef1422295dd3027ec4e205fca5.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <7e8771df-0900-deba-a33f-a1094e8cd560@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 18:14, Yann E. MORIN wrote:
> When preparing the legal-info, the source archives are copied in the
> legal-info/ output directory. When the archives are big, it can take
> quite a bit of time and unnecessarily uses disk space. When the
> legal-info output directory is on the same filesystem as the BR2_DL_DIR,
> we can easily reduce copy time and disk usage by just using hardlins
> instead of copying. However, the BR2_DL_DIR may be on a different
> filesystem, so we must fallback to copying in this case
>
> Introduce a helper script that copies a source file into a destination
> directory, by first attempting to hard-link, and falling back to a
> plain copy in case the hardlink fails.
>
> In case the destination already exists, it is forcibly removed first, to
> avoid clobering any existing target file (and especially any hardlink to
> it), since cp -f does not remove the destination file, but clobbers it.
>
> In some situations, it will be necessary that the destination file is
> named differently than the source, so if a third argument is specified,
> it is treated as the basename of the destination file.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
