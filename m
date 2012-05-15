From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 23:23:04 +0200
Subject: [Buildroot] [PATCH] logsurfer: new package
In-Reply-To: <1337067382-19212-1-git-send-email-faessler@was.ch>
References: <1337067382-19212-1-git-send-email-faessler@was.ch>
Message-ID: <4FB2C938.2000706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hoi Dominik,

  Thank you for your contribution.  You patch looks very good, with a few
small remarks.

  Please add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://kerneltrap.org/files/Jeremy/DCO.txt for more
details.

On 05/15/12 09:36, Dominik F?ssler wrote:
[snip]
> --- /dev/null
> +++ b/package/logsurfer/logsurfer.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# logsurfer
> +#
> +#############################################################
> +
> +LOGSURFER_VERSION = 1.8
> +LOGSURFER_SOURCE = logsurfer-$(LOGSURFER_VERSION).tar.gz
> +LOGSURFER_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/logsurfer/logsurfer/logsurfer-${LOGSURFER_VERSION}

  We try to be consistent in using $() to reference variables, rather than
${}.

> +define LOGSURFER_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/logsurfer $(TARGET_DIR)/bin
> +endef
> +
> +$(eval $(call AUTOTARGETS,package,logsurfer))

  The arguments to AUTOTARGETS are no longer necessary.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
