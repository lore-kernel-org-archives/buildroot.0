From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Sep 2018 17:46:30 +0300
Subject: [Buildroot] [PATCH 1/1] font-awesome compatible with fontconfig
In-Reply-To: <CAOt0XSc31keNicgWfc4jcn=-z43D8Vdb=0SCnVtL4POJz1QzoQ@mail.gmail.com>
References: <20180921031640.2238-1-benj.calderon@gmail.com>
 <87worfsdua.fsf@tkos.co.il>
 <CAOt0XSfL9ossLTQ6Z7eBA92=XE9a1PKGbH5Pyrjcao3W3JhC_A@mail.gmail.com>
 <87va6zsaqj.fsf@tkos.co.il>
 <CAOt0XSc31keNicgWfc4jcn=-z43D8Vdb=0SCnVtL4POJz1QzoQ@mail.gmail.com>
Message-ID: <87sh22sybd.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benjam?n,

Please keep the list on Cc.

Benjam?n Calder?n writes:
> The directory font-awesome inside /usr/share/fonts is just for separation
> of concerns. That's the practice of other font packages and if we where to
> upgrade to font-awesome 5 which includes more than one file it would all be
> contained in one folder.

But this folder is empty after you commit. Why create it?

> The other folders are not necessary because they are actually useless in
> this context. CSS needs to be in a server root to be used together with
> HTML pages. Less and scss would need processing and thus are more of
> "source code" than anything else for web development, again, very unlikely
> to be used on an embedded system.
>
> Will modify the path to fix the license.

Please also mention the information about the other directories in the
commit log.

baruch

> On Fri, Sep 21, 2018 at 1:03 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
>> Hi Benjam?n,
>>
>> Benjam?n Calder?n writes:
>> > the standard location for fonts is /usr/share/fonts/* and whatever is
>> there
>> > can be used by other programs that use fontconfig (Qt5 in my case)
>> > This patch fixed the directory where font-awesome is installed from
>> > /usr/share/font-awesome to /usr/share/fonts/fontawesome thus it can be
>> > accessed by other applications and appears when running fc-list.
>> >
>> > I have tested it with Qt5 in rpi3 and with fc-list on qemu_x86_64
>> >
>> > On Thu, Sep 20, 2018 at 11:56 PM Baruch Siach <baruch@tkos.co.il> wrote:
>> >> Benjamin Calderon writes:
>> >> > This commit installs font-awesome in the standard fonts directory
>> >> > making it available systemwide.
>> >> >
>> >> > Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
>> >> > ---
>> >> >  package/font-awesome/font-awesome.mk | 6 ++----
>> >> >  1 file changed, 2 insertions(+), 4 deletions(-)
>> >> >
>> >> > diff --git a/package/font-awesome/font-awesome.mk
>> >> b/package/font-awesome/font-awesome.mk
>> >> > index f39401041a..b1026b3c4d 100644
>> >> > --- a/package/font-awesome/font-awesome.mk
>> >> > +++ b/package/font-awesome/font-awesome.mk
>> >> > @@ -7,12 +7,10 @@
>> >> >  FONT_AWESOME_VERSION = v4.7.0
>> >> >  FONT_AWESOME_SITE = $(call
>> >> github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
>> >> >  FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
>> >> > -FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
>> >> >
>> >> >  define FONT_AWESOME_INSTALL_TARGET_CMDS
>> >> > -     mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
>> >> > -     $(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
>> >> > -             cp -dpfr $(@D)/$(d)
>> >> $(TARGET_DIR)/usr/share/font-awesome$(sep))
>> >> > +     mkdir -p $(TARGET_DIR)/usr/share/fonts/font-awesome/
>>
>> So why do we need this directory? And what about fonts in the
>> directories listed in FONT_AWESOME_DIRECTORIES_LIST? Aren't they useful
>> anymore? If so, please update the license.
>>
>> baruch
>>
>> >> > +     cp $(@D)/fonts/FontAwesome.otf
>> >> $(TARGET_DIR)/usr/share/fonts/font-awesome
>> >>
>> >> What does this patch fix? What about the fonts in other directories?
>> >>
>> >> >  endef
>> >> >
>> >> >  $(eval $(generic-package))

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
