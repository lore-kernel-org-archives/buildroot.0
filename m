From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 08:15:02 +0200
Subject: [Buildroot] iMX6Q prerequisite patches for Qt5
In-Reply-To: <51034.217.149.209.147.1366471569.squirrel@webmail.internl.net>
References: <51034.217.149.209.147.1366471569.squirrel@webmail.internl.net>
Message-ID: <5174D566.7010403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Henk,

On 20/04/13 17:26, H.Fijnvandraat at inter.nl.net wrote:
> Hi All,
>
> I have been successfull in compiling Qt5 for the Freescale iMX6Q processor
> using the contributions from Thomas Petazzoni.
>
> However, the iMX6Q uses a closed source Vivante GPU, which must be handled
> by some libraries.
>
> The attached patches are an attempt to incorporate these into Buildroot.

  I had to make changes in Qt5 itself as well to make it work. Didn't you 
need to?


  I also have the following problem with the gpu-viv-bin-mx6q package. 
It's a binary that is linked to a soft-float glibc library.  I had 
already added

         # Library binaries are linked against libc.so.6
         depends on BR2_TOOLCHAIN_CTNG_glibc || \
                 BR2_TOOLCHAIN_CTNG_eglibc || \
                 BR2_TOOLCHAIN_EXTERNAL_GLIBC

but that doesn't yet capture the softfloat aspect. The alternative is to 
lock it on to a specific external toolchain version, but I don't like to 
take away so much freedom from the user (plus it's really annoying when 
deprecating old toolchains).


  Finally, also some comments on the patch submitting process.

- Please send patches in-line, with a single patch per e-mail. That makes 
it easy to make reviews per e-mail. The preferred way of sending patches 
is to use git send-email.

- Please make separate patches for adding a new package and for updating 
other packages to make use of it. Also make the version bump of imx-lib a 
separate patch.

- Please word-wrap all lines at 80 columns.


  If you are not going to submit updated versions of your patch, please 
let us know so somebody else can take over (we will make sure your 
authorship information is retained).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
