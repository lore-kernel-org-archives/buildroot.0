From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 12:14:42 +0100
Subject: [Buildroot] [PATCH 1/1] nginx-dav-ext: New package
In-Reply-To: <CAJtjsKY2yT_EekNg2F_-K-PyLN5Zp47ykhRwVK4Kg3PixY4K9A@mail.gmail.com>
References: <1480438071-11906-1-git-send-email-johan.oudinet@gmail.com>
 <20161204235230.4be68e7c@free-electrons.com>
 <CAJtjsKY2yT_EekNg2F_-K-PyLN5Zp47ykhRwVK4Kg3PixY4K9A@mail.gmail.com>
Message-ID: <20161205121442.51bb6c46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Dec 2016 11:58:33 +0100, Johan Oudinet wrote:

> > I've applied to master, but after doing a number of changes. See below.  
> 
> Thanks Thomas.
> 
> > I've also added a separate patch to add you in the DEVELOPERS file for
> > nginx-dav-ext (even though you will never receive a build failure about
> > it, since the build really takes place inside the nginx package).
> 
> Oops, so many changes since I've sent a patch to BR. I should have
> read the documentation more carefully. Thanks.

Seems like my changes broke the build:

   http://autobuild.buildroot.net/?reason=nginx-1.10.2

So, it might be that the location in which modules are added in
nginx.mk might be important. Weird, because I did a number of test
builds before pushing and never got a failure.

Do you have the time to investigate? One of the failure,
http://autobuild.buildroot.net/results/3c8/3c8798f122a421e8fae741de76b2504c20e2da91/build-end.log,
is related to dav-ext.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
