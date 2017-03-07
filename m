From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:50:32 +0100
Subject: [Buildroot] [PATCH 1/1] firejail: new package
In-Reply-To: <1477502552-4236-1-git-send-email-cdf123@cdf123.net>
References: <1477502552-4236-1-git-send-email-cdf123@cdf123.net>
Message-ID: <20170307215032.64ed76d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 12:22:32 -0500, Chris Frederick wrote:
> Firejail Security Sandbox
> https://firejail.wordpress.com/
> 
> Lightweight application sandboxing system using seccomp and kernel
> namespaces.
> 
> Signed-off-by: Chris Frederick <cdf123@cdf123.net>
> ---
>  DEVELOPERS                     |  3 +++
>  package/Config.in              |  1 +
>  package/firejail/Config.in     | 17 +++++++++++++++++
>  package/firejail/firejail.hash |  2 ++
>  package/firejail/firejail.mk   | 27 +++++++++++++++++++++++++++
>  5 files changed, 50 insertions(+)
>  create mode 100644 package/firejail/Config.in
>  create mode 100644 package/firejail/firejail.hash
>  create mode 100644 package/firejail/firejail.mk

Thanks, I've applied to the master branch, with the following changes:

    [Thomas:
     - Fix DEVELOPERS entry: use <> around the e-mail address instead of ()
     - firejail builds fine with musl, so only exclude uclibc, which fails
       to build with EM_ARM undeclared
     - Update to upstream version 0.9.44.8.
     - Remove FIREJAIL_MAKE_OPTS, as suggested by Romain Naour.
     - Pass --enable-busybox-workaround only if Busybox is enabled, as
       suggested by Romain Naour.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
