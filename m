From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 19:20:55 +0200
Subject: [Buildroot] [PATCH 1 of 2] make clean: improve when no .config
 present
In-Reply-To: <20130930140438.713b4879@skate>
References: <patchbomb.1380539365@argentina>
 <2c5cb4c167d3cb700c22.1380539366@argentina> <20130930140438.713b4879@skate>
Message-ID: <524B0477.1030604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/30/13 14:04, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 30 Sep 2013 13:09:26 +0200, Thomas De Schampheleire wrote:
>> The 'make clean' recipe is using variables that are not defined without .config
>> file, causing only a partial cleanup when the .config file is accidentally
>> deleted.
>>
>> This patch moves those variables that do not depend on values from .config
>> outside the BR2_HAVE_DOT_CONFIG check, so that 'make clean' is much more similar
>> with and without .config.
>
> Yeah, this has bothered me for a while, so I agree with that.
>
>> The HOST_DIR (and the derived STAGING_DIR) are determined from BR2_HOST_DIR in
>> .config, so the host directory can still not be cleaned correctly without making
>> assumptions, if no .config is present.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>> Note: we could improve the HOST_DIR cleanup by removing 'output/host'
>> unconditionally, but it's an assumption. Let me know your thoughts on this, it
>> could be fixed in another patch.
>
> Hum, yeah, indeed. This means that the contents of output/host are not
> removed, which is quite annoying. I don't immediately see a solution to
> this problem, though.

  I would be OK with defining HOST_DIR as $(BASE_DIR)/host before .config 
is included. If .config exists, it will be overridden afterwards.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
