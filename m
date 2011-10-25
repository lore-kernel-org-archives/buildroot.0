From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 18:52:59 +0200
Subject: [Buildroot] [PATCH] manual: refactor the targets into GENDOC
	macro.
In-Reply-To: <87hb2xwf17.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Tue, 25 Oct 2011 12:18:12 +0200")
References: <201110112257.11996.arnout@mind.be>
 <1318366792-13507-1-git-send-email-arnout@mind.be>
 <87hb2xwf17.fsf@macbook.be.48ers.dk>
Message-ID: <87vcrdui6s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Also add a clean target, give absolute path to a2x, add a dependency
 Arnout> on the output file, and add to .PHONY.

 Arnout> +define GENDOC
 Arnout> +$(call GENDOC_INNER,$(1),xhtml,html,html,HTML)
 Arnout> +$(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
 Arnout> +$(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
 Arnout> +$(call GENDOC_INNER,$(1),text,txt,text,Text)
 Arnout> +$(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
 Arnout> +clean: clean-$(1)
 Arnout> +clean-$(1):
 Arnout> +	$(Q)$(RM) -r $(O)/docs/$(1)

 Peter> This removes the entire docs/manual, including the source files, so I
 Peter> changed this so they are put in docs/manual/<format>, and seperate
 Peter> clean-manual-<format> clean targets.

Ehh, forget this - I somehow missed the $(O)/

-- 
Bye, Peter Korsgaard
