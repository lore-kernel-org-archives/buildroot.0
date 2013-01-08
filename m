From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 09:24:06 +0100
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <20130108091028.042e824b@skate>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar> <50E6EDB5.9070004@petroprogram.com>
 <20130106054113.GD13545@sapphire.tkos.co.il>
 <50E9BE9A.4030703@petroprogram.com> <50EB496B.60301@mind.be>
 <50EB4DAD.6040409@petroprogram.com> <50EBCF42.3000505@mind.be>
 <20130108091028.042e824b@skate>
Message-ID: <50EBD7A6.109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/01/13 09:10, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 08 Jan 2013 08:48:18 +0100, Arnout Vandecappelle wrote:
>
>> (sys_lib_search_path_spec is computed based on the compiler's search
>> path.) So we actually risk running into this problem for any
>> libtool-based package... Maybe we should globally patch the configure
>> scripts to make sys_lib_dlsearch_path_spec empty.
>
> I thought the libtool issues were long sorted out thanks to the patches
> from support/libtool/. Are we talking about new issues here?

  Sorry, I didn't look carefully enough. The sys_lib_dlsearch_path_spec 
is only used to decide if an rpath should be added. It's still incorrect 
because it uses /etc/ld.so.conf to find the runtime search paths, but 
it's mostly harmless.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
