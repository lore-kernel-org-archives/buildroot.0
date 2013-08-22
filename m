From: Ralph Siemsen <ralphs@netwinder.org>
Date: Thu, 22 Aug 2013 15:07:14 -0400
Subject: [Buildroot] kernel patches suggestion : series file ->make it a
 variable
In-Reply-To: <4F595893DB584F8E8EB91B7106E82368@JohanW7>
References: <FAC1EE0BD8A0431EBFF14BEE70571910@JohanW7>
 <20130816125652.701e7173@skate>
 <2EEB59F1B4624C6B8D85EC7D0B6054E5@JohanW7>
 <20130816201240.GB2715@free.fr>
 <4F595893DB584F8E8EB91B7106E82368@JohanW7>
Message-ID: <20130822190714.GB13096@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You can put a series file in the directory, to control the order of patches.

Note that there is a small bug, if you make a mistake in your 'series' file,
buildroot will just silently ignore mis-typed patch names. I posted a fix
for this a little while ago: http://patchwork.ozlabs.org/patch/266895/

-Ralph

On Sun, Aug 18, 2013 at 02:26:29AM +0200, Sagaert Johan wrote:
>  
> Hi
> 
> I have used single patch directories by just specifying the path, but how do I manage the order of the patches.
> The series file was a good solution to force the order of patches to be applied.
> 
> Johan
> 
> -----Oorspronkelijk bericht-----
> Van: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] Namens Yann E. MORIN
> Verzonden: vrijdag 16 augustus 2013 22:13
> Aan: Sagaert Johan
> CC: 'Thomas Petazzoni'; buildroot at busybox.net
> Onderwerp: Re: [Buildroot] kernel patches suggestion : series file ->make it a variable
> 
> Sagaert, All,
> 
> On 2013-08-16 22:04 +0200, Sagaert Johan spake thusly:
> > -----Oorspronkelijk bericht-----
> > Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> > Verzonden: vrijdag 16 augustus 2013 12:57
> > Aan: Sagaert Johan
> > CC: buildroot at busybox.net
> > Onderwerp: Re: [Buildroot] kernel patches suggestion : series file 
> > ->make it a variable
> > 
> > Dear Sagaert Johan,
> > 
> > On Fri, 16 Aug 2013 12:19:13 +0200, Sagaert Johan wrote:
> > 
> > > Now I use a 'series'  file in my board directory to specify what patches that should be applied to the kernel.
> > > I would love to see a menu entry where I can specify what list of 
> > > patches that should be applied.(default value :series)
> > 
> > What's the difference between what you're asking and the already existing BR2_LINUX_KERNEL_PATCH configuration option?
> > 
> > 
> > Hi
> > 
> > Also works, but it gives long lines in the menu if you have more than 
> > 5 patches that have relative path's.
> > (eg board/karo/tx53/linux-3.4.58/firmware.patch  ......) Is just a bit 
> > difficult to see the full list then.
> 
> What you're missing, and Thomas explained, is...
> 
> > config BR2_LINUX_KERNEL_PATCH
> >         string "Custom kernel patches"
> >         help
> >           A space-separated list of patches to apply to the
> >           kernel. Each patch can be described as an URL, a local file
> >           path, or a directory. In the case of a directory, all files
>                   ^^^^^^^^^^^^^^
> >           matching linux-*.patch in the directory will be applied.
> 
> ... that you can pass the path to a directory that has all the patches, hence it becomes a singe entry:
> 
>     BR2_LINUX_KERNEL_PATCH="/path/to/your/many-patches/dirextory/"
> 
> with all your patches in there.
> 
> Furthermore, if you have a file named 'series' in that directory, then its content wil be read and patches applied in this order,
> rather than in alphabetical order. So if you even have patches in sub-dir therein, you can always use a 'series' file, whith such a
> content:
> 
>   series:
>     00-stable-patches/fix-1.patch
>     00-stable-patches/feat-2.patch
>     99-experimental/000-tentative-foo-bar.patch
>     99-experimental/123-come-on-baby.patch
> 
> And have those patches as they are listed in 'series'.
> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
