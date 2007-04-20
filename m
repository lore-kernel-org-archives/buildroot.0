From: Jinag Robert <cretaceousstone@yahoo.com.cn>
Date: Fri, 20 Apr 2007 17:36:31 +0800 (CST)
Subject: [Buildroot] ramdisk building issue
Message-ID: <255259.71430.qm@web15811.mail.cnb.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All,

I built ramdisk for a ARM 920T board on  a RedHat 2.6.9-34.ELsmp server. 
But after booting up, following message was printed repeatedly:
# attempt to access beyond end of device
ram0: rw=0, want=65734, limit=65536

The ramdisk is c create by "genext2fs" command 
and the "genext2fs" is created during building process. 

I tried on three other linux boxes,  and couldn't  reproduce this problem.
Build server    Host GCC version           Ramdisk.gz size      Bug status
2.6.9-42.0.3.ELsmp  gcc 3.4.6              11615252             Passed
Fedora Core 4   gcc 4.0.2                  11624291             Passed
2.6.9-34.ELsmp  gcc 3.4.5                  11661380             Failed
Fedora Core 3   gcc 3.4.2                  11613082             Passed

I updated 2.6.9-34.ELsmp server's GCC and binutils and rebuilt again, 
the dirty message is still printed.


And idea that how I will fix this problem ? 

Thanks,
Robert




      ___________________________________________________________ 
????????-3.5G???20M??? 
http://cn.mail.yahoo.com
