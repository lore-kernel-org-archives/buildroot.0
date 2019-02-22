From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 20:23:24 +0100
Subject: [Buildroot] 2019.02-rc1 doesn't boot properly
In-Reply-To: <20190222162831.GJ9224@smile.fi.intel.com> (Andy Shevchenko's
 message of "Fri, 22 Feb 2019 18:28:31 +0200")
References: <20190220163206.GB9224@smile.fi.intel.com>
 <878sy9qfa0.fsf@dell.be.48ers.dk>
 <20190222162831.GJ9224@smile.fi.intel.com>
Message-ID: <87tvgviq4z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@intel.com> writes:

Hi,

 >> Not that I am aware of. Are you using the same kernel version as for
 >> 2018.11? The kernel recently(-ish) changed the way lack of entropy is
 >> handled, leading to hangs / very slow boot.

 > Yes, tested with the same kernel (it's external to BR, so, definitely it's the same).

Ok, can you strace ssh-keygen to see if it indeed is hanging in
getrandom()?

Dropbear btw only creates the host keys on demand, E.G. the first time
you try to ssh to the device, which may allow the device to collect more
entrophy.

-- 
Bye, Peter Korsgaard
