From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 21:50:31 +0200
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build
 when libseccomp is enabled.
In-Reply-To: <1468006361981-b8d5773f-c47578b5-9b1f9581@mixmax.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
 <20160708212753.55d3c2ae@free-electrons.com>
 <1468006361981-b8d5773f-c47578b5-9b1f9581@mixmax.com>
Message-ID: <20160708215031.17fe15de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


On Fri, 08 Jul 2016 19:32:41 +0000, Christian Stewart wrote:

> In my latest revision of docker-engine I removed the -static flag for CGO
> because btrfs would not link for the same reason.
> I think it's fine to remove the ?-static? extldflag on everything for Go. I have
> had no trouble doing so with docker-engine and I don't see why there would be a
> problem with the other packages.
> We want to statically link the Go code to other go code, yes, but linking the Go
> code to C libraries should be fine dynamically.

OK. Can we remove unconditionally, or should we still keep it for
BR2_STATIC_LIBS=y builds?

Perhaps we should pass -extldflags '$(TARGET_LDFLAGS)', since
TARGET_LDFLAGS will automatically contain -static when
BR2_STATIC_LIBS=y.

For the specific case of runc, is "RUNC_GOTAGS = static_build" needed
when BR2_STATIC_LIBS=y ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
