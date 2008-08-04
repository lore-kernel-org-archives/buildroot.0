From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 04 Aug 2008 14:43:58 +0200
Subject: [Buildroot] C double type problem - at91sam9263
In-Reply-To: <223E6519BDCAC74695BEE9D163F8E6592306E3@oakleaf10.oakleafconsultancy.com>
References: <223E6519BDCAC74695BEE9D163F8E6592306E3@oakleaf10.oakleafconsultancy.com>
Message-ID: <4896F98E.1050203@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Richard Hardy wrote:
> Hi Everyone,
> 
> I am quite new to using buildroot and embedded linux systems in general.
> However, I have managed to use buildroot to get a (nearly) working
> system up and running for an at91sam9263 board. (kernel v 2.6.22, uClibc
> v 0.9.29)
> 
>  
> 
> I have one annoying problem though. One of the packages I am compiling
> from source uses C's "double" type, and this does not seem to be
> behaving as I need it to.
> 
>  
> 
> I have created a simple example program:
> 
>  
> 
> ...
> 
> int main (int argc, char *argv[])
> 
> {
> 
> double test;
> 
> test = 1;
> 
> fprintf(stderr, "Test double = %f.\n", test);
> 
> }
> 
>  
> 
> And the output that I see is:
> 
>  
> 
> Test double = 1000000.
> 
>  
> 
>  
> 
> I guess that this is due to one of the options, somewhere, in either the
> Linux Kernel, uClibc or something else, but I don't know how to find out
> which one. 
> 
>  
> 
> Can anyone point me in the right direction of where to look?

I see it too on cris architecture. I think it is uClibc related, at least 0.9.29. 
I'll try to reproduce on x86..
IMHO only printf is buggy, otherwise doubles and floats seem to have correct value.

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
