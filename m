From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 9 Mar 2015 20:32:16 +0100
Subject: [Buildroot] [V2 2/2] graph-depends: add an option
	--stop-on-virtual
In-Reply-To: <20150308221843.2d6fbf7d@free-electrons.com>
References: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
 <1420295353-8065-2-git-send-email-francois.perrad@gadz.org>
 <20150308221843.2d6fbf7d@free-electrons.com>
Message-ID: <CAB0FRsvxotGUKRC2q7R_JKPCajZb68X3r2qnjciehP-cqXENBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-08 22:18 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Sat,  3 Jan 2015 15:29:13 +0100, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  docs/manual/common-usage.txt  |  3 +++
>>  support/scripts/graph-depends | 11 +++++++++++
>>  2 files changed, 14 insertions(+)
>
> I'm still not convinced by this one. Shouldn't we instead have a more
> generic mechanism such as --exclude=<foo>,<bar>, which would allow to
> exclude packages? And maybe one of the possible values would be a
> magical value to exclude virtual packages?
>
> There are some cases where ignoring host-pkgconf, or
> host-automake/host-autoconf/host-libtool may be interesting, for
> example.
>

I agree with you.
The graphs become quickly too large.
The current option --depth seems to be only a workaround against an
infinite recursion when the graph has a cycle.
But at this time, we haven't found the good way (or the good use
cases) to limit the size of the graph.

Fran?ois

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
