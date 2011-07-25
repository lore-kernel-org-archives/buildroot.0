From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jul 2011 08:34:53 +0200
Subject: [Buildroot] [PATCH] toolchain: add user defined target LDFLAGS
	options
In-Reply-To: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 23 Jun 2011 12:21:21 +0300")
References: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
Message-ID: <87y5zmuauq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 Baruch> Allow the user to specify additional options for the target
 Baruch> LDFLAGS.  I use this to pass the -te500v2 option to the linker,
 Baruch> when using the CodeSourcery toolchain for PowerPC. This chooses
 Baruch> the correct CRT for e500 hard float. Otherwise I get errors
 Baruch> like

Committed, thanks.

What tree did you create this patch against? package/Makefile.in hasn't
looked like that since April, so I had to apply the patch manually.

 Baruch> ---
 Baruch>  package/Makefile.in           |    2 +-
 Baruch>  toolchain/toolchain-common.in |    5 +++++
 Baruch>  2 files changed, 6 insertions(+), 1 deletions(-)

 Baruch> diff --git a/package/Makefile.in b/package/Makefile.in
 Baruch> index 2ca8c31..a6cee06 100644
 Baruch> --- a/package/Makefile.in
 Baruch> +++ b/package/Makefile.in
 Baruch> @@ -81,7 +81,7 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 Baruch>  TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 Baruch>  endif
 
 Baruch> -TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 Baruch> +TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib $(BR2_TARGET_LDFLAGS)

You need to use qstrip as otherwise all the flags will be handled as a
single argument.

-- 
Bye, Peter Korsgaard
