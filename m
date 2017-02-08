From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 8 Feb 2017 10:28:24 +0100
Subject: [Buildroot] [PATCH] Don't disable dependency tracking if using
 <pkg>_OVERRIDE_SRCDIR.
In-Reply-To: <f2750ce8-3ac0-6e72-20ca-1c2141b7621a@gmail.com>
References: <20170201135310.3ghqvpqww25jfzm2@zenon.in.qult.net>
 <2a135f21-ffe1-06b8-37d3-e78f7a51798f@gmail.com>
 <20170206193729.i3epqqqekvlgiime@zenon.in.qult.net>
 <f2750ce8-3ac0-6e72-20ca-1c2141b7621a@gmail.com>
Message-ID: <29313098-6d7d-72f6-31fd-9c806625e4ee@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/2017 23:14, Romain Naour a ?crit:
> Hi Ignacy,
> 
> Le 06/02/2017 ? 20:37, Ignacy Gaw?dzki a ?crit :
>> On Mon, Feb 06, 2017 at 07:39:00PM +0100, parla Romain Naour:
>>>
>>> You're likely working on the target variant, so probably you can let the
>>> dependency tracking enabled for the host?
>>
>> Dependency tracking was initially *disabled* for both target and host.
>> I suppose that <pkg>_OVERRIDE_SRCDIR works for both target and host,
>> so I don't see why we should leave it disabled for one and not the
>> other.
> 
> Indeed <pkg>_OVERRIDE_SRCDIR works for both target and host packages and the
> "dependency tracking" was disabled (see [1]) to reduce the build time.
> 
> My initial feeling is to allow to enable the "dependency tracking" only when
> doing active development on a *target* package using <pkg>_OVERRIDE_SRCDIR.
> Buildroot is unlikely used for active development on a *host* package.

Some hosts packages are a dependency of the target package, because
they are not very friendly to cross-compiling, so the host variant
compiles build tools used by the target variant.  Both should be in
sync when building.

So it make sense to enable dependency tracking for hosts packages
during active development for a target package.
