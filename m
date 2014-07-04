From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Jul 2014 14:02:59 -0300
Subject: [Buildroot] [PATCH 0/2] ncursesw package fixes
Message-ID: <1404493381-24414-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes issues with packages when ncurses is built with widechar
support. This depends on the not-yet-applied patch from Jeremy Kerr
[package/ncurses: Allow building wide char support] to be of any real use,
however they shouldn't break anything if that's not applied since the
conditions are the same for ncurses without wchar.

Gustavo Zacarias (2):
  nano: enable ncursesw support
  statserial: don't link against legacy curses

 package/nano/nano.mk                                |  9 +++++++--
 package/statserial/statserial-01-ncurses-link.patch | 16 ++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 package/statserial/statserial-01-ncurses-link.patch

-- 
1.8.5.5
