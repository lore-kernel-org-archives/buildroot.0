From: Jeff Horn <outforaride@gmail.com>
Date: Fri, 7 Nov 2014 09:43:34 -0800
Subject: [Buildroot] host ldconfig package
In-Reply-To: <1456757.71s6JAxXJf@aquila>
References: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
 <1456757.71s6JAxXJf@aquila>
Message-ID: <CAM7q1LnW3-XFTqh-yWBZTb9O6XEy_CKxtjZhq62GYPmrd-a-PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the info

On Fri, Nov 7, 2014 at 8:35 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
>
> As far as I understand, fixing ldconfig issue is not sufficient to make
> video work? Can you describe issue you are facing?

When launching gplay or gst-launch I get missing lib errors. Which
makes sense considering the gst-fsl-plugins are in /usr/lib/imx-mm.

>
>
> For information, I made iMX6 hardware video decoding and display work. You
> may encounter a few difficulties:
>
>   - Xorg support for imx6 is not yet merged (and we are looking for
>     testers :-) )

I can help test. I have a couple different i.MX6 boards (Wand,
SabreSD). We are not using X11 on our board. We are using just Qt5
with the eglfs platform.

>
>   - /etc/ld.so.conf have to contains these paths:
>        /usr/lib/imx-mm/audio-codec
>        /usr/lib/imx-mm/video-codec
>        /usr/lib/imx-mm/parser
>     (I have to write a patch for this)

Yes, I saw a post about this patch and I added it to my buildroot
branch. I will continue to work on this to see what is happening.

Cheers,
Jeff
