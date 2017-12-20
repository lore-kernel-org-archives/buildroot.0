From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Dec 2017 11:26:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] erlang: remove non-SMP build option
In-Reply-To: <1513709144-12840-1-git-send-email-fhunleth@troodon-software.com>
References: <1513709144-12840-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20171220112604.6a560700@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Dec 2017 13:45:44 -0500, Frank Hunleth wrote:
> The non-SMP scheduler was deprecated with the Erlang/OTP 20.0 release and
> slated for removal with the next major Erlang release. Since the non-SMP
> scheduler isn't even built anymore, this option no longer has the
> intended effect of saving space or compile time. The SMP scheduler
> supports both SMP and non-SMP processors, so removing the option will
> not break any platforms.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - Added text to Config.in.legacy to explain the removal of the option
>     (suggested by Yann - I added to Config.in.legacy after thinking about
>      it, since anyone who previously selected this option may be surprised
>      to see the SMP scheduler in their process list.)
> 
>  Config.in.legacy         | 10 ++++++++++
>  package/erlang/Config.in | 10 ----------
>  package/erlang/erlang.mk |  4 ----
>  3 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index decbace..1607df6 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -153,6 +153,16 @@ config BR2_PACKAGE_GNUPG2_GPGV2
>  	  The gpgv2 executable is now named gpgv. The config option
>  	  has been renamed accordingly.
> 
> +config BR2_PACKAGE_ERLANG_SMP
> +	bool "erlang smp option removed"
> +	select BR2_LEGACY
> +	help
> +	  This option used to disable Erlang's SMP scheduler to save
> +	  space. Since Erlang 20.0 deprecated the non-SMP scheduler and
> +	  no longer builds it, it is no longer relevant. See the Erlang
> +	  20.0 release notes for more information. Note that the SMP
> +	  scheduler runs on both SMP and non-SMP CPUs.

As Yann explained, we do not want a Config.in.legacy option. Indeed,
the new behavior is identical to having the option enabled, so there is
no point in having a Config.in.legacy entry.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
