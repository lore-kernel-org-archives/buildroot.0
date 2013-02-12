From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Feb 2013 07:27:26 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
 create users
In-Reply-To: <201302082302.37055.yann.morin.1998@free.fr>
References: <cover.1360075956.git.yann.morin.1998@free.fr>
 <5f1de03287fa8817aa692419c52e0997ec3e2489.1360075956.git.yann.morin.1998@free.fr>
 <5111A009.10304@mind.be> <201302082302.37055.yann.morin.1998@free.fr>
Message-ID: <5119E0CE.5040801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/02/13 23:02, Yann E. MORIN wrote:
> Arnout, All,
>
> On Wednesday 06 February 2013 Arnout Vandecappelle wrote:
>> On 05/02/13 15:54, Yann E. MORIN wrote:
> [--SNIP--]
>>> +PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.)*"$/!d' \
>>> +                         -e 's//\1/;'                                       \
>>> +                         "${BUILDROOT_CONFIG}"                              \
>>> +                )"
>>
>>    I'm personally more in favour of sourcing ${BUILDROOT_CONFIG} and using
>> "${BR2_TARGET_GENERIC_PASSWD_METHOD}" directly.
>
> We can't simply source .config from shell scripts. .config may contain
> constructs of the form:
>      BR2_HOST_DIR="$(BASE_DIR)/host"
>
> which would ultimately try to call a command named 'BASE_DIR' which is
> obviously wrong for virtually everybody on Earth (and probably other
> planets, too).

  Ah, yes, that's why I prefer to put ${...} references in .config 
(${...} is the same as $(...) in GNU make).

  But there are about 10 references to $(...) in Config.in defaults, so 
changing that is a bit too heavy.


> So, I kept a sed expression to extract the password encoding method form
> the .config.
>
> Note: I applied most of your suggestions, and added your ACK, as per your
> initial mail. I hope it will be still valid once you see the nes script! ;-)

  No problem.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
