From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Mar 2012 22:57:21 +0100
Subject: [Buildroot] [PATCH 2/2] ccache: set COMPILERCHECK to 'none'
In-Reply-To: <351a3eaf5539eda4c54d1f9eb655d3e4d8b9654c.1331148403.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 7 Mar 2012 20:26:50 +0100")
References: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
 <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
 <351a3eaf5539eda4c54d1f9eb655d3e4d8b9654c.1331148403.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8762eeeoxq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This allows ccache to re-use its cache contents even if the compiler
 Thomas> binary mtime has changed. It is the simplest approach to solve this
 Thomas> problem, and it works for the internal, external and crosstool-ng
 Thomas> toolchain backends.

 Thomas> Of course, it leaves the user responsible for invalidating the cache
 Thomas> when necessary, but there doesn't seem to be a real good solution that
 Thomas> allows both to: 1/ keep the cache contents accross builds and re-use
 Thomas> it and 2/ invalidate the cache automatically when the compiler chances
 Thomas> in an incompatible way.

Committed, thanks.

-- 
Bye, Peter Korsgaard
