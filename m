From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Oct 2014 22:50:38 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-24
In-Reply-To: <CAMo8BfLG1rHMWQgsL=t=zW8mnWDqQ-Efzzo=M1rsx45fx9sq_A@mail.gmail.com>
References: <20141025063015.AC1771011CB@stock.ovh.net>
 <CAMo8BfLG1rHMWQgsL=t=zW8mnWDqQ-Efzzo=M1rsx45fx9sq_A@mail.gmail.com>
Message-ID: <544EBE2E.2010406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/14 12:47, Max Filippov wrote:
>> >       xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/2143b4f6f22f50ccb4af36732cc7d9304daa3ff9/
> Fails with
> 
> /usr/bin/make -j4 -C
> /home/test/autobuild/instance-1/output/build/schifra-0.0.1
> COMPILER="/home/test/autobuild/instance-1/output/host/usr/bin/xtensa-buildroot-linux-uclibc-g++"
> OPTIONS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals -pipe -Os
> -o" all
> make[1]: Entering directory
> `/home/test/autobuild/instance-1/output/build/schifra-0.0.1'
> /home/test/autobuild/instance-1/output/host/usr/bin/xtensa-buildroot-linux-uclibc-g++
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -mlongcalls -mtext-section-literals -pipe -Os   -o -o
> schifra_reed_solomon_codec_validation
> schifra_reed_solomon_codec_validation.cpp -lstdc++ -lm
> xtensa-buildroot-linux-uclibc-g++: error:
> schifra_reed_solomon_codec_validation: No such file or directory
> 
> note -o -o schifra_reed_solomon_codec_validation in the command line.
> Couldn't reproduce, looks like there's something in the environment
> variables on the build host.


 I'm surprised that you can't reproduce, because it is simply broken: the
OPTIONS variable passed to schifra's make has a redundant -o.

 I just sent a patch to fix it.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
