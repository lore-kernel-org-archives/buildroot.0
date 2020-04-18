From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 15:26:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/php: fix gd dependencies
In-Reply-To: <20200418090343.140078-2-aussedat.louis@gmail.com>
References: <20200418090343.140078-1-aussedat.louis@gmail.com>
 <20200418090343.140078-2-aussedat.louis@gmail.com>
Message-ID: <20200418152640.0c88904a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis,

On Sat, 18 Apr 2020 11:03:43 +0200
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> Due to migration to pkg-config in php 7.4, the detection of
> library dependencies has been changed.
> 
> source from php.net:
> --with-gd becomes --enable-gd
> --with-png-dir has been removed. libpng is required.
> --with-zlib-dir has been removed. zlib is required.
> --with-freetype-dir becomes --with-freetype
> --with-jpeg-dir becomes --with-jpeg
> 
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>

I've applied. However, we are currently using the bundled libgd source
code that comes from PHP, but it would be good to use an external gd
library from package/gd. This would also allow to make the
freetype/jpeg dependencies optional.

Could you have a look at doing this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
