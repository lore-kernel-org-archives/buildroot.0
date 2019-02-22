From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 22 Feb 2019 18:28:31 +0200
Subject: [Buildroot] 2019.02-rc1 doesn't boot properly
In-Reply-To: <878sy9qfa0.fsf@dell.be.48ers.dk>
References: <20190220163206.GB9224@smile.fi.intel.com>
 <878sy9qfa0.fsf@dell.be.48ers.dk>
Message-ID: <20190222162831.GJ9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 21, 2019 at 05:26:15PM +0100, Peter Korsgaard wrote:
> >>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@intel.com> writes:
> 
>  > Hello,
>  > Recently I had tried to boot 2019-02.rc1 on my Intel Edison board (after few
>  > iterations I confirm that the issue somewhere in Buildroot,
>  > since 2018.11.x works with the same configuration), but it went unsuccessfully.
> 
>  > It's a bit hard for me and time consuming to debug right now, though here are
>  > the symptoms. Since I have SSH and network enabled it looks like ssh-keygen
>  > goes to endless wait for entropy / random generator (?) and never becomes back
>  > that prevents to have a shell. Everything from kernel till daemons and modules
>  > works. (I have USB OTG enabled and I see dmesg when I switched USB roles).
>  > Is it known issue?
> 
> Not that I am aware of. Are you using the same kernel version as for
> 2018.11? The kernel recently(-ish) changed the way lack of entropy is
> handled, leading to hangs / very slow boot.

Yes, tested with the same kernel (it's external to BR, so, definitely it's the same).

-- 
With Best Regards,
Andy Shevchenko
