From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 May 2018 08:23:29 +0200
Subject: [Buildroot] Makefile.mk to compile using openmpi
In-Reply-To: <CAG__4yRmqg3uL0NquVbTgwbkqO-STy5vU1hSW3Xm8CBDdz=HBw@mail.gmail.com>
References: <CAG__4ySBJQCD-gCtQeYYpYhsiyUm24OF2nZOqOqxPjeuZkpZTA@mail.gmail.com>
 <e00dae76-144a-ca72-99e8-bac8f0fbd443@mind.be>
 <CAG__4yRmqg3uL0NquVbTgwbkqO-STy5vU1hSW3Xm8CBDdz=HBw@mail.gmail.com>
Message-ID: <24d68d74-3178-27b3-e5b2-f30fa06c994a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-05-18 06:02, Marco Espinoza wrote:
> Hello
> 
> Thanks for your response.
> I understand we need to add the proper CFLAGS for MPI, but I was anot able to do
> the cross-compilation using CFLAGS.
> Do you have a Makefile example with the proper CFLAGS to cross-compile MPI?

 I don't entirely understand your question.

 The openmpi packages already does cross-compilation with the proper CFLAGS.
However, it also cross-compiles mpicc, so you can't execute it during the build.

 So to get mpicc, you have to build openmpi for the host as well. This could be
as simple as adding $(eval $(host-autotools-package)) at the end of openmpi.mk.
But most likely you'll need to add some options to HOST_OPENMPI_CONF_OPTS as well.


 Regards,
 Arnout

> 
> Thanks
> Marco
> [snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
