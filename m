From: Ronny Meeus <ronny.meeus@gmail.com>
Date: Mon, 26 Nov 2012 21:45:52 +0100
Subject: [Buildroot] Passing arguments to the linker when external
 toolchain is used.
In-Reply-To: <50B29AE1.1000100@mind.be>
References: <CAMJ=MEc1T6Uz2tLS3ybdp5hwv7zX15ufGYMVuAY7jOSA+U=sYg@mail.gmail.com>
 <50B15945.90300@mind.be>
 <CAMJ=MEfp0Bevk141N4n8KAn2AzbRpEDfLX9513crSDLTxBKkwA@mail.gmail.com>
 <50B28348.7090701@mind.be>
 <CAMJ=MEcBJR8R_2SsfuLSz1dxheVz-iede6R6wG-xd7RvxAdpTQ@mail.gmail.com>
 <50B29AE1.1000100@mind.be>
Message-ID: <CAMJ=MEcN43B=aMbLGcG4dwMGXf5dq0Reu-qBe_UEhuDi3O13Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 25, 2012 at 11:25 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/11/12 21:56, Ronny Meeus wrote:
>>
>> On Sun, Nov 25, 2012 at 9:44 PM, Arnout Vandecappelle<arnout@mind.be>
>> wrote:
>
> [snip]
>
>>>   In that case, why not just pass them with LDFLAGS?
>>>
>>
>> Our SW is build in 2 parts: the Linux kernel, buildroot and other
>> components are build via buildroot itself.
>> Next to this we also have other applications that we build in with "a
>> private build infrastructure" using the toolchain, include files etc
>> of buildroot.
>>
>> By adding the extra linker parameters with the wrapper construction we
>> can transparantly introduce a new toolchain (with the required
>> parameters) in that environment without impact on our build
>> infrastructure. The big advantage is that the complete toolchain
>> selection (CPU,ABI etc) only needs to be done in buildroot.
>
>
>  Yes, sounds like a valid use case.
>
>  I also expect that the LDFLAGS are not passed reliably for all packages:
> they are hardly ever used, and there are no autobuilder configurations with
> any LDFLAGS, so errors in passing LDFLAGS can go unnoticed.
>
>  I don't think we have any other architecture currently in buildroot that
> requires something to be passed to ld. If this wrapper construction is
> added to buildroot, it would be good if we would also have an internal
> use case.
>

I do not really understand. On one hand you say it is a valid use-case
and on the other hand you say that an internal use-case is needed.
Shall I put some more effort in generalising the C code of the
wrapper?
Is there any chance that it gets accepted by the community?

---
Ronny

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
