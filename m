From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 17:43:13 +0100
Subject: [Buildroot] host-python build issue
In-Reply-To: <54AD3069.8090309@gmail.com>
References: <54AD3069.8090309@gmail.com>
Message-ID: <20150107174313.3d9ea5ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Wed, 07 Jan 2015 14:11:05 +0100, Zoltan Gyarmati wrote:

> i'm trying to build host-python (pulled in by
> mobile-broadband-provider-info), but some of the modules failed to build
> (namely ossaudiodev), and even if in this case the built python binary
> and modules work properly, the buildroot build process itself fails.
> Should this be considered as a bug, or this is the excepted behavior?

Do you have a /usr/include/linux/soundcard.h file in your system? If
yes, can you post it on pastebin?

We should probably disable the ossaudiodev module from the host Python
build. It's completely useful and I think we already had reports of
issues building with module with our host-python package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
