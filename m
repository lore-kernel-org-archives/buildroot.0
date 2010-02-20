From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:37:16 +0100
Subject: [Buildroot] avahi build failure on intltool-update
In-Reply-To: <20100214120039.2c7ff159@surf>
References: <20100214120039.2c7ff159@surf>
Message-ID: <20100220193716.3a92b370@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Feb 2010 12:00:39 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> With the attached .config, I get the following build failure on avahi
> (and I must leave so I don't have the time to dig into it now) :
> 
> =============================================================================================
> checking for intltool >= 0.35.0... ./configure: line 28714:
> intltool-update: command not found found
> configure: error: Your intltool is too old.  You need intltool 0.35.0
> or later.
> =============================================================================================

This problem occurs with several other packages as well, if intltool is
not installed on the host system.

Two options :

 1. Build intltool. intltool depends on Perl and the XML::Parser Perl
    module. Which of these do we build, and which of these do we
    require ?

 2. Depend on intltool unconditionnally in
    toolchain/dependencies/depencies.sh. This is the simplest solution,
    but would mean that all of our users would have to install intltool
    even if they don't build one the packages using it.

 3. Depend on intltool only if one of the packages needing it is
    enabled. But we could still do the check at the beginning of the
    build process.

Which solution?

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
