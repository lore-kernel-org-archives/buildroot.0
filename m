From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 4 Apr 2012 10:15:25 +0100
Subject: [Buildroot] [PATCH] rpm: Fix automagic dependency on openssl
In-Reply-To: <87k41wv710.fsf@macbook.be.48ers.dk>
References: <1333442128-16629-1-git-send-email-markos.chandras@imgtec.com>
 <87k41wv710.fsf@macbook.be.48ers.dk>
Message-ID: <4F7C112D.7080309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/2012 10:29 PM, Peter Korsgaard wrote:

>>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:
> 
>  Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>  Markos> ---
>  Markos>  package/rpm/rpm.mk |    7 +++++++
>  Markos>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
>  Markos> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
>  Markos> index 9f42ee1..47c2ee9 100644
>  Markos> --- a/package/rpm/rpm.mk
>  Markos> +++ b/package/rpm/rpm.mk
>  Markos> @@ -17,6 +17,13 @@ RPM_CONF_OPT = --disable-build-versionscript
> --disable-rpath \
>  Markos>        --with-libbeecrypt=$(STAGING_DIR) \
>  Markos>        --with-popt=$(STAGING_DIR)
> 
>  Markos> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  Markos> +RPM_DEPENDENCIES += openssl
>  Markos> +RPM_CONF_OPT += --with-openssl=external
>  Markos> +else
>  Markos> +RPM_CONF_OPT += --with-openssl=no
>  Markos> +endif
> 
> Hmm, this makes sense but BR2_PACKAGE_RPM selects
> BR2_PACKAGE_OPENSSL. Is openssl optional? If so, please drop the select
> line in Config.in.
> 
> --
> Bye, Peter Korsgaard
> 

Hi Peter,

You are right. All it needs is the --with-openssl=external switch in
RPM_CONF_OPT. I will send a new patch asap.

-- 
markos
