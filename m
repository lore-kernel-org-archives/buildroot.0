From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 17 Jan 2007 10:31:30 +0100
Subject: [Buildroot] netcat returns
In-Reply-To: <78e18a710701161527k16cb2503x2d728ad6deac6185@mail.gmail.com>
References: <78e18a710701161527k16cb2503x2d728ad6deac6185@mail.gmail.com>
Message-ID: <20070117093130.GA25996@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2007 at 12:27:12AM +0100, iks hefem wrote:
>hi, could you include netcat to your great buildroot distro ?
>A patch was submitted here :
>http://busybox.net/lists/buildroot/2006-November/000440.html (with a small
>problem : the last endif in the .mk file is not added properly due to a bad
>"patched patch file".)
>
>To answer the question : why not busybox ? Well , because is more powerful :
>udp mode by example.

Please make a complete svn diff --diff-cmd diff -x -rdup package/ >
~/buildroot.add-package-netcat.diff  and test it.

The patch you link to above does hardcode "tar xzf" which is not
acceptable. Fix it to do what all other packages do (NETCAT_ZCAT etc).
The CC_FOR_BUILD is nowadays already contained in the
TARGET_CONFIGURE_OPTS, so remove it.

Oh, and i, personally, would prefer to use the version that comes with
debian, since it seems to be more robust:
http://ftp.debian.org/debian/pool/main/n/netcat/

see
$ grep "debian/patch" package/*/*mk
on one possible way to support such packages that have debian patches
applied.
