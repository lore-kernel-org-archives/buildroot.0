From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Jul 2009 09:16:25 +0200
Subject: [Buildroot] no fontconfig in $(TARGET_DIR)
In-Reply-To: <4A71A8C8.5030409@fpga-art.de> (Lars Lockenvitz's message of
	"Thu\, 30 Jul 2009 16\:06\:00 +0200")
References: <4A71A8C8.5030409@fpga-art.de>
Message-ID: <87hbwtwcdy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lars" == Lars Lockenvitz <l.lockenvitz@fpga-art.de> writes:

 Lars> Hello,
 Lars> I don't use the newest buildroot version. I use rev 25671 from git.

git show 25671
fatal: ambiguous argument '25671': unknown revision or path not in the
working tree.
Use '--' to separate paths from revisions

 Lars> And have the problem that fontconfig is present in $(STAGING_DIR) but
 Lars> not in $(TARGET_DIR).

What exactly do you mean by that? Don't you have:

find -name fc-\* -o -name \*fontconfig\*
./usr/bin/fc-cache
./usr/bin/fc-match
./usr/bin/fc-cat
./usr/bin/fc-list
./usr/lib/libfontconfig.so.1.3.0
./usr/lib/libfontconfig.so.1
./usr/lib/libfontconfig.so
./tmp/fontconfig

If not, do you have a
project_build_*/*/autotools-stamps/fontconfig_target_installed ?

What happens if you delete that file and rerun make?

-- 
Bye, Peter Korsgaard
