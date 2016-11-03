From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 3 Nov 2016 18:56:53 +0100
Subject: [Buildroot] [git commit] core: re-enter make if $(CURDIR) or
 $(O) are not canonical paths
In-Reply-To: <265a8ed3-b0b9-5039-558f-b449d2b3aedd@mind.be>
References: <20161019211757.83C7D80DB7@busybox.osuosl.org>
 <20161102221830.GA3319@free.fr>
 <CAHXCMMLoxKuaHnb_g7qtWuN-yC==pM-EzXq5JiD0Et5ZronfxA@mail.gmail.com>
 <00e6d7a0-0e8e-ffaa-6382-6084a3af8162@mind.be>
 <CAGduivzPY9V05Cy3HQgYu6rLUjbX5Kuz8wUueaf0HGwcjQwx7Q@mail.gmail.com>
 <265a8ed3-b0b9-5039-558f-b449d2b3aedd@mind.be>
Message-ID: <CAGduivwtbKHf+=CAYcSRnPJNGnAWQeOqTOK-xtvxYbvCxhvtkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 3, 2016 at 4:19 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >
> > So here's my test case; I use an external and here's how my CI bot does it:
> >
> > $ rm buildroot/dl/tzdata* ; make O=../output -C buildroot
> > BR2_EXTERNAL=../myexternal tzdata-extract
> >
> > It will go and download by using the BR2_PRIMARY_SITE defined in my defconfig,
> > everything's fine.
> > Now if I do that:
> >
> > $ rm buildroot/dl/tzdata* ; make O=../output -C buildroot
> > BR2_EXTERNAL=../myexternal BR2_PRIMARY_SITE="blabla" tzdata-extract
> > It is still gonna use the value defined in my defconfig instead of the one on
> > the command line which should take precedence.
> >
> > It doesn't matter if you pass the variable to make or put it in the ENV.
>
>  So, have you tested http://patchwork.ozlabs.org/patch/690649/ ?

No, I have tested http://patchwork.ozlabs.org/patch/682684/ as pointed
to by Samuel.

Let me test this one, I'll report back soon.
>
>
>  If yes, can you add your Tested-by?
>
>  Regards,
>  Arnout
>
