From: Julien CORJON <corjon.j@ecagroup.com>
Date: Thu, 6 Aug 2015 11:35:09 +0000
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
Message-ID: <ADAE54FA6BC6A040A89AC44D7C863F8378FA5B79@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi  Baruch,

Le 6 ao?t 2015 13:30, Baruch Siach <baruch@tkos.co.il> a ?crit :
>
> Hi Julien,
>
> On Thu, Aug 06, 2015 at 12:06:14PM +0200, Julien Corjon wrote:
> > +ifeq ($(BR2_PACKAGE_GSTREAMER),y)
> > +QT5BASE_CONFIGURE_OPTS += -gstreamer 0.10
> > +QT5BASE_DEPENDENCIES   += gstreamer
> > +else ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
> > +QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
> > +QT5BASE_DEPENDENCIES   += gstreamer1
> > +else
> > +QT5BASE_CONFIGURE_OPTS += -no-gstreamer
> > +endif
>
> Shouldn't we default to gstreamer 1.0 when both are enabled?

For now qt recommend to keep gstreamer 0.1 as d?faut version[1].

Regards,

Julien

[1] https://wiki.qt.io/New_Features_in_Qt_5.5
>
> baruch
>
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
