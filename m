From: Austin S Hemmelgarn <ahferroin7@gmail.com>
Date: Mon, 04 Aug 2014 14:10:55 -0400
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <CAE9DZUSKbr3gzUW=Oh=f7P9q_Fs=nh7S0OpxyL_tbYV3NfxhAQ@mail.gmail.com>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
 <20140804070558.GK32743@waldemar-brodkorb.de>
 <CAE9DZUSKbr3gzUW=Oh=f7P9q_Fs=nh7S0OpxyL_tbYV3NfxhAQ@mail.gmail.com>
Message-ID: <53DFCCAF.2080108@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-08-04 13:56, Dallas Clement wrote:
> 
> On Mon, Aug 4, 2014 at 2:05 AM, Waldemar Brodkorb <wbx@openadk.org
> <mailto:wbx@openadk.org>> wrote:
> 
>     Hi Dallas,
>     Dallas Clement wrote,
> 
>     > Hi All,
>     >
>     > I am trying to figure out a way to produce a uSD card image file
>     during my
>     > build process and do it as a non-root user.  I am hoping to do
>     this from a post
>     > image script.
>     >
>     > I can create the image file with dd and partition it with parted
>     as a non-root
>     > user.  However, I have not figured out how to format, and populate
>     the image
>     > file.  Tools such as kpartx and losetup seem ideal for this
>     purpose except that
>     > they must be run as root.
>     >
>     > Does anyone know of a way to do this using qemu or fuse or related
>     tools?
> 
>     You could use genext2fs to generate a filesystem as non-root.
> 
>     Installing a bootloader as non-root would be tricky, but is
>     possible, too.
> 
>     best regards
>      Waldemar
> 
> 
> Wow!  This is perfect.  I searched all over for a tool like this. 
> Couldn't find anything.  Thanks Waldemar!  Do you know of a similar tool
> to make / populate fat partitions.  I need to work with both fat and ext2.

you can use any mkfs command as a non-root user, and for FAT you should
be able to find a fuse driver for manipulating it (or there is always
mtools).


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2967 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140804/63ab5a1e/attachment.p7s>
