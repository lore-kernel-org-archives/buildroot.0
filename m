From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 7 Aug 2018 12:02:47 -0500
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <2400f8a7f1f587d2ff8d351408c0558033150f7f.camel@spectralink.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <cc562d31-b770-c7e1-0a6d-e3f004c917db@mind.be>
 <CANQCQpaJd3-tj47Xp4XyFGvu9w5GcKZZyr+Pi98A0i1XRxa1Ww@mail.gmail.com>
 <2d96f4d291e7fc0eb2e17f497a840364ec6ec488.camel@spectralink.com>
 <CANQCQpYd6XjQyVeKZ_O+L1TPL0dcE6TaAmbc51+d8+=0Z9PeFQ@mail.gmail.com>
 <2400f8a7f1f587d2ff8d351408c0558033150f7f.camel@spectralink.com>
Message-ID: <CANQCQpZxkti_GQ9hqx7tzA657zokznfp1jRa-8200cSV5G=RMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 19, 2018 at 8:10 AM S?rensen, Stefan
<Stefan.Sorensen@spectralink.com> wrote:
>
> On Thu, 2018-07-19 at 07:58 -0500, Matthew Weber wrote:
> > > It works fine with a single spec file - I used two different files
> > > since I was keeping CFLAGS and LDFLAGS separate.
> > >
> >
> > Something in the syntax then would have to change, right?  I combined
> > the files and was getting CC errors.
>
> That was what I did - I have not run into any problems. Any particular
> packages that fails?

attr pkg during the configuring stage
https://paste.ubuntu.com/p/wdn3Pjsd39/

I can work up a simple defconfig but I didn't get to far before I ran into this.

The combined specs file looked like.
*cc1_options:
+ %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
*self_spec:
+ %{!static:%{!shared:%{!r:-pie}}}

Matt
