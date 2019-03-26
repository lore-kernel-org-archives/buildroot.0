From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Mar 2019 12:31:43 +0100
Subject: [Buildroot] bdaddr from bluez-utils 5.x package
In-Reply-To: <CALtfCQaALkdTHOTbx-vBX7L_KSUzpuJG2QMqZMS8jOqRXiSyuQ@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Tue, 26 Mar 2019 11:53:52 +0100")
References: <CALtfCQaALkdTHOTbx-vBX7L_KSUzpuJG2QMqZMS8jOqRXiSyuQ@mail.gmail.com>
Message-ID: <87k1glub1c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi everyone,
 > I am checking buildroot-2019.02 vs buildroot-2018.02.5 and it seems to
 > be that using the bluez-utils 5.x has disappeared the utility bdadd in
 > order to change the Bluetooth address from different devices using
 > this format:

 > NEW_BT_MAC=00:11:22:33:44:55
 > /usr/bin/bdaddr -i hci0 $NEW_BT_MAC

Ehh, are you sure you don't have some kind of local changes in your
2018.02.5 tree? Looking at the bluez-utils5 git repo I see that bdaddr
has been marked noinst since

commit 301904d649db6df8ae4735d7a90109993d9a4523
Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Date:   Wed Jan 4 14:47:13 2017 +0200

    build: Promote experiemental tools

    This promotes many tools that were behind --enable-experimental which are
    in fact used as stable tools for a while.

Which is part of the 5.43 release, so bdaddr should get built on both
2018.02.x and 2019.02.x, but not installed into TARGET_DIR.

find -name bdaddr
./build/bluez5_utils-5.48/tools/bdaddr

 > Could anyone confirm that?
 > Is there any other alternative for changing the mac address?

Sorry, I don't know. Perhaps ask the bluez developers?

-- 
Bye, Peter Korsgaard
