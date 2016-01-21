From: =?UTF-8?Q?Gabriel_Andr=C3=A9s_Castillo?= <gcastillo@controlnet.com.ar>
Date: Thu, 21 Jan 2016 10:07:32 -0300
Subject: [Buildroot] Wvdial segmentation fault
Message-ID: <CAKvcKqdOoe+XCRfQeVbk=u=iQga5AnP3Dt+6vLcTVgwRJp-BgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all, i'm trying to use wvdial to open a network connection using a
usb modem.

The steps that i'm doing is:

1) I create the "/etc/wvdial.conf" file:

# wvdialconf /etc/wvdial.conf


2) I configure the "/etc/wvdia.conf" file

[Dialer Defaults]
Init2 = ATQ0 V1 E1 &C1 &D2 +FCLASS=0
Modem Type = USB Modem
Phone = *99#
ISDN = 0
Username = gprs
Init1 = ATZ
Password = gprs
Modem = /dev/ttyACM0
Baud = 460800

3) I run wvdial:

# wvdial
--> WvDial: Internet dialer version 1.61
--> Warning: section [Dialer Defaults] does not exist in wvdial.conf.
--> Initializing modem.
--> Sending: ATZ
ATZ
OK
--> Modem initialized.
--> Configuration does not specify a valid phone number.
--> Configuration does not specify a valid login name.
--> Configuration does not specify a valid password.

4) I read the forum, and the solution for that was to run the wvdial with
all the flags configured by me:

# wvdial Init2="ATQ0 V1 E1 &C1 &D2 +FCLASS=0" Phone=*99# ISDN=0
Username=gprs Init1=ATZ Password=gprs Modem=/dev/ttyACM0 Baud=460800
--> WvDial: Internet dialer version 1.61
--> Warning: section [Dialer Defaults] does not exist in wvdial.conf.
--> Initializing modem.
--> Sending: ATZ
ATZ
OK
--> Sending: ATQ0 V1 E1 &C1 &D2 +FCLASS=0
ATQ0 V1 E1 &C1 &D2 +FCLASS=0
OK
--> Modem initialized.
Segmentation fault



I don't know what i'm doing wrong. If someone can help, i will to
appreciate.
Regards, Gabriel.
--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160121/27d702e7/attachment.html>
