From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 09:50:03 +0200
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <0db10485-c5ee-5097-97f4-aaadd2535761@microchip.com>
References: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
 <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
 <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
 <0db10485-c5ee-5097-97f4-aaadd2535761@microchip.com>
Message-ID: <20170713095003.057fb2bc@windsurf.orange-hotspot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 17:51:38 -0700, Joshua Henderson wrote:

> I tested adding hashes for all license files for 5.9.1. It turns out, this breaks the 5.6.2
> legal-info because there are files in common between the two versions, but with different hashes.
> 
>     $ make legal-info
> 
>     ...
> 
>     >>> qt5base 5.6.2 Collecting legal info  
>     LICENSE.GPLv3: OK (sha256: 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17)
>     ERROR: No hash found for LICENSE.LGPLv21
>     ERROR: No hash found for LGPL_EXCEPTION.txt
>     LICENSE.LGPLv3: OK (sha256: 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35)
>     LICENSE.FDL: OK (sha256: ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d)
>     ERROR: header.BSD has wrong sha256 hash:
>     ERROR: expected: 8fdefa0b45d9f791f687da6c2c4c83c1b701aaee2c08008f55d522af214b88f0
>     ERROR: got     : 1d05f2662f0be7544c4cc238d0957d1ed5d0edc45210e9108f905df354241a0e
>     ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>     package/qt5/qt5base/qt5base.mk:315: recipe for target 'qt5base-legal-info' failed
>     make[1]: *** [qt5base-legal-info] Error 1
>     Makefile:79: recipe for target '_all' failed
>     make: *** [_all] Error 2
> 
> In the case you have different license file contents, but with the same name, between different
> versions of a package, how should this be handled?

This is a *very* good question, and I don't think our current support
for license file hashes handles this situation properly.

I'm adding Yann and Peter in Cc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
