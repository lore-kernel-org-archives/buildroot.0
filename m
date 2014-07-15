From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 21:31:25 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20140715213125.1b848b48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Fri,  4 Jul 2014 17:56:23 +0200, Luca Ceresoli wrote:
> Hi,
> 
> this small patch series makes the exim mail transfer agent more configurable
> at build time.
> 
> Exim does not use a framework such as the autotools or CMake for its
> build-time configuration. Instead it requires to provide a Makefile
> (./Local/Makefile) with variables set appropriately. This Makefile is then
> included by the main Makefile.
> 
> These patches allow to use a custom configuration Makefile provided by the
> user and to tweak (in the Buildroot config) the user that will run the exim
> processes.
> 
> Luca
> 
> Luca Ceresoli (3):
>   exim: allow using a custom configuration file

Thanks, I've applied this patch.

>   exim: make EXIM_USER configurable
>   exim: generate the user with automatic uid

However, I've for now rejected those two patches. The reason is that I
don't think we should add an option to customize the user with which
each and every daemon is started. Buildroot should use a sane default
option, and for additional configuration, leave it to the Buildroot
user to use BR2_ROOTFS_USERS_TABLES to create any additional/custom
user that may be needed.

If you don't agree with this decision, let us know and resubmit patches
with more details on why an exim specific mechanism is needed here.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
