From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Sat, 29 Nov 2014 19:22:26 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix configure/build
In-Reply-To: <87k32ejljl.fsf@dell.be.48ers.dk>
References: <1417195423-17839-1-git-send-email-francois.perrad@gadz.org>
 <8761dzkqbe.fsf@dell.be.48ers.dk>
 <CAGhdn56p-WpX1w6A5hxos+DjSdaHVzZGHUsi0342xnBBXZDSKw@mail.gmail.com>
 <87k32ejljl.fsf@dell.be.48ers.dk>
Message-ID: <CAGhdn57+MwgoJ9v=OhrFDy+Um1wLfs27NiBQ5dhcTjmTSMiPog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-11-29 12:25 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Fran?ois" == Fran?ois Perrad <fperrad@gmail.com> writes:
>
> Hi,
>
>  >> > + sub try_to_autoconfigure {
>  >> > ++  return; # hack for BR
>  >>
>  >> But does that do the right thing?
>  >>
>  > with this patch, gdlib-config is never called, the configure step uses
> only
>  > values from PERL_GD_CONF_OPTS.
>
> Yes, exactly. Does it end up linking with the right libraries flags
> (-pthread -ljpeg -lz -lm)?
>
>

On my box, it links with : -lgd -lfreetype -lpng -lz -lm
that seems coherent with
    PERL_GD_DEPENDENCIES = perl zlib libpng freetype gd

Fran?ois


> --
> Venlig hilsen,
> Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141129/293284bd/attachment.html>
