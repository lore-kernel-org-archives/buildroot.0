From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 20:12:29 +0200
Subject: [Buildroot] [PATCH 2/7] dtc: add host build
In-Reply-To: <20151003231346.36ccac9e@gmx.net> (Peter Seiderer's message of
 "Sat, 3 Oct 2015 23:13:46 +0200")
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20151003231346.36ccac9e@gmx.net>
Message-ID: <87eghajyeq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> From: Peter Seiderer <ps.report@gmx.net>
 >> 
 >> Having a host variant of dtc is needed for example for U-Boot, which
 >> uses the Device Tree for a number of platforms.
 >> 
 >> In addition, now that we have a proper host-dtc package, it is no
 >> longer needed for the linux package to install the host dtc compiler:
 >> users interested in having the host dtc compiler can simply enable
 >> this package.

 > No, please do not drop the linux dtc host...things have changed since
 > my initial patch set. My intend was do enable a host dtc version with
 > overlay support as used with the raspberry pi (therefore the host
 > dtc package with overlay support patches which where not included
 > with the rpi kernel sources dtc package). Now things have changed
 > and the actual rpi kernel sources dtc already contain the overlay
 > patches. Please keep both options, linux sources host dtc and
 > extra host dtc package...

The problem really is that dtc isn't dtc. I've changed the Linux kernel
package to install its dtc into $(HOST_DIR)/usr/bin/linux-dtc instead so
it doesn't conflict with host-dtc.

-- 
Bye, Peter Korsgaard
