From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 10 Jun 2019 19:51:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 242
In-Reply-To: <20190601214028.1652-1-james.hilliard1@gmail.com>
References: <20190601214028.1652-1-james.hilliard1@gmail.com>
Message-ID: <866069e6-b85f-4b72-84d9-430ef808071b@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is not a simple bump for people who use systemd-networkd (or 
timesyncd, or resolved, or ...). On a build-from-scratch, these services 
won't be enabled anymore. A recent change now apparently requires people to 
run `systemctl prepare-all` [1] to re-create symlinks which enable these 
services.

This makes cross-building more complex, so I filed an issue upstream [2].

Cheers,
Jan

[1] https://github.com/systemd/systemd/blob/v242/NEWS#L223
[2] https://github.com/systemd/systemd/issues/12767
