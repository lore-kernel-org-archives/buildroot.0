From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2020 19:22:54 +0000
Subject: [Buildroot] [Bug 12701] New: [patch] wpa_supplicant must depend on
 openssl
Message-ID: <bug-12701-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12701

            Bug ID: 12701
           Summary: [patch] wpa_supplicant must depend on openssl
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: shaforostoff at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

with BR2_PACKAGE_OPENSSH=n building buildroot results in errors:

buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
../src/eap_peer/eap_teap.o: in function `eap_teap_session_id':

buildroot/build/wpa_supplicant-2.9/wpa_supplicant/../src/eap_peer/eap_teap.c:741:
undefined reference to `tls_get_tls_unique'
buildroot/build/wpa_supplicant-2.9/wpa_supplicant/../src/eap_peer/eap_teap.c:1828:
undefined reference to `tls_connection_get_cipher_suite'

buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld:
../src/eap_common/eap_teap_common.o: in function `eap_teap_tls_prf':
14:15:20
buildroot/build/wpa_supplicant-2.9/wpa_supplicant/../src/eap_common/eap_teap_common.c:75:
undefined reference to `tls_prf_sha256'

and so on. The fix is to add WPA_SUPPLICANT_DEPENDENCIES=opessl

-- 
You are receiving this mail because:
You are on the CC list for the bug.
