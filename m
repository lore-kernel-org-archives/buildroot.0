From: Claudio Laurita <claudio.laurita@integrazionetotale.it>
Date: Thu, 09 Oct 2014 17:13:26 +0200
Subject: [Buildroot] [PATCH 1/1] openocd bump to 0.8.0
In-Reply-To: <20141009132830.77fc2c47@free-electrons.com>
References: <1412801633-3394-1-git-send-email-claudio.laurita@integrazionetotale.it>	<20141008231040.57406af4@free-electrons.com>	<5435C245.1090100@integrazionetotale.it>	<20141009095735.529fd5ca@free-electrons.com>	<543655B0.8030304@integrazionetotale.it>
 <20141009132830.77fc2c47@free-electrons.com>
Message-ID: <5436A616.1090407@integrazionetotale.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 09/10/2014 13:28, Thomas Petazzoni ha scritto:
> No, it's buggy: the OpenOCD build system is based on the autotools, 
> and the autotools normally guarantee that you can do: --enable-foo 
> --disable-foo and be sure that "foo" will be disabled. The fact that 
> OpenOCD doesn't comply with that makes it incorrect. The reason why we 
> don't allow to change the base options is because you never need to do 
> so: you can override them as I just exposed above. And the build 
> system of OpenOCD is really buggy: if you specify --enable-shared 
> --enable-static, it builds a shared variant of jimtcl, but OpenOCD 
> tries to link against the static variant. This is not coherent at all. 

OK, let's opt for buggy.

> Another option you could look at is to use the existing Buildroot 
> jimtcl package, instead of relying on the jimtcl implementation built 
> into OpenOCD. I've seen that OpenOCD has an option to use an external 
> jimtcl implementation. Best regards, Thomas 

I was aware of the external option, but the actual BR package script for 
jimtcl suffers exactly of the same problem. No patches applied there and 
no autotools-package called. A custom configure command and 
generic-package management. But no way to build a static library if 
--enable-shared is globally adopted.

Anyway, I collected enough information to start working on release 2. 
Just need some spare hours, now.

Thanks a lot
Claudio
