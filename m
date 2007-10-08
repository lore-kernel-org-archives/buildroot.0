From: Leonid <Leonid@a-k-a.net>
Date: Mon, 8 Oct 2007 10:18:34 -0700
Subject: [Buildroot] Best buildroot options for a custom AT91RM9200
	board?
In-Reply-To: <6090c5eb0710080804n3f6d4f0bj42b0d31d24d01e9@mail.gmail.com>
References: <6090c5eb0710080804n3f6d4f0bj42b0d31d24d01e9@mail.gmail.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3C0246F764@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Jorge: 

________________________________________________________________________
On Monday, October 08, 2007 8:05 AM Jorge S. wrote:
> I'm trying to create a root fs for a custom board wich is AT91rm9200
based. So i have several newbie (maybe dumb) questions.

LB: I was working on the same last 2 weeks.

> I've started with the svn version of buildroot and after dealing with
lots of "soft-float"/uCLibc problems 
> finally discovered that there's a prebuilt setup from the Atmel people
that seems to work. 

[snip]

> 1) Last buildroot svn version
> 2)
ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_
Host/Buildroot/buildroot-20070116-RC2.tar.bz2

LB: I couldn't make option 1 working for me, but that probably was
because I was really newbie for builsroot couple weeks ago. I may try
again in future. After all I used second option successfully.

> And the last question, I'm using a 8MB Spi DataFlash for storage, so
my rootFS cannot grow more than 6 MB (since i use at least 2MB 
> for bootloader, kernel and other stuff) is there any "must have"
minimal configuration recommended? 

LB: My filesystem footprint is 8M now, but I have included gdb for
target and my application also takes space, bare minimum is about 6M.
Ramdisk (packed) was 1.4M and 3.7M respectively, so you can work with 8M
flash though I suggest bigger one.

Leonid.
