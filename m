From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:48:31 +0200
Subject: [Buildroot] Unable to apply a patch for the buildroot makedevs
 tool
In-Reply-To: <20210417071317.GO359705@scaer> (Yann E. MORIN's message of "Sat, 
 17 Apr 2021 09:13:17 +0200")
References: <AM6PR05MB5928D4AD5D2311ACA772CCA5A34C9@AM6PR05MB5928.eurprd05.prod.outlook.com>
 <20210417071317.GO359705@scaer>
Message-ID: <87czugemz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Ivan, All,
 > On 2021-04-16 06:58 +0000, Ivan Castell spake thusly:
 >> Hello! I did a patch for the makedevs tool that provides a new 'x' option
 >> that allows setting permissions for directories recursively without
 >> modifiying permissions for regular files.

 > As Peter said, makedev is directly compiled from its single source file
 > in Buildroot's tree, so no way to patch it with the standard package
 > infrastructure.

With that said, there is no specific reason why this is done like that -
And E.G. mcookie does copy its .c file to the build directory so the
patch step works - So it IMHO makes sense to fix makedevs to also do it
so the normal infrastructure works as expected.

I've sent a series to do that:

https://patchwork.ozlabs.org/project/buildroot/list/?series=240851

-- 
Bye, Peter Korsgaard
