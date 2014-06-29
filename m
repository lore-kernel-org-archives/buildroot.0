From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Jun 2014 21:04:06 +0200
Subject: [Buildroot] [PATCH v2 00/11] freescale: update userspace
	packages
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140629190406.GC30509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-06-26 22:24 -0700, Gary Bisson spake thusly:
> Here is the rework which I hope covers all the previous remarks. This time I tried to be more talkative in every patch but here is a summary:
>  1- first libfslvpuwrap gets independent as suggested
>  2- simply bump FREESCALE_IMX_VERSION to 3.10.17-1.0.0
>  3- update imx-lib: using idirafter just for uapi folder + remove unnecessary EULA
>  4- make the platform choice as a common option: made BR2_PACKAGE_FREESCALE_IMX a menuconfig not to get BR2_PACKAGE_FREESCALE_IMX_PLATFORM set in every config.
>  5- just adding the imx-vpu package from Freescale with no modification but using idirafter for uapi folder only
>  6- bump libfslvpuwrap: now depends on imx-vpu
>  7- bump libfslcodec: nothing special
>  8- bump libfslparser: same
>  9- gst-fsl-plugins: now depends on imx-vpu as well
>  10/11- fix imx-vpu for the IOGetVirtMem in case of a 3G/1G split: I finally decided not to go with the MAP_FAILED as the return value is an int. I think using -1 is as clear and avoids useless cast. That function could have been written in a simpler way but I didn't want to change the code too much.

Great work!

I still have a few comments on this series, but I'll do the changes and
repost an updated version.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
