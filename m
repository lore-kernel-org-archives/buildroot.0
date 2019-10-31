From: Jonah Petri <jonah@petri.us>
Date: Thu, 31 Oct 2019 13:25:58 -0400
Subject: [Buildroot] Should wpa_supplicant be a virtual package?
Message-ID: <0823FB89-0549-4A45-983C-4B1EC55ED698@petri.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Many wireless chip vendors ship forked versions of wpa_supplicant with their released linux driver packages (e.g. [1][2]).  Right now, WPA Supplicant in buildroot is not a virtual package, and some packages depend explicitly on it (e.g. connman).  This means that a lot of modification to the buildroot repo must be done in order to substitute the vendor-released versions, particularly because in some cases the vendor versions are forked from older wpa_supplicant releases.

It seemed worth raising the question: should wpa_supplicant be a virtual package?  This would allow buildroot users (like me) to easily use the vendor-provided versions of wpa_supplicant by wrapping them in buildroot packages which are providers of the virtual wpa_supplicant package.

Any thoughts on this?  Would this just clutter things up?  Sound useful as a patch?

Please leave me CC'd on replies, as I don't receive list emails.

Best,
Jonah


[1] Cypress (was Broadcom) https://community.cypress.com/docs/DOC-17441, patches atop hostapd 2.6
[2] TI http://software-dl.ti.com/ecs/WiLink8/SP/latest/exports/WiLink8_R8.7_SP3_manifest.html, lots of work atop hostapd 2.5
