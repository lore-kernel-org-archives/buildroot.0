From: Ron Eggler <reggler@semios.com>
Date: Wed, 18 Dec 2013 05:57:26 +0000
Subject: [Buildroot] generate uImage file
In-Reply-To: <20131218104644.364648bc@skate>
References: <1651747.2nkJEYoDym@regdesktophome> <20131218104644.364648bc@skate>
Message-ID: <1776243.gWOYWTpOXo@regdesktophome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




> Dear Ron Eggler,
> 
> On Tue, 17 Dec 2013 21:50:50 +0000, Ron Eggler wrote:
> > I just changed my buildroot config to generate a uImage file. I then
> > did a "make clean" followed by a make but for both I get:
> > linux/linux.mk:339: *** No kernel configuration file specified, check
> > your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting.  Stop.
> > 
> > What does this mean? How do I fix this to compile again?
> 
> You have selected the choice of providing a kernel configuration file
> to configure the kernel, but you did not give Buildroot the path to
> this file with the BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE configuration
> option.

That was it, providing the path under "configuration file path" fixed the issue.

Thank you Thomas!

Ron
-- 
*ron eggler | semios | senior software engineer*
320 - 887 Great Northern Way | Vancouver, BC | V5T 4T5
T | 604 229 2044 ext 105[1]
C | 778 230 9442[2]
E | reggler at semios.com[3]
smart farming[4]
twitter[5] linkedin[6]

--------
[1] tel:604%20229%202044%20ext%20105
[2] tel:778%20230%209442
[3] mailto:reggler at semios.com
[4] http://www.semios.com
[5] https://twitter.com/semios
[6] http://www.linkedin.com/company/semiosbio-technologies-inc?goback=%2Enmp_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1&trk=company_logo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131218/5b11e570/attachment.html>
