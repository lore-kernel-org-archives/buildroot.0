From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 22:27:51 +0200
Subject: [Buildroot] [PATCH 13/15 v4] fs: run packages' filesystem hooks
 in a copy of target/
In-Reply-To: <cbd0a228-12b8-9a72-f4bc-311f4c95d001@mind.be> (Arnout
 Vandecappelle's message of "Sat, 31 Mar 2018 21:04:23 +0200")
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <193b195e0bb305f01ccedd565a517635a975b154.1522487149.git.yann.morin.1998@free.fr>
 <cbd0a228-12b8-9a72-f4bc-311f4c95d001@mind.be>
Message-ID: <87bmf4t2go.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> mkdir -p $(FS_DIR)
 >> +	rsync -au $(BASE_TARGET_DIR)/ $(TARGET_DIR)

 >  This would benefit a lot from using the --link-dest= that we will also use in
 > PPS, in my opinion.

Wouldn't hard links be potentially dangerous - E.G. in case a script
appends to a file.

As I mentioned in my comments to patch 15, we could as well use cp
instead of rsync as we throw away the copy after each build.

-- 
Bye, Peter Korsgaard
