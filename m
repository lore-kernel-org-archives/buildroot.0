From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2011 10:30:35 +0200
Subject: [Buildroot] How to enable Oprofile while using external tool
 chain?
In-Reply-To: <BANLkTikQOCg+ZQy1qc34GWBEo-u7QC41Fg@mail.gmail.com>
References: <BANLkTikQOCg+ZQy1qc34GWBEo-u7QC41Fg@mail.gmail.com>
Message-ID: <20110525103035.6edf85b9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 May 2011 15:31:39 +0800
Bob Liu <lliubbo@gmail.com> wrote:

> It seems Oprofile package depends on no using external tool chain.
> 
> Is there any special reason of this, because I am trying to enable
> Oprofile in buildroot while using external tool chain.

Yes, it's due to the fact that oprofile depends on binutils being
available for the target, and our binutils build process didn't work
when external toolchain were used. The binutils package has been
reworked since then, so maybe it could work, but I haven't tried.

You can try, and see if any problem shows up.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
