From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 11 Jun 2020 00:55:13 +0200
Subject: [Buildroot] [PATCH 2/2] fs: clean the volatile /run and /tmp
 directories
In-Reply-To: <CADYdroO5MrSswWd_17ETVEbuFCOHMu-r-KKcFpBvLoXXSeH7DA@mail.gmail.com>
References: <20200605224858.12870-1-nolange79@gmail.com>
 <20200605224858.12870-2-nolange79@gmail.com>
 <20200606224227.60a26aeb@windsurf>
 <CADYdroO8PNfE=Cmd96rE-Kfd_nTq_7+h-JLdH-uUPGP3GmsBqg@mail.gmail.com>
 <20200607104708.1eed13a9@windsurf>
 <CADYdroO5MrSswWd_17ETVEbuFCOHMu-r-KKcFpBvLoXXSeH7DA@mail.gmail.com>
Message-ID: <CADYdroO46-MaeFC-aAEf62SekFkf7gNzF1k=wFBkSok=Qzn0rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 7. Juni 2020 um 20:41 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>
> Am So., 7. Juni 2020 um 10:47 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> >
> > On Sun, 7 Jun 2020 00:57:23 +0200
> > Norbert Lange <nolange79@gmail.com> wrote:
> >
> > > > However, I'm not sure if removing all what they contain is the right
> > > > approach. Shouldn't we avoid creating things in /tmp and /run in the
> > > > first place ?
> > >
> > > Yeah we should avoid creating stuff there, but it's sometimes hard to do.
> > > One example is defining a user with home dir in /run, mkusers will
> > > then create a dir there
> > > (pretty late to clear it up otherwise)
> >
> > But our skeleton has a fstab that always mounts a tmpfs filesystem on
> > /run, so how can it make sense for mkusers to create a home directory
> > in /run ?
>
> Think of system users, where the "home" is usually non-persistent or
> just some sort of jail.
> For ex. my openssh patch sets the sshd user's home to /run/sshd - A
> directory that's automatically
> created when the service starts and deleted when it stops.
>

Some other example is dbus, creates a user with homedir=/var/run/dbus. So
not only my hackjobs are affected ;)

Should I somehow ping you if some patches are ready BTW (not sure if
you read through all discussions)?
On that note, can you upgrade fakeroot to 1.24 now?
https://patchwork.ozlabs.org/project/buildroot/list/?series=176013

Norbert
