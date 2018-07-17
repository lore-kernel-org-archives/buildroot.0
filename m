From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 23:34:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/tar: bump version to 1.30
In-Reply-To: <20180715154847.GD2516@scaer> (Yann E. MORIN's message of "Sun,
 15 Jul 2018 17:48:47 +0200")
References: <20180709224218.32080-1-bernd.kuhls@t-online.de>
 <5afaa00d-083c-2b0d-8375-938f854371a6@mind.be>
 <20180715154847.GD2516@scaer>
Message-ID: <871sc1k0mi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Arnout, All,
 > On 2018-07-10 10:00 +0200, Arnout Vandecappelle spake thusly:
 >> Have you seen b8fa273d500b4?
 >> 
 >> check-host-tar.sh: blacklist tar 1.30+
 >> 
 >> Tar 1.30 changed the --numeric-owner output for filenames > 100 characters,
 >> leading to hash mismatches for the tar archives we create ourselves from
 >> git.  This is really a fix for a bug in earlier tar versions regarding
 >> deterministic output, so it is unlikely to be reverted in later versions.
 >> 
 >> For more details, see:
 >> http://lists.busybox.net/pipermail/buildroot/2018-January/211222.html
 >> 
 >> To work around this issue, blacklist tar 1.30+ similar to how we do it for
 >> pre-1.17 versions so Buildroot falls back to building host-tar.
 >> 
 >> 
 >> Marked as Rejected...

 > Yet at some point, we will want to bump tar to a newer version.

 > What I would suggest is that we pin the host version to 1.29, and still
 > allow bumping the target version, so maybe something like:

 >     TAR_VERSION = 1.30
 >     HOST_TAR_VERSION = 1.29

Yes, that is possible. It does add a bit of extra complexity (subdirs
for patches, 2 versions in tar.hash, ..), but we already have that for
packages where we have a version selection.

-- 
Bye, Peter Korsgaard
