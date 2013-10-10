From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Oct 2013 09:12:47 +0200
Subject: [Buildroot] netfilter projects: licensing ambiguities
Message-ID: <CAAXf6LX-VJiGbV1wG8G+ncnPezUWbn3NU1bmNa9e6L3CL6xLeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear netfilter core team,

There are some licensing ambiguities on the netfilter website and the
source code of the different netfilter projects.

* First of all, following link states:
http://www.netfilter.org/about.html#license
"Netfilter/Iptables is - like all of the Linux kernel - free software
(sometimes referred to as Open Source), distributed under either the
terms of GNU GPLv2 only or any later version.

For further information, please see the Licensing section of this homepage."

If this refers to the kernel part only, then this is not correct. The
Linux kernel is GPLv2 only, not GPLv2+.
If it refers to more than the linux kernel, then I think this
statement should be clarified.

* The licensing page says:
http://www.netfilter.org/licensing.html
"netfilter/iptables is - like all of the Linux Kernel - Free Software
(sometimes referred to as Open Source Software), distributed under the
terms of the GNU GPLv2 only. Please, note that some source code files
might differ, and in that case it is explicitely stated in the header
of every file."

This statement is correct, provided that it talks about the kernel part.

Note that some of the links on that page do not work, like: (didn't
check everything)
http://www.netfilter.org/documentation/licensing/netfilter-licensing.pdf
http://www.netfilter.org/documentation/licensing/netfilter-disclaimer.pdf
http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/documentation/licensing/

* The pages of the individual projects do not consistently mention the
license. Libmnl and libnetfilter_conntrack do mention the license, but
the others don't.

* The sources of the individual projects (didn't check all of them,
but several of the libnetfilter_* ones and libnfnetlink) do not
clearly nor consistently specify the license.
- Some projects mention the license in the README file, but many don't.
- The source and header files do not consistently specify the GPL header.

* The libnfnetlink README file states that the license is GPLv2+, but
the source files that do contain the GPL header specify GPLv2 (without
a reference to 'any later version').


I believe that these issues should be studied and fixed by the
netfilter (and subprojects) authors, so that users of any of the
netfilter projects know exactly which licenses apply, and the
obligations that come with it. Clearly this will also solidify the
legal position of the netfilter project.

Thanks,
Thomas
