From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Apr 2017 11:22:43 +0200
Subject: [Buildroot] [PATCH] libmpeg2: fix sparc32 build
In-Reply-To: <87o9viky89.fsf@dell.be.48ers.dk>
References: <20170427053609.GA20301@waldemar-brodkorb.de>
 <20170427102645.523f96c1@free-electrons.com>
 <87o9viky89.fsf@dell.be.48ers.dk>
Message-ID: <20170427112243.2b5693c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Apr 2017 11:15:34 +0200, Peter Korsgaard wrote:

>  > I am not sure this is the completely correct solution, and Arnout
>  > proposed another solution, see:  
> 
>  >   https://patchwork.ozlabs.org/patch/749138/
>  >   https://patchwork.ozlabs.org/patch/749137/  
> 
>  > The second patch has the explanation why Waldemar patch is not really
>  > correct.  
> 
> Ok. Can I take this as an acked-by for the check-bin-arch / pkg-generic
> changes then? ;)

I haven't reviewed the implementation details, but on the general
principles, yes, I'm OK. It's a bit annoying to extend the package
infrastructure for such a specific case, but I don't really see a
better solution here, except hacking libmpeg2 to remove the runtime
detection logic.

On the other hand, do we care enough about libmpeg2 on SPARC to extend
the package infrastructure just for this purpose? In the end, even if
Waldemar's solution is not "correct", it avoids the need to extend the
package infrastructure just for a purpose of a single package that will
most likely never ever be used on SPARC.

Arnout, what do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
