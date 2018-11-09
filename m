From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 21:57:00 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <20181108153322.17362-1-m.niestroj@grinn-global.com>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
Message-ID: <20181109215700.6b8dc6af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Nov 2018 16:33:22 +0100, Marcin Niestroj wrote:

> -sha256 b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916 linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
> +sha256 3e4fcbac18990a14d52159fefdc70081a56c5244adba28b14242e159a748e755 linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz

I am sorry, but this hash is still not good for me, I get:

  5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1

I.e:

ERROR: linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz has wrong sha256 hash:
ERROR: expected: 3e4fcbac18990a14d52159fefdc70081a56c5244adba28b14242e159a748e755
ERROR: got     : 5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1

And this morning, Yann E. Morin reported having the same hash as me:

08:07 < y_morin> kos_tom: I also have a different hash here.
08:10 < y_morin> kos_tom: FTR, I got: 5c636765fd1ac638176893feccfd4a4854f59fc3d01b38f3ccdbb89bd5bb6ef1

My system tar is 1.29, which is considered as a "good" version by
support/dependencies/check-host-tar.sh. I have nonetheless forced
building host-tar, and I still get the same hash.

I have uploaded the tarball at
https://bootlin.com/~thomas/pub/linux-firmware-1baa34868b2c0a004dc595b20678145e3fff83e7.tar.gz.
Could you upload the tarball that was generated on your side so that we
can compare them, and see where the problem lies ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
