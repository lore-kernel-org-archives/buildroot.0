From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Tue, 13 Jun 2017 21:59:55 +0530
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
In-Reply-To: <20170612210449.1f5e4bf9@windsurf.lan>
References: <20170612041512.9374-1-bernd.kuhls@t-online.de>
 <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
 <20170612210449.1f5e4bf9@windsurf.lan>
Message-ID: <CA+NV+Vn9h1PVrbVpkzkX9yh606fg3emzPG6opSQpoiAY=MkSRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Jun 13, 2017 at 12:34 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Yocto/OE also has a hash for license files, specifically to check if
> the license file is changed.

Yes, my intention to suggest that is to check if license text gets
changed. Preventing such build failure is added advantage out of this.

> However, I'm not sure if the .hash file is the appropriate location. In
> the .hash file, we have the hash of the downloaded files (in the ones
> in DL_DIR). Hashes for files inside the tarball is a quite different
> thing.

If we use .hash file, then all hashes will be in one place but yes, it
is for downloaded files. We can add hash of license file in .mk file
under LICENSE_FILES_HASH variable. In that case, one to one mapping of
license file and its hash needs to be maintained if there are multiple
license files. If using .hash file for hashes of only downloaded files
isn't a hard rule then adding hash of license file .hash file will be
more convenient ?

> Also, I'm a bit worried about the additional complexity and maintenance
> burden.

If this thing helps in maintaining legal info accurate and up-date
then additional complexity is OK in my opinion. After all legal info
is also important thing and we will be confident about it over a
period of time.

Thanks,
Rahul
