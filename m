From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Aug 2017 22:35:05 +0200
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <20170815142032.329e8103@windsurf>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
Message-ID: <865c6d16-fd88-294e-2fea-62cf312fbacb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 14:20, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 15 Aug 2017 08:31:02 +0200 (CEST), Thomas Petazzoni wrote:
> 

>>          arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/0a3a2485c187a000482c178f1e9c64dd716a858f |     
> 
> /home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(libgstreamer_1.0_la-gstinfo.o): In function `generate_unwind_trace':
> /home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2687: undefined reference to `_ULarm_init_local'
> /home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2694: undefined reference to `_ULarm_step'
> /home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2717: undefined reference to `_ULarm_get_proc_name'
> 
> No idea. It's happening in a static linking configuration. Not sure
> what is supposed to provide those symbols.

 They are from libunwind.


> Gustavo is listed in the DEVELOPERS file for this package, but I don't
> think he is going to be active in fixing this. Anyone else to look into
> that ?

 Perhaps we should remove Gustavo from DEVELOPERS entirely?

>>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2948ec94cc4f5f98f296fa487c481e971721cff8 | ORPH
> 
> GCC ICE :
> 
> tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in validate_condition_mode, at config/rs6000/rs6000.c:17988
> 
> Weird, we're using a modern gcc version here, on a fairly well-known
> architecture. Google doesn't know much about this ICE, so perhaps we
> should report it upstream to gcc.
> 
> 
>>       x86_64 |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/8f0342b7b88df979a59fdab574b2489628d7ffa5 | ORPH
> 
> Not sure what's happening here:
> 
> linking shared-library libruby.so.2.4.1
> libruby.so.2.4.1: final close failed: Invalid operation
> collect2: error: ld returned 1 exit status
> 
> Anyone to look into this ?

 Perhaps an instance of https://sourceware.org/bugzilla/show_bug.cgi?id=20006 ?
Not sure if that patch has been applied to the sourcery toolchain - it should
be, since the binutils 2.26 fix was committed in April 2016 and the toolchain is
from November, but it's hard to be sure.



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
