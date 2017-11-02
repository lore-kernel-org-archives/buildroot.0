From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Nov 2017 11:46:38 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171031230519.3feb2619@windsurf> (Thomas Petazzoni's message of
 "Tue, 31 Oct 2017 23:05:19 +0100")
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
Message-ID: <87inetez5d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> arm | core-dependencies | NOK |
 >> http://autobuild.buildroot.net/results/30d398c5764350609ef37d158c665347caf9f134
 >> |
 >> arm | core-dependencies | NOK |
 >> http://autobuild.buildroot.net/results/5f5b5edb058efe976c003678e21bcc28a87cc828
 >> |

 > Your Buildroot configuration needs a compiler capable of building 32 bits binaries.
 > If you're running a Debian/Ubuntu distribution, install the gcc-multilib package.
 > For other distributions, refer to their documentation.

 > Peter, gcc112 is your autobuilder, and it's a ppc64 machine, which
 > probably explains the issue.

Indeed. Packages should depend on x86(-64) hostarch before selecting any
of the BR2_HOSTARCH_NEEDS_IA32_* symbols. I have sent a patch series
fixing this.

-- 
Bye, Peter Korsgaard
