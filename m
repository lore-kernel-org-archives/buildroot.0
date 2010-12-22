From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Dec 2010 22:18:43 +0100
Subject: [Buildroot] [PATCH 2/7] imagemagick: remove *-config scripts
	from TARGET_DIR
In-Reply-To: <3f29fe94726ed9c3c04e46626f138dd026b7b9b7.1293038710.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 22 Dec 2010 18:25:21 +0100")
References: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<cover.1293038710.git.thomas.petazzoni@free-electrons.com>
	<3f29fe94726ed9c3c04e46626f138dd026b7b9b7.1293038710.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrn1tsjw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/imagemagick/imagemagick.mk |    8 ++++++++
 Thomas>  1 files changed, 8 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 Thomas> index aecf7ae..035ab7a 100644
 Thomas> --- a/package/imagemagick/imagemagick.mk
 Thomas> +++ b/package/imagemagick/imagemagick.mk
 Thomas> @@ -80,4 +80,12 @@ else
 Thomas>  IMAGEMAGICK_CONF_OPT += --without-tiff
 Thomas>  endif
 
 Thomas> +define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 Thomas> +	$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,	\
 Thomas> +		   $(addsuffix -config,			\
 Thomas> +		     Magick MagickCore MagickWand Wand))
 Thomas> +endef
 Thomas> +
 Thomas> +IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS

This (and the rest of the series) should presumably only be done if
!BR2_HAVE_DEVFILES?

-- 
Bye, Peter Korsgaard
