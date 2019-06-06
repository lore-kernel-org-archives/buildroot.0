From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Jun 2019 13:40:59 +0000
Subject: [Buildroot] [Bug 11946] New: wilink-bt-firmware: moved from github
 to http://git.ti.com/ti-bt
Message-ID: <bug-11946-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11946

            Bug ID: 11946
           Summary: wilink-bt-firmware: moved from github to
                    http://git.ti.com/ti-bt
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mzweerspenko+bugzilla at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

On my compulab sbc iot i.mx7 gateway the ble doens't work with the old
firmware. There is a newer version on git://git.ti.com/ti-bt/service-packs.git

The path only changed a bit:
cp $(@D)/initscripts/TIInit_*.bts $(TARGET_DIR)/lib/firmware/ti-connectivity

I only have this hardware so ? cant test it any further that this.

<Addendum>
11.8.32 isn't a library version number but a hardware one.
bluez5_utils-5.50/tools/hciattach_ti.c:    sprintf(firmware_file_name,
FIRMWARE_DIRECTORY "TIInit_%d.%d.%d.bts", chip, maj_ver, min_ver);

<device log>

<<Current version from github>>
device# Found a Texas Instruments' chip!
Firmware file : /lib/firmware/ti-connectivity/TIInit_11.8.32.bts
Loaded BTS script version 1
texas: changing baud rate to 3000000, flow control to 1
Initialization timed out.

<< current version from git://git.ti.com/ti-bt/service-packs.git >>
device# Found a Texas Instruments' chip!
Firmware file : /lib/firmware/ti-connectivity/TIInit_11.8.32.bts
Loaded BTS script version 1
texas: changing baud rate to 3000000, flow control to 1
Device setup complete

device# blescan
Scanning for devices...
    Device (new): 03:FF:FF:3f:FF:38 (random), -87 dBm (not connectable)
    Device (new): 04:FF:2b:FF:a5:55 (random), -77 dBm (not connectable)
    Device (new): 0c:FF:90:FF:15:90 (random), -92 dBm (not connectable)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
