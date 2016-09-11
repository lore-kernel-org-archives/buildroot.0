From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Sep 2016 15:19:57 +0000
Subject: [Buildroot] [Bug 9226] New: Firefly boot fails with: "failed to
	find part:boot"
Message-ID: <bug-9226-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9226

            Bug ID: 9226
           Summary: Firefly boot fails with: "failed to find part:boot"
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Tested on 2016.05 and master @ a26aa9686ad457d208df3b85a39c9befa04caaa3

Followed instructions under board/firefly/firefly-rk3288/readme.txt

Then from a TTL I see:

        arm pll = 600000000HZ
        periph pll = 300000000HZ
        ddr pll = 200000000HZ
        codec pll = 594000000HZ
    Board:  Rockchip platform Board
    DRAM:  Found dram banks:1
    Adding bank:0000000000000000(0000000080000000)
    128 MiB
    SDCard Update.
    storage init OK!
    Using default environment

    GetParam
    W: Invalid Parameter's tag (0x7BD32A6C)!
    Invalid parameter
    W: Invalid Parameter's tag (0xF07F8F7D)!
    Invalid parameter
    W: Invalid Parameter's tag (0xAE8ED94E)!
    Invalid parameter
    W: Invalid Parameter's tag (0x5EFFD968)!
    Invalid parameter
    W: Invalid Parameter's tag (0xEDDF0B28)!
    Invalid parameter
    W: Invalid Parameter's tag (0xE89DA830)!
    Invalid parameter
    W: Invalid Parameter's tag (0x00000802)!
    Invalid parameter
    W: Invalid Parameter's tag (0x00000000)!
    Invalid parameter
    failed to find part:boot
    failed to prepare fdt from boot!
    failed to find part:resource
    failed to prepare fdt from resource!
    no adc node
    can't find dts node for led
    can't find dts node for ricoh619
    can't find dts node for act8846
    can't find dts node for rk808
    can't find dts node for rk818
    Can't find dts node for fuel guage cw201x
    SecureBootEn = 0, SecureBootLock = 0

    #Boot ver: 0000-00-00#0.00
    empty serial no.
    unknown reboot type 1
    no fuel gauge found
    no fuel gauge found
    read logo_on switch from dts [0]
    no fuel gauge found
    failed to find part:recovery
    'recovery' does not seem to be a partition nor an address
    Unable to boot:recovery
    try to start backup
    failed to find part:backup
    'backup' does not seem to be a partition nor an address
    Unable to boot:backup
    try to start rockusb

but get no shell.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
