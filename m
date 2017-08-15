From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 15 Aug 2017 11:12:19 +0200
Subject: [Buildroot] [PATCH] lua: fix install of lua.pc
In-Reply-To: <20170815103948.5e910211@windsurf>
References: <20170813133111.3959-1-francois.perrad@gadz.org>
 <20170814222528.1ca21238@windsurf>
 <CAB0FRsuYHMSgoMqpkyq2ieQL54hh6EVywUTv=jBAqdgNZcZdWw@mail.gmail.com>
 <20170815103948.5e910211@windsurf>
Message-ID: <CAB0FRsvzktuPOcsADkydwxjBVCQZJ-ZB090wTL_mfzTKo9TZjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-08-15 10:39 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Tue, 15 Aug 2017 08:14:19 +0200, Fran?ois Perrad wrote:
>
> > The issue that we try to fix, was introduced 5 days ago, by the commit
> > [lua: fix pkg-config file](
> > https://git.busybox.net/buildroot/commit/package/lua?id=
> 8d845683e37640d33c186c0091ccce6ae3ef0777
> > )
> >
> > My patch restore the previous install commands.
> > If the lua.pc must be modified with configuration data, the logical step
> > for this is the configure step.
> >
> > Your patch is the little one which fixes the issue, but it doesn't see
> the
> > root cause.
>
> Well, whether SED'ing those .pc files should be part of the configure
> step or the install step can really be discussed. If those .pc files
> were used for the build process, then indeed, generating them should be
> part of the configure step. But as far as I know, they are not used
> during the build step. Those .pc files are only used for other packages
> who want to link against lua. Therefore, generating them/installing
> them in the install step is quite OK I believe, but I agree it's a
> matter of definition of what each step should do, so there might be
> different views/opinions.
>
>
In order to keep a code base clean , I am against mixing the responsability
of different steps.
In my point of view, the install step must only:
    - copying files
    - modifying the mode of files
    - rename files
    - create symbolic links

Fran?ois


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170815/83b29822/attachment.html>
