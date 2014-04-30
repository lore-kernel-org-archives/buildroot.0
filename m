From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Apr 2014 21:03:24 +0200
Subject: [Buildroot] Two stages compilation
In-Reply-To: <CAAXf6LVtAuS4DHWH9B-HtMcL-H6JszDsA2853c6FpM2Pu50WbA@mail.gmail.com>
References: <CA+TH9Vns0mvj6X2UiP_Biu1bnG4Adwg+UFhfnN9Dm4W9AGLx1A@mail.gmail.com>
 <535F8499.8070406@gmail.com>
 <CA+TH9VmbVayiELjF9FaMDBBE9tJvgBy8b2CUovg74b4qh4nBNA@mail.gmail.com>
 <CAAXf6LVtAuS4DHWH9B-HtMcL-H6JszDsA2853c6FpM2Pu50WbA@mail.gmail.com>
Message-ID: <20140430210324.31be1446@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Angelo,

On Wed, 30 Apr 2014 20:44:57 +0200, Thomas De Schampheleire wrote:

> >> A couple of months back i was able to package mono for OpenWrt (which is
> >> in this sense close to Buildroot), but i haven't finalized that project
> >> (as it turned out that the target MIPS CPU is not totally supported by
> >> Mono...). If you think it's useful, i can dig this out from the archive
> >> and share the package definition with you. Please let me know if so.
> 
> Note that Alexander Varnin has submitted a patch to the list for the
> mono runtime a while back:
> http://patchwork.ozlabs.org/patch/299488/

Though this particular package only provides a target version of Mono,
which probably means that it relies on mono being installed on the
build machine to be able to build all the Mono C# libraries (i.e step 2
in Angelo's description).

So indeed, as Zoltan pointed out, most likely the solution is to have
both a target and a host variant for Mono. The host variant builds the
compiler, and is used on the build machine to compile all the Mono C#
libraries into the corresponding byte code. The target variant builds
the "virtual machine" that runs on the target. And obviously most
likely the target variant will have a dependency on the host variant.

Also, the host variant building the compiler will be useful if people
want to package other Mono libraries/applications.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
