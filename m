From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 21:12:17 +0200
Subject: [Buildroot] Broken generation of locales
In-Reply-To: <523B1807.1070102@wanadoo.fr>
References: <523A9508.7040403@wanadoo.fr> <20130919170406.0e04a348@skate>
 <523B1807.1070102@wanadoo.fr>
Message-ID: <523B4C91.1020307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 17:28, Thierry Bultel wrote:
> Hi Thomas,
>
> This does not exactly revert the named commit, that
> added 's' for both inputfile and charmap.
>
> I pretend that the 's' option is mandatory for charmap only,
> else inputfile is always empty:
>
> inputfile:
>
> thierry at thierry-desktop:~$ echo fr_FR | cut -f1 -d '.'
> fr_FR
> thierry at thierry-desktop:~$ echo fr_FR | cut -f1 -d '.' -s
> thierry at thierry-desktop:~$
>
> charmap:
>
> thierry at thierry-desktop:~$ echo fr_FR.utf8 | cut -f2 -d '.'
> utf8
> thierry at thierry-desktop:~$ echo fr_FR.utf8 | cut -f2 -d '.' -s
> utf8

  Ack that.

  So this patch gets

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Note that you've caused Thomas's confusion by unnecessarily moving the 
-s option in the charmap line.


  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
