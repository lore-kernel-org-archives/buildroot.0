From: Himanshu Gusain <himanshu.gusain1989@gmail.com>
Date: Wed, 23 May 2018 11:17:26 -0500
Subject: [Buildroot] Bluetooth PAN issues with Buildroot 2015.05
Message-ID: <CAE8=ow1ZfmUeC24Jhy12cvJf_QfFFFJB9T-ZV1wk5tJNx-hprg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi



I am having some trouble with the buildroot v 2015.05



My goal is to connect a linux device running with above buildroot

to an Android device to perform a Bluetooth PAN communication

I have enabled Bluez 5 support in buildroot for that & using below command
for testing





    dbus-send --system --type=method_call --dest=org.bluez
/org/bluez/hci0/dev_DC_D9_16_E3_3C_1D org.bluez.Network1.Connect
string:'nap'



Below is the error I am getting



    bluetoothd[359]: src/adapter.c:resume_discovery()

    bluetoothd[359]:
profiles/network/connection.c:connection_connect() id 4374

    bluetoothd[359]: src/adapter.c:connected_callback() hci0 device
DC:D9:16:E3:3C:1D connected eir_len 15

    netplugd[287]: bnep0: ignoring event

    bluetoothd[359]: bnep: Could not bring up bnep0: Cannot assign
requested address(99)

    bluetoothd[359]: profiles/network/connection.c:bnep_conn_cb()

    bluetoothd[359]: connect failed Input/output error



Is there any dependency package I am missing in buildroot ?

I am completely stuck in this issue
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180523/ad4be257/attachment.html>
