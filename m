From: Ran Shalit <ranshalit@gmail.com>
Date: Tue, 20 Mar 2018 17:45:03 +0200
Subject: [Buildroot] igb initialization time after powerup
Message-ID: <CAJ2oMhKES2KSYk2U36-70F3e4AX47V6=B4TzDdMLocXT4qUqpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is not specific buildroot issue, yet I hope someone here will have an idea.
I have long ethernet boot time till receiving ping after powerup.
I use igb driver.

I tried plenty of things, but nothing worked.
I have printed the function which are called in igb driver.

This is the relevant log in dmesg:

[    2.538089] igb: Intel(R) Gigabit Ethernet Network Driver network 5
- version 5.4.0-k
[    2.549736] network igb_reset
[    2.561629] network igb_phy_sw_reset
[    2.561902] network igb_setup_copper_link
[    2.561902] network igb_setup_copper_link... in autoneg
[    2.561903] network igb_copper_link_autoneg
[    2.561904] network igb_phy_setup_autoneg
[    2.562311] network igb_phy_has_link
[    2.563896] network igb_power_down_link
[    2.563900] network igb_power_down_phy_copper
[    2.566079] network igb_phy_has_link
[    3.696797] network igb_set_spd_dplx
[    3.699341] network ping    <<---   trying to ping host from init.d script
[    3.710493] network gpio 5
[    3.975110] network igb_open
[    3.975113] network __igb_open
[    3.975197] network igb_phy_hw_reset
[    3.977192] network igb_power_up_link
[    3.977198] network igb_power_up_phy_copper
[    3.977487] network igb_phy_sw_reset
[    3.977760] network igb_setup_copper_link
[    3.977901] network igb_phy_sw_reset
[    3.978038] network igb_phy_has_link
[    4.020261] network igb_phy_has_link
[    5.216208] network igb_phy_has_link
[    7.881180] network igb_phy_has_link

Is there any idea how to minimize igb boot time ?

Regards,
ranran
