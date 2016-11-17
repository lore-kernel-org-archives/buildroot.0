From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 09:55:45 +0100
Subject: [Buildroot] [RFC PATCH 1/1] pkg-autotools: generic configure
 fix	for powerpc64
In-Reply-To: <n500gdx8kc.ln2@ID-313208.user.individual.net>
References: <56063c394c473bf4292658511bae0dd99583be07.1479356115.git.sam.bobroff@au1.ibm.com>
 <n500gdx8kc.ln2@ID-313208.user.individual.net>
Message-ID: <20161117095545.744c19df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 07:43:35 +0100, Bernd Kuhls wrote:

> good work! The minidlna package is fixed by your patch, but the 

How can minidlna be fixed by Sam's patch? I don't see the offending
hunk in minidlna's configure script. Am I missing something:

$ grep powerpc minidlna-1.1.5/configure
$ 

> because configure is re-created during the build phase. The quote from 
> configure comes from the second run of it.

It's not good to have configure re-created during the build phase. We
shouldn't find out why, and fix it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
