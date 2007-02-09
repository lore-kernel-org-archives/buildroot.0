From: Daniel Laird <danieljlaird@hotmail.com>
Date: Fri, 9 Feb 2007 01:59:21 -0800 (PST)
Subject: [Buildroot] First Step in allowing Static / shared library
 choice
In-Reply-To: <20070208174955.GC9196@aon.at>
References: <8867285.post@talk.nabble.com> <20070208172318.GA8945@aon.at>
	<8870245.post@talk.nabble.com> <20070208174308.GB9196@aon.at>
	<20070208174955.GC9196@aon.at>
Message-ID: <8882941.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Bernhard Fischer-6 wrote:
> 
>>
>>TARGET_CONFIGURE_OPTS get _only_ passed to target packages, be they
>>you-name-it package or a native compiler. Distinguishing between a
>>native compiler with shared lib support and the rest of the system being
>>static (and likely not having ld support due to this) doesn't sound like
>>we want to have it for a first take, ok?
> 
> Those have to be called TARGET_CONFIGURE_FLAGS, of course, and we'll have
> to pass them to all ./configure invocations.. manually. hmz. At least we
> can at the same time move DISABLE_NLS and DISABLE_LARGEFILE into these
> TARGET_CONFIGURE_FLAGS, so this isn't too bad.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

I do not think this is the best idea.  I would like to stick with the way we
handle DISABLE_NLS etc.  The reason is that if we pass all of these
configure options to all ./configure calls in the packages then they have to
all work. or at least not cause an error from the program configure.  Are we
certain that all packages will not error when calling ./configure
--disable-nls for example?
If you think that ./configure for all packages will not fail as long as you
use --enable-XXX --disable-XXX --without-XXX --with-XXX then maybe this will
work.
Cheers
Dan

-- 
View this message in context: http://www.nabble.com/First-Step-in-allowing-Static---shared-library-choice-tf3193891.html#a8882941
Sent from the BuildRoot mailing list archive at Nabble.com.
