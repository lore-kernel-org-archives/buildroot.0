From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Jan 2014 15:31:38 +0000 (UTC)
Subject: [Buildroot] [Bug 6818] New: toolchainfile.cmake has absolut path
	references
Message-ID: <bug-6818-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6818

           Summary: toolchainfile.cmake has absolut path references
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: u.strempel at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


On build process of buildroot the toolchainfile.cmake is created, but with
wrong absolut path.
When shareing the toolchain or move the folder you get problems this path
settings.
i.e. 
set(CMAKE_C_COMPILER
/home/dev/Buildroot/../Toolchain/arm-toolchain//usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc)
set(CMAKE_CXX_COMPILER
/home/dev/Buildroot/../Toolchain/arm-toolchain//usr/bin/arm-buildroot-linux-uclibcgnueabi-g++)

A workarround for cmake files is
- get the path of the toolchainfile.cmake
And set the the variables.

get_filename_component(CMAKE_TOOLCHAIN_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)
set(CMAKE_C_COMPILER
${CMAKE_TOOLCHAIN_PATH}/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc)
set(CMAKE_CXX_COMPILER
${CMAKE_TOOLCHAIN_PATH}/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
