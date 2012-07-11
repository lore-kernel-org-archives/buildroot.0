From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2012 11:30:32 +0200
Subject: [Buildroot] [PATCH] libgcrypt: install libgcrypt-config in host
 directory
In-Reply-To: <20120711112444.5b5cbad0@skate>
References: <1341958748-9024-1-git-send-email-arnout@mind.be>
 <20120711112444.5b5cbad0@skate>
Message-ID: <4FFD47B8.8060007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/12 11:24, Thomas Petazzoni wrote:
> Le Wed, 11 Jul 2012 00:19:08 +0200,
> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
>
>> Packages depending on libgcrypt call libgcrypt-config to determine its
>> CFLAGS.  If libgcrypt-config happens to be installed on the host, this
>> will add /usr/include to the target include path.  So make sure
>> libgcrypt-config is in the host directory.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>
> For most packages, we just leave the<foo>-config script in
> $(STAGING_DIR), and then adjust their reverse dependencies .mk file to
> point specifically to the $(STAGING_DIR) for that script.
>
> I am not a big fan of doing otherwise specifically for libgcrypt.

  Unfortunately I forgot which was the dependency that triggered the error
in the first place...  Probably libxslt, so I'll try if I can reproduce it
with that package.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
