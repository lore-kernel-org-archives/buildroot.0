From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Feb 2014 10:49:38 +0000 (UTC)
Subject: [Buildroot] [Bug 6938] New: mkuser script generates wrong password
 for new user in target/etc/shadow
Message-ID: <bug-6938-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6938

           Summary: mkuser script generates wrong password for new user in
                    target/etc/shadow
           Product: buildroot
           Version: 2013.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: poli at centrum.cz
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I've modified my mkusers script from buildroot-2013.11/support/scripts to
generate correct passwords for manually added users from custom packages. I've
renamed files, so the changes are clear.

diff -u mkusers_2013.11 mkusers_2013.11_modified 
--- mkusers_2013.11    2014-02-27 11:06:38.000000000 +0100
+++ mkusers_2013.11_modified    2014-02-27 11:05:15.000000000 +0100
@@ -261,7 +261,7 @@

 #----------------------------------------------------------------------------
 # Encode a password
-encode_password() {
+encode_passwd() {
     local passwd="${1}"

     mkpasswd -m "${PASSWD_METHOD}" "${passwd}"
@@ -313,7 +313,7 @@
             _passwd="$( encode_passwd "${passwd#=}" )"
             ;;
         *)
-            _passwd="${passwd}"
+            _passwd="$( encode_passwd "${passwd}" )"
             ;;
     esac

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
