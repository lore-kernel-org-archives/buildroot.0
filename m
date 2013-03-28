From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 28 Mar 2013 09:13:06 +0100
Subject: [Buildroot] [git commit] Makefile: simplify target skeleton
	copying
In-Reply-To: <87ip4c3q30.fsf@dell.be.48ers.dk>
References: <20130326074214.D6DFF9B2CA@busybox.osuosl.org>
 <5153EE16.8070207@mind.be> <87ip4c3q30.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWWJMrJBvkf_jwMrrHT73dOy85_iQJpcZVbhF4SKcjjSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On Thu, Mar 28, 2013 at 9:07 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  Arnout> On 26/03/13 08:33, Peter Korsgaard wrote:
>  >> +   rsync -au --exclude=.empty --exclude=CVS --exclude=.svn
> --exclude='*~' \
>  >> +           $(TARGET_SKELETON)/ $(TARGET_DIR)/
>
>  Arnout>  Since TARGET_SKELETON can be configured to point to a git- or
>  Arnout> mercurial-controlled directory, I'd want to exclude those as
> well. How
>  Arnout> about the --cvs-exclude --include core that ThomasDS introduced?
>
> We can do that as well. I was a bit afraid of excluding files people
> wanted to keep, so I kept it how it was - But yes, like likelyhood is
> quite small.
>
> Care to send a patch to do this?
>

Is this really needed?
I was thinking about this as well, but later had the following reasoning
(which could be wrong): for svn, if I recall correctly, there is a .svn in
each subdirectory. This is not the case for .git or .hg (which only exist
in the root of the repository). If one can assume that no-one puts the
skeleton in a repository, the exclusion of .svn is enough.

Moreover, the --cvs-exclude option cannot be used in this case, as it also
removes object files. In my version of rsync, this is the exclusion list
used by --cvs-exclude:

RCS SCCS CVS CVS.adm RCSLOG cvslog.* tags TAGS .make.state .nse_depinfo *~
#* .#* ,* _$* *$ *.old *.bak *.BAK *.orig *.rej .del-* *.a *.olb *.o *.obj
*.so *.exe *.Z *.elc *.ln core .svn/ .git/ .hg/ .bzr/

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130328/6750a2f0/attachment.html>
