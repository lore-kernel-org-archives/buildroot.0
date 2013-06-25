From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 21:41:05 +0200
Subject: [Buildroot] using a variable within a buildroot menuconfig
In-Reply-To: <51C94D88.5080707@gmail.com>
References: <51C94D88.5080707@gmail.com>
Message-ID: <20130625214105.0419b326@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Pohanka,

On Tue, 25 Jun 2013 09:58:00 +0200, Jan Pohanka wrote:

> I have another /weird/ question.
> 
> I would like to know if it is possible to create an item in 
> configuration which will for example contain some (absolute) path on my 
> filesystem. Then I would like to use this variable for example in 
> --extra-cflags configure option for applications like ffmpeg etc.
> 
> I know that it is not very nice way, but I need to integrate buildroot 
> with Texas Instruments SDK, which is not very GNU build tools friendy.

I'm not sure to really understand what you want to do here. You can
always create string options:

config BR2_SOME_PATH
	string
	default "/path/to/somewhere/"

and then in some .mk file, you can use:

	$(BR2_SOME_PATH)

to refer to still variable, or:

	$(call qstrip,$(BR2_SOME_PATH))

if you want to get rid of the quotes around the variable value.

Does this answer your questions?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
