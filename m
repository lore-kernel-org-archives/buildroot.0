From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 07:42:53 +0100
Subject: [Buildroot] [PATCH v1 4/4] package/wireshark: add missing qt5
 dependencies
In-Reply-To: <20200315233914.0f52a989@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 15 Mar 2020 23:39:14 +0100")
References: <20200310081902.3488-1-ps.report@gmx.net>
 <20200310081902.3488-4-ps.report@gmx.net>
 <20200315233914.0f52a989@windsurf.home>
Message-ID: <871rpeguxe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 10 Mar 2020 09:19:02 +0100
 > Peter Seiderer <ps.report@gmx.net> wrote:

 >> -comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL"
 >> +comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 4.8"
 >> depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
 >> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 >> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 >> +		!BR2_arc

 > Same problem as for pinentry in how the arch dependency is taken into
 > account.

 > Fixed to:

 > comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, gcc >= 4.8"
 >         depends on !BR2_arc
 >         depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
 >                 !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

 > And applied. Thanks!

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
