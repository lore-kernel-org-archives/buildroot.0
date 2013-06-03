From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 3 Jun 2013 14:12:27 +0100
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
In-Reply-To: <20130603144414.562f9385@skate>
References: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
 <20130603144414.562f9385@skate>
Message-ID: <CAHt8ZCO8PF0gxsvDWtCgWRdpbnUwGoNJmUdqe-eRO9ZKznJVZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas; thanks for looking at this.

On 3 June 2013 13:44, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This more-or-less reverts part of your commit
> 8d34e073c00236ff41a6df8f0fdd6b0b25dc4ad1. Is there a reason why
> sconeserver isn't taking the right ldflags from mysql_config?

The sconeserver configure script doesn't call mysql_config until after
it has checked for the mysqlclient library; the adjustment of the
LDFLAGS in the package makefile is needed so that the check for the
mysqlclient library works correctly. Once this library check has been
performed, the configure script calls mysql_config to obtain compile
and link flags for the build.

Simon.
