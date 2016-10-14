From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2016 15:57:00 +0200
Subject: [Buildroot] qt5webkit: host-python dependency issue in Python3
 environment
In-Reply-To: <CAGm1_ktbKzd7jbaTRryp27yZF94HMPZnZTfMw+sC1vCC8-mVvA@mail.gmail.com>
References: <CAGm1_ktbKzd7jbaTRryp27yZF94HMPZnZTfMw+sC1vCC8-mVvA@mail.gmail.com>
Message-ID: <20161014155700.583f6e14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Oct 2016 09:53:53 +0200, Yegor Yefremov wrote:
> My project uses both Python3 and Qt5 including qt5webkit package. The
> problem in this particular constellation is, that
> output/target/usr/bin/python is a symlink to
> output/host/usr/bin/python2.

Hu? target/usr/bin/python is a symlink to host/usr/bin/python2 ? Are
you sure ? If so, this is the problem, not the qt5webkit dependency on
host-python.

If you have a Python 3 enabled system, and qt5webkit is enabled, you
should have the following situation:

 - target/usr/bin/python -> target/usr/bin/python3
 - host/usr/bin/python -> host/usr/bin/python3
 - host/usr/bin/python2

I.e, Python 3 is the "default" version, but Python 2 for the host is
also available, if called explicitly using host/usr/bin/python2.

So, I don't understand your original problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
