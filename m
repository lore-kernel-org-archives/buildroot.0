From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:51:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: patch ping to link
 against libm
In-Reply-To: <1455541206-18200-1-git-send-email-martin@barkynet.com>
References: <1455541206-18200-1-git-send-email-martin@barkynet.com>
Message-ID: <20160220155111.368c3657@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Mon, 15 Feb 2016 13:00:06 +0000, Martin Bark wrote:
> ping fails to compile with uClibc based toolchains with the error
> 
> undefined reference to `__finite'
> 
> Add a patch to link ping against libm to resolve the math library function
> finite().
> 
> Note, this error is not seen with glibc based toolchains because finite
> seems to be resolved in both libm and libc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/08f7386f75c881bc582b338824f8ccd509b2921e/
> http://autobuild.buildroot.net/results/5aeef61fbd399dd78dc72b9e7cce978e6f1f58b4/
> 
> A pull request has been sent to fix this issue upstream, see
> https://github.com/iputils/iputils/pull/42
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/iputils/0001-ping-link-against-libm.patch | 29 +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/iputils/0001-ping-link-against-libm.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
