From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 17:34:14 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
	output file
In-Reply-To: <CAAXf6LXz_WcAAsk+kts3cZ4=v1Pw1rB=nLf9yKr9FotCZRR8sg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 25 Feb 2016 17:13:58
 +0100")
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
 <20160225170758.1f444549@free-electrons.com>
 <CAAXf6LXz_WcAAsk+kts3cZ4=v1Pw1rB=nLf9yKr9FotCZRR8sg@mail.gmail.com>
Message-ID: <874mcwwxyx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> Shouldn't we simply be checking in the package infrastructure that
 >> FOO_SITE is not empty?

> When a PRIMARY_MIRROR is set and there is a 'guarantee' or expectation
 > that each file is present on that mirror, FOO_SITE is not really used
 > and could be empty for proprietary packages, since there is no actual
 > proper value. Sure one could fill in a bogus value, but it's not very
 > nice.

You could set _SITE to your PRIMARY_MIRROR, which is really where those
tarballs (should be) are located.

 > Also, for packages where the source is included with buildroot, like
 > makedevs, FOO_SITE is empty too.

.. but those also don't define _SOURCE / _VERSION, so wget isn't called
;)

-- 
Bye, Peter Korsgaard
