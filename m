From: Brian C. Lane <bcl@brianlane.com>
Date: Sun, 13 Aug 2006 11:03:11 -0700
Subject: [Buildroot] Building for ARM
In-Reply-To: <c1bf1cf0608121653o1f5f4eb5y114c07b9889636d7@mail.gmail.com>
References: <44DE650C.2060402@brianlane.com>
	<c1bf1cf0608121653o1f5f4eb5y114c07b9889636d7@mail.gmail.com>
Message-ID: <44DF695F.2010601@brianlane.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ed Swierk wrote:
> On 8/12/06, Brian C. Lane <bcl@brianlane.com> wrote:
>> 3. I added the buildroot tools to the beginning of the path and try to
>> compile the kernel with:
>>
>> export PATH=../buildroot/build_armeb/staging_dir/bin:$PATH
>> make CROSS-COMPILE="armeb-linux-" ARCH="arm" bzImage

[snip]

> 
> Not sure if this is the cause of your problem, but adding a relative
> pathname to PATH doesn't seem like a good idea. Try
> PATH=$(pwd)/../buildroot/build_armeb/staging_dir/bin:$PATH instead.
> 

Very good point. I've switched to using an absolute path.


>> Does anyone have any idea of what I'm doing wrong? I've also done a
>> bunch of googleing and haven't come up with a decent howto for building
>> a basic system (coverage of uclibc, busybox and buildroot are great, but
>> none seem to talk about the kernel).
> 
> The various kernel makefiles under the targets directory are
> instructive; I created a fairly generic linux kernel makefile based on
> those. See the attached patch if you want to try it out for yourself.

Thanks for the patch -- After changing your ppc references to arm it
almost works :) It compiles most of the kernel without complaint but is
now stopping in rtc-lib.c with a complaint about cmpxchg:

drivers/built-in.o: In function `drm_lock_take':
rtc-lib.c:(.text+0x86920): undefined reference to `cmpxchg'
drivers/built-in.o: In function `drm_lock_free':

I probably don't have the kernel configured quite right.

Brian

- --
- ---[Office 71.6F]--[Outside 83.5F]--[Server 85.4F]--[Coaster 71.5F]---
Linux Software Developer                      http://www.brianlane.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Remember Lexington Green!

iD8DBQFE32lfIftj/pcSws0RAtSKAJwKzm6zGo/0Euxylr3w6xBMHRJPRgCcDzS6
A+BKy6/fZWaPMoLt+0O2wGs=
=HxY/
-----END PGP SIGNATURE-----
