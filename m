From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 16 Jul 2020 11:11:31 +0200
Subject: [Buildroot] Buildroot should not the common nobody group
Message-ID: <CADYdroP3PeFHvkUCc5cFcAr_dcEQ53b_e3YjcEpkPH1RtLJ_pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

when testing systemd, I found out that sysuserd will create a "nobody"
group with gid 999,
because Buildroot uses a "nogroup" group with the special gid 65534.

Is there any good reason for Buildroot to keep using "nogroup", or can
this be changes to the usual "nobody"?

Change would affect only a handful packages (I guess more than that
will just use the "nobody" group)

Norbert

$  grep -r nogroup
system/skeleton/etc/group:nogroup:x:65534:
package/oracle-mysql/oracle-mysql.mk: mysql -1 nogroup -1 * /var/mysql
- - MySQL daemon
package/systemd/systemd.mk: -Dnobody-group=nogroup \
package/boa/boa.conf:Group nogroup
package/mosquitto/mosquitto.mk: mosquitto -1 nogroup -1 * - - - Mosquitto user
