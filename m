From: Mika Blanc <mika.blanc@gmail.com>
Date: Tue, 26 Feb 2019 20:41:29 +0100
Subject: [Buildroot] [PATCH] package/flatbuffers: do not install to
 target
In-Reply-To: <20190225221151.0c773ee8@windsurf.home>
References: <20190225001610.3786-1-mika.blanc@gmail.com>
 <20190225221151.0c773ee8@windsurf.home>
Message-ID: <CAE6QPM0ru5gnpP2amPMzORD82_Wq4T4wbG191fCESW_HG8gFaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 25 f?vr. 2019 ? 22:11, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> I see a shared library on the target:
>
> ??? usr
>     ??? bin
>     ?   ??? flatc
>     ??? lib
>     ?   ??? libflatbuffers.so -> libflatbuffers.so.1
>     ?   ??? libflatbuffers.so.1 -> libflatbuffers.so.1.9.0
>     ?   ??? libflatbuffers.so.1.9.0
>
> so it doesn't quite match with what your commit log says. Are you sure
> you were not building with BR2_STATIC_LIBS=y ?
>
I'm actually building with the default behavior, so shared libs only by
default. I was mistaken in my commit message, I didn't check for the
presence of a shared library. Flatbuffers is not supposed to be used with
dynamic linking, despite it being possible. Maybe the patch should be
dropped then.

Regards.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190226/8989e24c/attachment.html>
