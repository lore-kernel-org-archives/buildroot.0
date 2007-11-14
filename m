From: Ed Stafford <ed.stafford@gmail.com>
Date: Wed, 14 Nov 2007 12:31:07 -0600
Subject: [Buildroot] Buildroot fails to build
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE10947FDF3@tranzeo-mail2.12stewart.tranzeo.com>
References: <41370a610711131402y3fe24e85we6c6fd9bafba3897@mail.gmail.com>
	<D61182AC8012EA4EBC531B3AF23BE10947FDF3@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <41370a610711141031h560c4b41l2fe74753577ae2f7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Nov 13, 2007 4:05 PM, Darcy Watkins <DWatkins@tranzeo.com> wrote:
> Hi Ed,
>
> Your ARCH appears to be set to a null value.

Ok, so I did a 'make ARCH=i386'

and felt dumb... it began working.

Then it broke while running a configure on gcc:

Unknown CPU given in --with-arch=geode.
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/home/estaffor/buildroot/toolchain_build_i386/gcc-4.2.1-initial'
make: *** [/home/estaffor/buildroot/toolchain_build_i386/gcc-4.2.1-initial/.compiled]
Error 2

I have, in the 'make menuconfig' of buildroot, set the Target
Architecture (i386) and Target Architecture Variant (geode).  Did I
run into a bug or does gcc 4.2.1 no longer support either the Geode or
requires a different setting?
