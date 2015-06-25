From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 00:26:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <20150625085428.GA3400@arthur-dreem>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be> <20150625085428.GA3400@arthur-dreem>
Message-ID: <558C800F.5030702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/15 10:54, Arthur LAMBERT wrote:
> Arnout, All,
> 
> Le Wednesday 24 Jun 2015 ? 23:46:52 (+0200), Arnout Vandecappelle a ?crit :
>>> +
>>> +Enable bluetooth
>>> +================
>>> +hciattach /dev/ttymxc4 any
>>> +hciconfig hci0 up
>>> +
>>> +Enable Wifi
>>> +==========
>>> +modprobe brcmfmac
>>> +ifconfig wlan0 up
>>
>>  To do something useful, you'll also need a wpa-supplicant I guess...
>>
>>  Since you anyway have a rootfs overlay, you could add init scripts to start
>> wifi and bluetooth. We don't usually do that, but I think it would be a good idea.
> 
> In fact I need bluez-util (to be able to run hciattach command also). And yes I also need wpa_supplicant for wifi.
> So ok I will enable these two packages and add init script

 Question for the other BR developers (especially Peter): do you agree it's a
good idea to make a non-minimal defconfig that includes bluez and wpa_supplicant?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
