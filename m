From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Jun 2020 10:47:08 +0200
Subject: [Buildroot] [PATCH 2/2] fs: clean the volatile /run and /tmp
 directories
In-Reply-To: <CADYdroO8PNfE=Cmd96rE-Kfd_nTq_7+h-JLdH-uUPGP3GmsBqg@mail.gmail.com>
References: <20200605224858.12870-1-nolange79@gmail.com>
 <20200605224858.12870-2-nolange79@gmail.com>
 <20200606224227.60a26aeb@windsurf>
 <CADYdroO8PNfE=Cmd96rE-Kfd_nTq_7+h-JLdH-uUPGP3GmsBqg@mail.gmail.com>
Message-ID: <20200607104708.1eed13a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 7 Jun 2020 00:57:23 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > However, I'm not sure if removing all what they contain is the right
> > approach. Shouldn't we avoid creating things in /tmp and /run in the
> > first place ?  
> 
> Yeah we should avoid creating stuff there, but it's sometimes hard to do.
> One example is defining a user with home dir in /run, mkusers will
> then create a dir there
> (pretty late to clear it up otherwise)

But our skeleton has a fstab that always mounts a tmpfs filesystem on
/run, so how can it make sense for mkusers to create a home directory
in /run ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
