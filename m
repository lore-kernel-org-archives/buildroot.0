From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:46:58 +0100
Subject: [Buildroot] [PATCH] toolchain/external: use -dumpversion to
 check gcc version
In-Reply-To: <20170309212754.7118e5ac@free-electrons.com>
References: <20170309080136.4799-1-kris@youview.com>
 <20170309212754.7118e5ac@free-electrons.com>
Message-ID: <20170309214658.15ab76aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Mar 2017 21:27:54 +0100, Thomas Petazzoni wrote:

> On Thu, 9 Mar 2017 09:01:36 +0100, Krzysztof Konopko wrote:
> > Currently, `--version` option is used and later matched with a regex to get
> > the actual gcc version.  There's a dedicated gcc option to do exactly that:
> > `-dumpversion`.
> > 
> > Also `--version` may return a string customised by a vendor that provides
> > the toolchain, which makes the current regex approach error prone.  In
> > fact, this situation has been seen with a real customised toolchain.
> > 
> > Signed-off-by: Krzysztof Konopko <kris@youview.com>
> > Signed-off-by: Tomasz Szkutkowski <tomasz.szkutkowski@youview.com>
> > ---
> >  toolchain/helpers.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
> Applied to master, thanks. I was worried that -dumpversion might have
> been a recent gcc option, but I found it in gcc 3.4 documentation, so
> we're good.

Peter: this commit might also be useful on the LTS, it allows the
external toolchain code to be more compatible with different
toolchains. Of course, you might want to wait a few days to see if we
get some feedback after it has been applied on master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
