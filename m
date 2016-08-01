From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 1 Aug 2016 15:43:55 +0000
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160730232322.4eca1a53@free-electrons.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <1470066235.23233.62.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all.

You can find some comments about failed packages for ARC below:

On Sat, 2016-07-30 at 23:23 +0200, Thomas Petazzoni wrote:
> > 
> > ?????????arc |????????????????????dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/964cb9bc434c8634db76c875b877317d77956982/
> arc-buildroot-linux-uclibc-gcc.br_real: error: 2: No such file or directory
> arc-buildroot-linux-uclibc-gcc.br_real: error: 2: No such file or directory
> 
> Not sure what's going on here. Alexey? Vlad?

Note that this failure appears not only for ARC.
Tomorrow I hope a will find some time to take a look at this issue.

> > 
> > ?????????arc |????????????????libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/5430b902d900943a34c1888e7e410bd5df367bc2/
> /tmp/ccGvdupB.s: Assembler messages:
> /tmp/ccGvdupB.s:575: Error: @dtpoff is not a complex relocation.
> /tmp/ccGvdupB.s:575: Error: extra comma
> /tmp/ccGvdupB.s:575: Error: syntax error
> /tmp/ccGvdupB.s:585: Error: @dtpoff is not a complex relocation.
> /tmp/ccGvdupB.s:585: Error: extra comma
> /tmp/ccGvdupB.s:585: Error: syntax error
> 
> Alexey, Vlad, this one is for you?
> 
> ?> ? ? ? ? arc |????????????libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/a563b484c9d123a711f1c92513cfc14c23bbc038/
> ?Another ARC toolchain issue. Alexey, Vlad?

This packages failed due to the same assembler problem. It has already been fixed internally.

> 
> > 
> > ?????????arc |????????????????linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/2c3aa54a14dbb561d56d8a48b6b9904f4cd1be12/
> > ?????????arc |????????????????linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/e9510c9443619d059770f85eb9755700e864a0c9/
> BFD (GNU Binutils) 2.26.51.20160702 assertion fail elf32-arc.c:1587
> 
> Alexey, Vlad?
> > 
> > ?????????arc |?????????????????????mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/d81e817f45331c90ed7aa7f114628a2ebe343979/
> > ?????????arc |?????????????????????mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/8997fdf95be140123be183e860e6948a21ed038a/
> Some more ARC toolchain issues: BFD (GNU Binutils) 2.26.51.20160702 assertion fail elf32-arc.c:2267.
> 
> Alexey, Vlad :)

These failures occurred because ARC toolchain hadn't PIE support. This issue has been solved too.

> 
> Thanks a lot!
> 
> Thomas


According to that report I can conclude that most failures above are fixed by the patch:
http://lists.busybox.net/pipermail/buildroot/2016-August/168893.html
So if you don't have any corrections or comments please consider to apply it.


Thank you for keeping us up to date of what is happening with our toolchain :)


-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
