From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Mar 2020 16:59:21 +0000
Subject: [Buildroot] [Bug 12691] New: host-rust build fails
Message-ID: <bug-12691-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12691

            Bug ID: 12691
           Summary: host-rust build fails
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: eyalroyee at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Unable to build host-rust (version 1.33.0).
I'm trying to build host-rust on my Ubuntu 18.04 with buildroot on branch
master (commit 35e845700fb15b4ab30678c073300b508db4eb95)

Steps to reproduce are:
1) select host-rust
2) make host-rust

The error is the following:
failed to parse TOML configuration 'config.toml': expected a table key, found a
right bracket at line 15
failed to run:
/home/eyal/buildroot/output/build/host-rust-1.33.0/build/bootstrap/debug/bootstrap
build

It looks like the HOST_RUST_CONFIGURE_CMDS didn't generated a proper .toml
file.
The 15th line in the generated .toml file is of the following format:
    echo '[target.$(RUSTC_TARGET_NAME)]';

I guess that should be some sort of validation for that variable before
evaluating it.

Thanks,
Eyal

-- 
You are receiving this mail because:
You are on the CC list for the bug.
