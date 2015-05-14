From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 May 2015 21:59:14 +0200
Subject: [Buildroot] Generating Debug Info Files
In-Reply-To: <00b501d08d9b$87eae570$97c0b050$@osullivan@cloudiumsystems.com>
References: <00b501d08d9b$87eae570$97c0b050$@osullivan@cloudiumsystems.com>
Message-ID: <20150514215914.10e83cad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John OSullivan,

On Wed, 13 May 2015 17:40:31 +0100, John OSullivan wrote:

> When I run perf on my buildroot based system it complains about missing
> symbols for my libraries and applications. I know it is possible to generate
> binaries with symbolic information in the staging area by selecting 'build
> packages with debugging symbols', but is there any way of generating
> separate .debug type files or do I need to do this in postBuild with a
> script based on objcopy.

No, we don't have support for separate .debug files currently.

But how would it work exactly, since perf is running on the target?

Don't you simply need to have debugging symbols on the target? If
that's the case, you can simply do BR2_ENABLE_DEBUG=y and
BR2_strip_none=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
