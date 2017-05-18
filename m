From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 May 2017 09:10:30 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <20170518045754.ecwqdtj35acvzk6b@tarshish>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <20170517153353.0bd784c9@free-electrons.com>
 <20170518045754.ecwqdtj35acvzk6b@tarshish>
Message-ID: <20170518091030.66a9cbee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 May 2017 07:57:54 +0300, Baruch Siach wrote:

> I have not tested kernel headers earlier than v3.12. Having a look at the 
> headers and the log of kernel commit cfd280c91253cc28 (net: sync some IP 
> headers with glibc), I'm pretty sure that the same issue also affects older 
> kernels.
> 
> Should we just disallow build of musl toolchain with older kernels? Something 
> like:

That's one option, though a bit annoying, no? Just for this "small"
reason, we prevent people from using musl toolchains on kernels older
than 3.12 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
