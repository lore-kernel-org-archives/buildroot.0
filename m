From: James J. Dines <jdines@jdines.net>
Date: Tue, 07 Sep 2010 13:42:47 -0400
Subject: [Buildroot] Why is extfs filesystem mandatory?
In-Reply-To: <1283878421.11196.7.camel@dubciaranr1.verifone.com>
References: <4C863CDD.8020805@jdines.net> <20100907165546.06ed2a29@surf>	
	<4C8669B3.4030209@jdines.net>
	<1283878421.11196.7.camel@dubciaranr1.verifone.com>
Message-ID: <4C867997.1050309@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/07/2010 12:53 PM, Quotient Remainder wrote:
> Ar M?irt, 2010-09-07 ag 12:34 -0400, scr?obh James J. Dines:
> 
>> In the menuconfig, under "Target Filesystems" I have an asterisk
>> surrounded by dashes, i.e.:
>>
>> - -*- ext2 root filesystem
> 
> Do you have ISO9660 FS enabled by any chance?
> 
> From the help for ext2:
> Selected by: BR2_TARGET_ROOTFS_ISO9660 && (BR2_i386 || BR2_x86_64) && BR2_LINUX_KERNEL
> 
> 
Yes, that was the issue.  I have to admit I feel a bit foolish having
not looked more closely at the dependencies by choosong the help option,
but on the other hand I cannot imagine why this dependency exists.
Obviously one can have an iso image without having an ext2 filesystem,
or there would be no such thing as an iso image for Windows.

Or am I missing something?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMhnmWAAoJECSpOhdQESq67zsH/RobUwNThApVjeWikX29G9MK
qyS2Kiggg8c2DV6FKeOmwBPvDgTe1QxGnGdxAPG0SgWj+GPd2mVMiha7ZaGZR+tB
cEhtVBeTeDexelV8K+XLvTq3e6cLAVJ2uEuX7sc/L+P1aHlbgEdXc9MdTlUSnkic
xQ4CPX5MvrXyJXimGPipb7PUjS2u6g7rDCqhsrbFeN7B/nE1vlGDcxYCEeWRoi01
ww8KtcuaGPwKw/c5bKXEED42rkQoPQWeCvZdAZauH1IEJ6K8cIKxMft+xnBDMeDJ
/tdrhQLK1Q9scNqrTGEwZ/lwPrm8pL5VwxPZvPk9DH6g8eu0bvLK56V0Q7xJ6jQ=
=foEH
-----END PGP SIGNATURE-----
