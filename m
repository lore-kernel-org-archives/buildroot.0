From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Fri, 18 Mar 2016 10:38:05 +0100
Subject: [Buildroot] The best way to add a new group to /etc/group
Message-ID: <CALtfCQY_vSZ3PGxgqhAsEsVpir+5p76TfLhCdQYJZASsNnSDzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm building a new package in buildroot and I would like to know the best
way to add a new group.

I have to add a new group called: test_group. In my system (with
INIT_SYSV). I have a user called root and I have to add it to this group
too.

I've read the section "17.5.2. generic-package reference" in the buidroot
manual and find this variable: NAMEPACKAGE_USERS that it's very interesting
because automatically it adds the user you want and the uid and guid can be
computed automatically, so is very useful.

Does anyone know if there is something similar to add a group?

Righ now, I'm using this command in my package.mk but it's a lilttle bit
owful and very dangerous because I don't know if the guid 1001 is free or
not.

# Added usergroup test_group
@echo "test_group:x:1001:root" 1>>$(TARGET_DIR)/etc/group

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160318/5fabd881/attachment.html>
