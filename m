From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2011 13:51:40 +0200
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <1310468114.2189.8.camel@dublxciaranr1.verifone.com>
References: <20110712000117.3af73a1a@skate>
 <1310468114.2189.8.camel@dublxciaranr1.verifone.com>
Message-ID: <20110712135140.4d2bd314@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 12 Jul 2011 11:55:12 +0100,
Quotient Remainder <quotientvremainder@gmail.com> a ?crit :

> I'm a little behind in tracking the changes with toolchain movements
> from a few months back but I was of the understanding that the current
> install scheme still allows the staging directory to be treated as a
> kind of mini SDK and so if I build a system using Buildroot I can tar
> up the staging dir and give it to application developers as an
> interface. Is this still the case?  If so, wouldn't putting
> executable programs into the staging dir be a bad thing?

Why would it be bad ? The binaries for the target are not inside
host/usr/bin, but inside host/usr/<tuple>/sysroot/usr/bin, so even if
the user adds host/usr/bin to its path to get access to the SDK, the
target binaries won't be visible.

It's true however that this would enlarge the size of the SDK.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
