From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 13:28:27 +0200
Subject: [Buildroot] [PATCH 3 of 6 resend] pkg-download.mk: support
 detection of URI schemes in DOWNLOAD
In-Reply-To: <8cbde66c4041f84f6c45.1340343756@beantl019720>
References: <patchbomb.1340343753@beantl019720>
 <8cbde66c4041f84f6c45.1340343756@beantl019720>
Message-ID: <5002A95B.9030605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/12 07:42, Thomas De Schampheleire wrote:
> When using one of the package infrastructures, the DOWNLOAD function
> uses $(PKG)_SITE_METHOD to determine the appropriate download method,
> which is autodetected based on the URI if none was explicitly set.
>
> When the DOWNLOAD function is called directly, for example when
> downloading a toolchain, or from a package that does not use one of
> the package infrastructures, the SITE_METHOD is not autodetected,
> and thus the download defaults to wget.
>
> This patch adds URI scheme detection directly to the DOWNLOAD method,
> in case no SITE_METHOD was detected yet.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Maybe the default definition of PKG_SITE_METHOD can be removed then?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
