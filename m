From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Feb 2019 19:52:15 +0100
Subject: [Buildroot] [PATCH] package/mongodb: remove package
In-Reply-To: <20190206120656.9936-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 6 Feb 2019 13:06:55 +0100")
References: <20190206120656.9936-1-peter@korsgaard.com>
Message-ID: <87r2cj1leo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/dd4/dd412fae45a84e44e7e6a49f8cdb124d0851c1df/

 > The mongodb version used (3.3.4) is no longer supported by upstream and
 > fails to build with openssl 1.1.1x.  On top of that it uses internal copies
 > of boost, pcre and zlib instead of the system ones.

 > Bumping the version to 3.4.19 (which is still supported until September
 > 2019) has been tried, but it:

 > - No longer builds for 32bit ARM

 > - Doesn't build without extra patches, E.G.:
 >   https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch?h=rocko

 > - Doesn't build with the system version of boost (1.69.0)

 > - Also fails to build with openssl-1.1.1x

 > So it looks like mongodb needs to be bumped to the 3.6.x series (which
 > changes the license to the SSPL) - Or simply dropped.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
