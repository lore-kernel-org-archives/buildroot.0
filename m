From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:09:05 +0200
Subject: [Buildroot] [PATCH V3 4/5] c-icap: new package
In-Reply-To: <1416322487-14247-5-git-send-email-guillaume.gardet@oliseo.fr>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-5-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <20150710190905.0aa3bc3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume GARDET,

On Tue, 18 Nov 2014 15:54:46 +0100, Guillaume GARDET wrote:
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> 
> ---
>  package/Config.in        |  1 +
>  package/c-icap/Config.in | 15 ++++++++++++
>  package/c-icap/S96cicap  | 35 ++++++++++++++++++++++++++
>  package/c-icap/c-icap.mk | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 115 insertions(+)
>  create mode 100644 package/c-icap/Config.in
>  create mode 100644 package/c-icap/S96cicap
>  create mode 100644 package/c-icap/c-icap.mk

I've applied, but a lot of changes were needed to make the patch
correct. In fact, with the patch you posted, the c-icap daemon was not
even starting properly at boot time because the c-icap.conf file
contained invalid paths.

Here are the changes I made before committing:

    [Thomas:
     - Remove trailing whitespace everywhere
     - Rewrap the Config.in help text
     - Fix Config.in comment, the proper text for BR2_PREFER_STATIC_LIB is
       "dynamic library", not "libdl library"
     - Use a PID file in the init script
     - Show OK / FAIL when stopping the service
     - Remove the largefile/IPv6 handling in c-icap.mk, since they are now
       mandatory. We therefore pass --enable-large-files and --enable-ipv6
       unconditionally.
     - Remove the reference to a non-existing
       C_ICAP_INSTALL_TARGET_CONFIGS install target hook.
     - Install the init script unconditionally.
     - Remove unneeded example configuration files (*.default) from /etc,
       and fixup the c-icap.conf so that the default values work with
       Buildroot
     - Properly handle the *-config scripts installed by c-icap.
     - Add hash file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
