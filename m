From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Feb 2019 11:38:57 +0100
Subject: [Buildroot] [PATCH] packages: update sysv S* scripts to 644
In-Reply-To: <1549394618-37338-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 5 Feb 2019 13:23:38 -0600")
References: <1549394618-37338-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87va1uzhry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---

 > Nothing fancy but here's my command to do it in the packages folder.
 > chmod 644 $(find . -type f -name "S*" -exec ls -l "{}" \; | grep "x 1" | cut -d ' ' -f10)

A simpler solution is using the -perm /u+x option, E.G.:

find -type f -name S\* -perm /u+x | xargs chmod 644

 >  package/input-event-daemon/S99input-event-daemon | 0

Strangely enough this file was still 755 after git-am'ing the patch, so
I manually added it and committed, thanks.

-- 
Bye, Peter Korsgaard
