From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Jun 2012 23:34:10 +0200
Subject: [Buildroot] [PATCH] nanocom: new package
In-Reply-To: <1338371933-10465-1-git-send-email-spdawson@gmail.com>
References: <1338371933-10465-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FCD29D2.2040802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/30/12 11:58, spdawson at gmail.com wrote:
[snip]
> diff --git a/package/nanocom/nanocom-dont-clobber-CC-definition.patch 
> b/package/nanocom/nanocom-dont-clobber-CC-definition.patch
> new file mode 100644
> index 0000000..a7bddd1
> --- /dev/null
> +++ b/package/nanocom/nanocom-dont-clobber-CC-definition.patch
> @@ -0,0 +1,23 @@
> +Fix the nanocom Makefile so that it doesn't clobber an existing CC definition.
> +
> +Signed-off-by: Simon Dawson<spdawson@gmail.com>
> +
> +diff -Nurp a/Makefile b/Makefile
> +--- a/Makefile    2005-08-05 23:06:48.000000000 +0100
> ++++ b/Makefile    2012-05-30 10:46:11.378152722 +0100
> +@@ -12,7 +12,7 @@
> + #** GNU General Public License for more details atwww.gnu.org
> + #****************************************************************************/
> +
> +-CC=gcc
> ++CC?=gcc

  Are you sure this is needed?  Make is called like
make ... CC=...

so the CC=... overrides any definition in the Makefile itself.

[snip]
> +NANOCOM_VERSION = 2.6.1
> +NANOCOM_SOURCE = nanocom.tar.gz
> +NANOCOM_SITE =http://prdownloads.sourceforge.net/nanocom/$(NANOCOM_SOURCE)?download
  http://$(BR2_SOURCEFORGE_MIRROR)/project/nanocom/nanocom/v1.0
works as well AFAICS.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
