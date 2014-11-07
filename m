From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Fri, 7 Nov 2014 10:12:02 +0100
Subject: [Buildroot] [PATCH 0/7] [RFC] systemV init without busybox
	series
In-Reply-To: <545BB09D.2080805@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <20141106182413.198106d0@free-electrons.com>
 <545BB09D.2080805@zacarias.com.ar>
Message-ID: <CABbD_XDLDuUNQWQRhK4KjAmVmZgTTUbZuJnXR=+83kMK_Xm23g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,

first, I'm happy that somebody else has the more/less same aim as me: to
make Buildroot able to create a more full Linux experience.
I think there are still some fundamental Linux tools' full versions are
missing, like shadow-utils to make Busybox circumventable,
but that's another story.

Regarding start-stop-daemon: I think that while downloading, configuring
and compiling dpkg is a more straight solution to get st-st-d, it's a bit
unnecessary to just get one .c file to produce one simple binary.
For this patch, I mostly used package/cache-calibrator as a template, which
basically does the exact same method.

Also, I think patching may still be needed for st-st-d for uClibc
compatibility, as uClibc tend not to have the O_NOFOLLOW preprocessor macro
declared in fcntl.h if __USE_GNU is not defined - and I think dpkg
configure does not define that?

Best regards,
Karoly

On Thu, Nov 6, 2014 at 6:32 PM, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> On 11/06/2014 02:24 PM, Thomas Petazzoni wrote:
>
> > Have you seen "[PATCH] start-stop-daemon: new package" already
> > submitted by Karoly Kasza a few days ago?
>
> I didn't notice it before, just seen it, this series was made about two
> weeks ago.
> That's one way to do it, but it's a bit hackish.
> In my version of the package i download the dpkg tarball (downloads
> ain't expensive these days and it isn't some super big tarball either),
> configure stripping almost everything and just build/install
> start-stop-daemon, everything without any nasting patching.
> I didn't send it because i want feedback on naming, for all intents and
> purposes it's just a start-stop-daemon package even though it downloads
> the dpkg tarball.
> Dpkg tools can be built from what i've seen but the build time &
> footprint will be far bigger, and i think it will send a wrong
> message/expectations.
> Regards.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141107/e6ab2bcc/attachment.html>
