From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 6 Dec 2006 09:37:21 +0100
Subject: [Buildroot] Removing packages
In-Reply-To: <0997C816-22B5-4B76-B4EA-88A39989DA01@linux.it>
References: <0997C816-22B5-4B76-B4EA-88A39989DA01@linux.it>
Message-ID: <20061206083721.GB12161@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 05, 2006 at 10:27:13PM -0800, Rafael A Barrero wrote:
>Hi;
>
>During the build process,  as the package is the configured and  
>compiled, is it possible to go back and unselect a particular package  
>so that it isn't included in the final distribution? Does unselecting  
>the package from the configuration menu actually allow the build  
>process to ignore it the next time around? How does one go about  
>doing so (removing a package)?

Some packages have working foo-clean targets. Try e.g.
$ make udev-clean

If this fails, then either provide a patch to extend the -clean target
to delete the package's file in the root, or
rm -rf build_* toolchain_* to start over from scratch.

HTH,
