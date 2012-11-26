From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Nov 2012 23:33:19 +0100
Subject: [Buildroot] Passing arguments to the linker when external
 toolchain is used.
In-Reply-To: <CAMJ=MEcN43B=aMbLGcG4dwMGXf5dq0Reu-qBe_UEhuDi3O13Rw@mail.gmail.com>
References: <CAMJ=MEc1T6Uz2tLS3ybdp5hwv7zX15ufGYMVuAY7jOSA+U=sYg@mail.gmail.com>
 <50B15945.90300@mind.be>
 <CAMJ=MEfp0Bevk141N4n8KAn2AzbRpEDfLX9513crSDLTxBKkwA@mail.gmail.com>
 <50B28348.7090701@mind.be>
 <CAMJ=MEcBJR8R_2SsfuLSz1dxheVz-iede6R6wG-xd7RvxAdpTQ@mail.gmail.com>
 <50B29AE1.1000100@mind.be>
 <CAMJ=MEcN43B=aMbLGcG4dwMGXf5dq0Reu-qBe_UEhuDi3O13Rw@mail.gmail.com>
Message-ID: <50B3EE2F.2020901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/11/12 21:45, Ronny Meeus wrote:
>> >    I don't think we have any other architecture currently in buildroot that
>> >  requires something to be passed to ld. If this wrapper construction is
>> >  added to buildroot, it would be good if we would also have an internal
>> >  use case.
>> >
> I do not really understand. On one hand you say it is a valid use-case
> and on the other hand you say that an internal use-case is needed.

  If ld requires some architecture specific flag to work, then it's a valid
use case to add this in the wrapper. (However, I now realize that this
would only work for external toolchains...  For internal and crosstool-NG
toolchains, we don't have a wrapper and it's not needed because those
things are hard-coded at compile time. So how would you deal with that for
this ld case?)

  But it would improve acceptance if there were also a use case inside
buildroot. I tried to find a package that would also require the additional
LD flag, but it seems that most packages that do partial linking use
$(CC) -nostdlib.

> Shall I put some more effort in generalising the C code of the
> wrapper?
> Is there any chance that it gets accepted by the community?

  If you can show a .config that fails to build without it: certainly.
Otherwise, it depends on how hard you push it :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
