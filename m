From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Feb 2018 16:20:25 +0100
Subject: [Buildroot] Xilinx-specific files not present in offline build
In-Reply-To: <CAMd7AX_ChKxJPAyhS9WeOP=AB0upLQ5COkQ-MYw6mg63GX3knQ@mail.gmail.com>
References: <CAMd7AX_ChKxJPAyhS9WeOP=AB0upLQ5COkQ-MYw6mg63GX3knQ@mail.gmail.com>
Message-ID: <d4b33919-b5b8-d354-1b7a-9be97e1ebe95@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Aaron,

On 28-02-18 15:13, A wrote:
> 
> I'm attempting an offline build, dowloading sources on a cygwin system with
> internet, and copying the dl/* files to the redhat system without internet.
> 
> My most recent issue is the "make" on the build system appears to make some
> progress, then eventually fails due to missing xilinx header files.

 Why do you say that this is about Xilinx header files?

> 
> Any advice for things to check, or more information that would be helpful to
> diagnose?
> 
> ? INSTALL include/linux/isdn (1 file)
> ? INSTALL include/linux/mmc (1 file)
> ./scripts/Makefile.headersinst:55: *** Missing UAPI file
> ./include/uapi/linux/netfilter/xt_CONNMARK.h.? Stop.

 This looks like it's the installation of the kernel headers (but the part of
the log that proves that is missing here; it's a few lines after). This should
not happen, it looks as if your kernel archive is broken somehow.

 Or more likely, I'm missing something :-)

 Could you paste a little more of the output?

 Regards,
 Arnout

> make[4]: *** [netfilter] Error 2


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
