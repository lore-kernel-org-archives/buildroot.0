From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Sep 2015 13:27:34 +0300
Subject: [Buildroot] [PATCHv2 1/2] udisks: bump to version 1.0.5
In-Reply-To: <55E6CC23.2090502@imgtec.com>
References: <1441188349-13079-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150902101033.GY17874@tarshish> <55E6CC23.2090502@imgtec.com>
Message-ID: <20150902102734.GA17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Wed, Sep 02, 2015 at 11:14:59AM +0100, Vicente Olivert Riera wrote:
> On 09/02/2015 11:10 AM, Baruch Siach wrote:
> > On Wed, Sep 02, 2015 at 11:05:48AM +0100, Vicente Olivert Riera wrote:
> >> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> >> +UDISKS_CONF_OPTS += libgudev
> >> +endif
> > 
> > So libgudev is not even an optional dependency when there is no systemd?
> 
> Well, it wasn't there before, so... Anyway, the default is not to add
> every optional dependency in the .mk, and let the users who really need
> them to send a patch to do it.

As I understand libgudev is not an optional dependency. But in principal we do 
want to list all known optional dependencies in .mk files, to make the build 
reproducible as much as possible.

> > In any case, a comment explaining this unusual dependency would be nice.
> 
> Well, I have copied the output of the error you will face if you don't
> depend on libgudev when using systemd. Do you think it's also necessary
> in the Config.in and udisks.mk file as well? I don't mind doing it if
> you think it is.

As Thomas explained the dependency situation here is far from obvious. I think 
that a detailed comment in udisks.mk would suffice.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
