From: Paul C Diem <PCDiem@FoxValley.net>
Date: Thu, 7 May 2020 12:59:04 -0500
Subject: [Buildroot] Package configure script environment
Message-ID: <b0635a68-dae9-1e89-c352-1082e49990ad@FoxValley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to find how buildroot execute package configure scripts. 
Specifically, I'm trying to build unbound. It build fine under buildroot 
2019.02 but I'm having trouble under 2020.02.1. The problem is that the 
ubnound configure script looks for include files (such as ssl.h) in 
directories such as /usr. It appears that from the configure script's 
perspective, /usr is the the /usr of the system I'm building on. It 
seems it should be the host /usr from sysroot. I assume a lot of 
configure scripts look for the existence of files in include and 
libraries directories and I would have thought buildroot chroot'ed into 
the host filesystem root when it ran the package configure scripts. Can 
someone explain in what environment the package configure scripts are 
executed?

-- 
Paul C Diem
PCDiem at FoxValley.net
