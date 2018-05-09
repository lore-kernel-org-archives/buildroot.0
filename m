From: Andreas Ziegler <br015@umbiko.net>
Date: Wed, 09 May 2018 08:35:20 +0200
Subject: [Buildroot] regarding creating my own customized package in
 buildroot and use it in my OS in Raspberry Pi
In-Reply-To: <mailman.7.1525694405.18540.buildroot@busybox.net>
References: <mailman.7.1525694405.18540.buildroot@busybox.net>
Message-ID: <2fb49bd5b94a59b1a12e1a3813beb321@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vineeth,

> ... I am able to build without any error. But am not able to view
> that in my newly built OS. Or couldn't use that package in my OS. I am 
> not
> able to sort where the issue is? Kindly help. Thank you!

you are probably missing code in your makefile(s) for installing your 
package. You need to copy the executable to the target root filesystem 
somehow, otherwise it will not show up in the target system.

Usually this code is placed in the project's makefile [1] and executed 
by the buildroot environment, but you could also place instructions 
directly into your buildroot .mk file.

For a quick-and-dirty solution you might check existing packages [2] for 
examples what could be done. For a reference I would recommend section 
17.5 of the buildroot manual [3].

Kind regards,
Andreas

[1] It should have a section to handle the 'make install' command.
[2] E.g. package/b43-firmware, package/tcping
[3] 
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems
