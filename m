From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 16:42:11 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/mesa3d-headers: fix install
 of dri.pc
In-Reply-To: <20200426092131.GV5035@scaer> (Yann E. MORIN's message of "Sun,
 26 Apr 2020 11:21:31 +0200")
References: <20191023062220.5646-1-bernd.kuhls@t-online.de>
 <20191023062220.5646-2-bernd.kuhls@t-online.de>
 <20200426092131.GV5035@scaer>
Message-ID: <87pnbepjy4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bernd, All,
 > On 2019-10-23 08:22 +0200, Bernd Kuhls spake thusly:
 >> Due to the switch of mesa3d to the meson build system the upstream
 >> tarball does not include dri.pc.in anymore, it is created during the
 >> build now:
 >> https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/drivers/dri/meson.build?h=19.2#n93
 >> 
 >> In order to provide dri.pc we need to add a version taken from a dri-
 >> based mesa3d build to our source repository, by doing so we can reduce
 >> the number of sed commands.
 >> 
 >> Without this patch the build of xserver_xorg-server, switched to virtual
 >> opengl provider, will fail:
 >> 
 >> checking for XSERVERCFLAGS... no
 >> configure: error: Package requirements (fixesproto >= 5.0 damageproto
 >> >= 1.1 xcmiscproto >= 1.2.0 xtrans >= 1.3.5 bigreqsproto >= 1.1.0
 >> xproto >= 7.0.31 randrproto >= 1.6.0 renderproto >= 0.11 xextproto
 >> >= 7.2.99.901 inputproto >= 2.3 kbproto >= 1.0.3 fontsproto >= 2.1.3
 >> pixman-1 >= 0.27.2 videoproto recordproto >= 1.13.99.1 resourceproto
 >> >= 1.2.0 xf86driproto >= 2.1.0 glproto >= 1.4.17 dri >= 7.8.0 dri3proto
 >> presentproto >= 1.1 xineramaproto xkbfile  pixman-1 >= 0.27.2 xfont2
 >> >= 2.0.0 xau xshmfence >= 1.1 xdmcp) were not met:
 >> 
 >> Package 'dri', required by 'virtual:world', not found
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > I have entirely reworked the commit log to be more explicit about the
 > meson buildsystem referecne that is confusing.

 > Applied to master, thanks.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
