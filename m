From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:40:28 +0200
Subject: [Buildroot] [PATCH] strongswan: needs atomics
In-Reply-To: <55258D3D.9070800@zacarias.com.ar>
References: <1428507128-8490-1-git-send-email-gustavo@zacarias.com.ar>
 <20150408212227.615c05a2@free-electrons.com>
 <55258D3D.9070800@zacarias.com.ar>
Message-ID: <20150408224028.1c419e88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 08 Apr 2015 17:19:09 -0300, Gustavo Zacarias wrote:
> On 04/08/2015 04:22 PM, Thomas Petazzoni wrote:
> 
> > Hum, I don't quite see how this change can fix the build issue. The
> > build issue is on Microblaze, and Microblaze has BR2_ARCH_HAS_ATOMICS=y.
> > 
> > So while I agree that Strongswan is indeed using atomic intrinsics, it
> > isn't going to fix the issue.
> 
> The real problem is that we declared that microblaze has atomics when it
> doesn't. All of the __atomic_compare_and_exchange_? functions for
> microblaze live in libatomic, which is a clear indication that it has no
> native atomics support whatsoever.

Does BR2_ARCH_HAS_ATOMICS says if the HW itself has atomics or if
generally atomic operations are available in the compiler? I would say
the latter, since this is actually what we care about.

But atomic handling is clearly an area that requires some
clarification, as there are still some autobuilder failures that we are
not able to solve due to bad handling of atomic related dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
