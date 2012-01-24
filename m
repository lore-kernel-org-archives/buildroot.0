From: Will Newton <will.newton@gmail.com>
Date: Tue, 24 Jan 2012 10:26:10 +0000
Subject: [Buildroot] [PATCH 00/14] Add EFL packages to buildroot
In-Reply-To: <20120123222150.7f28bf58@skate>
References: <CAFbHwiQEzOV7_wK647kRDjXZTWxEEPjnXo3uLfpOk=u1AbxszQ@mail.gmail.com>
 <20120123222150.7f28bf58@skate>
Message-ID: <CAFbHwiSeN_7-GHLg-2Xc=+OYszabK9pT3MsshHTHLQUsdzaJwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 23, 2012 at 9:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas!

Thanks for taking a look at the patches.

> Le Mon, 23 Jan 2012 16:35:06 +0000,
> Will Newton <will.newton@gmail.com> a ?crit :
>
>> This series is a reworked version of the previous series. It takes
>> into account review comments by Arnout Vandecappelle, fixes some bugs
>> and also adds some new packages, efreet, ethumb elementary and edbus.
>>
>> There are 3 patches to non-EFL packages that are required, a host
>> version of libjpeg and lua must be built and the xcb-util libraries
>> need to be installed into staging.
>
> Good to see EFL getting into Buildroot.
>
> Many of your packages have a host variant, but do not defined any
> HOST_... information, and the host variant appears to be unused. Take
> libembryo for example, it declares a host variant, but does not define
> any HOST_LIBEMBRYO_DEPENDENCIES. Is this normal?

I believe after the patch series by Arnout committed on January 18th
that host deps are calculated automatically. I'm not 100% sure if I
got it right but it builds so it appears that it's at least partially
right. I suppose one downside of that change is that it does make it
much harder to figure out who is depending on what.

> It looks like some of the packages for the host are needed to build
> edje-cc and eet-eet for the host. This could be explained somewhere.

I'll have a think about where the best place might be...
