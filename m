From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 7 Oct 2011 20:10:49 +0200
Subject: [Buildroot] [PATCH] crosstool-ng: add dependency to host-lzma
	if no lzma found
In-Reply-To: <5ce1be6b920b684e152c.1317999108@localhost6.localdomain6>
References: <5ce1be6b920b684e152c.1317999108@localhost6.localdomain6>
Message-ID: <201110072010.50040.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 07 October 2011 16:51:48 Thomas De Schampheleire wrote:
> Crosstool compilation fails when lzma is not present. If not present on the host
> system, we should compile one ourselves.
> 
> This patch uses the already existing but seemingly unused check-host-lzma.sh
> script in toolchain/dependencies.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

NAK.

A better solution is to remove the check from crosstool-NG's ./configure.
It's the way I followed upstream.

In fact, it's a bit more complex than that. In the current development
version of crosstool-NG, ./configure still checks for lzma, but it is
not an error if it is missing.

lzma (and/or now xz-utils) are used in crosstool-NG for two things:
 - apply the contributions in contrib/
 - download lzma/xz-compressed tarballs if possible

For buildroot use-case, just removing the check is largely sufficient,
because buildroot does not use the contrib/ution in crosstool-NG, and
the download will not try .xz or .lzma, but directly try .bz2

So, this is a NAK on my part.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
