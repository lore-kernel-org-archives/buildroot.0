From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 5 Nov 2018 16:21:16 -0600
Subject: [Buildroot] [PATCH] Config.in: security hardening: disable
 FORTIFY_SOURCE for gcc < 6
In-Reply-To: <87bm73cgol.fsf@dell.be.48ers.dk>
References: <20181105200750.6039-1-romain.naour@gmail.com>
 <CANQCQpYGPBpEivKh893TPeoqoOtS+FxGmNjYvmgwGWoArOyu=A@mail.gmail.com>
 <87bm73cgol.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpZJphzALGYtMA-45_3ppea0yLhj0VrECKX8wS_BT891jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter/Romain,


On Mon, Nov 5, 2018 at 4:17 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > Romain ,
>  > On Mon, Nov 5, 2018, 14:07 Romain Naour <romain.naour@gmail.com wrote:
>
>  >> As reported in the bug report [1], gcc < 6 doesn't build when
>  >> FORTIFY_SOURCE is set to 1 or 2. The issue is related to the
>  >> upstream bug report [2] but the patch fixing the issue for gcc 6
>  >> has not been backported to earlier gcc versions.
>  >>
>  >> Add a dependency on gcc at least version 6 to BR2_FORTIFY_SOURCE_1
>  >> and BR2_FORTIFY_SOURCE_2.
>  >>
>
>  > Sorry about the HTML email.
>
>  > Could this dependency be conditional on if a internal toolchain is used?
>
> Ahh yes, if this is really about *building* gcc, then it should be
>
> depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6
>

Correct.  I'll have to dig a bit and see what the minimum supported
external toolchain version is.  I believe 5.4.x

Matt



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
