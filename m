From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 11:05:56 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <CAAXf6LXnRWvi3i0B2q1r_gRjgTkyNjXhdSasMLyYiFrr3=RTWg@mail.gmail.com>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LXnRWvi3i0B2q1r_gRjgTkyNjXhdSasMLyYiFrr3=RTWg@mail.gmail.com>
Message-ID: <20170208110556.6a3ed63a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Feb 2017 10:50:13 +0100, Thomas De Schampheleire wrote:

> Is there a particular reason why you use unittest and nose2, rather
> than the popular pytest ?

First because I'm not a Pythonist, so I have no idea what is "popular"
in the Python world.

What lead me to use nose2 is because it is capable of executing tests
in parallel. In practice, this currently doesn't work due to how the
Qemu emulation is started (I use a fixed TCP port for the telnet
connection used for the serial port), but if we fix that, tests can be
executed in parallel, this is something I had tested when choosing
nose2.

Apparently, pytest can also run tests in parallel, according to
http://pytest.org/dev/xdist.html.

I honestly don't care which Python testing infrastructure is used, as
long as there is one. If you think pytest is better (and indeed its
website seems to be nicely documented and it seems to offer lots of
features), then patches are welcome :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
