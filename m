From: Christian Stewart <christian@paral.in>
Date: Wed, 25 Nov 2020 13:02:56 -0800
Subject: [Buildroot] [PATCH next 05/12]
 support/download/go-post-process: implement Go vendoring support
In-Reply-To: <CA+h8R2oGbPWH=ziw=XuT9OiYqE5nZyQJ5v6PCqqaXFAxAF87Tw@mail.gmail.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
 <20201119213658.1232531-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2rY05=7NZbOf+fU30qV+xdq0g2GhBpZSMBfg5uRm4x9XA@mail.gmail.com>
 <CA+h8R2rQcCzEt6TtqjEHYMoJurXrqJQ=UsimFHBzg+1hzx9Q+g@mail.gmail.com>
 <20201125215203.030cdb99@windsurf.home>
 <CA+h8R2oGbPWH=ziw=XuT9OiYqE5nZyQJ5v6PCqqaXFAxAF87Tw@mail.gmail.com>
Message-ID: <CA+h8R2rL39O6p78tMginRzWBHf00AYMLd2uHkipgUq1yQ9Ax2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Nov 25, 2020 at 12:54 PM Christian Stewart <christian@paral.in> wrote:
> > So this cannot simply be conditional on go.mod existing or not, because
> > we need the name of the Go module ?
>
> The "go mod init" command will actually do nothing if go.mod already exists.

Scratch that, "go mod init" will actually fail if go.mod already
exists. So we should instead:

if [ ! -f go.mod ] && [ -n "${gomod_init}" ]; then
    go mod init ${gomod_init}
fi

Apologies for confusion on that.

Best,
Christian
