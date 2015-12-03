From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Dec 2015 11:44:24 +0100
Subject: [Buildroot] [PATCH 1/4] dhrystone: add a hash file
In-Reply-To: <56601AD5.1090608@imgtec.com>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <87poyofulj.fsf@dell.be.48ers.dk> <56601AD5.1090608@imgtec.com>
Message-ID: <20151203114424.6f129af3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Thu, 3 Dec 2015 10:35:01 +0000, Vicente Olivert Riera wrote:

> >  > diff --git a/package/dhrystone/dhrystone.hash b/package/dhrystone/dhrystone.hash
> >  > new file mode 100644
> >  > index 0000000..9ea22a3
> >  > --- /dev/null
> >  > +++ b/package/dhrystone/dhrystone.hash
> >  > @@ -0,0 +1,2 @@
> >  > +# Locally calculated
> >  > +sha256 038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e  dhry-c
> > 
> > Hmm, what are we going to do if this file ever changes?
> 
> isn't the purpose of the hash files to ensure that we download exactly
> what we want to download, so we can make the builds reproducible?
> 
> If that file changes, we will notice it thanks to its hash file. You
> could ask the same for tarballs. What are we going to do if this
> tarballs ever changes?

It also took me a bit to understand Peter's comment. I believe what
Peter means is that this file has no version in its name. So if
upstream changes the file, the hash will change, and we will notice.
But it will break every previous Buildroot version that has been
released, since the old file can no longer be fetched from anywhere.

But unless I'm missing something, I believe that this is exactly what
we want: if upstream changes the file, it *does* affect old Buildroot
versions, and we want users of such old Buildroot versions to be loudly
notified that the dhry-c file they are building from is no longer the
same than the one that existed at the time the Buildroot they are using
was released.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
