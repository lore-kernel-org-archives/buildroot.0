From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Wed, 13 Jan 2021 10:27:38 +0100
Subject: [Buildroot] libusb host gcc version issue
In-Reply-To: <cmu-lmtpd-11307-1610526062-0@imapb020.mykolab.com>
References: <cmu-lmtpd-11307-1610526062-0@imapb020.mykolab.com>
Message-ID: <2052796.irdbgypaU6@zgyarmati-w530>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

compiling host-libusb requires gcc >=4.9 (due to   _Thread_local ), which 
causes autobuilder failures on older distros (like Ubuntu 14.04), see the 
linked autobuild report below. Also the target build needs >= 4.9, but it's 
already being handled by Fabric's patch.
  One way to fix the host build to bump the minimal GCC version to 4.9 in 
'support/dependencies/dependencies.mk', although I'm not sure it's desirable, 
as it's not only kicks out Ubuntu 14.04 (which is EOL anyway), but also CentOS 
7 (which is supported until 2024). What is the public opinion on this?

Thx, regards
Zoltan Gyarmati

On 2021. janu?r 13., szerda 9:20:58 CET Thomas Petazzoni wrote:
> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
> 
> Results for the 'master' branch
> -------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                             
>          url
> -------------+--------------------------------+----------------------------
> ----------------------------------------------------- arm      |      
> host-libusb-1.0.24       |
> http://autobuild.buildroot.net/results/a9a557eed77238fff36735f4391278bca40b
> 9d04
