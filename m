From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Oct 2018 14:48:02 +0200
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
In-Reply-To: <1adacc2a-25dc-eee5-8688-47ce66aa080b@mind.be>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20180926025514.2092-6-ricardo.martincoski@gmail.com>
 <20181011204808.1aff4cd1@windsurf>
 <1adacc2a-25dc-eee5-8688-47ce66aa080b@mind.be>
Message-ID: <20181013144802.72c8bf88@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 23:27:10 +0200, Arnout Vandecappelle wrote:

> > At some point, we will have to find a solution to store such
> > "artefacts" somewhere, instead of having them inline in their test
> > cases. I don't have a good idea about this.  
> 
>  I think it would be nice if we could add in the package directory a
> subdirectory with files to be copied to the target for the runtime test, and a
> python script for the test itself.
> 
>  As an in-between step, we can put the files-to-be-copied inside the
> support/testing directory and explicitly enumerate the files-to-be-copied in the
> test fixture.

I am still hesitant between putting the tests + fixtures near/in the
packages themselves, and keeping the whole test suite thing separate.
One issue with putting the tests+fixture near/in the packages is that a
number of tests aren't package-related, so where do we put them? Isn't
that also going to put a lot of mess/cruft in our packages?

I don't have a good answer to that. Perhaps for now it makes more sense
to have those test fixtures in support/testing/, and see where to go
from there.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
