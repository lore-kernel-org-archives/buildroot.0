From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 10:55:08 +0200
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <CAHt8ZCPHv7MR=WAvPRL5PxiTp=NsgDkhWKFusCEYgxiBtZPWXg@mail.gmail.com>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
 <20120725102242.77a06eca@skate>
 <CAHt8ZCPHv7MR=WAvPRL5PxiTp=NsgDkhWKFusCEYgxiBtZPWXg@mail.gmail.com>
Message-ID: <20120725105508.1c7179df@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 09:49:35 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> Yes, you're right. It was using the native compiler before your
> patches, but somehow managed to get through the build without falling
> over. Another problem then.

Can you share a defconfig that shows the problem? I've tested the build
with BR2_PACKAGE_PYTHON + BR2_PACKAGE_GPSD, and it just builds (even
though the output is completely incorrect: the gpsd Python modules are
installed in the wrong location and are built for the host rather than
the target).

Do you actually need the Python support in gpsd? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
