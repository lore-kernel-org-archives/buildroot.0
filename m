From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:14:11 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build on powerpc64le
In-Reply-To: <20170312234757.074092cb@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 12 Mar 2017 23:47:57 +0100")
References: <1487006691-34766-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170312234757.074092cb@free-electrons.com>
Message-ID: <87y3w8wz0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 13 Feb 2017 18:24:51 +0100, Fabrice Fontaine wrote:
 >> There is an issue with powerpc64le and boost::uuids::random_generator on the
 >> following line of code (from include/boost/uuid/seed_rng.hpp):
 >> sha.process_bytes( (unsigned char const*)&std::rand, sizeof( void(*)() ) )
 >> This line "inspects the first couple bytes (here eight) of the std::rand
 >> function to seed some rng. Due to the implementation of process_bytes and
 >> inlining happening, it seems that one of the loops therein uses &rand-1 as
 >> some boundary, compiling with -O0 makes that reloc come out as 'rand + 0' and
 >> the link will succeed."
 >> See: https://bugzilla.suse.com/show_bug.cgi?id=955832#c7
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/454c0ea393615bae2d1b44be9920f25b5c49fc33
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/domoticz/domoticz.mk | 18 +++++++++++++++++-
 >> 1 file changed, 17 insertions(+), 1 deletion(-)

 > I'm not a big fan of the fix, but nobody came up with a better
 > solution, so I've applied your patch. Thanks!

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
