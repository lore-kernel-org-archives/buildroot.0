From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 25 Feb 2016 17:13:58 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
 output file
In-Reply-To: <20160225170758.1f444549@free-electrons.com>
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
 <20160225170758.1f444549@free-electrons.com>
Message-ID: <CAAXf6LXz_WcAAsk+kts3cZ4=v1Pw1rB=nLf9yKr9FotCZRR8sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 25, 2016 at 5:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thomas,
>
> On Thu, 25 Feb 2016 14:19:56 +0100, Thomas De Schampheleire wrote:
>
>> When a package does not (by error) define FOO_SITE, and the source
>> archive is not already present, the wget download helper will be
>> invoked with as URL /foo-xxx.tar.gz. wget reports 'Scheme missing' and
>> bails out, but _returns with a successful error code (0)_.
>
> Shouldn't we simply be checking in the package infrastructure that
> FOO_SITE is not empty?
>

When a PRIMARY_MIRROR is set and there is a 'guarantee' or expectation
that each file is present on that mirror, FOO_SITE is not really used
and could be empty for proprietary packages, since there is no actual
proper value. Sure one could fill in a bogus value, but it's not very
nice.

Also, for packages where the source is included with buildroot, like
makedevs, FOO_SITE is empty too.

/Thomas
