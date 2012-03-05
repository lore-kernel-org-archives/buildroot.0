From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Mar 2012 21:48:52 +0100
Subject: [Buildroot] udev build error solved : core dependency tar must
	be > 1.20
In-Reply-To: <20120305193818.031c5332@skate> (Thomas Petazzoni's message of
 "Mon, 5 Mar 2012 19:38:18 +0100")
References: <3727543134DD41C589596DA3C5EC9F5B@JohanW7>
 <20120305193818.031c5332@skate>
Message-ID: <87fwdm6aff.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 5 Mar 2012 18:01:16 +0100,
 Thomas> "Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

 >> It seems the tar -J option was introduced with tar version 1.21 
 >> I upgraded my host to the latest tar version (1.26) and now it udev
 >> 181 builds. Maybe this is something to check for in  the core
 >> dependencies check. My debian lenny had version 1.20 in its package
 >> list. 

 Thomas> Or rather we should patch the udev code so that it doesn't use
 Thomas> -J, but instead bunzip2 + tar.

-J is xz, not bzip. I think the way forward is one or more of:

- Extend host-tar handling to build for tar<1.21
- Teach udev upstream a configure option to disable tests
- Convince udev upstream to use a basic .tar.gz for test

-- 
Bye, Peter Korsgaard
