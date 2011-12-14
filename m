From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 11:46:50 +0100
Subject: [Buildroot] [PATCH] New package: python-dpkt
In-Reply-To: <4EE87CC9.1040809@visionsystems.de>
References: <1323858932-10219-1-git-send-email-yegorslists@googlemail.com>
 <4EE87CC9.1040809@visionsystems.de>
Message-ID: <20111214114650.539556ba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Dec 2011 11:39:05 +0100,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> I have following problem building this package:
> 
> Traceback (most recent call last):
>   File "setup.py", line 4, in <module>
>     import dpkt
>   File
> "/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/python-dpkt-1.7/dpkt/__init__.py",
> line 26, in <module> import gzip File
> "/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/python-dpkt-1.7/dpkt/gzip.py",
> line 5, in <module> import struct, zlib ImportError: No module named
> zlib

At build time, the host-python is used. And the fact that you enabled
"zlib" for the target python has no impact on the configuration of the
host python. Why does it require zlib support in Python at build time?
Or, said otherwise, why does it tries to import the dpkt Python module
you're building, at build time?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
