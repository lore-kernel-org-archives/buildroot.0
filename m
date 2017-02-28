From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 10:02:02 +0100
Subject: [Buildroot] [PATCH] classpath: only allow on supported
	architectures
In-Reply-To: <1488233771-5322-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 Feb 2017 23:16:11 +0100")
References: <1488233771-5322-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mvd6k7sl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit a75ab1fc1dcc7eee8668b1c3c19b703f1390b2cd ("package/classpath:
 > Don't depend on jamvm"), we removed the dependency of classpath on
 > jamvm. Since jamvm is only available for a reduced set of architectures,
 > classpath could until this commit until be built on those architectures.

 > However, now that this dependency has been removed, classpath can
 > potentially be built for all architectures supported by Buildroot, even
 > though it doesn't support all of them.

 > Since adding support for additional architectures in classpath doesn't
 > make much sense, because classpath is in Buildroot only usable with
 > JamVM anyway, and JamVM is only available for a small set of
 > architectures, this commit simply makes classpath available on the
 > architectures that it supports.

 > By doing so, it also removes the or1k support patch which was added by
 > commit f12a146f817c8ef07a7d41a31a5336b5ef6a96e8, since anyway or1k is
 > not supported by JamVM.

 > Fixes:

 >   http://autobuild.buildroot.net/results/55eb89f89e96b94a821778bc18ed844af08b7460/
 >   (classpath on microblaze)

 >   http://autobuild.buildroot.net/results/279dd731bd9ecf5f9d54bda3715caeaa7cbcdbb3/
 >   (classpath on nios2)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
