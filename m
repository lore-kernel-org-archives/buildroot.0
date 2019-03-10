From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Mar 2019 10:11:26 +0100
Subject: [Buildroot] [PATCH v3 0/2] Add gettext-tiny package
In-Reply-To: <20190310002005.jglt6ptlgctyz6eb@vkochan-ThinkPad-T470p>
References: <20190212215520.7422-1-vadim4j@gmail.com>
 <20190309233742.3095c546@windsurf>
 <20190310002005.jglt6ptlgctyz6eb@vkochan-ThinkPad-T470p>
Message-ID: <20190310101126.3d738624@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Sun, 10 Mar 2019 02:20:05 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Many thanks for your feedback! Using the gnu gettext's tar is really better
> idea! Regarding ecryptfs-utils - yes, I think the patch might be really easy,
> something like this:
> 
> ...
> function trans {
>     if command -v gettext &> /dev/null; then
>         gettext @
>     else
>         echo @
>     fi
> }
> ...
> 
> and replace gettext -> trans in scripts.

Sounds good! Will you work on this ?

So, we agree that for the target gettext, only gettext-gnu will be a
provider when BR2_SYSTEM_ENABLE_NLS=y. When BR2_SYSTEM_ENABLE_NLS is
disabled, we don't have any target gettext package. Correct ? If so,
then I'll rework my branch to take this into account.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
