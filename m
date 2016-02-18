From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Feb 2016 14:20:30 +0000
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: append endianness
 argument to TARGET_LD for MIPS
In-Reply-To: <87si0qwetv.fsf@dell.be.48ers.dk>
References: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160217221313.439547e4@free-electrons.com> <56C4F70A.8060506@mind.be>
 <20160218090740.74a227b0@free-electrons.com>
 <87si0qwetv.fsf@dell.be.48ers.dk>
Message-ID: <56C5D32E.1090002@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, Thomas and Arnout,

so, do you prefer a patch to just fix perf?

The perf Makefile doesn't read an environmental LDFLAGS variable, so
adding -EL/-EB to LDFLAGS will not work.

Also, doing LD="$(TARGET_CC)" in order to use gcc for linking doesn't
work either and it fails with errors about '-lgcc_s' not found.

Are you ok with doing LD="$(TARGET_LD) -EL/-EB" only when building perf
for MIPS architecture?

Regards,

Vincent.

On 18/02/16 09:25, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  >> Unless Vicente volunteers to work on an ld wrapper, I guess on the short term
>  >> we should take patches like these. That said, it should really be passed through
>  >> LDFLAGS and not LD itself.
> 
>  > And the hack be limited to those specific packages that are broken,
>  > IMO. At least until we realize how many packages are affected by this.
>  > It would be annoying to put those additional flags globally just to fix
>  > one single package.
> 
> As I understood it from Vicente on IRC:
> 
> - The endian flags are always required when linking
> - The options are understood both when linking with gcc and ld
> 
> Which is why I suggested we do it globally.
> 
