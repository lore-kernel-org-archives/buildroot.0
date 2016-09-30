From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Sep 2016 10:06:19 +0200
Subject: [Buildroot] [PATCH] lzop: unbreak powerpc build with GCC >= 5
In-Reply-To: <20160928143314.16109-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 28 Sep 2016 16:33:14 +0200")
References: <20160928143314.16109-1-peter@korsgaard.com>
Message-ID: <87vaxdyfpg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/c60/c60554f7b84d5050b86c1735fb857856ddfa4dff/
 > http://autobuild.buildroot.net/results/888/888ea1aea200a71d0887754e2afabdc6b260bf2f/
 > http://autobuild.buildroot.net/results/219/219194d269d7f3cf4c3db120e6d8079085916bd3/

 > GCC >= 5 changed the behaviour of 'extern inline', causing linking errors
 > when the powerpc inline functions are used in multiple compilation units:

 > https://gcc.gnu.org/gcc-5/porting_to.html

 > Add a patch from openembedded to change it to use static inline (which has
 > the correct behaviour in both old/new GCC versions) to fix it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
