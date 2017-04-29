From: Mario Rugiero <mrugiero@gmail.com>
Date: Sat, 29 Apr 2017 17:02:26 -0300
Subject: [Buildroot] [PATCH] package/protobuf: depend on gcc >= 4.5
In-Reply-To: <CAKKQwLR3sxMycDpH0_qvva7_-9s5DCZzs5kj-xJe4_7YJOZ59Q@mail.gmail.com>
References: <20170426162850.5214-1-mrugiero@gmail.com>
 <20170429143136.3da63d52@free-electrons.com>
 <CAKKQwLR3sxMycDpH0_qvva7_-9s5DCZzs5kj-xJe4_7YJOZ59Q@mail.gmail.com>
Message-ID: <CAKKQwLRyHdGAqK8QtPuOexXp+nokJ+7wgAbwvRE6b9fkg25jKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just realized there was more before The question I answered. The bug got
fixed in versi?n 4.5.0 of gcc, thus it is unsupported to build with earlier
versions. The message seen is an instance of this bug.

El abr. 29, 2017 11:54, "Mario Rugiero" <mrugiero@gmail.com> escribi?:

> 2017-04-29 9:31 GMT-03:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > Hello,
> >
> > On Wed, 26 Apr 2017 13:28:50 -0300, mrugiero at gmail.com wrote:
> >> From: "Mario J. Rugiero" <mrugiero@gmail.com>
> >>
> >> Protobuf hits a bug in gcc < 4.5 which breaks the build.
> >> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=189
> >
> > This bug is marked as FIXED, and it has been fixed since many years.
> >
> > What is the actual problem you are seeing? Is there a reference to an
> > autobuilder issue?
> >
> > I've tried to build with gcc 4.3, and indeed I'm getting:
> >
> > ./google/protobuf/metadata.h: In constructor
> 'google::protobuf::internal::InternalMetadataWithArena::
> InternalMetadataWithArena(google::protobuf::Arena*)':
> > ./google/protobuf/metadata.h:175: error: class
> 'google::protobuf::internal::InternalMetadataWithArena' does not have any
> field named 'InternalMetadataWithArenaBase'
> > ./google/protobuf/metadata.h: In constructor
> 'google::protobuf::internal::InternalMetadataWithArenaLite::
> InternalMetadataWithArenaLite(google::protobuf::Arena*)':
> > ./google/protobuf/metadata.h:204: error: class
> 'google::protobuf::internal::InternalMetadataWithArenaLite' does not have
> any field named 'InternalMetadataWithArenaBase'
> >
> > Is this the issue we're talking about ?
> Exactly.
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170429/e3124482/attachment.html>
