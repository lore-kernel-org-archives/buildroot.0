From: Brad House <brad@mainstreetsoftworks.com>
Date: Tue, 07 Aug 2007 17:47:11 -0400
Subject: [Buildroot] [patch] udev broken, update and fix
In-Reply-To: <022001c7d939$a7eb56d0$dcc4af0a@atmel.com>
References: <46B7BE61.5060107@mainstreetsoftworks.com>
	<022001c7d939$a7eb56d0$dcc4af0a@atmel.com>
Message-ID: <46B8E85F.2040909@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> If you build udev, and then delete the source directory, and build udev again
> you will get multiple lines "udev_root=/dev" in the udev.conf.
> 
> It would be better to check if it is there and add it, if it is not.

Yep, you're right. I've attached a patch to fix that.
I also fixed the udev-clean/dirclean issue if you didn't have
volume_id and scsi_id selected.

-Brad
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: udev-114-2.patch
Url: http://busybox.net/lists/buildroot/attachments/20070807/4f3c8ee9/attachment.diff 
