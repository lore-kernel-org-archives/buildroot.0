From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 00:54:19 +0100
Subject: [Buildroot] [PATCH] yaml-cpp: requires boost
In-Reply-To: <1427571272-8465-1-git-send-email-fabio.porcedda@gmail.com>
References: <1427571272-8465-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150328235419.GA3887@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-03-28 20:34 +0100, Fabio Porcedda spake thusly:
> The Boost C++ library is already selected in the Config.in but it was
> missing in the yaml-cpp.mk file.
> 
> Fix build failure:
> CMake Error at /home/tetsuya/buildroot/br/output/host/usr/share/cmake-3.1/Modules/FindBoost.cmake:1182 (message):
>   Unable to find the requested Boost libraries.
> <snip>
> make: *** [/home/tetsuya/buildroot/br/output/build/yaml-cpp-0.5.1/.stamp_configured] Error 1
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Good catch!

Shame on me for giving my reviewed-by tag back then as I missed that
dependency... :-(

Hopefully I'm not missing anything now:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/yaml-cpp/yaml-cpp.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
> index 5ebdb23..afc70bd 100644
> --- a/package/yaml-cpp/yaml-cpp.mk
> +++ b/package/yaml-cpp/yaml-cpp.mk
> @@ -10,4 +10,6 @@ YAML_CPP_INSTALL_STAGING = YES
>  YAML_CPP_LICENSE = MIT
>  YAML_CPP_LICENSE_FILES = license.txt
>  
> +YAML_CPP_DEPENDENCIES = boost
> +
>  $(eval $(cmake-package))
> -- 
> 2.3.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
