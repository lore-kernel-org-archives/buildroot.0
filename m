From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 May 2018 00:33:36 +0200
Subject: [Buildroot] Bluetooth PAN issues with Buildroot 2015.05
In-Reply-To: <CAE8=ow1ZfmUeC24Jhy12cvJf_QfFFFJB9T-ZV1wk5tJNx-hprg@mail.gmail.com>
References: <CAE8=ow1ZfmUeC24Jhy12cvJf_QfFFFJB9T-ZV1wk5tJNx-hprg@mail.gmail.com>
Message-ID: <5c6665a9-7cb4-7df7-62ad-e7961553a8d0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-05-18 18:17, Himanshu Gusain wrote:
> Hi
> 
> 
> 
> I am having some trouble with the buildroot v 2015.05
> 
> 
> 
> My goal is to connect a linux device running with above buildroot
> 
> to an Android device to perform a Bluetooth PAN communication
> 
> I have enabled Bluez 5 support in buildroot for that & using below command
> for testing
> 
> 
> 
> 
> 
>     dbus-send --system --type=method_call --dest=org.bluez
> /org/bluez/hci0/dev_DC_D9_16_E3_3C_1D org.bluez.Network1.Connect
> string:'nap'
> 
> 
> 
> Below is the error I am getting
> 
> 
> 
>     bluetoothd[359]: src/adapter.c:resume_discovery()
> 
>     bluetoothd[359]:
> profiles/network/connection.c:connection_connect() id 4374
> 
>     bluetoothd[359]: src/adapter.c:connected_callback() hci0 device
> DC:D9:16:E3:3C:1D connected eir_len 15
> 
>     netplugd[287]: bnep0: ignoring event
> 
>     bluetoothd[359]: bnep: Could not bring up bnep0: Cannot assign
> requested address(99)
> 
>     bluetoothd[359]: profiles/network/connection.c:bnep_conn_cb()
> 
>     bluetoothd[359]: connect failed Input/output error

 This doesn't look like it's a buildroot issue at all, you may have more luck on
the linux-bluetooth list. Except, it seems like someone reported a similar
problem there [1] a few months ago with no replies...

 Is bluetoothd running as root? The problem seems to be that it is not able to
set the address of the bnep0 NIC. Or maybe the same address is already in use?

 Regards,
 Arnout


[1] https://www.spinics.net/lists/linux-bluetooth/msg74367.html


> Is there any dependency package I am missing in buildroot ?
> 
> I am completely stuck in this issue
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
