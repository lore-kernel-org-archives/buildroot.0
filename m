From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 16:17:48 +0200
Subject: [Buildroot] [PATCH 1/2] libtorrent: new package
In-Reply-To: <d72c000db80dab016beb8feec3f3a870@zacarias.com.ar>
References: <1336765188-20743-1-git-send-email-gustavo@zacarias.com.ar>
 <4FADA2BA.3010507@mind.be> <d72c000db80dab016beb8feec3f3a870@zacarias.com.ar>
Message-ID: <4FAE710C.4020706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/12 01:41, Gustavo Zacarias wrote:
> On 2012-05-11 20:37, Arnout Vandecappelle wrote:
>
>> On 05/11/12 21:39, Gustavo Zacarias wrote:
>>> +LIBTORRENT_DEPENDENCIES = host-pkg-config libsigc openssl
>>> +LIBTORRENT_CONF_OPT = --enable-aligned --enable-openssl
>>
>> Isn't the openssl dependency optional?
>>
>> Regards,
>> Arnout
>
> Yes for libtorrent, no if you want rtorrent to work (needs libtorrent built with openssl to work - it builds without it
> but will bail out when running it).
> I can add an openssl Config.in knob but since 99% of the time libtorrent will be used as a dependency of rtorrent it's
> kind of pointless.

  You could add 'select BR2_PACKAGE_OPENSSL' to rtorrent instead.  But indeed
it is probably pointless.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
