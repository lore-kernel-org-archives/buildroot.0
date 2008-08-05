From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Tue, 05 Aug 2008 10:31:20 +0200
Subject: [Buildroot] C double type problem - at91sam9263
In-Reply-To: <408540dd0808041427x493ba179j78d111b5dcaa30e1@mail.gmail.com>
References: <223E6519BDCAC74695BEE9D163F8E6592306E8@oakleaf10.oakleafconsultancy.com>	<48970F48.9020104@cetrtapot.si>
	<408540dd0808041427x493ba179j78d111b5dcaa30e1@mail.gmail.com>
Message-ID: <48980FD8.1060406@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew Dombroski wrote:
> On Tue, Aug 5, 2008 at 2:16 AM, Hinko Kocevar
> <hinko.kocevar@cetrtapot.si> wrote:
>> Richard Hardy wrote:
>>>> I see it too on cris architecture. I think it is uClibc related, at
>>> least
>>>> 0.9.29.
>>>> I'll try to reproduce on x86..
>>>> IMHO only printf is buggy, otherwise doubles and floats seem to have
>>>> correct value.
> 
> I had this problem some time ago, as have others, and found the
> solution to be disabling uClibc's locale support.
> Not ideal, but at least you can display floats, dates, etc.
> 
> http://www.busybox.net/lists/buildroot/2007-March/002232.html
> http://buildroot.uclibc.org/lists/buildroot/2008-June/008945.html
> http://buildroot.uclibc.org/lists/buildroot/2008-April/008176.html
> 

Right.
I've confirmed that floats for cris architecture with uClibc without locale work.

But what about i386 toolchain with uClibc and locale enabled? It seem to work in my case.. I'll redo the test with clean buildroot just to be sure.


Best regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
