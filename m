From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 05 Dec 2012 01:00:56 +0200
Subject: [Buildroot] elfutils and the perf userspace tool
In-Reply-To: <50BE7E8E.5000201@petroprogram.com>
References: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
 <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
 <1354608794.90144.YahooMailNeo@web120304.mail.ne1.yahoo.com>
 <50BE4D1C.3020702@petroprogram.com> <20121204204232.3e5b0ec9@skate>
 <50BE77CB.2040205@petroprogram.com> <20121204233403.3315e87d@skate>
 <50BE7E8E.5000201@petroprogram.com>
Message-ID: <50BE80A8.1050801@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

5.12.2012 0:51, Stefan Fr?berg kirjoitti:
> 5.12.2012 0:34, Thomas Petazzoni kirjoitti:
>> Dear Stefan Fr?berg,
>>
>> On Wed, 05 Dec 2012 00:23:07 +0200, Stefan Fr?berg wrote:
>>
>>>> Don't reinvent the wheel:
>>>>
>>>>   http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/elfutils/elfutils/uclibc-support.patch
>>>>
>>>> And possibly other patches in:
>>>>
>>>>  http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/elfutils/elfutils
>>>>
>>>> Thomas
>>> So why those are not in buildroot yet ?
>> Because you forgot to submit a patch? :-)
>>
>> Thomas
> Nah, I have too much work while testing working of latest firefox 16.0.1
> for buildroot right now and trying
> to push patches upstream.
>
> And I let all the honor for that elfutils work to go for Boldan.
>
> But I did some quick checking of those patches and all those are for
> older than 0.155 that Boldan is trying to compile
> and that uclibc-support.patch needs some tuning to be applied cleanly
> for 0.155 version and there is no mention
> of obstack() function problem being fixed (if using uClibc) in any of them.
>
> Maybe it can be fixed without using gnulib (witch provides obstack
> implementation similar to glibc) and using some
> standard comforming function(s) but I could not find any.
>
> Regards
> Stefan
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

And now I just noticed this line from that uclibc-support.patch:

|"Upstream-Status: Inappropriate [uclibc specific]"

How nice. Like I said earlier. The makers of this elfutils software are 
really lifting the middle finger in terms of portability.
:P

I wonder if Ulrich Drepper was (still is?) in head of this .........






|




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121205/5759b72c/attachment.html>
