From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 27 Apr 2020 20:02:55 +0000
Subject: [Buildroot] [Bug 12821] New: Vagrantfile in download page still
 points to 2020.02
Message-ID: <bug-12821-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12821

            Bug ID: 12821
           Summary: Vagrantfile in download page still points to 2020.02
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: phernandez at luxoft.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I followed the instructions inside the Buildroot user manual and in section 3,
it asks you to get the Vagrantfile  from
https://buildroot.org/downloads/Vagrantfile but this is still pointing to
2020.02 and should be pointing to 2020.02.1

2020.02 is not able to compile using the config file from
freescale_imx8mmevk_defconfig, it end up with the next error without image
creation:

remote: Enumerating objects: 54171, done.
remote: Counting objects: 100% (54171/54171), done.
remote: Compressing objects: 100% (9304/9304), done.
error: cannot fork() for index-pack: Cannot allocate memory
fatal: fetch-pack: unable to fork off index-pack
Detected a corrupted git cache.
This is the second time in a row; bailing out
--2020-04-24 22:54:26-- 
http://sources.buildroot.net/linux/linux-rel_imx_4.14.98_2.0.0_ga.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.1.37,
104.26.0.37, 2606:4700:20::681a:125, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.1.37|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2020-04-24 22:54:26 ERROR 404: Not Found.

--2020-04-24 22:54:26-- 
http://sources.buildroot.net/linux-rel_imx_4.14.98_2.0.0_ga.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.0.37,
104.26.1.37, 2606:4700:20::681a:25, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.0.37|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2020-04-24 22:54:27 ERROR 404: Not Found.

package/pkg-generic.mk:167: recipe for target
'/home/vagrant/Gemini/test_capxl_daemons_for_gemini/capxl/output/build/linux-headers-rel_imx_4.14.98_2.0.0_ga/.stamp_downloaded'
failed
make[1]: ***
[/home/vagrant/Gemini/test_capxl_daemons_for_gemini/capxl/output/build/linux-headers-rel_imx_4.14.98_2.0.0_ga/.stamp_downloaded]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

This is not happening in version 2020.02.1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
