From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 15:36:32 +0200
Subject: [Buildroot] [V2] moarvm: new package
In-Reply-To: <CAB0FRssQa117taJbxzpF9rbszqzN=tqPgd91dyj=V1LO96MxRA@mail.gmail.com>
References: <1433448072-13632-1-git-send-email-francois.perrad@gadz.org>
 <20150605075007.410bd306@free-electrons.com>
 <CAB0FRssQa117taJbxzpF9rbszqzN=tqPgd91dyj=V1LO96MxRA@mail.gmail.com>
Message-ID: <20150605153632.390b9055@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Fri, 5 Jun 2015 09:21:16 +0200, Fran?ois Perrad wrote:

> >> diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
> >> new file mode 100644
> >> index 0000000..4427e55
> >> --- /dev/null
> >> +++ b/package/moarvm/Config.in
> >> @@ -0,0 +1,14 @@
> >> +config BR2_PACKAGE_MOARVM
> >> +     bool "moarvm"
> >> +     depends on BR2_TOOLCHAIN_HAS_THREADS
> >> +     depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
> >
> > You don't use libatomic, so: why?
> >
> 
> The MoarVM tarball embeds its own copy of libatomic.

Ah, ok. Since this is not trivial/obvious, please add a comment above
this 'depends on'.

> > Is using the system provided Perl OK or should we use host-perl instead?
> >
> 
> Work with the system perl.

Ok, we'll see if this is effectively true when we'll start building in
the autobuilders with various different/old versions of Perl. But no
need to worry about this now, the autobuilders will tell us what they
think :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
