From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 Jan 2017 23:00:36 +0000
Subject: [Buildroot] [Bug 9581] New: VagrantFile provisioning step fails due
 to issue with grub-pc update
Message-ID: <bug-9581-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9581

            Bug ID: 9581
           Summary: VagrantFile provisioning step fails due to issue with
                    grub-pc update
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Mac OS
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: robiniddon at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6851
  --> https://bugs.busybox.net/attachment.cgi?id=6851&action=edit
Patch to correct provisioning step in Vagrantfile

If you follow the steps in the manual to launch vagrant (download VagrantFile,
run vagrant up) then the resulting VirtualBox VM hangs during the provisioning
because the grub-pc update is asking a question but there is no interactive
context in which the user can answer it.

The solution is to run the apt-get update with not only -y but also some magic
options that make sure it really doesn't ask any questions.

The issue is described here:

http://askubuntu.com/questions/146921/how-do-i-apt-get-y-dist-upgrade-without-a-grub-config-prompt

I attach a patch that makes it so.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
