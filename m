From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 09:34:27 +0100
Subject: [Buildroot] [PATCH 3/3] infra: replace BUILDROOT_CONFIG with
 BR2_CONFIG.
In-Reply-To: <1097248087.5049435.1391589013728.JavaMail.root@openwide.fr>
References: <1097248087.5049435.1391589013728.JavaMail.root@openwide.fr>
Message-ID: <52F1F793.5020307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/14 09:30, Jeremy Rosen wrote:
> 
> 
> 
> ----- Mail original -----
>> To make the naming consistent (all user-visible options should be
>> prefixed with BR2_).
>>
>> An entry is added to Makefile.legacy to warn users who have set
>> BUILDROOT_CONFIG but not BR2_CONFIG.
>>
>> Still export BUILDROOT_CONFIG but pointing to some phony value, to
>> make sure that scripts that still use it fail in a predictable way.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
> 
> 
> I tested with my script which has the following code
> 
> BR2_RASPAUDIO_PAACCESS="$( sed -r -e '/^BR2_RASPAUDIO_PAACCESS="(.*)"$/!d;'    \
>                          -e 's//\1/;'                                           \
>                          "${BUILDROOT_CONFIG}"                                  \
>                 )"
> 
> 
> which is adapted from the mkusers script... and it failed silently.

 Really silently? sed should complain on stderr that the file doesn't
exist, but indeed the script will continue with an empty
BR2_RASPAUDIO_PAACCESS variable.

> 
> I am not sure how to deal with the situation. I don't really see a better
> way, but silently failing in a case where I copied what is done in mainline
> seems a bad idea... 

 Hm, I also don't see a way out :-(

 Regards,
 Arnout

> 
> Regards
> 
> Jeremy Rosne
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
