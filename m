From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 May 2018 00:40:20 +0200
Subject: [Buildroot] Makefile.mk to compile using openmpi
In-Reply-To: <CAG__4ySBJQCD-gCtQeYYpYhsiyUm24OF2nZOqOqxPjeuZkpZTA@mail.gmail.com>
References: <CAG__4ySBJQCD-gCtQeYYpYhsiyUm24OF2nZOqOqxPjeuZkpZTA@mail.gmail.com>
Message-ID: <e00dae76-144a-ca72-99e8-bac8f0fbd443@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-05-18 18:44, Marco Espinoza wrote:
> Hello
> 
> I'm using buildroot to generate an image for a zedboard. And I'm trying to
> add an application which require openmpi compilation.
> However I'm having issues, because my compilation is failing.
> The issue I'm having is because my program requires mpicc compilation, but,
> despite I have installed openmpi in my buildroot image, the
> cross-compilation is not working.
> 
> Would you please help me telling what do I need in my *.mk file, to
> cross-compile properly using buildroot  a program which requires mpicc?

 I guess you need to have an mpicc built for the host, and it looks like the
openmpi build system is not really cross-compile friendly. The easiest approach
is to make a host-openmpi package. But some additional work will be needed, to
make sure the opal_wrapper calls the target toolchain with the appropriate
CFLAGS instead of the host toolchain...

 Regards,
 Arnout

> 
> Thanks
> Marco Espinoza
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
