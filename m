From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Apr 2014 08:18:41 +0200
Subject: [Buildroot] [PATCH 4/6] package/vlc: depends on the virtual
 package libgl
In-Reply-To: <20140402162653.GB3509@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <44a8749bc3ef2c283fa679da79efd8764e482682.1396302677.git.yann.morin.1998@free.fr>
 <533BABEA.4030802@mind.be> <20140402162653.GB3509@free.fr>
Message-ID: <533CFD41.50601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/14 18:26, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-04-02 08:19 +0200, Arnout Vandecappelle spake thusly:
>> On 01/04/14 00:00, Yann E. MORIN wrote:
>>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
[snip]
>>> -ifeq ($(BR2_PACKAGE_MESA3D),y)
>>> +ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
>>>  VLC_CONF_OPT += --enable-glx
>>
>>  Since the option is called enable-glx, it sounds as if it should depend
>> on X as well (I don't think wayland has glx, right?)
> 
> Well, full-openGL is only possible with X11 anyway, so BR2_PACKAGE_HAS_OPENGL
> will itself not be set when X.org is not selected as well.

 So wayland doesn't support full-GL? Or maybe wayland also supports glx?


 Regards,
 Arnout

> 
> So, I think we can just depend on BR2_PACKAGE_HAS_OPENGL for this
> option.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
