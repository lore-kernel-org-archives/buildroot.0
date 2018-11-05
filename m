From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Nov 2018 23:17:46 +0100
Subject: [Buildroot] [PATCH] Config.in: security hardening: disable
 FORTIFY_SOURCE for gcc < 6
In-Reply-To: <CANQCQpYGPBpEivKh893TPeoqoOtS+FxGmNjYvmgwGWoArOyu=A@mail.gmail.com>
 (Matthew Weber's message of "Mon, 5 Nov 2018 14:35:56 -0600")
References: <20181105200750.6039-1-romain.naour@gmail.com>
 <CANQCQpYGPBpEivKh893TPeoqoOtS+FxGmNjYvmgwGWoArOyu=A@mail.gmail.com>
Message-ID: <87bm73cgol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Romain ,
 > On Mon, Nov 5, 2018, 14:07 Romain Naour <romain.naour@gmail.com wrote:

 >> As reported in the bug report [1], gcc < 6 doesn't build when
 >> FORTIFY_SOURCE is set to 1 or 2. The issue is related to the
 >> upstream bug report [2] but the patch fixing the issue for gcc 6
 >> has not been backported to earlier gcc versions.
 >> 
 >> Add a dependency on gcc at least version 6 to BR2_FORTIFY_SOURCE_1
 >> and BR2_FORTIFY_SOURCE_2.
 >> 

 > Sorry about the HTML email.

 > Could this dependency be conditional on if a internal toolchain is used?

Ahh yes, if this is really about *building* gcc, then it should be

depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6

-- 
Bye, Peter Korsgaard
