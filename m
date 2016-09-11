From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:54:49 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/mysql: add MYSQL_SOCKET
 variable
In-Reply-To: <f0638391-c360-8479-b23e-20d62d3cc156@je-eigen-domein.nl>
References: <1473437448-27903-1-git-send-email-bos@je-eigen-domein.nl>
 <20160911213223.711de86f@free-electrons.com>
 <f0638391-c360-8479-b23e-20d62d3cc156@je-eigen-domein.nl>
Message-ID: <20160911225449.647cc382@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 22:25:08 +0200, Floris Bos wrote:
> On 09/11/2016 09:32 PM, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Fri,  9 Sep 2016 18:10:47 +0200, Floris Bos wrote:  
> >> Add MYSQL_SOCKET variable with MySQL socket location
> >>
> >> v3: fix systemd missing user
> >> v2: move socket to /run/mysql/mysql.sock
> >> chmod 755 /run/mysql to allow users access to it  
> > This patch lacks your Signed-off-by line.
> >
> > Also, this patch defines the MYSQL_SOCKET variable, which in PATCH 2/2
> > gets used in the PHP package. Sharing variables between packages
> > doesn't work in all situations, so we usually refrain from doing so.
> > Maybe we should document in the manual which cases work and which cases
> > don't work. Cc'ing Arnout, who knows quite a bit about this topic :)  
> 
> Ah, didn't know.
> Thought that always all package .mk files were included, and that 
> variable expansion was deferred until actual use when created with the = 
> operator (as opposed to := )
> 
> Anyway, if you prefer to do without variable, and have the value 
> hardcoded at both places, that's fine with me as well.

Just discussed this with Yann, and this particular usage is OK, so
patches are good.

Can you resend with:

 1. Your Signed-off-by line added.

 2. The changelog below the "---" sign (which itself should be after
    the Signed-off-by line). See
    https://patchwork.ozlabs.org/patch/668485/ for a good example.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
