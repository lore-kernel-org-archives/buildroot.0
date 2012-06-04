From: Murat Demirten <mdemirten@yh.com.tr>
Date: Mon, 4 Jun 2012 11:41:18 +0300
Subject: [Buildroot] [PATCH] jpeg-turbo: new package
In-Reply-To: <87aa0jseft.fsf@macbook.be.48ers.dk>
References: <CA+pfegELseWchx5hbbChKKi-=xtQMO9CWTyKBEV+6RpRQVEqBA@mail.gmail.com>
 <20120603092136.3a462ea1@skate>
 <CA+pfegGdB802LwiCLn+frAJDyqYTpx2B59qgZLXwrJNU9vrExg@mail.gmail.com>
 <CAHXCMMKBJU4kO_H-WA-B2fHKZk0AK9C6EXqPtfqb5yU47i9mmQ@mail.gmail.com>
 <CA+pfegFoEQB_=byD-fyvZt_0SJYy5Dtu5dhATDh29ay66Fk6tg@mail.gmail.com>
 <87aa0jseft.fsf@macbook.be.48ers.dk>
Message-ID: <CA+pfegGUeGR1M3Lv-9XHgvUW9mkwd_UMJ7gs3UjZFXp8Tscefg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, jpeg-turbo is source compatible with libjpeg and some distributions
(including Ubuntu, Fedora, Gentoo) start to ship it for the default libjpeg.

Please note that, jpeg-turbo and TurboJPEG-IPP is not the same, TurboJPEG
has some disadvantages on new 64 bit systems and it's development stopped.

2012/6/4 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Murat" == Murat Demirten <mdemirten@yh.com.tr> writes:
>
>  Murat> Hi,
>
>  Murat> Your solution will work. Adding a PROVIDES mechanism need more
>  Murat> work (like the what is provides-default of jpeg?). I'm not
>  Murat> changing anything in patch now. I'm not sure about that to add a
>  Murat> generic PROVIDES mechanism because it will increase the
>  Murat> buildroot complexity if only used by jpeg-turbo. When we see
>  Murat> that there are more packages like this, we have to add generic
>  Murat> PROVIDES mechanism.
>
>  Murat> jpeg-turbo's performance gain depends to type of images you're
>  Murat> working on too.  We tested it on mips and arm platform (yes, it
>  Murat> make difference on mips too) and it is %30-%50 times faster than
>  Murat> libjpeg (I don't have the exact results now).  It is a big
>  Murat> difference when you have to make lots of jpeg decompression in
>  Murat> your program.
>
> Is there any reason to NOT use jpeg-turbo? Isn't it source level
> compatible with the "normal" libjpeg?
>
> --
> Bye, Peter Korsgaard
>



-- 
Murat Demirten
Genel M?d?r
http://www.yh.com.tr
(212) 292 04 46 - 113
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120604/c47b6958/attachment.html>
