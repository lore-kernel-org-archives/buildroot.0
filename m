From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 08:56:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-subprocess32: add
 PYTHON_SUBPROCESS32_CONFIGURE_CMDS
In-Reply-To: <20191214215428.75264bb3@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 14 Dec 2019 21:54:28 +0100")
References: <20191214171023.1650001-1-fontaine.fabrice@gmail.com>
 <20191214215428.75264bb3@windsurf.home>
Message-ID: <875ziif2e7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sat, 14 Dec 2019 18:10:23 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Since commit 1745fcde740057951dcc5429f3bfabd103b764a1,
 >> python-subprocess32 fails to build because it runs configure with
 >> incorrect arguments so add a PYTHON_SUBPROCESS32_CONFIGURE_CMDS
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/dcf944129392ee6cacc106e096d8d3adfa4447bb
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > When seeing this, I was a bit "meh, how did it work before?". So I
 > built python-subprocess32 with 1745fcde740057951dcc5429f3bfabd103b764a1
 > reverted. What happens is that the ./configure script is executed, with
 > no arguments at all, and no CC variable is passed. So it happily uses
 > the host compiler, does a bunch of tests with it, and then uses the
 > resulting config.h file to build some target library. This is obviously
 > completely bogus!

 > With 1745fcde740057951dcc5429f3bfabd103b764a1, we now pass
 > CC=cross-compiler, so ./configure doesn't work because it uses a
 > cross-compiler, but no --host= value is passed, leading to the build
 > failure.

 > So 1745fcde740057951dcc5429f3bfabd103b764a1 really uncovered a real bug
 > in the python-subprocess32 packaging, which your patch fixes.

Wow, (part of) this info would have been great to add to the commit
message.

-- 
Bye, Peter Korsgaard
