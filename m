From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:46:57 +0200
Subject: [Buildroot] [PATCH] utils/get-developers: add -e flag to only
 list email addresses for git send-email
In-Reply-To: <20181008074333.1582-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 8 Oct 2018 09:43:33 +0200")
References: <20181008074333.1582-1-peter@korsgaard.com>
Message-ID: <87o9bn79ha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > When called with a list of patches, get-developers prints the entire git
 > send-email invocation line:

 > ./utils/get-developers 0001-git-security-bump-to-version-2.16.5.patch
 > git send-email --to buildroot at buildroot.org --cc "Matt Weber <matthew.weber@rockwellcollins.com>"

 > This may be handy when creating an entire patch series and editing a cover
 > letter, but it does mean that this has to be explicitly executed and
 > get-developers cannot be used directly by the --cc-cmd option of git
 > send-email to automatically CC affected developers.

 > So add an -e flag to only let get-developers print the email addresses of
 > the affected developers in the one-email-per-line format expected by git
 > send-email, similar to how get_maintainer.pl works in the Linux kernel.

 > With this and a suitable git configuration:

 > git config sendemail.to buildroot at buildroot.org
 > git config sendemail.ccCmd "$(pwd)/utils/get-developers -e"

 > You can simply do:

 > git send-email master

 > To automatically mail the buildroot list and CC affected developers on
 > patches.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
