From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Oct 2017 15:43:31 +0200
Subject: [Buildroot] [PATCH 1/2] Use HOSTCC_NOCCACHE for both
 core-dependencies and DEPENDENCIES_HOST_PREREQ
In-Reply-To: <1493372121-32177-1-git-send-email-alfredo.alvarez_fernandez@nokia.com>
References: <1493372121-32177-1-git-send-email-alfredo.alvarez_fernandez@nokia.com>
Message-ID: <efc013bf-90ed-d6c2-ae6e-12ef3335b50e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-04-17 11:35, Alfredo Alvarez Fernandez wrote:
> This also fixes make clean host-ccache
> 
> Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>

 Both applied to master, thanks. I extended the commit message quite a bit,
because it was not at all clear why this was needed.

 Regards,
 Arnout

> ---
>  support/dependencies/dependencies.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
> index d4b0409..ef2ae9b 100644
> --- a/support/dependencies/dependencies.mk
> +++ b/support/dependencies/dependencies.mk
> @@ -23,8 +23,8 @@ core-dependencies:
>  		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
>  		$(TOPDIR)/support/dependencies/dependencies.sh
>  
> -dependencies: HOSTCC=$(HOSTCC_NOCCACHE)
> -dependencies: HOSTCXX=$(HOSTCXX_NOCCACHE)
> +core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
> +core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
>  dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
>  
>  ################################################################################
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
