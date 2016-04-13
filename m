From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Wed, 13 Apr 2016 10:35:48 -0300
Subject: [Buildroot] Setting RGB
In-Reply-To: <CAFMv-czPriV5jOfVm=GeuXpW-f-t7YkiWRqZPLSYWGD9G__7=w@mail.gmail.com>
References: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
 <20160204205505.5a842de4@gmx.net> <1455126039107-125494.post@n4.nabble.com>
 <CAAEAJfBS36gKR3P_-MZ888yMi4y=piVN=x77F07z0-+=Bpxv0Q@mail.gmail.com>
 <1455203390156-125571.post@n4.nabble.com> <20160211215209.2f381cc0@gmx.net>
 <CAFMv-czPriV5jOfVm=GeuXpW-f-t7YkiWRqZPLSYWGD9G__7=w@mail.gmail.com>
Message-ID: <CAFMv-cwx1QUJoRDj14jLT4Kk0fd6b5dQ77eZnV5qK7Z6kSXsuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forgot to mention:

At QLinuxFbScreen::initialize() display format is detected as RGB (and it
is true because fbtest shows colors right).
So, I had to swap red and blue structs (struct fb_bitfield), so detection
now says it is BGR. Then at doRedraw() image is inverted when drawing is
issued.

I still don't understand why I should force BGR so Qt drawing can work fine.




2016-04-12 8:45 GMT-03:00 Leonardo Giordano <lgiordano@controlnet.com.ar>:

> Sorry for delay on replying, we were using as a workaround swapping red
> and blue info on the pictures we use.
> Yesterday I fixed it based on Peter's reply and this patch:
> https://bugreports.qt.io/browse/QTBUG-40527
>
> Thanks for your support!
> Regards,
> Leonardo
>
> 2016-02-11 17:52 GMT-03:00 Peter Seiderer <ps.report@gmx.net>:
>
>> Hello Gabriel Andr?s Castillo,
>>
>> On Thu, 11 Feb 2016 07:09:50 -0800 (PST), GabrielCastillo <
>> gcastillo at controlnet.com.ar> wrote:
>>
>> > Definitely the problem is with QT5. I read some places that could be
>> > littleendian problem. To run my app, i do:
>> >
>> > > ./App -platform linuxfb
>> >
>> > There are any form to tell that it has to be execute in littleendian or
>> > bigendian?
>> >
>>
>> No, no such option for qt5 (see [1] for linuxfb options).
>>
>> Mind to run 'fbset -s' (or 'fbset -i') on your platform ?
>>
>> Output gives the pixel defintion of the framebuffer, e.g.
>>
>> rgba 5/11,6/5,5/0,0/16
>>
>> for my adafruit display (and try to test if the given
>> pixel defintion is correct by writing color patterns
>> to the framebuffer (direct or with some framebuffer
>> test program)...
>>
>> Or mind to try the following atmel qt5 patch ([2]) from
>> the OpenEmbedded/Yocto layer?
>>
>> This patch gives you a hint for the place where to fix/adjust the
>> qt5 drawing to the framebuffer...
>>
>> Regards,
>> Peter
>>
>>
>> [1] http://doc.qt.io/qt-5/embedded-linux.html
>> [2]
>> https://github.com/linux4sam/meta-atmel/blob/master/qt5-layer/recipes-qt/qt5/files/atmel-color-format-force.patch
>>
>> >
>> >
>> > --
>> > View this message in context:
>> http://buildroot-busybox.2317881.n4.nabble.com/Setting-RGB-tp124903p125571.html
>> > Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160413/fba82904/attachment.html>
