From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 00:04:25 +0200
Subject: [Buildroot] [PATCH 2/2] target: add different methods to encode
 the root password
In-Reply-To: <1347574590-13716-2-git-send-email-yann.morin.1998@free.fr>
References: <1347574590-13716-1-git-send-email-yann.morin.1998@free.fr>
 <1347574590-13716-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5058EFE9.5050707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/14/12 00:16, Yann E. MORIN wrote:
> The password can be encoded in different ways (from the weakest
> to the strongest): des, md5, sha-256, sha-512
>
> Add a choice entry to select the method, defaulting to 'des'.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

  I think this is going way too far for just setting the root password. I would just
make it an md5 crypt (which is supported by all uClibc versions) and be done
with it.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
