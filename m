From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 14:39:34 +0100
Subject: [Buildroot] adding a new machine configuration
In-Reply-To: <4F4F74A4.2060909@gmail.com>
References: <4F4F74A4.2060909@gmail.com>
Message-ID: <20120301143934.073f50a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 01 Mar 2012 15:07:48 +0200,
Roland <rolandu@gmail.com> a ?crit :

> I have created a new machine configuration file.
> 
> Target is Voipac iMX25 module ( http://voipac.com/#X25-DMM-254 ).
> 
> I'm gonna also create one for iMX51.
> 
> The problem is, the generated filesystem image won't work if don't 
> change the fs/ubinize.cfg file (problem with alignment). And
> currently it's not possible to edit ubinize.cfg file in the buildroot 
> configuration file.

I guess you're talking about the vol_alignment parameter, is this
correct?

> I'm interested in sharing the config and other files so, it can be 
> merged to buildroot's git.
> But it's probably not possible until ubinize.cfg is configurable.
> 
> Any comments by the people, who have commit access?

You can simply add a new configuration option in the menuconfig to
specify the alignment, with a default value equal to the one used in
the current ubinize.cfg. Then, you change the ubinize.cfg to something
like:

vol_alignment=__BR_VOL_ALIGNMENT__

And then when the filesystem image is built, you copy this ubinize.cfg
somewhere, making the replacement of __BR_VOL_ALIGNMENT__ with the
value from the configuration, and you run ubinize with it.

Is this what you're looking for?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
