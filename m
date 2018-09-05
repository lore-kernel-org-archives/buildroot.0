From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 22:47:15 +0200
Subject: [Buildroot] [PATCH v1 1/4] qt5virtualkeyboard: fix example
 build issue with 5.6
In-Reply-To: <20180903123747.5234-2-gael.portay@savoirfairelinux.com>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
 <20180903123747.5234-2-gael.portay@savoirfairelinux.com>
Message-ID: <20180905224715.769bc0d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Mon,  3 Sep 2018 08:37:44 -0400, Ga?l PORTAY wrote:
> The patch does not apply properly and needs to be fixed.
> 
> The patch was backported from 5.7 [1] with path adaptation in commit
> (cb97d9473b qt5virtualkeyboard: allow to build with qt5.6), but the
> submitted patch did not reflect that said adaptation.
> 
> Apply the said patch adaptation (i.e. add missing basic subdirectory) to
> apply properly the patch.
> 
> Fixes:
> 
> 	>>> qt5virtualkeyboard 2.0 Patching  
> 
> 	Applying 0001-remove-weird-install-path-for-example.patch using patch:
> 	patching file examples/virtualkeyboard/basic/basic.pro
> 	Hunk #1 FAILED at 7.
> 	1 out of 1 hunk FAILED -- saving rejects to file examples/virtualkeyboard/basic/basic.pro.rej
> 	make: ***[/home/test/autobuild/run/instance-2/output/build/qt5virtualkeyboard-2.0/.stamp_patched] Error 1
> 
> [1]: https://github.com/qt/qtvirtualkeyboard/commit/aef55eb7b3470ba6dee4abc67acda1d308c90e97
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

The title is wrong: it does not fix the "example build", it fixes
applying the patches. Even if you don't build the examples, the patch
doesn't apply and prevents building the package entirely.

I fixed up the title and did some minor tweaks in the commit log, and
applied to master. Thanks!

We really need something that tests the build of this Qt stack in 5.6
version, because we have found many legal-info issues and build issues
recently.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
