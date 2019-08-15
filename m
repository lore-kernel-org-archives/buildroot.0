From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 13:55:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 0.7.0
In-Reply-To: <20190815095804.GA28418@coltrane>
References: <20190815095804.GA28418@coltrane>
Message-ID: <20190815135505.1e5a2c36@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Koen,

On Thu, 15 Aug 2019 11:58:04 +0200
Koen Martens <gmc@sonologic.nl> wrote:

> The patch against 0.6.1 has been merged upstream,
> and has been removed from this package.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>

This patch breaks legal-info for the package, because the license file
hash has changed:

ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 16194222e9412c3aa14d2287953f7fc89a1dcbcdd266d1534ba35060d4cde5b6
ERROR: got     : 9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10

Notice that when such a thing happen, you shouldn't just silently
change the license file hash: the commit log must include an
explanation as to what changed in the license file. Typically doing a
diff between the old and the new license file allows to check what
changed.

Could you fix this and submit an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
