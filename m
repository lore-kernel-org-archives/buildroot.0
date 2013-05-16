From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 May 2013 08:17:43 +0200
Subject: [Buildroot] Config options for optional dependencies [was: [PATCH
 6/6] gnutls: bump to version 3.2.0]
In-Reply-To: <5192BF6F.8000800@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <1368463259-18958-6-git-send-email-gustavo@zacarias.com.ar>
 <5192BC67.2070600@mind.be> <5192BF6F.8000800@zacarias.com.ar>
Message-ID: <51947A07.2080301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/05/13 00:49, Gustavo Zacarias wrote:
> On 05/14/2013 07:36 PM, Arnout Vandecappelle wrote:
>>   Any reason why you want to add this config symbol, instead of just
>> checking for BR2_PACKAGE_P11_KIT in the .mk file?
>
> Other than it's usually an obscure option (probably not easy to infer
> for people), not really.

  I think it is time that we formalize a bit the rules for optional 
dependencies.

  To be honest, I would prefer explicit config options for optional 
dependencies, because it's not easy for users to realize they can select 
the additional library. However, that buts an unrealistic (maintenance) 
overhead on the Config.in files.

  So as a second-best option, I would say that the optional dependencies 
should be mentioned in the package help text. It's still not easy on the 
user, because s/he needs to know how to read the help text and how to 
search for the relevant package. It's also still a bit of a maintenance 
burden because the help text has to be updated when optional dependencies 
are added/removed. But I guess it's a reasonable compromise.

  With that, I think our informal guideline of adding config options only 
for obscure libraries becomes less of a necessity, and we can make it a 
rule to never add config options for optional dependencies.

  What do you think?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
