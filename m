From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Oct 2014 14:45:07 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-04
In-Reply-To: <20141005063015.846CF101508@stock.ovh.net>
References: <20141005063015.846CF101508@stock.ovh.net>
Message-ID: <CANQCQpYkPJATN4b8hYwCWtLpz3XhO5ZtESWb9crSChA2jYgrjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Oct 5, 2014 at 1:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-10-04
> ===============================
>
>         success : 193
>        failures : 97
>        timeouts : 0
>           TOTAL : 290
>
> Classification of failures by reason
> ====================================
>
>     host-protobuf-c-v1.0.0-rc1 | 21
>                    atftp-0.7.1 | 19
>                    perl-5.20.1 | 8
>                    dejavu-2.34 | 7
>                   fan-ctrl-1.3 | 6
>          python-protobuf-2.6.0 | 5
>                  opencv-2.4.10 | 4
>                valgrind-3.10.0 | 2
>                  webkit-1.11.5 | 2
>                      tcl-8.6.2 | 2
>                 protobuf-2.6.0 | 2
<snip>
>      powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/3c1c620684a23b4cbb1cfa560096094cd9bf09ec/
>      powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/f1b70ebabd587987547424a21eefc530317026cd/

These powerpc builds use a gcc 4.5 compiler which doesn't provide the
generic atomicops implementation which is only exposed if GCC >= 4.7.
I looked at the BR2_ARCH_HAS_ATOMICS option as a possible dependency
to fix this but it seems like that option is always set if the ARCH
supports it.  Not necessarily based on if a toolchain provides a
generic.


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
