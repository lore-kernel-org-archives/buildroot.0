From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jun 2016 10:41:31 +0200
Subject: [Buildroot] [PATCH] mpdstate: add package
In-Reply-To: <20160617083600.GA6429@airbook.newtec.eu>
References: <20160530063656.GC31737@airbook.vandijck-laurijssen.be>
 <20160612215336.06191b9e@free-electrons.com>
 <20160617083600.GA6429@airbook.newtec.eu>
Message-ID: <20160617104131.0f27432f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Jun 2016 10:36:00 +0200, Kurt Van Dijck wrote:

> I'm yet puzzled by the version info that I take from the git repository,
> that does not work in buildroot since it's buildroot's git repo there.
> I haven't found a solution yet, and that's keeping me from updating my
> patches :-)

Your package build system should not call "git describe" or call git to
get the version. Or at least it should provide a way to override that.

Buildroot extracts the source code of packages in
output/build/<name>-<version>/, and those directories do *not* contain
the Git metadata (i.e the .git/ directory is not present). Due to this,
when you run "git" in output/build/<name>-<version>/, it searches in
the parent directory, up to the point where it finds the .git/
directory of Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
