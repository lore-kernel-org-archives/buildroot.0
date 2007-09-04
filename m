From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 4 Sep 2007 22:21:58 +0200
Subject: [Buildroot] Cannot select architecture variant.
In-Reply-To: <46DC2A5A.7080001@os.pl>
References: <46DC2A5A.7080001@os.pl>
Message-ID: <20070904202158.GU11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 03, 2007 at 05:38:02PM +0200, Kyku wrote:
>Hello,
>I'm pretty new to buildroot so please be patient with me :-)
>I have the following problem with svn version of buildroot:
>Whenever I select other target architecture variant than i386 in the 
>menuconfig I get the following error after typing make:
>
>ln: `/tmp/buildroot/build_i686/staging_dir/usr/.': cannot overwrite 
>directory
>make: *** [/tmp/buildroot/build_i686/staging_dir] Error 1
>
>Can I do anything with this?

This comes from toggling gcc's sysroot support..
A make clean will wipe your *build_arch dirs and will let you restart
from a fresh, clean build.

HTH
