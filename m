From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2015 16:45:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/bash: indicate getcwd is
	malloc-supported
In-Reply-To: <1441292409-5264-1-git-send-email-james.knight@rockwellcollins.com>
 (James Knight's message of "Thu, 3 Sep 2015 11:00:09 -0400")
References: <1441292409-5264-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <87a8t2mee2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > When Bash attempts to find the current working directory, it uses a C
 > library call `getcwd` to resolve it. When cross-compiling, the
 > configuration process cannot determine if the target system's C library
 > can support an "unfixed" path length. Therefore, Bash will fallback to a
 > size of `PATH_MAX` for determining the current working directory. When
 > using OverlayFS (and possible other file systems), this becomes an issue
 > since file paths can commonly exceed standard `PATH_MAX` length. This
 > typically results in the following error appearing:

 >    error retrieving current directory: [...]

 > Common C library `getcwd` calls can default to a higher limit (usually
 > the system's page size). The current configurable C libraries (as of at
 > least 2015.08) support a zero (0) size buffer length. Most use the
 > system's page size; musl, being an exception, which defaults to
 > `PATH_MAX` (as Bash was doing). Since these C libraries support
 > allocating buffer space with a zero (0) provided size, the following
 > configuration change allows Bash to support getting a larger-length'ed
 > working directory on target's that support it.

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
