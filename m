From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 11 Jan 2019 04:36:55 -0700
Subject: [Buildroot] [PATCH 1/1] package/systemd: add upstream fix for
 CVE-2018-16864
In-Reply-To: <87k1jbqvfv.fsf@dell.be.48ers.dk>
References: <1547193242-29882-1-git-send-email-james.hilliard1@gmail.com>
 <87sgxzqxny.fsf@dell.be.48ers.dk>
 <CADvTj4oX2kY5WepFYp7FY4UQJjUujpQ4+SeyWKiu4CvyFBMuWQ@mail.gmail.com>
 <87k1jbqvfv.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4oap98Gc9F4-47AOp9Gccpk7ZufqMoHcNPwr=4+hGkp1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 11, 2019 at 4:34 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
> Hi,
>
>  >> > +[james.hilliard1 at gmail.com: backport from upstream commit
>  >> > +084eeb865ca63887098e0945fb4e93c852b91b0f]
>  >> > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  >>
>  >> The "standard way" to backport is to use git cherry-pick -sx which adds
>  >> a line like:
>  > Patch format in buildroot seems to be fairly inconstant. I think this
>  > format was what I was recommended to use last.
>
> True. As systemd is maintained in git, it IMHO makes sense to use the
> normal git format.
>
>  >> What about CVE-2018-16865, E.G. commit 052c57f132f04a / ef4d6abe7c7fa?
>  >> Do those not apply to 240?
>  > So here https://www.qualys.com/2019/01/09/system-down/system-down.txt it says:
>  > "CVE-2018-16865 was introduced in December 2011 (systemd v38) and became
>  > exploitable in April 2013 (systemd v201). CVE-2018-16866 was introduced
>  > in June 2015 (systemd v221) and was inadvertently fixed in August 2018."
>  > So my assumption was that we didn't need patches for CVE-2018-16865
>  > since systemd 240 was released in Dec 2018.
>
> We don't need a fix for 16866, but we do need for 16865, right?
That is not entirely clear to me as there seems to be contradictory info.
>
> --
> Bye, Peter Korsgaard
