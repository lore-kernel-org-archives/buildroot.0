From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 11:18:27 +0100
Subject: [Buildroot] [PATCH] ntfs-3g: add security fix for CVE-2017-0358
In-Reply-To: <20170213225110.31788-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 13 Feb 2017 23:51:10 +0100")
References: <20170213225110.31788-1-peter@korsgaard.com>
Message-ID: <8737fhkrd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Jann Horn, Project Zero (Google) discovered that ntfs-3g, a read-write
 > NTFS driver for FUSE does not not scrub the environment before
 > executing modprobe to load the fuse module. This influence the behavior
 > of modprobe (MODPROBE_OPTIONS environment variable, --config and
 > --dirname options) potentially allowing for local root privilege
 > escalation if ntfs-3g is installed setuid.

 > Notice that Buildroot does NOT install netfs-3g setuid root, but custom
 > permission tables might be used, causing it to vulnerable to the above.

 > ntfs-3g does not seem to have a publicly available version control system
 > and no new releases have been made, so instead grab the patch from Debian.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
