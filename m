From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 9 Mar 2016 09:20:15 +0100
Subject: [Buildroot] [PATCH v4] android-tools: add new package
In-Reply-To: <57351aed-03da-40ff-9c76-a384f847820e@MAIL-SINTERS-01.sinters-int.fr>
References: <1448296032-7781-1-git-send-email-gary.bisson@boundarydevices.com>
 <CAFGQKxcZERH0vMo8S_gE-YFWN_etHCB2xcAaBvzqgALRj5s7wg@mail.gmail.com>
 <CAAMH-ys65yXKR+T3K304Dk9iyrzeJr6Z7g-ARH9N0zOrNcNE_g@mail.gmail.com>
 <57351aed-03da-40ff-9c76-a384f847820e@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <CAAMH-yu+m5+wY9YGFUGLiWNwTzsxQmmX9yXQWsM0X_UpDtbFwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On Tue, Mar 8, 2016 at 6:45 PM, Julien CORJON <corjon.j@ecagroup.com> wrote:
>
> Gary, All,
>
> I use host-fastboot (almost) every days to flash my SECO i.MX6 uQ7 so
> you can add
> Tested-by: Julien Corjon <corjon.j@ecagroup.com>
>
> As i use it in an buildroot-external tree I've just noticed this package
> as not been accepted yet.
>
> And for the whole patch you can add
> Review-by: Julien Corjon <corjon.j@ecagroup.com>

Thanks for your feedback and support on the package.

> Le 24/11/2015 16:15, Gary Bisson a ?crit :
> > Martin, All,
> >
> > On Mon, Nov 23, 2015 at 8:02 PM, Martin Bark <martin@barkynet.com> wrote:
> >> <snip>
> >>> +++ b/package/android-tools/android-tools.mk
> >>> @@ -0,0 +1,85 @@
> >>> +################################################################################
> >>> +#
> >>> +# android-tools
> >>> +#
> >>> +################################################################################
> >>> +
> >>> +ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
> >>> +ANDROID_TOOLS_VERSION = 4.2.2+git20130218
> >>
> >> Debian now has version 5.1.1.r29 would it be better to use this newer
> >> version?  It seems to fix this bug
> >> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=798305 where adb in
> >> 4.2.2 fails on newer android devices.  You can find
> >> android-tools_5.1.1.r29.orig.tar.xz here
> >> http://snapshot.debian.org/package/android-tools/5.1.1.r29-2.  It
> >> looks like Debian only added this a few weeks back.
> >
> > Thanks for the update. However the Debian package doesn't provide adbd
> > support which is, in my opinion, a quite useful feature to have.
> > I'll look at how much effort it is to add adbd support but I might
> > also wait for the Ubuntu package to be updated.
>
> Since there is no update from Ubuntu I suggested to accept this patch
> 'as-is' and see later to handle the android-tool bug raised by Martin.

Yes the Ubuntu package hasn't been upgraded yet but offers both adb
and adbd support which is pretty neat in my opinion, I'm using it
extensively as well.

Martin, I just tried to build the host adb package to connect to my
MotoG3 phone running Android 6.0 Marshmallow and it works just fine so
I don't see any issue with this adb version. What device have you been
having troubles with?

Thomas, rebasing that patch I realized it doesn't apply cleanly on
master right now due to packages/Config.in.host. Also, I realized the
package Config.in.host is missing "host " in its bool description. Do
you want me to send a v5?

Regards,
Gary
