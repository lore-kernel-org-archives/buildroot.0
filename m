From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 09:37:49 +0100
Subject: [Buildroot] 2011.11: manual improvements
In-Reply-To: <20111123092314.5065a4b8@skate>
References: <CAAXf6LUPKRJUJF83-x1n4rRVXdmg3Ob-1dgtyuV+6v+aqfKbWQ@mail.gmail.com>
 <CAAXf6LV2Z+FEk79qj3nqg1faH1wpWXzAVBin1Uh9xUvpvf0pTg@mail.gmail.com>
 <20111123092314.5065a4b8@skate>
Message-ID: <CAAXf6LWh3_+8zwBjaJkpFH05+J=oSSPZbztZuNsoAVOKmGRuXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 23, 2011 at 9:23 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 23 Nov 2011 08:23:47 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> > * The 2011.11-rc1 tarball does not contain a ready-made manual. A
>> > user that doesn't know buildroot and searches for the manual, will
>> > only find the manual sources in docs/manual. These are readable,
>> > but they are not intended for that purpose. I don't think we can
>> > expect users to first run 'make manual', and have asciidoc
>> > installed. Therefore I think we should provide a ready-made manual
>> > in the tarballs. It probably requires a rewrite of the 'release'
>> > target, because the current 'git archive' used there will not take
>> > along untracked files. One approach is to add the files to the
>> > tarball afterwards.
>
> I agree on the need to have a generated version of the manual in the
> released tarballs.
>
>> > * I think it should become more clear that the contents of
>> > 'docs/manual' are really the manual sources, not the finished
>> > manual. One way to do this would be to move them in a subdirectory
>> > 'sources' or rename 'manual' to 'manual-sources'.
>
> Hum, not sure this is so important. I know Peter wanted to move the
> website sources from docs/* to docs/website/. Many the manual sources
> can be in docs/manual/src/ and the generated manual available in
> released tarballs stored in docs/manual/.

That seems like a clear split to me.

>
>> > * Suppose a user does execute 'make manual', then it's unclear what
>> > the location of the manual is. I think we should print the location
>> > when executing the corresponding make targets, and provide a README
>> > or similar in docs/manual to explain this. I would actually like it
>> > if the manual were generated in docs/manual directly, instead of in
>> > 'output'.
>
> That's what I implemented originally, but I was told that it wasn't
> correct to generate things within the source tree. If we do support
> out-of-tree build, then it's true that we should support the case where
> the source tree is kept read-only. I don't feel very strongly about
> this.

It's true that this would clutter the output of 'git status', unless
we add it to the .gitignore files or similar.

Alternatively, we could add a symbolic link from docs/manual to
output/docs/manual, and put the link under version control. But, this
has the downside of having manuals in two places: the official manual
distributed with a release tarball and the generated manual in
output/docs.

>
>> I haven't seen any comments regarding this. Still, I think it's
>> important to discuss before releasing 2011.11.
>
> I don't think any of those problems are show-stoppers for the release.
> They would be nice to have (especially having generated manuals in the
> release tarballs), but they can be improved in future releases if not
> implemented for 2011.11.

Ok, agreed.

Thanks for your input,
Thomas
