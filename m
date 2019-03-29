From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:12:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/scons: bump to version 3.0.5
In-Reply-To: <20190327195027.16858-1-fontaine.fabrice@gmail.com>
References: <20190327195027.16858-1-fontaine.fabrice@gmail.com>
Message-ID: <20190329171224.7c4ace92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Mar 2019 20:50:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add hash for license file
> - Don't remove host-python2 dependency as most of the packages using
>   scons (such as mongodb or gnuradio) haven't moved to python3 yet

gnuradio is not using Scons, so I'm not sure to see the relationship here.

Also, if mongodb needs Python 2, then it should be mongodb that depends
on host-python, no ?

This way, we can remove:

HOST_SCONS_NEEDS_HOST_PYTHON = python2

now that Scons if Python 3.x compatible (if I understood correctly).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
