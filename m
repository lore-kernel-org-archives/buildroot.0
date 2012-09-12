From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 12 Sep 2012 02:10:31 -0400
Subject: [Buildroot] big root fs
In-Reply-To: <1347427978.76430.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1347366592.32116.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120911154439.47e2b53a@skate>
 <1347427978.76430.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <CAHqTa-1OnmaKx9zx-YtkVbH=OUe_ybd2LsgMo1Rri_ZyTTX+tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The best thing to do is to just poke around the image with du.  You
will probably find tons of files you don't need, especially if you
compare the list of files in your overly-large image vs. the nice
small one.

On Wed, Sep 12, 2012 at 1:32 AM, Zoran Djordjevic <djdjdjole@yahoo.com> wrote:
> So, as much as I understood, I can't expect to reduce jffs2 below
> let's say 45MB having included options that I stated (GTK, ...).
> Then a question emerged to me - how it happens that for example
> Qtopia for my ARM board has 25MB, alltogether with some
> video materials, games, ...?
> Although I didn't try, but there is Angstrom root file system for my
> ARM board, based on glibc, that is 25MB at size, which is considerably
> smaller then my jffs2.
> How did they achieve that, or maybe I made some mistakes so the
> file size is large ?
>
> Regards
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> To: Zoran Djordjevic <djdjdjole@yahoo.com>
> Cc: "buildroot at busybox.net" <buildroot@busybox.net>
> Sent: Tuesday, September 11, 2012 3:44 PM
> Subject: Re: [Buildroot] big root fs
>
> Le Tue, 11 Sep 2012 05:29:52 -0700 (PDT),
> Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :
>
>> I built linux kernel using Buildroot, but included glibc support
>> instead of uClibc. For that matter I was using Crosstool NG.
>> I achieved the goal - compiled the GTK applications and they work on
>> my target ARM board. All of that is by using NFS on my Ubuntu machine.
>> However the size of generated jffs2 is 52MB- which is huge for me.
>> Although I included GTK examples, and maybe few more properties I
>> still wander if the size is related (only) to glibc matter.
>> I will try building with uClibc (only to detect difference in size),
>> but at the moment it is important to me to use glibc, so what else
>> can contribute to overal size of image, other than  (maybe) glibc.
>
> The difference is size will not be that huge, maybe around 1-2 MB, not
> much more.
>
>> I attatched my .config if someone want to look at it and maybe find
>> some memory eating matter. Also, can size of glibc be reduced, by
>> throwing out some properties.
>
> glibc does not offer any configuration options. eglibc has a few
> options, but that are not exposed by Crosstool-NG, and I doubt that
> they provide a really significant size reduction.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
