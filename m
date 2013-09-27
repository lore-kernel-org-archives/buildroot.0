From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 27 Sep 2013 09:48:34 +0200
Subject: [Buildroot] ntp init script and config file issue
Message-ID: <52453852.20904@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i was just wondering: the ntp init script shipped in
packages/ntp/S49ntpd sources the /etc/default/ntpd file, but it does not
use all of the settings from there, only the NTPDATE_OPTS and the
NTPSERVERS variables. It's seems to be faulty for me, but maybe i miss
something obvious, please correct me if so. For my application i
modified the init script to:

* also sources the /etc/ntpd file if exist, which overrides the settings
coming from /etc/default/ntpd

* starts the daemon only if NTPD=yes

* also calls the ntpdate only when NTPDATE=yes

Is the community interested in such a fix? If so, please let me know and
I'll send in a patch.
Thanks,

-- 
br, 
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
