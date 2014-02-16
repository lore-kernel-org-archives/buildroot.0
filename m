From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 10:14:21 +0100
Subject: [Buildroot] [PATCH 1/2] vlc: explicitly disable opencv support
In-Reply-To: <87zjlrii9l.fsf@dell.be.48ers.dk>
References: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
 <1392502403-19701-2-git-send-email-s.martin49@gmail.com>
 <87zjlrii9l.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMLJQjNkeV1gWq=_Oi8bbFr=v6OenPSKii6Ne9k_nC2kLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Feb 16, 2014 at 9:17 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
>  > vlc can use opencv in video filters, but it requires a couple of
>  > features enabled in opencv; so, simply force disabling opencv support.
>
>  > Note that vlc does includes the legacy opencv/cv.h header, which pulls a
>  > number of opencv's features (core, video, imgproc, ...).
>
> Is this meant as a short term fix for 2014.02?

Yes, it is a short term fix for the 2014.02 release, also because I
don't think vlc package was added to buildroot with opencv support in
mind... ;-)

I just need some time to find all opencv's features used/required by vlc.

> Presumably the user CAN
> enable the needed opencv option so it could work? - E.G. we could come
> up with the needed test like:
>
> ifeq ($(BR2_PACKAGE_OPENCV_FOO)$(BR2_PACKAGE_OPENCV_BLAH)...,yyy)
> VLC_CONF_OPT += --with-opencv
> VLC_DEPENDENCIES += opencv
> else
> VLC_CONF_OPT += --without-opencv
> endif
>

Regards,

-- 
Samuel
