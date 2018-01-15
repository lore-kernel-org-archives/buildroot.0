From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 14:47:26 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <276755364.2420280.1516020636845@mail.yahoo.com>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
 <20180112220436.677e3084@windsurf.lan>
 <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
 <20180112233842.388e29a0@windsurf.lan>
 <276755364.2420280.1516020636845@mail.yahoo.com>
Message-ID: <20180115144726.02c4bbd1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 12:50:36 +0000 (UTC), Laurent Charpentier wrote:

> Here are some experiments on my side.(1) AUTORECONF=yes (no use of ./bootstrap.sh)-> ./configure fails
> (2) (cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh) (no use of AUTORECONF)-> run OK (configure passed, build passed)
> (3) AUTORECONF=yes and (cd $(@D) &&?./bootstrap.sh)-> run OK (configure passed, build passed)
> I would like to use choice (2). This choice is similar to the RPM packaging (http://pkgs.fedoraproject.org/cgit/rpms/lldpad.git/tree/lldpad.spec) and follows the guidelines in the README file.

Choice (2) alone is wrong, because you won't have the dependency on
host-autoconf, host-automake and host-libtool.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
