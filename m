From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Mar 2014 17:35:58 +0100
Subject: [Buildroot] [git commit] linux: only depend on host-lzop if
	needed
In-Reply-To: <20140304091400.4213b502@skate> (Thomas Petazzoni's message of
 "Tue, 4 Mar 2014 09:14:00 +0100")
References: <20140303212321.09FDC9B9F2@busybox.osuosl.org>
 <87mwh679ls.fsf@dell.be.48ers.dk> <20140304091400.4213b502@skate>
Message-ID: <87eh2h7wgh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Tue, 04 Mar 2014 07:37:19 +0100, Peter Korsgaard wrote:

 >> Doesn't this get executed very early, E.G. before the linux sources are
 >> extracted?

 > Indeed, but the configuration file is already available at this point.
 > It may be either a full .config, or a minimal defconfig, but in both
 > cases it doesn't matter. See below.

As I explained on IRC, it isn't available if the defconfig isn't part of
buildroot but inside the linux tree (arch/$ARCH/config/foo_defconfig).

We do support such setups (and multiple defconfigs use it), and I don't
see how it can be made to work here.

-- 
Bye, Peter Korsgaard
