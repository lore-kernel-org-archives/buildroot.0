From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 16 Aug 2013 22:04:24 +0200
Subject: [Buildroot] kernel patches suggestion : series file ->make it a
	variable
In-Reply-To: <20130816125652.701e7173@skate>
References: <FAC1EE0BD8A0431EBFF14BEE70571910@JohanW7>
 <20130816125652.701e7173@skate>
Message-ID: <2EEB59F1B4624C6B8D85EC7D0B6054E5@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: vrijdag 16 augustus 2013 12:57
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] kernel patches suggestion : series file ->make it a variable

Dear Sagaert Johan,

On Fri, 16 Aug 2013 12:19:13 +0200, Sagaert Johan wrote:

> Now I use a 'series'  file in my board directory to specify what patches that should be applied to the kernel.
> I would love to see a menu entry where I can specify what list of 
> patches that should be applied.(default value :series)

What's the difference between what you're asking and the already existing BR2_LINUX_KERNEL_PATCH configuration option?


Hi

Also works, but it gives long lines in the menu if you have more than 5 patches that have relative path's.
(eg board/karo/tx53/linux-3.4.58/firmware.patch  ......)
Is just a bit difficult to see the full list then.

Regards, Johan


config BR2_LINUX_KERNEL_PATCH
        string "Custom kernel patches"
        help
          A space-separated list of patches to apply to the
          kernel. Each patch can be described as an URL, a local file
          path, or a directory. In the case of a directory, all files
          matching linux-*.patch in the directory will be applied.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
