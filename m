From: l m <lmmmcc@gmail.com>
Date: Wed, 17 Dec 2008 13:40:41 +0800
Subject: [Buildroot] hotplug lsof index libssp
Message-ID: <6c8937b20812162140u6138e517n87fe31e24e82b7ba@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I've met some problems with recent buildroot versions.

1. hotplug: r24435
"cat package/hotplug/diethotplug-0.5.tar | tar -C
/opt/buildroot/build_i686   -xf -
tar: Skipping to next header
tar: Error exit delayed from previous errors
make: *** [/opt/buildroot/build_i686/diethotplug-0.5] Error 2"

I've compared diethotplug-0.5.tar in different buildroot svn versions. In
r24435 the file size is 40951 Bytes, in another working version, it's 40960
Bytes. Is it this diethotplug-0.5.tar in r24435 corrupted?

2. lsof
The default lsof site ftp://lsof.itap.purdue.edu is not valid now. I use
http://www.mirrors.wiretapped.net/security/host-security/lsof/ to replace
it.

3. index() function
Some packages still use index(), but default setting doesn't support it. Is
it the "Enable SuSv3 LEGACY" in uclibc? I use strchr() to replace this
function.

4. libssp.so
For my X86 target system and FC10 X86 host system with gcc 4.3.2, openssh
compiling is ok, but its running (sshd, ssh-keygen,...) needs libssp.so in
the target system. Some people said in X86 with gcc 4 libssp is needed.
Should you add it to openssh.mk for X86 and gcc 4?


Regards

LM
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081217/9c4afe32/attachment.htm 
