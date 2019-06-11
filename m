From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Jun 2019 16:37:20 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 242
In-Reply-To: <42b606ec-8404-6e76-c698-626633e63080@mind.be>
References: <20190601214028.1652-1-james.hilliard1@gmail.com>
 <866069e6-b85f-4b72-84d9-430ef808071b@cesnet.cz>
 <CADvTj4pU-jYAQdC8QdO9_QaRsDf=_Vdk0p4_qMf+eRN_oAbUjw@mail.gmail.com>
 <42b606ec-8404-6e76-c698-626633e63080@mind.be>
Message-ID: <CADvTj4o7Vae1zEaYb35uVUETtQxCA2EeN3GM9TNJHdXP=h0_2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 11, 2019 at 4:09 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 11/06/2019 00:55, James Hilliard wrote:
> > On Mon, Jun 10, 2019 at 11:51 AM Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
> >>
> >> This is not a simple bump for people who use systemd-networkd (or
> >> timesyncd, or resolved, or ...). On a build-from-scratch, these services
> >> won't be enabled anymore. A recent change now apparently requires people to
> >> run `systemctl prepare-all` [1] to re-create symlinks which enable these
> >> services.
> >>
> >> This makes cross-building more complex, so I filed an issue upstream [2].
> > Hopefully this fixes it:
> > https://github.com/systemd/systemd/pull/12769
>
>  I actually agree with the analysis made upstream, that it's better to call
> systemctl --root=/path/to/it preset-all rather than maintaining two code paths
> that do the same thing. Yes, it means we need to build a minimal host-systemd to
> get systemctl, but I don't see that as a big showstopper.
Yeah, I understand their reasoning, it just seems like overkill for a
few symlinks.

The build system may provide a way to do build a systemctl for the host as part
of the target build using this:
https://mesonbuild.com/Cross-compilation.html#mixing-host-and-build-targets
Not sure how difficult that would be though.
>
>  Regards,
>  Arnout
>
> >>
> >> Cheers,
> >> Jan
> >>
> >> [1] https://github.com/systemd/systemd/blob/v242/NEWS#L223
> >> [2] https://github.com/systemd/systemd/issues/12767
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
