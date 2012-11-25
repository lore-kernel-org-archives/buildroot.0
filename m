From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Nov 2012 21:44:56 +0100
Subject: [Buildroot] Passing arguments to the linker when external
 toolchain is used.
In-Reply-To: <CAMJ=MEfp0Bevk141N4n8KAn2AzbRpEDfLX9513crSDLTxBKkwA@mail.gmail.com>
References: <CAMJ=MEc1T6Uz2tLS3ybdp5hwv7zX15ufGYMVuAY7jOSA+U=sYg@mail.gmail.com>
 <50B15945.90300@mind.be>
 <CAMJ=MEfp0Bevk141N4n8KAn2AzbRpEDfLX9513crSDLTxBKkwA@mail.gmail.com>
Message-ID: <50B28348.7090701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/12 18:23, Ronny Meeus wrote:
>>> >>  In my application we need to create partially linked objects that will
>>> >>  be linked together in a final link step.
>>> >>  I see that the correct options (ABI etc) are passed to the compiler
>>> >>  via the ext-toolchain-wrapper construction, but for the linker this
>>> >>  technique is not used. It is directly invoked without modifying the
>>> >>  command line. If I want to create this partially linked file, I need
>>> >>  to pass an extra option the linker to indicate that is needs to use
>>> >>  the N32 abi (-melf32btsmipn32).
>> >
>> >
>> >    First of all, I don't understand why ld needs any option that we normally
>> >  pass to the compiler.  Do the -march, -mtune and -mfpu options even work
>> >  in ld?
> I think you miss-understood my mail.
> The linker needs a different option (-melf32btsmipn32) while the
> compiler needs -march, -mtune and -mfpu etc.
> For the compiler there is no issue, it is the linker for which no
> options are passed.

  In that case, why not just pass them with LDFLAGS?


> If you look to the changes I made to the wrapper, you can see that a
> completely different set of options can be passed to the linker. The
> compiler options are passed to the compiler while a different set of
> options is passed to the linker.

  Sorry, I didn't look at the patch in that much detail...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
