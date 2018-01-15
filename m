From: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Mon, 15 Jan 2018 12:50:36 +0000 (UTC)
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <20180112233842.388e29a0@windsurf.lan>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
 <20180112220436.677e3084@windsurf.lan>
 <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
 <20180112233842.388e29a0@windsurf.lan>
Message-ID: <276755364.2420280.1516020636845@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Yegor,
On Fri, 12 Jan 2018 22:29:44 +0100, Yegor Yefremov wrote:

> > So instead, please keep <pkg>_AUTORECONF = YES, and if the missing m4
> > folder is the only problem (but I doubt it because the bootstrap.sh
> > script doesn't create it), then add a post-extract hook that creates
> > the m4 file.??
>?
> bootstrap.sh doesn't create m4 folder, but if you just clone the
> open-lldp repo and invoke "autoreconf -i", it would just complain
> about missing m4 folder, but create it. In BR environment we get an
> error. We had similar situation earlier with some other package
> (libsoc) and I coudn't find the case of the problem, so I just added
> m4 upstream and now it is working.

Here are some experiments on my side.(1) AUTORECONF=yes (no use of ./bootstrap.sh)-> ./configure fails
(2) (cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh) (no use of AUTORECONF)-> run OK (configure passed, build passed)
(3) AUTORECONF=yes and (cd $(@D) &&?./bootstrap.sh)-> run OK (configure passed, build passed)
I would like to use choice (2). This choice is similar to the RPM packaging (http://pkgs.fedoraproject.org/cgit/rpms/lldpad.git/tree/lldpad.spec) and follows the guidelines in the README file.
Let me know if you think of something different.Best Regards,Laurent
   
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180115/6e435a42/attachment.html>
