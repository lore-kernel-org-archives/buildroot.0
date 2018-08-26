From: Niall Parker <stuff@npengineering.ca>
Date: Sun, 26 Aug 2018 14:19:34 -0700
Subject: [Buildroot] do config fragments work ?
In-Reply-To: <e123e7b0-718c-d403-d7c2-ba9e571b6596@npengineering.ca>
References: <e123e7b0-718c-d403-d7c2-ba9e571b6596@npengineering.ca>
Message-ID: <e4186b12-39a1-7910-228b-2e5830c7d916@npengineering.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-08-24 03:48 PM, Niall Parker wrote:
> I'm trying to apply some minor tweaks to the default config for uboot 
> and using fragments seemed the best approach however the changes don't 
> appear to make it into the final .config used for the build. For 
> example, using a fragment containing CONFIG_BOOTDELAY? 1 still results 
> in the binary using the default bootdelay of 2 (of course I can make 
> uboot-menuconfig and set the boot delay there and it will stick but I 
> was hoping to clump the config customizations into a simple fragment).

Turns out I had the syntax of the fragments wrong.

CONFIG_BOOTDELAY=1

works.
