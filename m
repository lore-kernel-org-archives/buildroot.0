From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 15:46:02 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: dynamic loader
 symlink to actual location of musl libc.so
In-Reply-To: <1495112596-26182-1-git-send-email-ilya.kuzmich@gmail.com>
References: <1495112596-26182-1-git-send-email-ilya.kuzmich@gmail.com>
Message-ID: <20170702154602.77b7427b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 May 2017 16:03:16 +0300, Ilya Kuzmich wrote:
> Test whenever musl libc.so located at /lib or /usr/lib and create dynamic
> library loader symlink accordingly.
> 
> Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>

Thanks. However, after discussing this issue, we found that we could in
fact entirely get rid of this TOOLCHAIN_EXTERNAL_MUSL_LD_LINK hook. See
https://patchwork.ozlabs.org/patch/783188/.

So I've marked your patch as "Superseded". Of course, my new proposal
has been tested with a Crosstool-NG musl toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
