From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 7 Jan 2015 08:45:53 -0800
Subject: [Buildroot] host-python build issue
In-Reply-To: <20150107174313.3d9ea5ff@free-electrons.com>
References: <54AD3069.8090309@gmail.com>
 <20150107174313.3d9ea5ff@free-electrons.com>
Message-ID: <CALo-6+jKLNFqOG08oQbWZOd2RSjoeF8aFkS-zBY5Y77JNtd5Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I might also suggest describing or setting up an option for a minimal
python embedded target. Last week I tried to complile python for an
embedded target and got hung up in the audio, dbm and other missing
dependencies.

Charles

On Wed, Jan 7, 2015 at 8:43 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Zoltan Gyarmati,
>
> On Wed, 07 Jan 2015 14:11:05 +0100, Zoltan Gyarmati wrote:
>
> > i'm trying to build host-python (pulled in by
> > mobile-broadband-provider-info), but some of the modules failed to build
> > (namely ossaudiodev), and even if in this case the built python binary
> > and modules work properly, the buildroot build process itself fails.
> > Should this be considered as a bug, or this is the excepted behavior?
>
> Do you have a /usr/include/linux/soundcard.h file in your system? If
> yes, can you post it on pastebin?
>
> We should probably disable the ossaudiodev module from the host Python
> build. It's completely useful and I think we already had reports of
> issues building with module with our host-python package.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150107/089ba692/attachment.html>
