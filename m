From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 27 Oct 2019 19:18:55 +0100
Subject: [Buildroot] package/alljoyn: is it worth to port to Py3 ?
Message-ID: <f26113ff-6b7f-26ac-fc10-a88f4af90132@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabrice and all Buildrooters,

As you may know, Python2 is going to be deprecated on the 1st of January 
2020, and as such I'm working on adapting the Buildroot packages that 
still depend on Python2. There's an overview page on 
https://elinux.org/index.php?title=Buildroot:Python2Packages

At this very moment, I'm looking at packages that rely on host-python at 
build time, mostly those using the waf or SCons build system. In 
particular, I came accross the alljoyn packages, which are based on 
SCons, and contain a fair amount of Python2-only idioms. Fixing them is 
a bit tedious but definitely easy and feasible. However it would result 
in quite large patches in the Buildroot codebase.

Hence my question: is anyone using these alljoyn packages ? There does 
not seem to be any package that depend on them, and there is no upstream 
commit since 2016. If nobody needs them, I guess we can simply remove 
them from Buildroot.

Best regards,

Titouan
