From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 30 Nov 2017 11:31:53 -0500
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <20171130154202.437-1-johan.oudinet@gmail.com>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
Message-ID: <CA+-urNSgFcRjQz1pce9iG-7dxw0_BLC5M1Jt6cvLamqfarstGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

On Thu, Nov 30, 2017 at 10:42 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
>
> This change bumps the Erlang version from 19.3 to 20.0. As a new major
> release, there are a few incompatibilities. Details are here:
> http://www.erlang.org/news/114

Thanks for doing this. I had been holding on to a nearly identical
patch, but it breaks several erlang packages currently in Buildroot.
It didn't look easy to fix, and then I got busy. As I'm sure that
you're aware, ejabberd builds fine. I don't think there are many of us
Erlang/Buildroot users, so if this still breaks erlang packages that
you don't use, I'm fine with removing them.

Two comments:

1. Do you want to bump to Erlang 20.1 since that's the latest?
2. Should we remove support for non-SMP builds now that it's
deprecated? I've actually never used the option due to it disabling
NIF features used by some libraries.

Having said that, I'd prefer this patch in than not since it moves
Buildroot forward, so

Reviewed-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks!
Frank


>
> This should fix builds on ppc64le host machines:
> http://autobuild.buildroot.net/results/407af9800313d4540643d7625e85acc0c2366892
> http://autobuild.buildroot.net/results/2aca54ad48ecfd72242d97499e21a46c1b384b10
>
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/erlang/erlang.hash | 4 ++--
>  package/erlang/erlang.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
> index dc12ccd062..cf820cec1b 100644
> --- a/package/erlang/erlang.hash
> +++ b/package/erlang/erlang.hash
> @@ -1,3 +1,3 @@
>  # md5 from http://www.erlang.org/download/MD5, sha256 locally computed
> -md5    a8c259ec47bf84e77510673e1b76b6db        otp_src_19.3.tar.gz
> -sha256  fe4a00651db39b8542b04530a48d24b2f2e7e0b77cbe93d728c9f05325bdfe83       otp_src_19.3.tar.gz
> +md5     2faed2c3519353e6bc2501ed4d8e6ae7        otp_src_20.0.tar.gz
> +sha256  fe80e1e14a2772901be717694bb30ac4e9a07eee0cc7a28988724cbd21476811        otp_src_20.0.tar.gz
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index f3684d0c91..733c1d5786 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>
>  # See note below when updating Erlang
> -ERLANG_VERSION = 19.3
> +ERLANG_VERSION = 20.0
>  ERLANG_SITE = http://www.erlang.org/download
>  ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
>  ERLANG_DEPENDENCIES = host-erlang
> @@ -19,7 +19,7 @@ ERLANG_AUTORECONF = YES
>
>  # Whenever updating Erlang, this value should be updated as well, to the
>  # value of EI_VSN in the file lib/erl_interface/vsn.mk
> -ERLANG_EI_VSN = 3.9.3
> +ERLANG_EI_VSN = 3.10
>
>  # The configure checks for these functions fail incorrectly
>  ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
> --
> 2.14.1
>
