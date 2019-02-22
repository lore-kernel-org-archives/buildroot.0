From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 22 Feb 2019 05:54:52 -0300
Subject: [Buildroot] [PATCH 2/2] package/snort: build with OpenAppID
 support if luajit/openssl is enabled
In-Reply-To: <20190222090428.0547fedb@windsurf>
References: <1550780846-7463-1-git-send-email-sergio.prado@e-labworks.com>
 <1550780846-7463-3-git-send-email-sergio.prado@e-labworks.com>
 <20190222090428.0547fedb@windsurf>
Message-ID: <CANu7NGtVHn6bF7jhNfacE99N+arwaLebMbmgSVaK5Pp1nnpDJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Em sex, 22 de fev de 2019 ?s 05:04, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> escreveu:

> > Since version 2.9.12, OpenAppID [1] is enabled by default.
> >
> > OpenAppID depends on luajit and openssl. If we leave it enabled by
> > default, snort would require luajit. Since luajit is not available on
> > all architectures, that would limit the usage of the snort package.
> >
> > Since not all users will need/use OpenAppID, let's leave it disabled by
> > default. To build with OpenAppID support, the user will need to enable
> > luajit and libssl.
> >
> > Also, it is necessary to apply a patch to fix a compile error when
> > building OpenAppID with uclibc and musl. The build fails when
> > dereferencing the rpcent structure because rpc.h is not been included.
> >
> > [1] https://www.snort.org/downloads/openappid/9553
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Shouldn't this be squashed into PATCH 1/2 ? Indeed, if I applied just
> PATCH 1/2, then I suppose snort will no longer build on architectures
> that don't support Luajit.
>
> Alternatively PATCH 1/2 could have an unconditional
> --disable-open-appid, and then PATCH 2/2 adds the logic to enable
> OpenAppID support when possible.

Right. I'll squash into just one patch and send V2.

Thanks!

Sergio Prado
Embedded Labworks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190222/1268f750/attachment.html>
