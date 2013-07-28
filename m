From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 15:03:34 +0200
Subject: [Buildroot] [PATCH v2] <pkg>-rsync: support user custom cmds
In-Reply-To: <1375007963-15935-1-git-send-email-tjlee@ambarella.com>
References: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
 <1375007963-15935-1-git-send-email-tjlee@ambarella.com>
Message-ID: <20130728150334.6a8a862c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tzu-Jung Lee,

On Sun, 28 Jul 2013 18:39:23 +0800, Tzu-Jung Lee wrote:
> This patch allows users to override the options or entire command
> line of rsync.  The default options filters out object or libraries
> during rsync.  For local packages which come with pre-built binaries,
> the copy in build/ directory will not have complete files as src/

Hum, I am not sure this is the right way to fix this. When it was
introduced, I thought the --cvs-exclude option was only ignoring things
like CVS/ directories, .svn/ directories or .git/ directories. But now
that I read the rsync man page, I see that it excludes a huge number of
other file name patterns, which I think isn't desirable.

So rather than providing a way for the user to override the rsync
command, I'd prefer the rsync command to behave appropriately. I
believe it should simply copy /everything/, including version control
directories. Yes that's longer, but there's no reasonable generic way
to determine which files should be copied and which files should not.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
