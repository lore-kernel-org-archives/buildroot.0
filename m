From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 00:20:15 +0200
Subject: [Buildroot] [PATCH v2 2/2] docker: add license info
In-Reply-To: <20131023214410.GA18090@free.fr>
References: <1382560114-25036-1-git-send-email-arnout@mind.be>
 <1382560114-25036-2-git-send-email-arnout@mind.be>
 <20131023214410.GA18090@free.fr>
Message-ID: <52684B9F.1080004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/10/13 23:44, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2013-10-23 22:28 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> v2: no change
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>   package/docker/docker.mk | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/package/docker/docker.mk b/package/docker/docker.mk
>> index c1c8efd..4b597d1 100644
>> --- a/package/docker/docker.mk
>> +++ b/package/docker/docker.mk
>> @@ -7,6 +7,11 @@
>>   DOCKER_VERSION = 1.5
>>   DOCKER_SITE = http://icculus.org/openbox/2/docker
>>
>> +DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
>
> Shouldn't this go in the previous patch?

  Crap.

  I first had only one patch, then I thought there would be complaints 
that the patch should be split so I split it, but of course didn't check 
carefully enough...


  Regards,
  Arnout

>
>> +DOCKER_LICENSE = GPLv2+
>> +# The 'or later' is specified at the end of the README, so include that one too.
>> +DOCKER_LICENSE_FILES = COPYING README
>> +
>>   define DOCKER_BUILD_CMDS
>>   	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>>   		XLIBPATH=$(STAGING_DIR)/usr/lib
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
