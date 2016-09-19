From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 05:41:02 +0200
Subject: [Buildroot] [PATCH 2/2] Openjpeg: Build third party
 dependencies for static library
In-Reply-To: <1474232179-19811-3-git-send-email-olivier.schonken@gmail.com>
References: <1474232179-19811-1-git-send-email-olivier.schonken@gmail.com>
 <1474232179-19811-3-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160919054102.3b8492b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Sep 2016 22:56:19 +0200, Olivier Schonken wrote:

> +ifeq ($(BR2_STATIC_LIBS),y)
> +OPENJPEG_CONF_OPTS = -DBUILD_THIRDPARTY=ON
> +endif

If I understand correctly, this tells OpenJPEG to build its internal
copy of lzma, tiff and other libraries. Is this correct?

If it is, then it is not the proper solution to the problem. Regardless
of whether we're static linking or dynamic linking, we want to use the
external libraries (i.e provided by the corresponding Buildroot
packages).

Also, your commit log lacks a reference to the autobuilder failure
being fixed (I know they are in the cover letter, but the cover letter
doesn't get committed, which is why we want the explanation and the
autobuilder reference to be in the commit lot itself).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
