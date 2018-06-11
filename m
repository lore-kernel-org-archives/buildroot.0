From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 Jun 2018 09:35:10 +0000
Subject: [Buildroot] [Bug 11086] New: download/git submodule breaks on
 symlinked dl folder
Message-ID: <bug-11086-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11086

            Bug ID: 11086
           Summary: download/git submodule breaks on symlinked dl folder
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posted at heine.so
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I'm not sure if this should be actually considered a bug but maybe this is
something which should be mentioned in the documentation.

I have been symlinking the /dl folder of Buildroot to keep a central cache of
downloads (I now know `export BR2_DL_DIR` might be better). This was no problem
before but I ran into a problem with a git download which uses a submodule. 

So my structure is like this

/foo/buildroot-2018.05
/foo/dl

the BR folder contains a symlink to the dl folder (doesn't matter if relativ or
absolute)

the checkout of the submodule fails with
fatal: Could not chdir to
'../../../../../../../../dl/my_project/git/dep/my_submodule': No such file or
directory

If I compare paths I notice one too many '../' in this. which relates to the dl
folder being one folder higher than the dl folder in BR.

(the entry in .git/modules/dep/my_submodule/config contains the false relative
worktree)

I imagine this would require some decent fiddeling to fix. So maybe a note
mentioning "you should no symlink the dl folder, use BR2_DL_DIR" would be
helpful.

Regards,
Michael

-- 
You are receiving this mail because:
You are on the CC list for the bug.
