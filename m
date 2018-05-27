From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:46:49 +0200
Subject: [Buildroot] [PATCH] fs: ensure hard links in TARGET_DIR are
 correctly copied for filesystem input
In-Reply-To: <20180527204857.6081-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 27 May 2018 22:48:57 +0200")
References: <20180527204857.6081-1-peter@korsgaard.com>
Message-ID: <877enon54m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes #11046
 > Commit bb2a57a17a7 (fs: run packages' filesystem hooks in a copy of target/)
 > changed the file system logic to run file system hooks from packages on a
 > copy of TARGET_DIR, and finally use this copy as input for the file system
 > generation.

 > This copy was done with rsync, which by default does not preserve hard
 > links, leading to an expansion of the file system images when hard links are
 > present.

 > Fix it by passing the -H option to rsync (preserve hard links).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Alternatively we can use 'cp -a' instead of rsync.

Committed, thanks.

-- 
Bye, Peter Korsgaard
