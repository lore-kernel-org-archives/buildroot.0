From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Feb 2014 17:31:57 +0100
Subject: [Buildroot] [PATCH] Makefile: change rsync used in overlays to
 always transfer files
In-Reply-To: <1370655822-2668-1-git-send-email-danomimanchego123@gmail.com>
References: <1370655822-2668-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CACXmVibcZ=4o_Lv=mP5L5QXgWLqDc1X=4n8SLYP62DfuJJpp4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 8, 2013 at 3:43 AM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> If two files with the same relative paths exist in multiple overlay
> skeletons, and they have the same modification time and size, then rsync
> might not copy the later file on top of the earlier file.  This patch fixes
> this by adding the -I option to the rsync commands used in the overlay
> skeleton file installations.  ("man rsync" indicates that this option turns
> off the file-size/mod-date "quick check" behavior, causing all files to be
> updated - more like the cp commands that we had originally.)
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed with -I changed to --ignore-times as it is a bit more
obvious what the option does.

-- 
Bye, Peter Korsgaard
