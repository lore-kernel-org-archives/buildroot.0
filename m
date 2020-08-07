From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Fri, 7 Aug 2020 15:41:04 +0200
Subject: [Buildroot] Root password and ssh issues
In-Reply-To: <20200807133552.09637480@gmx.net>
References: <12918ca7-601b-3a85-67bd-4b7953840a77@bootlin.com>
 <20200807115412.3b93cbc4@windsurf.home>
 <d0f3148a-c8d3-e5cf-68ee-030699e7abec@bootlin.com>
 <20200807131256.5c691f3b@gmx.net>
 <1b8d3eda-957d-184d-2bbc-da9d871ccb43@railnova.eu>
 <20200807133552.09637480@gmx.net>
Message-ID: <6b1def36-8387-624c-a51f-21d20505f500@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

Thanks for these useful clarifications!

On 8/7/20 1:35 PM, Peter Seiderer wrote:
> ...and should be fixed for uclibc by commit 'package/uclibc: defconfig:
> enable sha-256/512 password auth support' ([1])...
>
> By the way, maybe it would be nice if the buildroot password hash
> selection although changes the busybox default via
> busybox/.config CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="md5"?
>
> Regards,
> Peter
>
> [1] https://git.buildroot.net/buildroot/commit/?id=bdd8362a88428ed1c04fc6f4bbcbf7692b2a2b39

Right, I should have mentioned that I'm using an external uClibc
toolchain built by crosstool-ng.

Do I understand well that the trouble comes from Dropbear (not BusyBox)
supporting only MD5 in /etc/shadow, at least when built with my toolchain?

Thanks again,

Michael.

-- 
Michael Opdenacker, CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
