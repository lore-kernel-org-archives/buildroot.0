From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Aug 2019 11:30:07 +0200
Subject: [Buildroot] [PATCH v3] board: Add PowerPC mac99
In-Reply-To: <CACPK8XfC=f5t+=KwmzTHDR-KedP0nLkgf8YHcRv+NpVVZ5ikDw@mail.gmail.com>
 (Joel Stanley's message of "Fri, 2 Aug 2019 06:42:52 +0000")
References: <20190625012652.21853-1-joel@jms.id.au>
 <87wofwx4ni.fsf@dell.be.48ers.dk>
 <CACPK8XfC=f5t+=KwmzTHDR-KedP0nLkgf8YHcRv+NpVVZ5ikDw@mail.gmail.com>
Message-ID: <87r263syn4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

Hi,

 >> You forgot to specify the version of the Linux kernel /
 >> kernel-headers. Committed with those set to 5.2.4, thanks.

 > I didn't forget, I omitted them so the config would use the latest default.

 > Is there a reason we specify a fixed version?

Yes, reproducibility. If the defconfig is tested and working today, then
it should preferably still work in (say) 6 months from now.


 >> With that said, we now have 4 32bit ppc qemu defconfigs which sounds
 >> like a lot to me. Are they all still interesting / useful?

 > I am not familiar with them. Michael?

 > They all target different CPUs which means there is no overlap at least:

 > $ grep -r BR2_powerpc_ configs/qemu_ppc_*
 > configs/qemu_ppc_g3beige_defconfig:BR2_powerpc_750=y
 > configs/qemu_ppc_mac99_defconfig:BR2_powerpc_7400=y
 > configs/qemu_ppc_mpc8544ds_defconfig:BR2_powerpc_8548=y
 > configs/qemu_ppc_virtex_ml507_defconfig:BR2_powerpc_440=y

Correct. Ok, lets leave them for now then.

-- 
Bye, Peter Korsgaard
