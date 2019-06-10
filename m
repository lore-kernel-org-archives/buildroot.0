From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Jun 2019 16:55:57 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 242
In-Reply-To: <866069e6-b85f-4b72-84d9-430ef808071b@cesnet.cz>
References: <20190601214028.1652-1-james.hilliard1@gmail.com>
 <866069e6-b85f-4b72-84d9-430ef808071b@cesnet.cz>
Message-ID: <CADvTj4pU-jYAQdC8QdO9_QaRsDf=_Vdk0p4_qMf+eRN_oAbUjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 10, 2019 at 11:51 AM Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
>
> This is not a simple bump for people who use systemd-networkd (or
> timesyncd, or resolved, or ...). On a build-from-scratch, these services
> won't be enabled anymore. A recent change now apparently requires people to
> run `systemctl prepare-all` [1] to re-create symlinks which enable these
> services.
>
> This makes cross-building more complex, so I filed an issue upstream [2].
Hopefully this fixes it:
https://github.com/systemd/systemd/pull/12769
>
> Cheers,
> Jan
>
> [1] https://github.com/systemd/systemd/blob/v242/NEWS#L223
> [2] https://github.com/systemd/systemd/issues/12767
