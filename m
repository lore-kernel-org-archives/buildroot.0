From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 7 Oct 2014 11:30:00 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-04
In-Reply-To: <20141007094832.01c0f443@free-electrons.com>
References: <20141005063015.846CF101508@stock.ovh.net>
 <CANQCQpYkPJATN4b8hYwCWtLpz3XhO5ZtESWb9crSChA2jYgrjQ@mail.gmail.com>
 <20141007094832.01c0f443@free-electrons.com>
Message-ID: <CANQCQpZQ0PKOrMR_D-43oiUTQg3vvCub=i8aU=Wndx+FKdQvOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Oct 7, 2014 at 2:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matthew Weber,
>
> On Mon, 6 Oct 2014 14:45:07 -0500, Matthew Weber wrote:
>
>> >      powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/3c1c620684a23b4cbb1cfa560096094cd9bf09ec/
>> >      powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/f1b70ebabd587987547424a21eefc530317026cd/
>>
>> These powerpc builds use a gcc 4.5 compiler which doesn't provide the
>> generic atomicops implementation which is only exposed if GCC >= 4.7.
>> I looked at the BR2_ARCH_HAS_ATOMICS option as a possible dependency
>> to fix this but it seems like that option is always set if the ARCH
>> supports it.  Not necessarily based on if a toolchain provides a
>> generic.
>
> Gaah, yes. We knew that we introducing the BR2_ARCH_HAS_ATOMICS thing,
> but making it a per-compiler version thing was really too annoying.
>
> Is there a way to build protobuf without those atomic operations, or
> not at all?

Yeah, I believe the GCC version check is arbitrary.  I was going to
take a look at the generic atomics implementations and see if they
were stub functions.  If so, we could patch in a workaround to allow
GCC  >= 4.3 to build (with that being an arbitrarily old compiler
version.....)  or just open it up to any version and test if we get
compiler failures.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
