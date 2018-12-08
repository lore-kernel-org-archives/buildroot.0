From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Dec 2018 17:17:49 +0100
Subject: [Buildroot] [PATCH] gitlab-ci: store .config files as artefacts
 for defconfig tests
In-Reply-To: <20181208161128.20041-1-yann.morin.1998@free.fr>
References: <20181208161128.20041-1-yann.morin.1998@free.fr>
Message-ID: <20181208161749.GO2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-12-08 17:11 +0100, Yann E. MORIN spake thusly:
> Add Buildroot's own .config file, as well as any package's .config file
> (uclibc, linux, and busybox), for later inspection should a build fails,
> notably due to changes in the kconfig-package infrastructure.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .gitlab-ci.yml    | 2 ++
>  .gitlab-ci.yml.in | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1a78211823..7dda71248f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -57,10 +57,12 @@ check-package:
>          when: always
>          expire_in: 2 weeks
>          paths:
> +            - .config
>              - build.log
>              - output/images/
>              - output/build/build-time.log
>              - output/build/packages-file-list.txt
> +            - output/*/.config

Damn, I was too quick at sending that patch. It should've been
output/build/*/.config

I'll resend soonish, sorry for the noise...

Regards,
Yann E. MORIN.

>  
>  .runtime_test: &runtime_test
>      # Running the runtime tests for every push is too much, so limit to
> diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
> index ebca29ca1f..41a7589072 100644
> --- a/.gitlab-ci.yml.in
> +++ b/.gitlab-ci.yml.in
> @@ -57,10 +57,12 @@ check-package:
>          when: always
>          expire_in: 2 weeks
>          paths:
> +            - .config
>              - build.log
>              - output/images/
>              - output/build/build-time.log
>              - output/build/packages-file-list.txt
> +            - output/*/.config
>  
>  .runtime_test: &runtime_test
>      # Running the runtime tests for every push is too much, so limit to
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
