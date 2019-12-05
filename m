From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:17:29 +0100
Subject: [Buildroot] [PATCH] package/glibc: drop dependency of utilities
 on bash
In-Reply-To: <20191203001405.12984-1-unixmania@gmail.com>
References: <20191203001405.12984-1-unixmania@gmail.com>
Message-ID: <20191205231729.2c16445c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Dec 2019 21:14:05 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> The dependency was added because ldd uses bash-specific syntax to
> localize messages. Add a post-patch hook, instead, to replace the
> occurrences of $"foo" by "foo", simply, so the code becomes POSIX
> sh compliant if bash is not selected.
> 
> Also set the configuration environment accordingly to replace the
> /bin/bash hashbang by /bin/sh.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

I've applied, however I think it would be nice to have this mechanism
supported upstream. It can probably be easily added using a check in
configure.ac, and the proper autoconf replacement variable when
generating elf/ldd.bash.

Could you have a look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
