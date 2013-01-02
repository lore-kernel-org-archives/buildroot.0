From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 2 Jan 2013 17:18:15 +0100
Subject: [Buildroot] inittab for different systems
In-Reply-To: <50E3D5B5.9020903@mind.be>
References: <CAGm1_kucdX-CyXwmxN_A_pBO0qqX5+Z2gS=CrsiYsJ-f4XsxAQ@mail.gmail.com>
 <50E3D5B5.9020903@mind.be>
Message-ID: <CAGm1_ks6DUZXODpYHAkLismCqoeJVGhNzwLget1en7wfZN5yYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 2, 2013 at 7:37 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 12/21/12 16:36, Yegor Yefremov wrote:
>>
>> I have two systems that use DT and thus can share one uImage. I'd like
>> to use one rootfs image for both. How do I configure console in
>> inittab, so that it can deal with different systems (one has ttyO2 the
>> other ttyO3 as console)?
>
>
>  I think the simplest way is to have a custom inittab that opens a getty on
> both ttyO2 and ttyO3.
>
>  I _think_ you can also use /dev/console (assuming console is set up in your
> DT) - but I guess strange things will happen if you have multiple consoles.
>
>  Regards,
>  Arnout

/dev/console has just once small drawback: you can't login as root
AFAIK, But with this patch (tty_io.c)
http://svn.visionsystems.de/cgi-bin/viewvc.cgi/trunk/buildroot-2011.08/board/vscom/linux-3.0/linux-0013-dev-console-fix.patch?revision=26&root=buildroot&view=markup
one can fix this. But I would like the "official" way. By the way why
this /dev/console restriction?

Yegor
