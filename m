From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 10:50:57 +0100
Subject: [Buildroot] [PATCH v2] poco: build it as "poco", not "poco-poco"
In-Reply-To: <20170211164837.26d4de3c@free-electrons.com>
References: <1486771153-10386-1-git-send-email-casantos@datacom.ind.br>
 <c56b756cdb1ca9426d7a9ec5d04ba9462c6d4006.1486811718.git.casantos@datacom.ind.br>
 <20170211164837.26d4de3c@free-electrons.com>
Message-ID: <20170212095057.GB4533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-11 16:48 +0100, Thomas Petazzoni spake thusly:
> On Sat, 11 Feb 2017 09:15:55 -0200, Carlos Santos wrote:
> 
> > -POCO_VERSION = poco-1.7.2-release
> > -POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
> > +POCO_VERSION = 1.7.2
> > +POCO_VERSION_TAG = poco-$(POCO_VERSION)-release
> > +POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION_TAG))
> 
> In all packages, we currently use directly the upstream tag name as the
> <pkg>_VERSION value. I.e, we already had some people who wanted to do:
> 
> FOO_VERSION = 1.2.3
> FOO_SITE = $(call github,foo,bar,v$(FOO_VERSION))
> 
> and we said no, the version should be v1.2.3.

Actually, there are 13 packagers where this is the case:

    package/libcec/libcec.mk:LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
    package/libiio/libiio.mk:LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
    package/libplatform/libplatform.mk:LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,p8-platform-$(LIBPLATFORM_VERSION))
    package/luaposix/luaposix.mk:LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
    package/msr-tools/msr-tools.mk:MSR_TOOLS_SITE = $(call github,01org,msr-tools,msr-tools-$(MSR_TOOLS_VERSION))
    package/nodm/nodm.mk:NODM_SITE = $(call github,spanezz,nodm,debian/$(NODM_VERSION))
    package/openjpeg/openjpeg.mk:OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
    package/python-coherence/python-coherence.mk:PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,Coherence-$(PYTHON_COHERENCE_VERSION))
    package/python-crc16/python-crc16.mk:PYTHON_CRC16_SITE = $(call github,gennady,pycrc16,v$(PYTHON_CRC16_VERSION))
    package/python-pysendfile/python-pysendfile.mk:PYTHON_PYSENDFILE_SITE = $(call github,giampaolo,pysendfile,release-$(PYTHON_PYSENDFILE_VERSION))
    package/systemd/systemd.mk:SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
    package/unionfs/unionfs.mk:UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
    package/yaml-cpp/yaml-cpp.mk:YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,release-$(YAML_CPP_VERSION))

So some did manage to sneak in; about half of them when the github
helper was introduced.

> So I'm not sure why we would want to do this differently for the poco
> package. Yes, poco-poco-1.7.2-release seems weird, but if you find this
> weird, then it's upstream who should change the name of their tags.
> 
> That being said, one thing that might lead us to change our mind is
> when we will do tracking of new upstream releases. In this situation,
> it might be easier to have a "cleaner" <pkg>_VERSION variable. See for
> example the list of versions visible at
> https://release-monitoring.org/project/5418/.

I think there are so vicious^Wvarious ways to put tags, tht we can't
even consider this for now...

So, until we have a good reason, let's stay with the version as-is for
now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
