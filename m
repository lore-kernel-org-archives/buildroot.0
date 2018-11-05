From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 5 Nov 2018 09:22:12 +0100
Subject: [Buildroot] [PATCH v2] scanpypi: use archive file name to
 specify the extraction folder
In-Reply-To: <20181102213640.3a274edc@windsurf>
References: <20181102134501.13860-1-yegorslists@googlemail.com>
 <20181102213640.3a274edc@windsurf>
Message-ID: <CAGm1_kt-oH0S5m8TfEXL9E08t_1-1a9pH10e3CSEKxAsjF0E8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 2, 2018 at 9:36 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri,  2 Nov 2018 14:45:01 +0100, yegorslists at googlemail.com wrote:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Some packages have archive name that is different from package name.
> > For example websocket-client's archive name is websocket_client-*.tar.gz.
> > scanpypi expects the temporary extract folder to be:
> >
> > /tmp-folder/BR-package-name/PyPI-packagename-and-version
> >
> > In the case of websocket-client package the real extraction folder
> > will be different from the expected one because of the '_' in the
> > archive file name.
> >
> > Use archive file name instead of package name to specify the extraction
> > folder. As the version is already part of this file, we don't need to
> > specify it.
> >
> > Bonus: remove obsolete "return None, None" as the function doesn't return
> > anything. OSError class doesn't provide "message" member, so replace it
> > with "strerror".
>
> I've applied to master, but I believe it should perhaps have been two
> separate patches. Indeed, I don't see the relationship between the use
> of the archive file name, and the change around "return None, None".

You're right. Will do next time.

Yegor
