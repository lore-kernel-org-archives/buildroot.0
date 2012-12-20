From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Dec 2012 11:34:26 +0100
Subject: [Buildroot] [PATCH RFC 5/6] libfslcodec: new package
In-Reply-To: <87a9t9ytss.fsf@dell.be.48ers.dk>
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
 <1355960256-10786-6-git-send-email-arnout@mind.be>
 <653065179.1471991.1355965563202.JavaMail.root@advansee.com>
 <50D2CA07.1060503@mind.be> <87a9t9ytss.fsf@dell.be.48ers.dk>
Message-ID: <50D2E9B2.70808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/12 10:08, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle<arnout@mind.be>  writes:
>
> Hi,
>
>   >>  For packages like this one that install pre-built libraries, it
>   >>  would be good to document somewhere or to auto-check (e.g. with
>   >>  toolchain kconfig options vs.  package kconfig options) the ABI
>   >>  compatibility to make sure that there won't be any issue with the
>   >>  toolchain used.
>
>   Arnout>   I agree, but how?
>
> I don't know the specifics of this package, but presumably it only works
> with glibc and a specific soft/softfp/hard floating point mode? If so,
> we could atleast catch some of these dependencies in Config.in.

  Yes, but how to know what the dependencies are (except by run-testing 
with all the different toolchains on all the different SoCs)?

  I'd also like to find a way to decide which of the _arm9, _arm11 or 
_arm12 libraries to use (they all have the same ABI flags...).

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
