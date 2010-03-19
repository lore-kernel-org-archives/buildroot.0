From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Mar 2010 09:33:24 +0100
Subject: [Buildroot] Compilation error of Buildroot with X server
In-Reply-To: <4BA257A4.6040009@terawatt.fr>
References: <4B9124F4.40206@terawatt.fr> <20100307112147.55145b25@surf>
	<4B9652A7.1080103@terawatt.fr> <4B9656D6.3070202@terawatt.fr>
	<4B978247.3030707@terawatt.fr> <4BA257A4.6040009@terawatt.fr>
Message-ID: <20100319093324.2c8d967e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Mar 2010 17:41:08 +0100
Damien Borie <dbe@terawatt.fr> wrote:

> So, I finally successfully created my distribution. So if anybody 
> encounter the same problems, I send my solution here.
> In fact, the .la files, used by Libtool for linking libraries, were 
> filled with bad paths. The error was to define the same path for the 
> External Toolchain Location option and the Toolchain Header Location 
> option. The second is where libraries are copied by Buildroot, and
> must be in the Buildroot tree. I don't know why, in my configuration,
> it was the path to my Toolchain (the 2 options had the same value).
> I never understood why the problem only comes with X libraries 
> compilation and no with other libraries.
> I reset this option to the default value (output/staging or something 
> like that), and, it's work fine.

Oh, yes, these are two very different things. The location were your
external toolchain is installed could be read-only. We use this
location for the cross-tools binaries (that we keep in this
directory) and for the C library and headers (that we copy into the
staging directory).

Maybe I should check that they are different ?

> I encountered some errors during Vesa drivers and XGI drivers
> compilation, but I resolved them (some include to modify in some .h
> files). So now I got a working distribution.

Ok. After the 2010.02 release there has been a big update of all the
X11-related packages, so maybe these issues are already solved.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
