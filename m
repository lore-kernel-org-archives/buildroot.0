From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Jan 2017 03:48:03 +0000
Subject: [Buildroot] [Bug 9596] New: KODI: --enable-lirc needs "HAVE_LIRC"
 compiler definition to use the lirc subsystem
Message-ID: <bug-9596-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9596

            Bug ID: 9596
           Summary: KODI: --enable-lirc needs "HAVE_LIRC" compiler
                    definition to use the lirc subsystem
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lipkegu at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When compiling kodi, with option --enable-lirc, the Lirc subsystem doesnt get
initialized when "-DHAVE_LIRC isnt set. normaly --enable-lirc should set it but
it doesnt.

Reproduce case:
https://github.com/xbmc/xbmc/blob/8d4a5bba55638dfd0bdc5e7de34f3e5293f99933/xbmc/input/ButtonTranslator.cpp#L601

I removed the "HAVE_LIRC" definition from the code and the result was clear:

01:00:26.239 T:3016212480    INFO: Loading special://xbmc/system/Lircmap.xml
01:00:26.263 T:3016212480    INFO: * Adding remote mapping for device 'mceusb'
01:00:26.265 T:3016212480    INFO: * Adding remote mapping for device
'XboxDVDDongle'
01:00:26.265 T:3016212480    INFO: * Adding remote mapping for device
'Microsoft_Xbox'
01:00:26.266 T:3016212480    INFO: * Adding remote mapping for device
'PinnacleSysPCTVRemote'
01:00:26.266 T:3016212480    INFO: * Adding remote mapping for device 'anysee'
01:00:26.267 T:3016212480    INFO: * Adding remote mapping for device
'iMON-PAD'
01:00:26.267 T:3016212480    INFO: * Adding remote mapping for device
'Antec_Veris_RM200'
01:00:26.268 T:3016212480    INFO: * Adding remote mapping for device
'MCE_via_iMON'
01:00:26.268 T:3016212480    INFO: * Adding remote mapping for device
'TwinHanRemote'
01:00:26.269 T:3016212480    INFO: * Adding remote mapping for device
'linux-input-layer'
01:00:26.270 T:3016212480    INFO: * Linking remote mapping for
'linux-input-layer' to 'cx23885_remote'
01:00:26.270 T:3016212480    INFO: * Adding remote mapping for device
'mediacenter'
01:00:26.271 T:3016212480    INFO: * Adding remote mapping for device
'devinput'
01:00:26.276 T:3016212480    INFO: Loading special://profile/Lircmap.xml
01:00:26.282 T:3016212480    INFO: * Adding remote mapping for device 'mceusb'
01:00:26.283 T:3016212480    INFO: * Adding remote mapping for device
'devinput'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
