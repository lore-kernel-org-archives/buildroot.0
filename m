From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 09:25:25 +0100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A63@vpane.excalyptech.com>
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com>
 <20130313083725.4605312e@skate>
 <201303131910.06613.yann.morin.1998@free.fr>
 <20130314084816.00d23bd7@skate>
 <EE5E77B503DE9A478B63A89AAD2585EDB66A63@vpane.excalyptech.com>
Message-ID: <20130315092525.0fd38998@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Przemyslaw Wrzos,

On Fri, 15 Mar 2013 11:18:44 +1100, Przemyslaw Wrzos wrote:

> So just a question about the effect of that. If we remove that
> dependency then won't this be inconsistent with how the internal
> buildroot toolchain build works?

Nothing in Buildroot tries to get rebuilt automatically when there are
configuration changes. This has been the Buildroot policy for a long
time, and only the Crosstool-NG backend was moving away from this
general policy.

If you make a change in the Buildroot configuration, it's up to you to
understand the consequences of the change, and take the appropriate
actions (a complete "make clean all" in some situations, remove some
stuff in other situations, etc.).

> Or does it not matter because the
> internal toolchain is going to be deprecated eventually anyway.

From the discussions of the last Buildroot Developers Meeting, it is
really not clear whether the internal toolchain backend will be
deprecated one day. There are still some integration problems in the
Crosstool-NG backend (download infrastructure, license infrastructure)
that are not easy to handle.

See http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013 (search for
"Switching to ct-ng as the default toolchain backend has been in the
plans for several years").

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
