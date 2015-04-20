From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Mon, 20 Apr 2015 15:29:31 -0400 (EDT)
Subject: [Buildroot] a philosophical question about Config.in and
 "comment" directives
In-Reply-To: <87a8y2vc8j.fsf@dell.be.48ers.dk>
References: <alpine.LFD.2.11.1504170840320.7665@localhost>
 <20150417150042.GA5271@free.fr> <55313266.9000600@mind.be>
 <87a8y2vc8j.fsf@dell.be.48ers.dk>
Message-ID: <alpine.LFD.2.11.1504201525090.29417@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2015, Peter Korsgaard wrote:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  >>> that layout makes it far clearer that the entire option depends on
>  >>> arm or you see *nothing* and, further, internally, the dependencies
>  >>> in the comment list *only* those dependencies that the user will be
>  >>> warned that they need if they want this selection.
>
>  >  I completely agree.
>
> Me too.
>
>  >> So yes, you are right _on principle_. But we're not gonna change that
>  >> policy, and we'll continue to require new packages to conform to it.
>
>  >  We _could_ change the policy and just require new packages to conform to the
>  > new policy. We do that regularly (cfr. patch naming, BR2_ prefix, ...).
>
>  >  That said, I don't think the current situation is bad enough to
>  > warrant such a change.
>
> No indeed. I wouldn't mind new patches doing it like this, but I don't
> want to se the churn to change our ~1500 existing packages to it.

  i didn't mean to open such a can of standardization worms ... the
only reason i mentioned this is because the first time i saw that
structure, i was a bit confused as to why the very same dependency was
in both places.

  i also note that this is (i think) addressed in the user manual,
section 17.2.4:

http://nightly.buildroot.org/manual.html#_config_files

and i quote:

"Many packages depend on certain options of the toolchain: the choice
of C library, C++ support, thread support, RPC support, IPv6 support,
wchar support, or dynamic library support. Some packages can only be
built on certain target architectures, or if an MMU is available in
the processor.

"These dependencies have to be expressed with the appropriate depends
on statements in the Config.in file. Additionally, for dependencies on
toolchain options, a comment should be displayed when the option is
not enabled, so that the user knows why the package is not available.
Dependencies on target architecture or MMU support should not be made
visible in a comment: since it is unlikely that the user can freely
choose another target, it makes little sense to show these
dependencies explicitly.

"The comment should only be visible if the config option itself would
be visible when the toolchain option dependencies are met. This means
that all other dependencies of the package (including dependencies on
target architecture and MMU support) have to be repeated on the
comment definition. To keep it clear, the depends on statement for
these non-toolchain option should be kept separate from the depends on
statement for the toolchain options. If there is a dependency on a
config option in that same file (typically the main package) it is
preferable to have a global if ? endif construct rather than repeating
the depends on statement on the comment and other config options."

  so that last para does in fact describe the requirement for
*repeating* the dependency.

  anyway, i'll shut up about this now, and get back to reading.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
