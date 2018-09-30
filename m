From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 23:49:56 +0200
Subject: [Buildroot] [PATCH 1/1] sqlite: fix build without threads
In-Reply-To: <20180930193514.23846-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 30 Sep 2018 21:35:14 +0200")
References: <20180930193514.23846-1-fontaine.fabrice@gmail.com>
Message-ID: <871s9a1wqj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > If threads are not available, set SQLITE_THREADSAFE to 0.
 > Indeed, since version 3.25.0, the following line:
 > THREADSAFE_FLAGS=-DSQLITE_THREADSAFE=0
 > has been removed from configure.ac
 > As a result, SQLITE_THREADSAFE will be set to a default value of 1 even
 > if --disable-threadsafe is set

 > Fixes:
 >  - http://autobuild.buildroot.org/results/70b1582edcb787746e4483e80b27f86ac781f0fa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

Can you please report the issue upstream?

-- 
Bye, Peter Korsgaard
