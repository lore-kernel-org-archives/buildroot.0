From: =?UTF-8?Q?Benjam=C3=ADn_Calder=C3=B3n?= <benj.calderon@gmail.com>
Date: Fri, 21 Sep 2018 00:02:22 -0400
Subject: [Buildroot] [PATCH 1/1] font-awesome compatible with fontconfig
In-Reply-To: <87worfsdua.fsf@tkos.co.il>
References: <20180921031640.2238-1-benj.calderon@gmail.com>
 <87worfsdua.fsf@tkos.co.il>
Message-ID: <CAOt0XSfL9ossLTQ6Z7eBA92=XE9a1PKGbH5Pyrjcao3W3JhC_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the standard location for fonts is /usr/share/fonts/* and whatever is there
can be used by other programs that use fontconfig (Qt5 in my case)
This patch fixed the directory where font-awesome is installed from
/usr/share/font-awesome to /usr/share/fonts/font-awesome thus it can be
accessed by other applications and appears when running fc-list.

I have tested it with Qt5 in rpi3 and with fc-list on qemu_x86_64
____
*Benjam?n C. Calder?n*


On Thu, Sep 20, 2018 at 11:56 PM Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Benjamin,
>
> Benjamin Calderon writes:
> > This commit installs font-awesome in the standard fonts directory
> > making it available systemwide.
> >
> > Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
> > ---
> >  package/font-awesome/font-awesome.mk | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/font-awesome/font-awesome.mk
> b/package/font-awesome/font-awesome.mk
> > index f39401041a..b1026b3c4d 100644
> > --- a/package/font-awesome/font-awesome.mk
> > +++ b/package/font-awesome/font-awesome.mk
> > @@ -7,12 +7,10 @@
> >  FONT_AWESOME_VERSION = v4.7.0
> >  FONT_AWESOME_SITE = $(call
> github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
> >  FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
> > -FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
> >
> >  define FONT_AWESOME_INSTALL_TARGET_CMDS
> > -     mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
> > -     $(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
> > -             cp -dpfr $(@D)/$(d)
> $(TARGET_DIR)/usr/share/font-awesome$(sep))
> > +     mkdir -p $(TARGET_DIR)/usr/share/fonts/font-awesome/
> > +     cp $(@D)/fonts/FontAwesome.otf
> $(TARGET_DIR)/usr/share/fonts/font-awesome
>
> What does this patch fix? What about the fonts in other directories?
>
> >  endef
> >
> >  $(eval $(generic-package))
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180921/f99f4c66/attachment.html>
