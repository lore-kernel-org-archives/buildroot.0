From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Jun 2012 21:09:18 +0300
Subject: [Buildroot] [PATCHv2 7/7] automatically set PARALLEL_JOBS when
 BR2_JLEVEL is 0
In-Reply-To: <1339686165-10145-1-git-send-email-ntl@pobox.com>
References: <1339466983-19786-8-git-send-email-ntl@pobox.com>
 <1339686165-10145-1-git-send-email-ntl@pobox.com>
Message-ID: <20120614180918.GA8258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathan,

On Thu, Jun 14, 2012 at 10:02:45AM -0500, Nathan Lynch wrote:
> When BR2_JLEVEL is 0, set PARALLEL_JOBS to double the number of CPUs
> detected.  This allows one to more or less fully utilize the host
> system without manually tuning the configuration.
> 
> Also make 0 the default value for BR2_JLEVEL.
> 
> Signed-off-by: Nathan Lynch <ntl@pobox.com>
> ---

[snip]

> +ifeq ($(BR2_JLEVEL),0)
> +PARALLEL_JOBS:=$(shell echo \
> +	$$((2 * `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
> +else
>  PARALLEL_JOBS:=$(BR2_JLEVEL)
> +endif

IMO, there should be a comment here explaining the magic (2*CPUs) number.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
