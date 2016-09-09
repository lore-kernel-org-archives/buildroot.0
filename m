From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Sep 2016 23:58:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-08
In-Reply-To: <20160909063029.AD4F810253E@stock.ovh.net>
References: <20160909063029.AD4F810253E@stock.ovh.net>
Message-ID: <1752cdf6-e88e-27f6-4822-e8d32fa41186@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 09-09-16 08:30, Thomas Petazzoni wrote:
> microblazeel | make[1]: *** Waiting for un... | TIM |
> http://autobuild.buildroot.net/results/6998b1cafe344d2a1c07ff0830067917ed165c1e
> microblazeel | make[1]: *** Waiting for un... | TIM |
> http://autobuild.buildroot.net/results/83e504d5827a0a4e10213724875427a3a5eaf8a2
> microblazeel | make[2]: *** Waiting for un... | TIM |
> http://autobuild.buildroot.net/results/08be1d3004cb90959ebaae2b85c6c9cdd821e6a6
> microblazeel | make[2]: *** [libavfilter/a... | TIM |
> http://autobuild.buildroot.net/results/1ac5c0bdbc2c139907a0e55bbaee18323993514a

 These timeouts are not the usual timeouts but actual build errors in ffmpeg.

/home/test/autobuild/run/instance-3/output/host/usr/lib/gcc/microblazeel-buildroot-linux-uclibc/4.9.4/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: FDE encoding in /home/test/autobuild/run/instance-3/output/host/usr/lib/gcc/microblazeel-buildroot-linux-uclibc/4.9.4/libgcc.a(_divdi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.

 We actually had this issue before, with bullet, and I reported it upstream [0]. It seems to be fixed: this doesn't occur anymore with gcc6.

 However, with gcc6 the compilation of libavfilter/avfilter.o doesn't finish :-(

 I'm giving up...

 Regards,
 Arnout


[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68476
-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
