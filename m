From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 16:29:08 +0200
Subject: [Buildroot] [PATCH 1/1] mono: remove copy of host etc files on
 install
In-Reply-To: <20170315022458.14160-1-dustin.r.johnson@gmail.com>
References: <20170315022458.14160-1-dustin.r.johnson@gmail.com>
Message-ID: <20170523162908.069ae88c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 22:24:58 -0400, Dustin Johnson wrote:
> When the mono package is installed, the autotools installer installs
> the /etc/mono files to the target. A post_install hook then copies
> over the mono libraries to the target as well as the host /etc/mono
> files which overrides the target files. The target specific mono
> configuration file (/etc/mono/config) is overridden with the host
> settings. This causes mono on the target to be unable to locate target
> specific .so files as it overrides the changes enacted by the patches
> for the package.
> 
> Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
> ---
>  package/mono/mono.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks. Thanks also to Angelo for having
tested/reviewed the patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
