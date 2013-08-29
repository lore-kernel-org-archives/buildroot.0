From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 10:26:59 +0200
Subject: [Buildroot] MesaLib
In-Reply-To: <A3285828-B3A0-4875-98F8-96A2BF7DD889@deadfrog.net>
References: <A3285828-B3A0-4875-98F8-96A2BF7DD889@deadfrog.net>
Message-ID: <20130829102659.6240bcb9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Wilkins,

On Wed, 28 Aug 2013 19:22:47 -0400, Ryan Wilkins wrote:

> I'm using buildroot 2013.08-rc2 and ran across an error on compile where MesaLib-7.10.3 can't be found.  Looking at the sources.buildroot.net server, 7.10.1 exists but not 7.10.3.  Output is below.
> 
> --2013-08-28 17:15:25--  http://sources.buildroot.net//MesaLib-7.10.3.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109  
> Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2013-08-28 17:15:25 ERROR 404: Not Found.
> 
> Should 7.10.3 be in the repository or is the buildroot source wrong?

The sources.buildroot.net mirror is updated only when a Buildroot
release is made. The last stable release is currently 2013.05, which
was using MesaLib 7.10.1, which explains why it is available from our
mirror.

The bump to 7.10.3 was done by commit
53cea4462c67a6707bf8dad83fa928262e44fce9 in June 2013, i.e after the
2013.05 release. Since the 2013.08 release hasn't been made yet, I
believe Peter has not updated the Buildroot mirror, and therefore it
doesn't contain for the moment all the new versions of the tarballs
that have been upgraded since 2013.05.

But normally, Buildroot uses the upstream location first. It doesn't
work MesaLib ? The Buildroot mirror is normally here for "old" versions
of Buildroot, where the upstream location might have changed or
disappeared.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
