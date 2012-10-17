From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Oct 2012 22:20:14 +0200
Subject: [Buildroot] Configuring for a custom kernel.
In-Reply-To: <1350317845.18861.38.camel@Homeserver>
References: <1350317845.18861.38.camel@Homeserver>
Message-ID: <507F12FE.9030108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/12 18:17, Chris Wilkinson wrote:
>
> I saved a custom kernel tarball to<BR>/dl.
>
> I extracted the kernel with 'make linux-extract', creating
> <BR>/output/build/linux-custom/.
>
> I configured the kernel with 'make linux-menuconfig'.
>
> This saves the kernel config in<BR>/output/build/linux-custom/.config.
>
> What should the kernel settings be in<BR>  'make menuconfig' for
>
> kernel version (custom tarball and its filename?)

  Put the custom tarball in some other location (which may, BTW, be
an URL or a scp:// location), not in the dl dir.  Buildroot will
download/copy it to the dl dir.

> kernel configuration ('using defconfig' or 'using custom config'?)

  Select 'using custom config'.  Then specify a location for your
custom config (which doesn't exist yet).  Then, run
'make linux-update-defconfig' (assuming your kernel is 2.6.33 or later,
otherwise you have to use 'make linux-update-config').  The latter command
will copy the linux-custom/.config file to the location you specified
in menuconfig.


  Regards,
  Arnout


> Defconfig name
>
> Neither of the two kernel configuration options available seem to point
> to ./config

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
