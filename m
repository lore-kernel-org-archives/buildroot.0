From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 21:04:58 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <20180319175010.0c26763b@windsurf> (Thomas Petazzoni's message of
 "Mon, 19 Mar 2018 17:50:10 +0100")
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <1521477052.10662.140.camel@impinj.com>
 <20180319175010.0c26763b@windsurf>
Message-ID: <87o9jjltlh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 19 Mar 2018 16:30:52 +0000, Trent Piepho wrote:

 >> After fixing s/L/l/, here are the timings for a 15 minute build:
 >> 
 >> configure                510.29
 >> build                    166.12
 >> extract                   45.53
 >> other                     43.88
 >> hostinstall               35.43
 >> check_host_rpath          33.37
 >> check_bin_arch            28.30
 >> targetinstall             23.37
 >> stageinstall              15.97
 >> step_pkg_size              9.49

 > Thanks for those measurements. I still find it a bit annoying that we
 > spend 1m10sec on instrumentation related topics on a 15 minutes build.
 > The use of ccache makes the build time lower than it normally is, and
 > therefore makes the instrumentation cost even more visible, but using
 > ccache is a valid use case.

Agreed, Buildroot has always been about low overhead and fast builds.

 > Should we move the check_host_rpath and check_bin_arch checks as
 > finalize hooks, instead of running them at the end of each package
 > installation ? We can always get the package that installed the "bogus"
 > file through the package-file-list*.txt files, no ?

I would think so as well. Anybody interested in giving it a shot?

-- 
Bye, Peter Korsgaard
