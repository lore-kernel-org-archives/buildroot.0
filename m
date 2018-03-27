From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@gmail.com>
Date: Tue, 27 Mar 2018 17:46:57 +0200
Subject: [Buildroot] Buildroot 2018.02 Mosquitto v1.4.15 : no
 CONNECT/CONNACK on libmosquitto
Message-ID: <CALmdmcBazaBmEVUiCL3N6kCV4AgSp2Duqv2=iPzy1uUSTyCYyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I have been using libmosquitto in C for quite some time in buildroot (used
in an EFL mainloop) and it works well. Here are some quick details about
how I currently use it :
* C API to create a client
* I use callbacks API to set callbacks on logs, connect/disconnect events,
publish/susbscribe events and so on
* connection uses TLS (certificate provided to API)
* once connected, Mosquitto file descriptor is provided and integrated to
EFL main loop

I recently switched to buildroot 2018.02 (it has upgraded mosquitto from
v1.4.14 to v1.4.15), and I am now encountering a new issue with the lib.
Trying to establish a new connection to my broker (using the
mosquitto_connect API), I can see that a new TCP connection is opened onto
the broker, but it seems that no MQTT data is transfered (i.e. no CONNECT
event), so the broker, of course, does not answer the usual CONNACK
(observed with tcpdump).
I have made sure that the issue only happens in v1.4.15. Quickly taking a
look on Eclipse Github, I saw no specific issue directly linked to this
problem.
Before diving more in depth in this issue on mosquitto code, I would like
to ask here : is there anyone encountering the same issue with this new
mosquitto version ? I did not see any comment about this in the mailing
list, but maybe the release is too young so it has not been detected yet ?
Or anyone can confirm that this new version, used as client with C API,
works on its side ?
Regards,
--
Alexis Lothor?
06.51.59.81.45
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180327/f3f40b40/attachment.html>
