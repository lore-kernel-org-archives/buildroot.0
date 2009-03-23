From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 23 Mar 2009 12:01:35 -0300
Subject: [Buildroot] Package license constraints
In-Reply-To: <49C7858F.2080904@maxim-ic.com>
References: <49C3C0EF.8010003@maxim-ic.com>
	<200903211906.04999.markus.heidelberg@web.de>
	<d6cda7730903211717x33f412e7g3706c57232850ae3@mail.gmail.com>
	<49C7858F.2080904@maxim-ic.com>
Message-ID: <d6cda7730903230801m47d9b4f2oca19ed0a72ae4d74@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gr?gory,

2009/3/23 Gr?gory Rom? <gregory.rome@maxim-ic.com>:
> On 03/22/2009 01:17 AM, Thiago A. Corr?a wrote:
>
> My goal in this case is not to share a package, but to add a 'pure' binary
> package to the Buildroot I provide to my customer (to avoid two entry
> points, one for the open source components and one for the others).
>
> Obviously, I'm very careful to respect the open source license!
>
[cut]
> A cryptographic library that we sale to our customers but we don't want to
> provide the source code (to protect the implementation).

Doesn't it depend on libs from the buildroot environment? Say, if we
decide to update uClibc or update one of the other toolchain packages,
wouldn't that break the binary package?

If you say yes to those last 2 questions then it sounds like the best
approach for you and your customers might be a fork, so if we change
things, it doesn't suddenly stop working for them. Then you would have
more control over things and you could merge our changes into your
tree as you review them, and hopefully, send back changes in your tree
that are generic enough to be usefull to others for inclusion into
upstream.

I guess the only reason to roll your own crypto library is to use a
crypto support inside one of your chips. Since it runs linux(as you
use buildroot), it would really be best if it were added to existing
crypto libraries, so existing apps could take advantage of that. This
would still actually only benefiting your customers directly and not
those of some other chip maker as the internal registers are likely
different anyway.
Of course, that is just my 2 cents, I don't really know what business
model you are trying to achieve.

Anyway, it doesn't look much practical to have a binary package added
to buildroot, mostly because of the dependencies.

Kind Regards,
   Thiago A. Correa
