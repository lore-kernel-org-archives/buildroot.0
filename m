From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 17:11:33 2006
Subject: [Buildroot] [PATCH] ccache fails if toolchain build dir is deleted
Message-ID: <c1bf1cf0607211711g5b7f5d7bmbaad3f8e7c2add15@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Deleting the toolchain build directory causes ccache to stop working.
This is unfortunate because the toolchain would otherwise be easy to
package up and distribute as an rpm, which developers could then use
to build packages outside buildroot.

The attached patch prevents ccache.mk from hardcoding the ccache
directory to the toolchain build tree. This restores ccache's default
behavior of looking at the CCACHE_DIR environment variable or using
$HOME/.ccache if it is unset. Using the same ccache directory with
different toolchains shouldn't cause trouble, as ccache is smart
enough to take the compiler into account when computing source file
hashes.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-ccache-unhardcode-cache-dir.patch
Type: text/x-patch
Size: 613 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/3557ef9a/buildroot-ccache-unhardcode-cache-dir-0001.bin
