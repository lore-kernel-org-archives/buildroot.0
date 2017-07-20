From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 10:27:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib
 of host-python
In-Reply-To: <CAO6UsjBm0q9_g8_dpuA=7kPcFuzhouvM_8GV1J=+76PDfVykSw@mail.gmail.com>
References: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
 <20170720095636.72423497@windsurf>
 <CAO6UsjBm0q9_g8_dpuA=7kPcFuzhouvM_8GV1J=+76PDfVykSw@mail.gmail.com>
Message-ID: <20170720102733.2d606f02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 16:21:51 +0800, Diankun Zhang wrote:

> According to HOST_PYTHON_CONF_OPTS defined in python.mk, --disable-hashlib
> is not specified.
> That means _hashlib should be enabled by default, right?

Well, no, not necessarily. We simply forgot to add --disable-hashlib.

Again: why do you need this? If you could answer this question it would
make the discussion a lot more productive :-)

It is very possible that there are legitimate use cases for having
the hashlib module built in the host Python interpreter. If we
understand those use cases, then we can come up with a solution. But if
you keep being silent about the *why* you need this, we won't move very
far.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
