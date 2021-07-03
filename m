From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Jul 2021 15:38:45 +0200
Subject: [Buildroot] Question on users and ssh access
In-Reply-To: <82f467ec-fbb3-9e87-be88-b5b51fc9b632@microchip.com>
References: <82f467ec-fbb3-9e87-be88-b5b51fc9b632@microchip.com>
Message-ID: <569f9ccf-381c-7cc7-d464-045f6be99fe0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/06/2021 10:55, Eugen.Hristev--- via buildroot wrote:
> Hello everyone,
> 
> Maybe you can help me with a small matter related to user accounts in 
> Buildroot ?
> 
> By default the /home directory does not exist, thus when using adduser 
> to create a user, the creation of /home/foo fails ... and this causes 
> login with ssh to the user impossible due to lack of home dir.
> 
> Any recommendation on how to solve this ? It is preferred to set a 
> password for root for ssh access (as root has /root as home) ? or add a 
> post-script to create the /home in the rootfs ?

 You can use BR2_ROOTFS_DEVICE_TABLE ("Path to permission tables") to point to a
file that instructs buildroot to create the /home directory.

 Alternatively, you can create an overlay (BR2_ROOTFS_OVERLAY) that contains /home.

 Finally, you can specify the home directory location in adduser's arguments,
for example pointing to /tmp/<user>.

 Regards,
 Arnout

> 
> Thanks !
> Eugen
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
