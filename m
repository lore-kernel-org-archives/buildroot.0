From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 22:33:15 +0200
Subject: [Buildroot] [PATCH] pppd: Provide error() implementation in
 pppoe-discovery
In-Reply-To: <1476555914-22201-1-git-send-email-Stefan.Nickl@gmail.com>
References: <1476555914-22201-1-git-send-email-Stefan.Nickl@gmail.com>
Message-ID: <20161015223315.47f04e55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 20:25:14 +0200, stefan.nickl at gmail.com wrote:
> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> The pppoe-discovery program calls error() from the CHECK_ROOM macro
> defined in pppoe.h. Since pppoe-discovery is a standalone program not
> linked with the rest of pppd, the only way this could build is by
> linking to glibc's proprietary error(3) function instead of the function
> of the same name (but with different arguments) defined in pppd/utils.c.
> 
> So with glibc this builds, but will probably crash when the assertion is
> triggered. As the assertion is unlikely to fail, nobody has noticed.
> 
> The build however fails with musl libc or uClibc since they don't
> provide the doppelganger.
> 
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

Thanks for this patch. Could you submit this as a Buildroot patch? I.e
a patch that adds a patch to package/pppd/ ?

Also, can you detail how you produce this error (Buildroot defconfig
that exhibits the issue) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
