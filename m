From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 23:03:56 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
	archives
In-Reply-To: <20170216174124.GB4986@free.fr> (Yann E. MORIN's message of "Thu, 
 16 Feb 2017 18:41:24 +0100")
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
 <20170216174124.GB4986@free.fr>
Message-ID: <87efyxg5df.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Actually, there is a use-case for being able to specify some of those,
 > at least the downloaders: git, wget, svn, scp...

 > I use a script that is called in lieue of each downloader:

 >     BR2_WGET="/path/to/wrapper wget --passive-ftp -nd -t 3"
 >     BR2_GIT="/path/to/wrapper git"
 >     and so on...

 > That script is responsible for memorising, for each package, whether it
 > was downloaded from the primary mirror, the official site, or the backup
 > mirror, then acts according to where the package was downloaded:

 >   - from the primary mirror, nothing is done,

 >   - from the official site: it sends the archive to the primary mirror,
 >     and add it to a report,

 >   - from the backup site: it sends the archive to the primary mirror,
 >     and adds it to a report.

 > This is done by a Jenkins job, which gets both reports as the result. If
 > any of the reports is non-empty, the build is marked failed.

 > This allows us to:

 >   - automatically track new dependencies added by Joe Random Developer,
 >     especially transitive dependencies he might not be aware of,

 >   - automatically feed our local mirror so we are not dependent on
 >     upstream or s.b.o.

Nice, but presumably you could also simply create a directory with
wget/git/svn/.. symlinks to your wrapper and prepend that to your path
before running buildroot, and then change the wrapper to do its stuff
and call further in the path for the real tool, similar to the recently
added date wrapper for reproducable builds?

-- 
Bye, Peter Korsgaard
