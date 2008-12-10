From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2008 09:23:32 +0100
Subject: [Buildroot] buildroot using glibc
In-Reply-To: <008a01c95a00$53f2a300$4d01a8c0@signet>
References: <008a01c95a00$53f2a300$4d01a8c0@signet>
Message-ID: <20081210092332.0f9e74bd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 9 Dec 2008 18:46:20 +0530,
"P Jagadeesh Maiya" <pjmaiya@signal-networks.com> a ?crit :

>   I want to use buildroot built using glibc instead of ulibc. I have
> gone through entire mailing list archeive, but nowhere I am not
> getting any information or link to get patch for glibc. Can anyone
> provide any refernce for the patch so that buildroot can be used with
> glibc.

The simplest solution is to use an external toolchain. I already used a
Codesource glibc-based toolchain with Buildroot, and it worked nicely.
The only needed modification were :

 * Modifications to get external toolchains to work (I have sent a
   patch recently for this)

 * Specifying the proper values for the BR2_TOOLCHAIN_EXTERNAL_LIB_C and
   BR2_TOOLCHAIN_EXTERNAL_LIBS configuration variables.

If you want to *generate* a glibc-toolchain with Buildroot, it is
probably going to be a more tedious work. But if you happen to do that,
please submit patches!

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
