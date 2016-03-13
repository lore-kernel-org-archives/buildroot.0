From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Mar 2016 22:53:42 +0100
Subject: [Buildroot] changing sources before patching
In-Reply-To: <56E5BF43.90507@lespocky.de>
References: <56E5BF43.90507@lespocky.de>
Message-ID: <56E5E166.7090403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/16 20:28, Alexander Dahl wrote:
> Hei hei,
>
> in the fli4l [1] project, we use buildroot as build system, a little
> custom stuff on top, but basically it's buildroot. Now Carsten wanted to
> make a package for sfftools [2], especially sfftobmp3. The source is
> only available from subversion and we need to patch it. The problem we
> face is: some files we need to patch (e.g. configure.ac) have CRLF aka
> DOS line endings and patch fails then. So we want to convert the line
> endings to LF aka unix before patching. Is this possible with buildroot
> and how? Or does anyone else has a good idea for an elegant solution to
> this problem?

  As Bernt wrote, you can have a patch containing the correct CRLF.

  Alternatively, you can run a conversion in the _PRE_PATCH_HOOKS.

  Regards,
  Arnout

>
> (please keep Carsten and Christoph in Cc)
>
> Greets
> Alex
>
> [1] http://www.fli4l.de/
> [2] https://sourceforge.net/projects/sfftools/
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
