From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:25:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/supervisor: bump to version
 3.4.0
In-Reply-To: <20190907201408.9367-1-sam@gpsm.co.uk>
References: <20190907201408.9367-1-sam@gpsm.co.uk>
Message-ID: <20190907232513.40485c7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Sep 2019 21:14:08 +0100
sam at gpsm.co.uk wrote:

> From: Sam Lancia <sam@gpsm.co.uk>
> 
> Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
> ---
>  package/supervisor/supervisor.hash | 2 +-
>  package/supervisor/supervisor.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, but this break "make legal-info", because the hash of the
license file has changed:

>>> supervisor 3.4.0 Patching
>>> supervisor 3.4.0 Collecting legal info
ERROR: COPYRIGHT.txt has wrong sha256 hash:
ERROR: expected: a85a622378c6a892ead1ce5d0488e446e106bf014d3b763fdbc1ad1ae38ee491
ERROR: got     : 7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make[1]: *** [package/supervisor/supervisor.mk:36: supervisor-legal-info] Error 1
make: *** [Makefile:84: _all] Error 2

Could you check what are the differences between the COPYRIGHT.txt in
the old version and in the new version, explain them in the commit log,
and update the hash ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
