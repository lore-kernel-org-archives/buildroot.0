From: Christian Stewart <christian@paral.in>
Date: Mon, 28 Jun 2021 11:00:10 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/go: use host compiler when
 go-bootstrap unsupported
In-Reply-To: <875yy6a926.fsf@tarshish>
References: <20210622024337.3009417-1-christian@paral.in>
 <875yy6a926.fsf@tarshish>
Message-ID: <CA+h8R2oT+3UREAwqG3CtKp-4haoyyy3i28Ts_4q8rBNJSEHQZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Mon, Jun 21, 2021 at 8:10 PM Baruch Siach <baruch@tkos.co.il> wrote:
> > +HOST_GO_BOOTSTRAP_ROOT = /usr/lib/go
>
> I think we need a check for host go existence and maybe also version under
> support/dependencies/.
>
> baruch

I had a look at those scripts and am not familiar enough to know the
correct way to only check for host-go existence on the system only if
all of:

 - BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS=y
 - BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS is not set
 - BR2_PACKAGE_HOST_GO=y

If any of these conditions are not met, it's not necessary to have Go
installed on the host system.

Best,
Christian
