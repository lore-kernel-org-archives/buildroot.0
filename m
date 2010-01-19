From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Jan 2010 18:23:33 +0000 (UTC)
Subject: [Buildroot] [Bug 925] New: Bump wpa_supplicant package to 0.6.10
Message-ID: <bug-925-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=925

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump wpa_supplicant package to 0.6.10
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=949)
 --> (https://bugs.busybox.net/attachment.cgi?id=949)
Bump wpa_supplicant package to 0.6.10

wpa_supplicant 0.6.10 changes:

* fixed SHA-256 based key derivation function to match with the
  standard when using CCMP (for IEEE 802.11r and IEEE 802.11w)
  (note: this breaks interoperability with previous version) [Bug 307]
* changed driver_wext to disconnect at init/deinit to clear state
* added explicit disconnect on 4-way handshake failures
* added WPS workarounds for known interoperability issues with broken,
  deployed implementation
* update IEEE 802.11w implementation to match with the published
  standard
* do not send WPS M8 message when learning current AP configuration as
  an external Registrar
* added a workaround for race condition between receive EAPOL frames
  and association events
* fixed compilation with newer GnuTLS versions
* fixed PKCS#12 use with OpenSSL 1.0.0

Also enable nl80211 driver when libnl is installed in target.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
