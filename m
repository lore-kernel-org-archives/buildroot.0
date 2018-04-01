From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 22:42:05 +0200
Subject: [Buildroot] [PATCH] check-package: support symlinks to the
 script
In-Reply-To: <20180401200516.21064-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 1 Apr 2018 22:05:16 +0200")
References: <20180401200516.21064-1-arnout@mind.be>
Message-ID: <87fu4epski.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The check-package script finds base_dir (= the Buildroot directory) and
 > cd's into it. To be able to support relative paths as arguments, it
 > first recalculates the arguments relative to base_dir.

 > However, if there is a symlink anywhere on the path to the
 > check-package script, the relative paths will be wrong. To solve this,
 > use realpath() instead of abspath(), so symlinks are resolved before
 > calculating the relative path.

 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
