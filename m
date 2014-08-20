From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 20 Aug 2014 15:33:38 +0000 (UTC)
Subject: [Buildroot] OT: Using oprofile on buildroot system
Message-ID: <lt2f4i$f16$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to get oprofile 0.9.9 running on my ARM9 biuldroot target.
I've enabled oprofile support in my kernel (2.6.33), and the oprofile
package builds fine, and the binaries are where they should be on the
target system.  But, when I try to run opcontrol, it appears to be
trying to load a runtime kernel module:

  # opcontrol --init
  modprobe: chdir(/lib/modules): No such file or directory
  modprobe: chdir(/lib/modules): No such file or directory
  Kernel doesn't support oprofile
 
The oprofile docs say you can enable oprofile support either as a
module or built-in, and I have done the latter -- so despite what
opcontrol says, my kernel _does_ support oprofile. 

I don't have loadable module support enabled in my kernel so of course
modprobe isn't going to work. 

Does anybody have any hints on getting oprofile running?

Any ideas on what module opcontrol might be trying to load?

[I've asked these questions on the oprofile mailing list, but haven't
gotten any response.]

-- 
Grant Edwards               grant.b.edwards        Yow! Why are these athletic
                                  at               shoe salesmen following
                              gmail.com            me??
