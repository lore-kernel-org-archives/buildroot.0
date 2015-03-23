From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Mar 2015 23:32:52 +0100
Subject: [Buildroot] [PATCH v1] evtest: fix
	program_invocation_short_name undeclared
In-Reply-To: <20150320212213.21f2881e@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 20 Mar 2015 21:22:13 +0100")
References: <1426803498-18890-1-git-send-email-ps.report@gmx.net>
 <20150320140947.38980613@free-electrons.com>
 <1426881775.2897.10.camel@synopsys.com>
 <20150320212213.21f2881e@free-electrons.com>
Message-ID: <87bnjjgx9n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Alexey Brodkin,
 > On Fri, 20 Mar 2015 20:02:58 +0000, Alexey Brodkin wrote:

 >> And for now I would propose to ignore mentioned build errors. Because
 >> indeed there's no point to throw in tons of temporary patches - if
 >> anybody really wants those "problematic" packages to be built there's
 >> always a possibility to build toolchain in Buildroot and it will use
 >> Buildroot's default uClibc config.
 >> 
 >> Will it work for you?

 > Yes, it works. In the mean time, there is a way to avoid the build
 > errors: add an exception to the autobuilder script. See
 > http://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run#n346
 > for a bunch of examples.

Or simply make the packages depend on
!BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12. Peter will you send
patches to do that for evtest and libevdev?

-- 
Bye, Peter Korsgaard
