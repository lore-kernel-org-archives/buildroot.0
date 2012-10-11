From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Oct 2012 22:28:48 +0200
Subject: [Buildroot] [PATCH] scons: fix library installation directory
In-Reply-To: <1349821556-17510-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 9 Oct 2012 19:25:56 -0300")
References: <1349821556-17510-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fw5k4utb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On gentoo systems SCons setup.py tries to install into
 Gustavo> $(HOST_DIR)/usr/lib64 but SCons looks up for its stuff in
 Gustavo> $(HOST_DIR)/usr/lib instead hence breaking.
 Gustavo> Make it install into $(HOST_DIR)/usr/lib by force to avoid the issue, it
 Gustavo> shouldn't matter on other distributions.
 Gustavo> Version bumping doesn't fix it.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/scons/scons.mk |    2 +-
 Gustavo>  1 files changed, 1 insertions(+), 1 deletions(-)

 Gustavo> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
 Gustavo> index 2aed62c..878dcba 100644
 Gustavo> --- a/package/scons/scons.mk
 Gustavo> +++ b/package/scons/scons.mk
 Gustavo> @@ -7,7 +7,7 @@ define HOST_SCONS_BUILD_CMDS
 Gustavo>  endef
 
 Gustavo>  define HOST_SCONS_INSTALL_CMDS
 Gustavo> -	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr)
 Gustavo> +	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr --install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION))

Committed with the line wrapped after ~80 chars, thanks.

-- 
Bye, Peter Korsgaard
