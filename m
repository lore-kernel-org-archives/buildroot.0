From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 3 Jan 2015 14:49:25 +0100
Subject: [Buildroot] [PATCH 2/2] graph-depends: add an option
	--stop-on-virtual
In-Reply-To: <20150102112116.7c2085eb@free-electrons.com>
References: <1420188573-4236-1-git-send-email-francois.perrad@gadz.org>
 <1420188573-4236-2-git-send-email-francois.perrad@gadz.org>
 <20150102112116.7c2085eb@free-electrons.com>
Message-ID: <CAB0FRsucJ3kZ64JvD-r7zVW_PR8F=LSUGW7Vx60Vs63rCK-v3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-02 11:21 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri,  2 Jan 2015 09:49:33 +0100, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  docs/manual/common-usage.txt  |  3 +++
>>  support/scripts/graph-depends | 11 +++++++++++
>>  2 files changed, 14 insertions(+)
>
> Why would we want to stop on virtual packages? I don't really see the
> use case for this additional option.
>

On package point of view (not for a whole configuration),
for example, with a package which depends on OpenGL, it is not useful
to see the dependencies of a specific implementation of OpenGL,
because they depend on hardware and not on the package.

The graph of dependencies becomes quickly too large,
I think to another option which doesn't display host dependencies
but just target dependencies.

Fran?ois

> Thanks,
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
