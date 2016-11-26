From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 11:30:55 +0100
Subject: [Buildroot] problem with cups
In-Reply-To: <1480147676790-151149.post@n4.nabble.com>
References: <1480147676790-151149.post@n4.nabble.com>
Message-ID: <08cf5dbf-ef19-6026-c129-b644e037b17a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-11-16 09:07, Ajorian wrote:
> D [02/Jan/2000:23:04:59 +0000] [Job 1] Running command line for gs: gs -q
> -dNOPAUSE -dBATCH -dSAFER -sDEVICE=ps2write -sOUTPUTFILE=%stdout
> -dLanguageLevel=3 -r300 -dCompressFonts=false -dNoT3CCITT -dNOINTERPOLATE -c
> \'save pop\' -f /var/spool/cups/tmp/000c13879b775
> D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter gs (PID 196)
> D [02/Jan/2000:23:04:59 +0000] [Job 1] Started filter pstops (PID 197)
> D [02/Jan/2000:23:04:59 +0000] [Job 1] Unable to execute gs program: No such
> file or directory
> D [02/Jan/2000:23:04:59 +0000] [Job 1] PID 196 (gs) stopped with status 1!

 It looks like that printer driver requires ghostscript. ghostscript is
currently not in Buildroot, but Bernd has a patch for it:
http://patchwork.ozlabs.org/patch/666735/

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
