From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 08 Jun 2013 21:27:38 +0200
Subject: [Buildroot] Buildroot 2013.05 + uClibc 0.9.30.2
In-Reply-To: <CACQMp4D5y1PQ8cBZa1esk=zuv_zgmU8eYwTVYE8=b5Ln39k-dw@mail.gmail.com>
References: <CACQMp4D5y1PQ8cBZa1esk=zuv_zgmU8eYwTVYE8=b5Ln39k-dw@mail.gmail.com>
Message-ID: <51B385AA.6040606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/13 11:12, David Kochner wrote:
> I am looking for a way to build the latest buildroot environment for
> powerpc e500v2. It actually works pretty well for me. But I would like to
> use a (much) older uClibc (0.9.30.2) as I need to compile binaries to run
> on an old system that I can't upgrade.
> I tried forcing the uClibc from 2010.02 to the latest 2013.05 release, it
> works (sort of) but I need to fix a lot of compilation issues along the
> build (not finished yet...) and I still didn't manage to successfully
> compile it.

  There have been many infrastructural changes since then so it's not 
really a surprise that this may be hard...

> Sicne tools like crosstool-ng are able to use older uClibc I assume there
> should be a way to do it.
> I was wondering if there is an "official" or "recommended" way to do this.

  Yes: build your toolchain with crosstool-NG, and import it as an 
external toolchain in buildroot.

> When I try to statically build binaries using a newer uClibc and put it
> on my target machine they crash.

  That is weird... Does the binary really not use any shared library 
(check with readelf)?  How/why does it crash?  Can you get a backtrace in 
a debugger?


  Regards,
  Arnout

>
> Right now I am facing 3 options:
> 1. Use old buildroot (2010.02) that support uClibc 0.9.30.2 but cannot
> build e500v2 binaries (can I just build generic ppc and get it over with?)
> 2. Use the newer buildroot (2013.05) and test my applications thoroughly
> to make sure the the old uClibc on my target doesn't cause me any issues
> 3. Force the older uClibc on the newer buildroot...


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
