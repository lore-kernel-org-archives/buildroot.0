From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Mar 2018 08:39:00 +0100
Subject: [Buildroot] [PATCH] pkg-virtual.mk: explicitly set
 <pkg>_VERSION / _SOURCE for robustness
In-Reply-To: <20180312223603.21788-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 12 Mar 2018 23:36:03 +0100")
References: <20180312223603.21788-1-peter@korsgaard.com>
Message-ID: <87h8pjhzsb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Recently a build failure was reported which was traced back to to the fact
 > that the user had a TOOLCHAIN_VERSION environment variable set which leads
 > to a strange looking error message:

 > toolchain/toolchain/toolchain.mk:40: *** TOOLCHAIN_SITE cannot be empty when
 > TOOLCHAIN_SOURCE is not.  Stop.

 > Environment variables automatically gets converted to make variables by GNU
 > make - E.G. from the manual
 > (https://www.gnu.org/software/make/manual/html_node/Environment.html):

 > Variables in make can come from the environment in which make is run.  Every
 > environment variable that make sees when it starts up is transformed into a
 > make variable with the same name and value

 > So we end up in make with TOOLCHAIN_VERSION set to the value of the
 > environment variable.  As virtual packages do not have a version, there is
 > no explicit TOOLCHAIN_VERSION = ..  line in toolchain.mk overriding this
 > value, and the logic in package/pkg-generic.mk sets a default value for
 > TOOLCHAIN_SOURCE when TOOLCHAIN_VERSION is set, and finally errors out as
 > TOOLCHAIN_SITE isn't set.

 > As a workaround, explicitly set <pkg>_VERSION and <pkg>_SOURCE to the empty
 > string in the virtual package infrastructure.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
