From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 24 Mar 2011 14:33:40 -0500
Subject: [Buildroot] sshd and password problem
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835817820906@NBE-MBX01.americas.swk.pri>
References: <1D6034426110564DA0DEA9EE9793B3835817820906@NBE-MBX01.americas.swk.pri>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99A499@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I added OpenSSH to my top level menuconfig in Buildroot. When I
> brought
> the platform up I tried to 'ssh' to the target. But each time I
> tried to
> login to the target, ssh would always force me to change my
> password, and then
> close the connection.

You don't have a RTC, do you ;). So, what you'll need to do is
to set the system time at boot to something close to now.  If
you have no way to externally source time, make the system time
something along the lines of +10seconds beyond whichever is 
later: passwd or shadow or some other file that you know you
have touched lately.  Doing this will make ssh think that
you have changed your password recently enough (like within the
last -- I think -- 300 Billion years).

Andy
