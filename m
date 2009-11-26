From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 15:31:17 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <op.u3z7srteyqa4qb@jap-lappis> (Joachim Pihl's message of "Thu\,
	26 Nov 2009 15\:15\:11 +0100")
References: <op.u3z7srteyqa4qb@jap-lappis>
Message-ID: <873a419x3e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

 Joachim> Just trying out building RC1 straight from the "box", basically all
 Joachim> defaults and adding a few packages. Set to use headers matching a
 Joachim> previously configured kernel. Running on Ubuntu 9.10

Huh, that's wrong - The config you attached has:

BR2_KERNEL_HEADERS_2_6_31=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.31.6"

And still you are trying to use headers from 2.6.27.10.

The getline problem is a known issue with old kernels and new
distributions (fixed in 2.6.29+ and later versions of 2.6.27.x).

Are you sure you're using that exact config and just running make?

 Joachim> make[1]: Entering directory
 Joachim> /home/jpihl/system_controller/buildroot-2009.11_rc1/output/toolchain/linux-2.6.27.10'

-- 
Bye, Peter Korsgaard
