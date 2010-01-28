From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 17:49:01 +0100
Subject: [Buildroot] [PATCH 06/15] bash: fix configuration
In-Reply-To: <1263768063-24133-7-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Sun, 17 Jan 2010 23:40:54 +0100")
References: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
	<1263768063-24133-7-git-send-email-llandwerlin@gmail.com>
Message-ID: <87pr4umayq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Patch bash32-011 modifies the configure.in script. Therefor we need to
 llandwerlin> run autoconf before launching the configure script. Otherwise, once
 llandwerlin> the configure script called, the makefile's dependencies over
 llandwerlin> configure.in will relaunch autoconf without options/environnement
 llandwerlin> variables we usually set when calling configure.

 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/bash/bash.mk |    3 ++-
 llandwerlin>  1 files changed, 2 insertions(+), 1 deletions(-)

 llandwerlin> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
 llandwerlin> index 705ce8d..08039e2 100644
 llandwerlin> --- a/package/bash/bash.mk
 llandwerlin> +++ b/package/bash/bash.mk
 llandwerlin> @@ -32,7 +32,8 @@ $(BASH_DIR)/.unpacked: $(DL_DIR)/$(BASH_SOURCE)
 llandwerlin>  $(BASH_DIR)/.configured: $(BASH_DIR)/.unpacked
 llandwerlin>  	# bash_cv_have_mbstate_t=yes
 llandwerlin>  	(cd $(BASH_DIR); rm -rf config.cache; \
 llandwerlin> -		$(TARGET_CONFIGURE_OPTS) \
 llandwerlin> +                autoconf && \

That should be $(AUTOCONF) and we need a dependency on
host-autoconf. Will fix myself.

-- 
Bye, Peter Korsgaard
