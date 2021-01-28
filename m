From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 18:01:33 +0100
Subject: [Buildroot] [PATCH] package/uhd: fix build with riscV
In-Reply-To: <20210112063027.27344-1-gwenj@trabucayre.com> (Gwenhael
 Goavec-Merou's message of "Tue, 12 Jan 2021 07:30:27 +0100")
References: <20210112063027.27344-1-gwenj@trabucayre.com>
Message-ID: <87eei53sia.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > When the target CPU is riscV, msgpack is unable to detect endianness with a list of errors like:

 > uhd/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:190:2: error:
 > #error msgpack-c supports only big endian and little endian
 >   190 | #error msgpack-c supports only big endian and little endian
 >       |  ^~~~~

 > and with subsequent errors:

 > uhd0/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:236:46: error:
 > there are no arguments to 'take8_8' that depend on a template
 > parameter, so a declaration of 'take8_8' must be available
 > [-fpermissive]
 >   236 |     char buf[2] = {static_cast<char>(0xccu), take8_8(d)};
 >       |

 > This is due to a missing support for this architecture in msgpack.
 > This patch adapt commit from https://github.com/boostorg/predef

 > [backported from https://github.com/EttusResearch/uhd/pull/400]

 > Fix:
 > - http://autobuild.buildroot.net/results/afacf5c5c2cd9dff6962523f1fdded9b474b9d66/
 > - http://autobuild.buildroot.net/results/91530538d630a7f09d85327e514f01b45253c1a6/
 > - http://autobuild.buildroot.net/results/91530538d630a7f09d85327e514f01b45253c1a6/
 > - and others

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
