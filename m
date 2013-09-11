From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Sep 2013 12:52:58 +0200
Subject: [Buildroot] A Bug: xserver_xorg 1.12.4
In-Reply-To: <20130911111732.3300eaa7@skate> (Thomas Petazzoni's message of
 "Wed, 11 Sep 2013 11:17:32 +0200")
References: <20130909080432.GA2684@zuhnb712.ap.bm.net>
 <20130911111732.3300eaa7@skate>
Message-ID: <87bo3ztyt1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Woody Wu,
 Thomas> On Mon, 9 Sep 2013 16:04:33 +0800, Woody Wu wrote:
 >> In 2013.08, build is using 1.12.4 version of xserver_xorg package.
 >> However, I found there is bug in this version, which cause the options
 >> parsing of kdrive modules is not correct.
 >> 
 >> I attached a patch file in the message (not sure what's the correct way
 >> to commit buildroot package patches).

 Thomas> Unfortunately, no, it's not the correct. You should submit a patch
 Thomas> against Buildroot, which adds a patch in
 Thomas> package/x11r7/xserver_xorg-server/ that fixes the bug you're seeing.

 Thomas> See http://buildroot.org/downloads/manual/manual.html#patch-policy.

 Thomas> Also, it'd be good to see if this patch has been fixed upstream
 Thomas> already. If it's already fixed upstream, either backport the upstream
 Thomas> patch, or bump the X.org server version used in Buildroot. If not, then
 Thomas> try to submit your patch upstream so that it gets integrated in future
 Thomas> releases of X.org.

It is fixed upstream, but it was never pushed to the 1.12 branch:

http://cgit.freedesktop.org/xorg/xserver/commit/hw/kdrive/src/kinput.c?id=09f1e5b15b769e1122f0a8d7

I've cherry picked it and added it to buildroot, thanks.

-- 
Bye, Peter Korsgaard
