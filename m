From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Sep 2018 22:03:07 +0200
Subject: [Buildroot] [PATCH] cutelyst: Add dependency on Kernel headers
 >= 3.3
In-Reply-To: <875zzi8nk2.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 06 Sep 2018 20:53:49 +0200")
References: <20180906165132.24690-1-dantti12@gmail.com>
 <875zzi8nk2.fsf@dell.be.48ers.dk>
Message-ID: <87h8j275s4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Daniel" == Daniel Nicoletti <dantti12@gmail.com> writes:
 >> Cutelyst-WSGI module uses SO_REUSEPORT
 >> Fixes:

 >> http://autobuild.buildroot.net/results/d38411eda9edf16e2c40d8931bcfc889faae43dc/

 >> Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>

 > Committed, thanks.

Hmm, this cannot have been tested:

make menuconfig
package/cutelyst/Config.in:19: syntax error
package/cutelyst/Config.in:18: invalid option
Makefile:900: recipe for target 'menuconfig' failed

The syntax is 'depends on FOO', not just 'depends FOO'.

I've pushed a fix for that now, but please be more careful.

-- 
Bye, Peter Korsgaard
