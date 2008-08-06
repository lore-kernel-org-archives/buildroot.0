From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 06 Aug 2008 15:36:58 +0200
Subject: [Buildroot] C double type problem - at91sam9263
In-Reply-To: <223E6519BDCAC74695BEE9D163F8E6592306FB@oakleaf10.oakleafconsultancy.com>
References: <223E6519BDCAC74695BEE9D163F8E6592306FB@oakleaf10.oakleafconsultancy.com>
Message-ID: <4899A8FA.5030903@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Richard Hardy wrote:

> I am using arm-linux-gcc v4.2.1., compiled on an intel Linux box to run
> on an atmel at91sam9263. 
> 
> For example, one problem I found was that I was getting stack
> corruptions when using "-Os" as a compiler option in (some) functions
> that were being passed int64_t and double values. I fixed that by using
> "-O0" instead. 
> 

That sounds like a compiler problem...

> However, I am getting lots of other really weird segmentation faults
> when I run the compiled program, which I am having to work around one by
> one (I am trying to cross-compile and use ffmpeg which does lots of
> complicated internal calculations for playing mpeg files).
> 
> Is it possible that gcc 4.2.1 is a very buggy compiler version? Can
> anyone suggest whether I might be better to try another version (ideally
> one that Buildroot supports), and if so, which one?

I guess you would be better off using latest compiler available in 4.2.x series - 4.2.3 or 4.2.4 that is. I had a lot of issues with different gcc versions for cris architecture (internal compiler errors, segafaults, etc.) and ended up using 4.3.1 that does the job for now ;)

my 2 c..

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
