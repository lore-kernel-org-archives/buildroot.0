From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Feb 2014 19:11:14 +0100
Subject: [Buildroot] [PATCH] linux: don't automatically set
 uevent_helper with mdev /dev management
In-Reply-To: <769563a34e142e85ec4c.1391761259@argentina>
References: <769563a34e142e85ec4c.1391761259@argentina>
Message-ID: <20140207181114.GC3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-07 09:20 +0100, Thomas De Schampheleire spake thusly:
> When mdev /dev management is chosen in the buildroot configuration, the
> Linux configuration is updated automatically to set option
> CONFIG_UEVENT_HELPER_PATH to "/sbin/mdev". However, the help text of this
> option explicitly recommends not setting this option due to large
> performance impact during boot (experienced first hand by the reporter ?nd
> author).
> 
> The mdev startup script S10mdev already sets the helper during userspace
> boot, which will make sure mdev is working correctly.
> 
> Fixes bug #6596: https://bugs.busybox.net/show_bug.cgi?id=6596
> 
> Reported-by: Andreas Koop <andreas.koop@zf.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
