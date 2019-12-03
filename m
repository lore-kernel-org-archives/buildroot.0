From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 11:17:43 +0100
Subject: [Buildroot] [PATCH] package/faifa: fix incorrect library symlink
In-Reply-To: <20191118211047.50199-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 18 Nov 2019 22:10:46 +0100")
References: <20191118211047.50199-1-thomas.petazzoni@bootlin.com>
Message-ID: <87fti1ogqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As spotted in
 > http://autobuild.buildroot.net/results/a61/a612cb7a85927d8cfe55c95c34d2901e7694fab0//diffoscope-results.txt,
 > faifa installs a library symlink with an incorrect target, which was
 > detected by the reproducible build logic, but is in fact wrong in any
 > case:

 > -lrwxrwxrwx 0 0 0 0 2019-11-07 19:38:04.000000 ./usr/lib/libfaifa.so
 > -> /home/naourr/work/instance-3/output-1/target/usr/lib/libfaifa.so.0
 > +lrwxrwxrwx 0 0 0 0 2019-11-07 19:38:04.000000 ./usr/lib/libfaifa.so
 > -> /home/naourr/work/instance-3/output-2/target/usr/lib/libfaifa.so.0

 > In practice, this is not a problem at runtime, as the .so symlink is
 > not used: the library soname is libfaifa.so.0. However, it still makes
 > sense to fix.

 > It is fixed by backporting an upstream commit. We considering bumping
 > to a newer version, but the latest version requires a new dependency
 > (libevent), so we preferred the backporting approach.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
