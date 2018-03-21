From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Mar 2018 09:33:30 -0400
Subject: [Buildroot] [PATCH 2/8] gst-plugins-{base, good, bad,
 ugly}: bump to 1.14
In-Reply-To: <92e79318-9403-ffa6-82b9-933d17267b2f@ginzinger.com>
References: <20180320144901.9032-1-aduskett@gmail.com>
 <20180320144901.9032-3-aduskett@gmail.com>
 <92e79318-9403-ffa6-82b9-933d17267b2f@ginzinger.com>
Message-ID: <CAFSsvmo42akMw3tJ4P0O_ooAAT4_PcUgfANDZDzM7JPKYasvOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin;

On Tue, Mar 20, 2018 at 11:25 AM, Martin Kepplinger
<martin.kepplinger@ginzinger.com> wrote:
> On 2018-03-20 15:48, Adam Duskett wrote:
>> These are grouped together because several plugins have been re-arranged and
>> there is no way to individually update each plugin package.
>>
>> Changes:
>>
>> Add the following to gst1-plugins-base and remove them from plugins-bad:
>>  - opengl
>>  - gles2
>>  - glx
>>  - egl
>>  - x11
>>  - wayland
>>  - dispmanx
>>  - audiomixer
>>
>> Add the following to plugins-good and remove them from plugins-ugly:
>>  - lame
>>  - mpg123
>>
>
> Thanks for timely work!
>
No problem!

> --disable-qt has moved from bad to good too (which means it seems to be
> enabled now)
>
> It builds for me, but strangely, gst1-plugin-good's HAVE_QT is not set;
> even though I clearly have qt5 built before it.
>
> In short: It would be nice to enable Qt for gstreamer properly, instead
> of moving --disable-qt from bad to good.
>
> To be specific, I want to get gstreamer's qmlglsink element to be built.
> Do you have any more insight on how the configuration would look like?
>
>                            martin
This is just a upgrade series, there are a few other plugins that were
added as well that I too wish to
add to the series, but that will be after this is approved.

I will move the --disable-qt from bad to good and submit a V2. If you
want to dig into enabling the QT
plugin that would actually be quite helpful!

Adam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
