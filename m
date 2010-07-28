From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Wed, 28 Jul 2010 20:02:53 +0100
Subject: [Buildroot] makedevs: line 49: regular file (...)
 buildroot/output/target/usr/share/udhcpc/default.script does not exist: No
 such file or directory
In-Reply-To: <1280200547.30894.34.camel@segulix>
References: <1280116089.28885.29.camel@segulix>
	<20100726082816.7a1bd8d1@surf> <1280151165.31502.6.camel@segulix>
	<20100726154939.6a80081d@surf>  <1280154696.31502.11.camel@segulix>
	<1280200547.30894.34.camel@segulix>
Message-ID: <1280343773.3560.4.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2010-07-27 at 04:15 +0100, Sergio Monteiro Basto wrote:
> I think with this main change: 
> -# BR2_PROGRAM_INVOCATION is not set
> +BR2_PROGRAM_INVOCATION=y
> 
> Give me the habitability to build libglib2-2.22.5 which give an error
> like buildroot/output/build/libglib2-2.22.5/.stamp_configured] Error
> 1,
> (I lost the error message). Which, let me think, that libglib2 also
> needs depend on PROGRAM_INVOCATION in .config, like tar and
> coreutils. 

This assumption is not correct,
After get configure:
checking for libintl.h... (cached) no
configure: error: 
*** You must have either have gettext support in your C library, or use
the
*** GNU gettext library.
(http://www.gnu.org/software/gettext/gettext.html

make: ***
[/home/sergio/hardware/moviecube/buildroot/output/build/libglib2-2.22.5/.stamp_configured] Error 1

if I do:
make flush 
make
I got 
checking libintl.h presence... yes
checking for libintl.h... yes
checking for ngettext in libc... no
checking for bindtextdomain i

Thanks, 
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3293 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100728/189b2c7f/attachment-0001.bin>
