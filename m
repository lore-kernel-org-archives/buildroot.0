From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 22:02:21 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <56DF3C1F.30205@mind.be>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <56DF3C1F.30205@mind.be>
Message-ID: <20160308220221.0a5088d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Mar 2016 21:54:55 +0100, Arnout Vandecappelle wrote:
> On 11/18/15 15:37, J?r?me Pouiller wrote:
> > It is handy to use local.mk or external.mk to add specific targets
> > for current project. However, until now, it not possible to add help
> > message these targets.
> > This patch add LOCAL_HELP variable. This variable is aimed to be assigned
> > from any .mk files. Its content is displayed with 'make help'.
> >
> > For exemple:
> >    LOCAL_HELP += "flash                  - Flash target"
> >    LOCAL_HELP += "chroot                 - Chroot into target/"
> >    LOCAL_HELP += "qemu                   - Run image with qemu"
> >    LOCAL_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
> >    LOCAL_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
> >    LOCAL_HELP += "Please contact support at company.com in case of problem."
> >
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> 
>   Looks good to me, except that I don't like the name 'LOCAL'. I'd prefer e.g. 
> ADDITIONAL.

Wouldn't EXTERNAL_HELP be even better, suggesting that its main
use-case is for BR2_EXTERNAL ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
