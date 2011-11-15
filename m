From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2011 22:25:07 +0100
Subject: [Buildroot] How to add share/zoneinfo to my Linux target
In-Reply-To: <C5029C549AA03148AF1B73C0F27DC86D021CEDCB@mse2003.vanteonrdc.vanteon.com>
References: <C5029C549AA03148AF1B73C0F27DC86D021CEDCB@mse2003.vanteonrdc.vanteon.com>
Message-ID: <20111115222507.5fe3b85b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 Nov 2011 15:29:14 -0500,
"Thireos, Mike" <mthireos@vanteon.com> a ?crit :

> We are using buildroot with linux  2.6.31 and glibc to build for our
> target platform. I see the zoneinfo directory in the staging folder,
> but I can't seem to find any configuration option to get it into my
> target file system. I also tried adding it to the skeleton folder
> with no luck.

There is no dedicated option to do that. However, Buildroot provides
you with the BR2_POST_BUILD_SCRIPT option, which can be set to the path
to a script that gets executed after all packages have been installed
but *before* the root filesystem images are generated.

Therefore, you can write a custom script that makes various
modifications on the target root filesystem, including copying the
zoneinfo informations.

See http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf for
more details on using the post build script, and example of usage.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
