From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 27 Feb 2011 23:58:40 +0100
Subject: [Buildroot] Question about buildroot generated toolchain
	binaries
In-Reply-To: <AANLkTin5E0ig9oa0m-=L-xd-eg-QoeA9xOREO2mwBYEP@mail.gmail.com>
References: <AANLkTikLie3Zj9hqYV=BvGEN+efJm0_eVKWbc-66L3wt@mail.gmail.com>
	<AANLkTi=4GCSBMgvC6M8Dh0LrpOdpOOX2J+jk6+3X5tOo@mail.gmail.com>
	<AANLkTin5E0ig9oa0m-=L-xd-eg-QoeA9xOREO2mwBYEP@mail.gmail.com>
Message-ID: <201102272358.41140.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, Charles, All,

On Sunday 27 February 2011 23:40:37 Steve Johnson wrote:
> Actually, there are two copies of gcc:
> 
> one in /usr/arm-linux/bin:
> -rwxr-xr-x. 1 na na  252289 Feb 21 20:10 gcc
> 
> and one in /usr/bin:
> -rwxr-xr-x.  2 na na  252289 Feb 21 20:10 arm-unknown-linux-uclibcgnueabi-gcc

Actually, they are the same file. If you lok at the inode number for those
two files, you'll see that the two inodes are the same. So the files are
in fact hard links. As such, they do not use more space (only a directory
entry, which is really not much).

I am not too sure why there is one in /usr/tuple/bin, but as suggested before
by Michael, it has to do with the 'machine' stuff that gcc used to use.

Before gcc-4.6 (yet to be released!), you could use a single gcc frontend to
drive different backends for different machines and/or versions of gcc. You
would do that with the -b and -V options to gcc, and then gcc would call the
/usr/tuple/bin/gcc instead.

This was seldom used, was partly broken, and is now removed from gcc-4.6.
See:
  http://gcc.gnu.org/gcc-4.6/changes.html

Also, as suggested by Michael, it was used on hosts where the standard C
compiler was not gcc. But that is now of historical interest, no? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
