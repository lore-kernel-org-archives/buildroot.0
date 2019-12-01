From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Dec 2019 21:17:19 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/python-gobject: depend on
 python2
In-Reply-To: <20191201183909.3756147-1-aduskett@gmail.com>
References: <20191201183909.3756147-1-aduskett@gmail.com>
Message-ID: <20191201211719.757d02ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Dec 2019 10:39:08 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Version 2.86.6 of python-gobject is quite old and no longer works with
> Python versions > 3.7. When importing a user will recieve the following error:
> 
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.8/site-packages/gobject/__init__.py", line 26, in
>   <module>
>   File "/usr/lib/python3.8/site-packages/glib/__init__.py", line 22, in <module>
> SystemError: initialization of _glib raised unreported exception
> 
> Because new versions of python-gobject require gobject-introspection, which is
> not currently available in Buildroot, add a dependency on python2 to prevent
> users from receiving the above error.

You forgot to add the reference to the bug being fixed, despite this
being noted in my review of v1. No need to resend just for that though.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12286

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
