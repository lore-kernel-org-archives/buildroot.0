From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 May 2019 22:54:50 +0200
Subject: [Buildroot] Location of external firmware
In-Reply-To: <509774653.20190506161444@tele2.se>
References: <509774653.20190506161444@tele2.se>
Message-ID: <37f920d1-be43-800f-4422-7f1217cc4b82@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/05/2019 16:14, Mats Jansson wrote:
> Hi,
> 
> I have an external firmware to be loaed by a driver. The normal way is
> to put the firmware in /lib/firmware. But since it needs to
> be loaded during boot and udev is not intitialised at that point I
> have found out that I need to build it into the kernel.
> 
> I want to put this file in my buildroot-external-tree just like I do
> with patches. Any idea on how to do it?
> I have tried two different approaches.
> 1. Creating a patch, but then I get the error message that "git binary diffs are not
> supported."

 That will indeed not be possible, unfortunately.

> 2. setting CONFIG_EXTRA_FIRMWARE_DIR to $(BR2_EXTERNAL)/firmware but I
> get the error message "BR2_EXTERNAL: command does not exist"

 Looks like you're trying to do this from the shell; $(...) in shell means
executing a subcommand, which is not what you want here.

 In addtion, $(BR2_EXTERNAL) should no longer be used (since 2016.11). Instead,
each external has a name, and you should use $(BR2_EXTERNAL_<name>_PATH). This
variable is exported, so you can use it in your linux configuration file.

 Regards,
 Arnout

> 
> Anyone have a good idea on how to solve this?
> 
> Best regards
> Mats                          mailto:matsmanhav at tele2.se
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
