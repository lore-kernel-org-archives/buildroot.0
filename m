From: Nicolas Dechesne <ndec13@gmail.com>
Date: Mon, 4 Feb 2013 21:42:39 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <510F9768.4020907@carallon.com>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com>
Message-ID: <CAOT3miJfu8dUwA92BxPv+mcgwfrPX+8xq3CGV4LdDv=HssC5dQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2013 at 12:11 PM, Will Wagner <will_wagner@carallon.com> wrote:
> You can find my work on updating to x11r7.7 on gitorious at
> https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7
>
> It is now based on a much older buildroot version and needs a lot of work to
> update.

thanks. i am starting to look at what you've done (and rebase on
master). however I don't understand how you came up with the large
list of 'removed' components [1].

some comments:
 - why did you remove any of the xapp_xxx components? these one are
generally not included in the X11 R7.x releases, and are released
separately. i don't understand why we should remove them from BR
during a X11 version upgrade
 - i agree with your list of removed drivers (xdriver_xxx)
 - I agree that the following components were removed during R7.4 to
R7.5 migration:
font-bitstream-speedo-1.0.0.tar.gz
fontcacheproto-0.1.2.tar.gz
libXfontcache-1.0.4.tar.gz
 - for everything else, i don't know why you removed them.

cheers

nico



[1] : $ git log --oneline
master..remotes/will/remotes/gitorious/x11r7.7  | grep removed | awk
'{print $2}'
xapp_xinit:
xproto_xf86rushproto:
xproto_printproto:
xproto_fontcacheproto:
xfont_font-bitstream-speedo:
xcb-util:
xlib_lixXprintUtil:
xlib_libXprintAppUtil:
xlib_libXp:
xlib_libxkbui:
xlib_libXfontcache:
xlib_liboldX:
xdriver_xf86-video-xgixp:
xdriver_xf86-video-xgi:
xdriver_xf86-video-tseng:
xdriver_xf86-video-suntcx:
xdriver_xf86-video-sunleo:
xdriver_xf86-video-suncg3:
xdriver_xf86-video-suncg14:
xdriver_xf86-video-sisusb:
xdriver_xf86-video-s3virge:
xdriver_xf86-video-s3:
xdriver_xf86-video-rendition:
xdriver_xf86-video-i740:
xdriver_xf86-video-chips:
xdriver_xf86-video-apm:
xdriver_xf86-input-aiptek:
xdriver_xf86-input-acecad:
xapp_xvidtune:
xapp_xstdcmap:
xapp_xsm:
xapp_xsetpointer:
xapp_xsetmode:
xapp_xprehashprinterlist:
xapp_xplsprinters:
xapp_xmore:
xapp_xmh:
xapp_xmessage:
xapp_xman:
xapp_xmag:
xapp_xlsfonts:
xapp_xlogo:
xapp_xload:
xapp_xkbprint:
xapp_xgc:
xapp_xfsinfo:
xapp_xfs:
xapp_xfontsel:
xapp_xfd:
xapp_xf86dga:
xapp_xeyes:
xapp_xedit:
xapp_xdm:
xapp_xditview:
xapp_xdbedizzy:
xapp_xclock:
xapp_xclipboard:
xapp_xcalc:
xapp_xbiff:
xapp_viewres:
xapp_twm:
xapp_showfont:
xapp_scripts:
xapp_rstart:
xapp_rgb:
xapp_oclock:
xapp_listres:
xapp_ico:
xapp_fstobdf:
xapp_fslsfonts:
xapp_fonttosfnt:
xapp_editres:
xapp_bitmap:
xapp_beforelight:
xapp_appres:
