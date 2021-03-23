From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 18:27:26 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/batman-adv: fix compile with
 BR2_PACKAGE_BATMAN_ADV_BATMAN_V disabled
In-Reply-To: <20210316181429.30804-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 16 Mar 2021 19:14:27 +0100")
References: <20210316181429.30804-1-ps.report@gmx.net>
Message-ID: <87zgytok5d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Taking a deeper look at the configure script gen-compat-autoconf.sh reveals that
 > the batman feature options must be explicitly set to 'y' or 'n' to work as
 > expected.

 > Fixes:

 >   ERROR: modpost: "batadv_v_mesh_free" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
 >   ERROR: modpost: "batadv_v_mesh_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
 >   ERROR: modpost: "batadv_v_hardif_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!
 >   ERROR: modpost: "batadv_v_init" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

 > Reported-by: Christian Stewart <christian@paral.in>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Notes:
 >   - the previous patch was tested against an RPi4 linux kernel already
 >     enabling the build-in batman-adv module inlcusive batman-v, the defconfig
 >     given by Christian (enhanced by BR2_LINUX_KERNEL/BR2_LINUX_KERNEL_LATEST_VERSION/
 >     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFI) uses one with build-in batman-adv
 >     disabled

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
