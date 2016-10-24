From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Oct 2016 15:05:00 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <20161024142840.4c398e72@free-electrons.com>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <874m42lztg.fsf@dell.be.48ers.dk>
 <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
 <20161024142840.4c398e72@free-electrons.com>
Message-ID: <8c64e8e7-1907-5e74-c743-3d980539be06@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-10-16 14:28, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 24 Oct 2016 13:19:30 +0100, Vicente Olivert Riera wrote:
[snip]
>> And another question. What happen if we use the real compiler to build
>> kernels and bootloaders? Would that be a problem? I don't know other
>> architectures, but for MIPS the only variable we need to pass to the
>> make program for building a kernel is ARCH=mips. The defconfig will set
>> all the rest (float, endian, etc.).
> 
> Could be an approach to investigate, but I'm afraid is not as simple as
> it looks. "perf" for example is part of the kernel, built with our
> cross-compiler, but we would need to go through the wrapper because
> "perf" is user-space code, and it does need to link with a bunch of
> libraries available in our sysroot (so the --sysroot flag is important).

 ... but perf *is* built separately from the kernel code, in linux-tools-perf.

 I kind of like the idea of having a TARGET_CC_UNWRAPPED that we pass to the
packages that are non-hosted.


> Perhaps we need an environment variable in the wrapper that tells it
> "use all your flags" vs. "use only the flags that are really important,
> such as --sysroot". We could then set this environment variable when
> building specific packages such as the kernel and bootloaders.

 This, however, is probably the safest solution, and fairly elegant as well.
I'll keep it in mind when I (finally) start working on this :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
