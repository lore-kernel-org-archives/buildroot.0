From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 7 Oct 2008 22:59:49 +0200
Subject: [Buildroot] proftpd does not compile
In-Reply-To: <gcghe9$fb1$1@ger.gmane.org>
References: <gc8fta$bif$1@ger.gmane.org> <48E9CB77.8060808@netcentral.co.uk>
	<gcdcjp$v98$1@ger.gmane.org> <48EA3AEA.7070206@netcentral.co.uk>
	<gcghe9$fb1$1@ger.gmane.org>
Message-ID: <20081007205949.GF5178@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 07, 2008 at 10:39:28PM +0200, Micha Nelissen wrote:
>Nick Peirson wrote:
>> I think I misunderstood you. It looks like there was a patch to resolve 
>> bcopy related issues in the buildroot repository, but it was removed:
>> http://busybox.net/lists/buildroot/2008-June/009198.html
>> 
>> Not sure if it helps it would help with the issue your seeing or not?
>
>Could be but this seems to replace all bcopy uses with memcpy? That 
>seems a workaround to me, not really solving the root problem.

Using memcpy et al instead of bcopy, bzero, etc. certainly is the proper
thing to do. Fix your application not to rely on legacy stuff that was
_obsoleted_ (not deprecated, but really obsoleted) a decade ago.
>
>Anyway, the umode_t problem is a compilation error so more problematic 
>at this point. (The bcopy thing is "only" a compilation warning).
>
>Micha
