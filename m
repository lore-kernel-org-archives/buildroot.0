From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Oct 2014 09:48:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-04
In-Reply-To: <CANQCQpYkPJATN4b8hYwCWtLpz3XhO5ZtESWb9crSChA2jYgrjQ@mail.gmail.com>
References: <20141005063015.846CF101508@stock.ovh.net>
 <CANQCQpYkPJATN4b8hYwCWtLpz3XhO5ZtESWb9crSChA2jYgrjQ@mail.gmail.com>
Message-ID: <20141007094832.01c0f443@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Mon, 6 Oct 2014 14:45:07 -0500, Matthew Weber wrote:

> >      powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/3c1c620684a23b4cbb1cfa560096094cd9bf09ec/
> >      powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/f1b70ebabd587987547424a21eefc530317026cd/
> 
> These powerpc builds use a gcc 4.5 compiler which doesn't provide the
> generic atomicops implementation which is only exposed if GCC >= 4.7.
> I looked at the BR2_ARCH_HAS_ATOMICS option as a possible dependency
> to fix this but it seems like that option is always set if the ARCH
> supports it.  Not necessarily based on if a toolchain provides a
> generic.

Gaah, yes. We knew that we introducing the BR2_ARCH_HAS_ATOMICS thing,
but making it a per-compiler version thing was really too annoying.

Is there a way to build protobuf without those atomic operations, or
not at all?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
