From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 08:42:02 +0100
Subject: [Buildroot] [PATCH 1/1] Fix gdk-pixbuf broken by host package
 moved to /lib instead of /usr/lib Regression occured following commit
 19ba17ee3ba946ac865849df89d7c2988ea5aca9: "Globally replace
 $(HOST_DIR)/usr/lib with $(HOST_DIR)/lib" The host package loader.cache now
 references shared objects in /lib but target files are still in /usr/lib so
 sed has to be fixed accordingly.
In-Reply-To: <1516445179-11479-1-git-send-email-pct@crookies.net> (Pierre
 CROKAERT's message of "Sat, 20 Jan 2018 11:46:19 +0100")
References: <1516445179-11479-1-git-send-email-pct@crookies.net>
Message-ID: <87lgg9yzed.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre" == Pierre CROKAERT <pct@crookies.net> writes:

 > Signed-off-by: Pierre CROKAERT <pct@crookies.net>

Committed after extending / cleaning up the commit message, thanks.

-- 
Bye, Peter Korsgaard
