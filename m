From: Robert Lerche <robert.lerche@msbit.com>
Date: Tue, 3 Oct 2017 13:51:55 -0700
Subject: [Buildroot] Private mirror repository for Python package
 dependencies -- howto?
In-Reply-To: <20170929215151.35dea574@windsurf>
References: <CAF7SrrG6-FgUdN3HESU_vGX4+HEfrU8hfFQc9VzH9wh2GugxBQ@mail.gmail.com>
 <20170929215151.35dea574@windsurf>
Message-ID: <CAF7SrrFDHt1=+a0DcJUBrwk7vL_01Kd8YfyCBKFswCtLw3TEBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your response.

At the request of one of our developers I added Python connexion (
https://pypi.python.org/pypi/connexion) which in turn pulled in a bunch of
other components (flake8, mccabe, pyflakes, pycodestyle, pytest-runner).

Reading between the lines of your mail, I added each of those components
individually to my customized Buildroot and that takes care of the issue.

On Fri, Sep 29, 2017 at 12:51 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 29 Sep 2017 09:53:25 -0700, Robert Lerche wrote:
> > Buildroot provides a simple and effective means to specify a private
> mirror
> > for package source code components (BR2_PRIMARY_SITE).  This is essential
> > for a company basing an embedded system product on Buildroot.
> >
> > Is there an equivalent mechanism to support a private repository for
> Python
> > package dependencies?  Otherwise distutils and setuptools will fetch from
> > public sources even though the package base comes from the private
> mirror.
>
> This should never happen. If a Python package downloads its
> dependencies by itself without going through Buildroot's download
> mechanism, it's a bug.
>
> Could you give a more specific example of a problematic Python package ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171003/2334f1fd/attachment.html>
