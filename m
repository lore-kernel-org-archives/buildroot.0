From: Reuven Wachtfogel <wreuven@gmail.com>
Date: Thu, 3 Dec 2020 13:41:36 +0200
Subject: [Buildroot] Is it possible to have buildroot build the static
 versions of GStreamer & GStreamer plugins?
In-Reply-To: <87czzrno9c.fsf@tarshish>
References: <8D8223CE-C315-454B-8E9F-F3F4742A293A@hxcore.ol>
 <87czzrno9c.fsf@tarshish>
Message-ID: <CAHTXDR7ev86kMo_439sLf7qVp0Fpqk0_NEN57CRdAs3ANOi-rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That fixed it.

Thanks very much!

On Thu, Dec 3, 2020 at 1:05 PM Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Reuven,
>
> On Thu, Dec 03 2020, Reuven Wachtfogel wrote:
> > GStreamer packages seem to ignore BR2_SHARED_STATIC_LIBS=y.
> > Is there another way?
>
> Try setting BR2_STATIC_LIBS (static only). Note that some plugins do not
> support static build (!BR2_STATIC_LIBS dependency). In most cases this
> is due to dependency on libraries that do not support static build.
>
> Hope this helps,
> baruch
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201203/2eeec4ed/attachment.html>
