From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:26:15 +0100
Subject: [Buildroot] 2019.02-rc1 doesn't boot properly
In-Reply-To: <20190220163206.GB9224@smile.fi.intel.com> (Andy Shevchenko's
 message of "Wed, 20 Feb 2019 18:32:06 +0200")
References: <20190220163206.GB9224@smile.fi.intel.com>
Message-ID: <878sy9qfa0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@intel.com> writes:

 > Hello,
 > Recently I had tried to boot 2019-02.rc1 on my Intel Edison board (after few
 > iterations I confirm that the issue somewhere in Buildroot,
 > since 2018.11.x works with the same configuration), but it went unsuccessfully.

 > It's a bit hard for me and time consuming to debug right now, though here are
 > the symptoms. Since I have SSH and network enabled it looks like ssh-keygen
 > goes to endless wait for entropy / random generator (?) and never becomes back
 > that prevents to have a shell. Everything from kernel till daemons and modules
 > works. (I have USB OTG enabled and I see dmesg when I switched USB roles).
 > Is it known issue?

Not that I am aware of. Are you using the same kernel version as for
2018.11? The kernel recently(-ish) changed the way lack of entropy is
handled, leading to hangs / very slow boot.

-- 
Bye, Peter Korsgaard
